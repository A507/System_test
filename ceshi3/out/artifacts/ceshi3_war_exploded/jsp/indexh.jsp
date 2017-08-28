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
<form action="index.jsp" method="post">

    <%
String[] id3=new String[10];
    String[] address3=new String[10];String[] phone3=new String[10];String[] referee3=new String[10];String[] sex3=new String[10];
    String[] date3=new String[10];String[] industry3=new String[10];String[] committee3=new String[10];String[] password3=new String[10];

    String id1=(String)request.getParameter("id1");
    String quanxian1=(String)request.getParameter("quanxian") ;
    javabean JAVA=new javabean();
    JAVA.connection();
    JAVA.output();
   int i=0;
   for(i=0;i<10;i++){
       id3[i]=JAVA.getID(i);
       address3[i]=JAVA.getadd(i);
       phone3[i]=JAVA.getpho(i);
       referee3[i]=JAVA.getref(i);

       sex3[i]=JAVA.getsex(i);
       date3[i]=JAVA.getdate(i);
       industry3[i]=JAVA.getind(i);
       committee3[i]=JAVA.getcom(i);
       password3[i]=JAVA.getpassword(i);

   }
  System.out.println(id3[0]);


    //展示
     //response.sendRedirect("index.jsp");
%>
    <<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
        <html lang="ml">
        <head>
            <script src="https://code.jquery.com/jquery-3.2.1.js">
            </script>
            <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
            <title>Document</title>
        </head>
        <body>
        <script type="text/javascript">
            $(function ( ) {
                location.href="index.jsp?id=<%out.print(id3[0]);%>";
            });
        </script>

        </body>
        </html>
