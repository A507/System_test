<%@ page import="bean.javabean" %>
<%@ page import="Sha.Sha" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: 卢人玮
  Date: 2017/8/29
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    request.setCharacterEncoding("UTF-8");
    javabean bean=new javabean();
    if(!bean.connect()){
        out.print("<h1>连接错误，稍后重试</h1>");
        return;
    }
    String xingming=request.getParameter("xingming");
    String jiatingzhuzhi=request.getParameter("jiatingzhuzhi");
    String lianxifangshi=request.getParameter("lianxifangshi");
    String tuijianren=request.getParameter("tuijianren");
    String chushengriqi=request.getParameter("chushengriqi");
    String hangyefenhui=request.getParameter("hangyefenhui");
    String zhuanweihui=request.getParameter("zhuanweihui");
    String mima=request.getParameter("mima");
    String sex=request.getParameter("sex");

    mima=Sha.getSha1(mima);


/*
    out.print("<h1>"+xingming+"</h1>");
    out.print("<h1>"+jiatingzhuzhi+"</h1>");
    out.print("<h1>"+lianxifangshi+"</h1>");
    out.print("<h1>"+tuijianren+"</h1>");
    out.print("<h1>"+chushengriqi+"</h1>");
    out.print("<h1>"+hangyefenhui+"</h1>");
    out.print("<h1>"+zhuanweihui+"</h1>");
    out.print("<h1>"+mima+"</h1>");
    out.print("<h1>"+sex+"</h1>");
*/
    //判断用户名是否存在
    ResultSet resultSet;
    resultSet=bean.getYonghu(xingming);
    if(resultSet!=null){
        resultSet.last();
        if(resultSet.getRow()!=0){
            response.sendRedirect("register/register.jsp?msg=1");
        }
    }
    //插入数据
    if(!bean.insertYonghu(xingming,jiatingzhuzhi,lianxifangshi,tuijianren,sex,chushengriqi,hangyefenhui,zhuanweihui,mima,null,null,null,null,null)){
        out.print("<h1>插入失败，稍后重试</h1>");
        return;
    }
    //提取id
    resultSet=bean.getYonghu(xingming);
    if(resultSet==null){
        out.print("<h1>结果错误，稍后重试</h1>");
        return;
    }
    resultSet.last();
    if(resultSet.getRow()==0){
        out.print("<h1>没有搜索到</h1>");
        return;
    }
    resultSet.first();
    String id=resultSet.getString("id");
    if(!bean.insertQuanxian(id,"0")){
        out.print("<h1>权限插入失败</h1>");
        return;
    }
    bean.closeDatabase();
    %>
<html>
<head>
    <title>结果</title>
</head>
<body>
<h1>成功注册，3天内完成审核</h1>
</body>
</html>
