<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/22
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.beans.Statement" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="bean.javabean"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>$Title$</title>
</head>
<body>


<jsp:useBean id="javabean" scope="page" class="bean.javabean"/>


<%
    String id1=(String)request.getParameter("id");
    String password1=(String)request.getParameter("password");
    javabean JAVA=new javabean();
    JAVA.connectiondenglu();
%>
<%
    int a=JAVA.login(id1,password1);
%>
<%
    if(a==0)
    {

        response.sendRedirect("login.jsp");
    }

    else if(a==1)
    {
        response.sendRedirect("index.jsp?id4="+id1);

    }
%>




</body>
</html>