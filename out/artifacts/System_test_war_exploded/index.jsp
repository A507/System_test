<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/23
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <%
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/test";
    String user = "root";
    String password = "123456";
try {


  Class.forName(driver);
  Connection conn = DriverManager.getConnection(url, user, password);
  Statement statement = conn.createStatement();
  String sql = "SELECT * FROM mytable";
  ResultSet rs = statement.executeQuery(sql);
  rs.next();
  String str1 = null;
  str1 = rs.getString("name");
  rs.close();
  conn.close();
}catch (ClassNotFoundException e){

} catch (SQLException e) {

} catch (Exception e) {

}


    out.print(str1);
    %>
  </body>
</html>
