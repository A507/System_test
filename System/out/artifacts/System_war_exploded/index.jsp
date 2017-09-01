<%@ page import="java.sql.Time" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalTime" %>
<%@page import="java.text.*" %>
<%--
  Created by IntelliJ IDEA.
  User: 卢人玮
  Date: 2017/8/28
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%--
  utf8防止乱码
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
  Date date=new Date();
  out.print(dateFormater.format(date));

  String search=request.getParameter("search");
  out.print("<h1>"+search+"</h1>");
%>
