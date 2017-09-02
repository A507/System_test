<%@ page import="java.sql.Time" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalTime" %>
<%@page import="java.text.*" %>
<%@ page import="hash.Hash" %>
<%@page import="java.sql.ResultSet" %>
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


  //获取参数
  String quanxian=null;
  String password=null;
  String user_id=null;
  String xingming=null;


  //获得hash
  //检查cookie确认登录状态
  String hash = null;
  Cookie[] cookie=request.getCookies();
  if (cookie==null){
    response.sendRedirect("../index/index.jsp");
    //测试
    //out.print("<h1>cookie=null</h1>");
    hash="";
    return;
  }
  else {
    //获取值
    for (int i = 0; i < cookie.length; i++) {
      if (cookie[i].getName().equals("hash")) {
        hash = cookie[i].getValue();
      }
    }
    if (hash == null) {
      //测试
      //out.print("<h1>取不到hash</h1>");
      response.sendRedirect("../index/index.jsp");
      return;
    }
    //测试
    if (hash != null) {
      //out.print("<h1>hash=" + hash + "</h1>");
    }
  }






  //验证身份
  //没有从登录过来
  if(hash!=null){
    if (hash.equals("")){
      response.sendRedirect("../index/index.jsp");
      return;
    }
    if(!hash.equals("")) {
      javabean bean = new javabean();
      bean.connect();
      //获取cookie
      ResultSet resultSet = bean.checkCookie(hash);
      resultSet.last();
      //cookie不存在
      if (resultSet.getRow() == 0) {
        quanxian = null;
        xingming = null;
        response.sendRedirect("../index/index.jsp");
      } else {
        //延长cookie
        user_id = resultSet.getString("id");
        resultSet.close();
        //设置客户端cookie时间
        Cookie cookie1 = new Cookie("hash", hash);
        cookie1.setPath("/");
        cookie1.setMaxAge(20 * 60);
        response.addCookie(cookie1);
        //设置服务器cookie时间
        bean.addCookieTime(hash);
        //获取用户信息
        resultSet = bean.getYonghuById(user_id);
        resultSet.last();
        xingming = resultSet.getString("xingming");
        resultSet.close();
        ;
        //获取权限信息
        resultSet = bean.getQuanxian(user_id);
        resultSet.last();
        quanxian = resultSet.getString("quanxian");
        resultSet.close();
      }
    }
  }



  //未验证不允许进入
  if (xingming==null){
    response.sendRedirect("../index/index.jsp");
    return;
  }else
  {
    if (xingming.equals("")){
      response.sendRedirect("../index/index.jsp");
      return;
    }
  }


%>
