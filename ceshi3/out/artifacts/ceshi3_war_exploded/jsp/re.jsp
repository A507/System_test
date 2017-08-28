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
    String id1=(String)request.getParameter("xingming");
    String address1=(String)request.getParameter("jiatingzhuzhi");
    String phone1=(String)request.getParameter("lianxifangshi");
    String referee1=(String)request.getParameter("tuijianren");
    String sex1=(String)request.getParameter("sex");
    String date1=(String)request.getParameter("chushengriqi");
    String industry1=(String)request.getParameter("hangyefenhui");
    String committee1=(String)request.getParameter("zhuanweihui");
    String password1=(String)request.getParameter("mima");
    javabean.connection();
    javabean.insert(id1,address1,phone1,referee1,sex1,date1,industry1,committee1,password1);
%>





</body>
</html>
