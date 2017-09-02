<%--
  Created by IntelliJ IDEA.
  User: 卢人玮
  Date: 2017/8/31
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bean.javabean" %>
<%@page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");



    //获取参数
    String quanxian=null;
    String password=null;
    String user_id=null;
    String xingming=null;
    String chexiao_id=request.getParameter("chexiao_id");






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






    //修改用户信息
    String danwei=request.getParameter("danwei");
    String zhicheng=request.getParameter("zhicheng");
    String dianhua=request.getParameter("dianhua");
    String youxiang=request.getParameter("youxiang");
    String jiatingzhuzhi=request.getParameter("jiatingzhuzhi");
    String weixin=request.getParameter("weixin");
    String zhiwu=request.getParameter("zhiwu");
    //检查是否为空
    if(danwei!=null){
        if(zhicheng!=null){
            if(dianhua!=null){
                if(youxiang!=null){
                    if(jiatingzhuzhi!=null){
                        if(weixin!=null){
                            if(zhiwu!=null){
                                if(!dianhua.equals("")){
                                    if (!jiatingzhuzhi.equals("")){
                                        if(xingming!=null) {
                                            if(!xingming.equals("")) {
                                                javabean bean = new javabean();
                                                bean.connect();
                                                bean.setYonghu(danwei, zhicheng, dianhua, youxiang, jiatingzhuzhi, weixin, zhiwu, xingming);
                                                bean.closeDatabase();
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>信息维护</title>
    <script src="https://code.jquery.com/jquery-3.2.1.js">


    </script>
    <style>
        #div_header {
            width: 100%;
            height: 133px;
            background-color: white;
        }

        body {
            background-image: url("image/interface.png");
        }
        #div_img {
            width: 1000px;
            height: 133px;
            margin: auto;
            background-image: url(image/header_001.jpg);
        }
        #div_zhuce {
            width: 77px;
            height: 31px;
            background-image: url(image/zhuce1_001.jpg);
            margin-right: 20px;
            margin-top: 7px;
            float: right;
            border-radius: 5px;
        }
        #div_denglu {
            width: 77px;
            height: 32px;
            margin-top: 7px;
            margin-right: 25px;
            float: right;
            background-image: url(image/login1_001.jpg);
            border-radius: 5px;
        }
        #sousuo {
            height: 41px;
            width: 54px;
            margin-right: 14px;
            background-image: url(image/sousuo_001.png);
            float: right;
        }
        #input_sousuo {
            height: 24px;
            width: 176px;
            border: 1px solid #b1b1b1;
            float: right;
            margin-right: 1px;
            margin-top: 10px;
        }
        #div_content {
            margin-top: 45px;
            width: 1000px;
            height: 47px;
            float: left;
        }
        #div_shouye {
            height: 47px;
            width: 114px;
            margin-left: 24px;
            background-image: url(image/shouye_001.jpg);
            float: left;
        }
        #div_wengaoguanli {
            height: 47px;
            width: 149px;
            margin-left: 1px;
            float: left;
            background-image: url(image/wengaoguanli_001.jpg);
        }
        #wo {
            height: 47px;
            width: auto;
            font-family: "黑体";
            font-size: 25px;
            float: right;
            margin-right: 50px;
            color: #5e6761;
            line-height: 47px;
        }
        #man {
            height: 47px;
            width: 44px;
            background-image: url(image/man_001.jpg);
            float: right;
        }
        #xinxiweihu{
            height: 1179px;
            width: 1000px;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            border-radius: 8px;
        }
        #xinxiweihu_gap1{
            height: 17px;
            width: 1000px;
        }
        #xinxiweihu_header{
            height: 38px;
            width: 1000px;
            background-image: url(image/wodexinxi_001.jpg);
        }
        #xinxiweihu_content{
            width: 703px;
            height: 989px;
            margin-left: 134px;
        }
        #xinxiweihu_gap2{
            width: 1000px;
            height: 21px;
        }
        .xinxiweihu_row{
            width: 703px;
            height: 70px;
        }
        .xinxiweihu_leftcol{
            height: 70px;
            width: 247px;
            margin-left: 30px;
            float: left;
            font-family: "黑体";
            font-size: 25px;
            line-height: 70px;
            color: #464646;
        }
        .xinxiweihu_right{
            height: 33px;
            border: 1px solid #b1b1b1;
            width: 284px;
            margin-left: 8px;
            float: left;
            margin-top: 19px;
            font-family: "黑体";
            font-size: 25px;
            line-height: 33px;
        }
        .xinxiweihu_right1{
            height: 33px;
            width: 284px;
            margin-left: 8px;
            float: left;
            margin-top: 19px;
            font-family: "黑体";
            font-size: 25px;
            line-height: 33px;
        }
        #xinxiweihu_gap3{
            height: 26px;
            width: 1000px;
        }
        #baocun{
            width: 98px;
            height: 41px;
            margin-left: 419px;
            background-color: #00a9ff;
            line-height: 41px;
            text-align: center;
            font-family: "黑体";
            font-size: 20px;
            color: white;
            border-radius: 8px;
        }
        #div_zhuxiao{
            width: 77px;
            height: 31px;
            margin-right: 20px;
            margin-top: 7px;
            float: right;
            border-radius: 5px;
            background-color: #29ace2;
            font-family: "黑体";
            font-size: 17px;
            line-height: 31px;
            text-align: center;
            color: white;
        }
    </style>
</head>

<body>
<script type="text/javascript">
    //
    //整体变色动画
    $(".bianse").mouseenter(function () {
        $(this).css("background-color","rgba(54,130,169,1)");
    });
    $(".bianse").mouseleave(function () {
        $(this).css("background-color","#37abe7");
    });


    $(function(){
        $("#div_zhuce").mouseenter(function() {
            $("#div_zhuce").css("background-image", "url(image/zhuce2_001.jpg)");
        });
        $("#div_zhuce").mouseleave(function() {
            $("#div_zhuce").css("background-image", "url(image/zhuce1_001.jpg)");
        });
        $("#div_denglu").mouseenter(function() {
            $("#div_denglu").css("background-image", "url(image/login2_001.jpg)");
        });
        $("#div_denglu").mouseleave(function() {
            $("#div_denglu").css("background-image", "url(image/login1_001.jpg)");
        });
        $("#baocun").mouseenter(function(){
            $("#baocun").css("background-color","#478db1");
        });
        $("#baocun").mouseleave(function(){
            $("#baocun").css("background-color","#00a9ff");
        });


        //跳转页面
        $("#div_denglu").click(function(){
            location.href="../login/login.html";
        });
        $("#div_zhuce").click(function(){
            location.href="../register/register.html";
        });
        $("#div_shouye").click(function(){
            location.href="../index/index.jsp";
        });
        $("#baocun").click(function () {
            if(check()) {
                $("form").submit();
            }
        });


        //验证表单
        function check() {
            if($("input[name='dianhua']").val()==""){
                alert("电话不能为空");
                return false;
            }
            if($("input[name='jiatingzhuzhi']").val()==""){
                alert("家庭住址不能为空");
                return false;
            }
            return true;
        }



        //搜索
        $("#sousuo").click(function(){
            if($("input[name='sousuo']").val()==""){
                alert("搜索不能为空");
            }else {
                location.href="../index/index.jsp?sousuo="+$("input[name='sousuo']").val();
            }
        });p
    });
</script>
<div id="div_header">
    <div id="div_img">
        <a href="../index/index.jsp?zhuxiao=1">
            <div id="div_zhuxiao" class="bianse">注销</div>
        </a>
        <div id="sousuo"></div>
        <input type="text" name="sousuo" id="input_sousuo" />
        <div id="div_content">
            <div id="div_shouye"></div>
            <a href="../tian/tian.jsp">
                <div id="div_wengaoguanli"></div>
            </a>
            <div id="wo"><%
                if (xingming!=null) {
                    out.print(xingming);
                }
            %></div>
            <div id="man"></div>
        </div>
    </div>
</div>
<div id="xinxiweihu">
    <div id="xinxiweihu_gap1"></div>
    <div id="xinxiweihu_header"></div>
    <div id="xinxiweihu_gap2"></div>
    <%
        //打印用户信息
        if(xingming!=null){
            javabean bean=new javabean();
            bean.connect();
            ResultSet resultSet=bean.getYonghu(xingming);
            if(resultSet!=null){
                resultSet.last();
                int count=resultSet.getRow();
                resultSet.first();
                if(count!=0){
    %>
    <form action="xinxiweihu.jsp" method="post">
        <div id="xinxiweihu_content">
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">姓名</div>
            <div class="xinxiweihu_right1"><%
                out.print(resultSet.getString("xingming"));
            %></div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">性别</div>
            <div class="xinxiweihu_right1"><%
                if(resultSet.getString("xingbie").equals("m")){
                    out.print("男");
                }else {
                    out.print("女");
                }
            %></div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">单位</div>
            <input value="<%
            if(resultSet.getString("danwei")==null){
                out.print("");
            }else {
            out.print(resultSet.getString("danwei"));
            }
            %>" name="danwei" type="text" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">职称</div>
            <input value="<%
            if(resultSet.getString("zhicheng")==null){
                out.print("");
            }
            else {
                out.print(resultSet.getString("zhicheng"));
            }
            %>" name="zhicheng" type="text" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">电话</div>
            <input value="<%
            out.print(resultSet.getString("lianxifangshi"));
            %>" name="dianhua" type="tel" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">邮箱</div>
            <input type="email" name="youxiang" value="<%
            if(resultSet.getString("youxiang")==null){
                out.print("");
            }else {
                out.print(resultSet.getString("youxiang"));
            }
            %>" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">id</div>
            <div class="xinxiweihu_right1"><%
                out.print(resultSet.getString("id"));
            %></div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">推荐人</div>
            <div class="xinxiweihu_right1"><%
                if (resultSet.getString("tuijianren")==null){
                    out.print("");
                }else {
                    out.print(resultSet.getString("tuijianren"));
                }
            %></div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">行业分会</div>
            <div class="xinxiweihu_right1"><%
                out.print(resultSet.getString("hangyefenhui"));
            %></div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">专委会</div>
            <div class="xinxiweihu_right1"><%
                out.print(resultSet.getString("zhuanweihui"));
            %></div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">家庭住址</div>
            <input value="<%
            if(resultSet.getString("jiatingzhuzhi")==null){
                out.print("");
            }else {
                out.print(resultSet.getString("jiatingzhuzhi"));
            }
            %>" name="jiatingzhuzhi" type="text" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">微信</div>
            <input value="<%
            if(resultSet.getString("weixin")==null){
                out.print("");
            }else {
                out.print(resultSet.getString("weixin"));
            }
            %>" name="weixin" type="text" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">出生日期</div>
            <div class="xinxiweihu_right1"><%
                out.print(resultSet.getString("chushengriqi"));
            %></div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">职务</div>
            <input value="<%
            if(resultSet.getString("zhiwu")==null){
                out.print("");
            }else {
                out.print(resultSet.getString("zhiwu"));
            }
            %>" name="zhiwu" type="text" class="xinxiweihu_right"/>
        </div>
    </div>
    </form>
    <%
                }
            }
        }
    %>
    <div id="xinxiweihu_gap3"></div>
    <div id="baocun">保存</div>
</div>
</body>

</html>
