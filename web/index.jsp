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
     String id1=(String)request.getParameter("userneame");
     System.out.println("2");
     javabean.connection();
     javabean.insert("g","g","g","g","g","g","g","g","g");
  %>





  </body>
</html>
