<%--
  Created by IntelliJ IDEA.
  User: 卢人玮
  Date: 2017/8/28
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Sha.Sha" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Vector" %>
<%@ page import="bean.javabean" %>
<%@ page import="java.sql.ResultSet" %>
<%
    request.setCharacterEncoding("UTF-8");

    //设置cookie
    Cookie cookie=new Cookie("lurenwei","hello");
    cookie.setMaxAge(100);
    response.addCookie(cookie);

    //获得数据
    String name=request.getParameter("name");
    String id=request.getParameter("id");
//
    out.print("<h1>name="+name+"</h1>");
    out.print("<h1>id="+id+"</h1>");

    out.print("<h1>sha="+Sha.getSha1(name)+"</h1>");
    Date date=new Date();
    long time=date.getTime();
    out.print("<h1>时间"+time+"</h1>");

    //测试读取数据
    javabean bean=new javabean();
    bean.connect();

    ResultSet resultSet=bean.getYonghu("name");
    if(resultSet==null){
        out.print("<h1>result错误</h1>");
        return;
    }
    resultSet.last();
    out.print("<h1>数量："+resultSet.getRow()+"</h1>");
    resultSet.first();
    out.print("<h1>位置："+resultSet.getRow()+"</h1>");
    out.print("<h1>名字："+resultSet.getString("xingming")+"</h1>");

    resultSet.close();
    bean.closeDatabase();

%>
<html>
<head>
    <title></title>
</head>
<body>

</body>
</html>
