<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/22
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.beans.Statement" %>
<%@ page import="java.util.*"%>
<%@ page import="bean.javabean"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*"%>

<html>
<head>
    <title>$Title$</title>
</head>
<body>


<jsp:useBean id="javabean" scope="page" class="bean.javabean"/>


    <%
    String zuozhe=(String)request.getParameter("xingming");
    System.out.println(zuozhe);
    String mingcheng1=(String)request.getParameter("mingcheng");
    String neirong=(String)request.getParameter("neirong");
    String date=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间
    javabean JAVA=new javabean();
    JAVA.connectionwendang();
    JAVA.insertwendang(mingcheng1,zuozhe,date,neirong);

%>
