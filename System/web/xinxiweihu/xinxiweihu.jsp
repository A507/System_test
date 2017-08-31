<%--
  Created by IntelliJ IDEA.
  User: 卢人玮
  Date: 2017/8/31
  Time: 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");



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
            location.href="../index/index.html";
        });
        $("#div_wengaoguanli").click(function(){
            location.href="../tian/tian.html";
        });
    });
</script>
<div id="div_header">
    <div id="div_img">
        <div id="div_zhuxiao">注销</div>
        <div id="sousuo"></div>
        <input type="text" name="sousuo" id="input_sousuo" />
        <div id="div_content">
            <div id="div_shouye"></div>
            <div id="div_wengaoguanli"></div>
            <div id="wo">诡辩师</div>
            <div id="man"></div>
        </div>
    </div>
</div>
<div id="xinxiweihu">
    <div id="xinxiweihu_gap1"></div>
    <div id="xinxiweihu_header"></div>
    <div id="xinxiweihu_gap2"></div>
    <div id="xinxiweihu_content">
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">姓名</div>
            <input value="卢人玮" type="text" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">性别</div>
            <div class="xinxiweihu_right1">男</div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">单位</div>
            <input value="北京工业大学" type="text" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">职称</div>
            <input value="校长" type="text" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">电话</div>
            <input value="12345677" type="tel" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">邮箱</div>
            <input type="email" value="12345677@123.com" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">id</div>
            <div class="xinxiweihu_right1">1238754</div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">推荐人</div>
            <div class="xinxiweihu_right1">这是推荐人</div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">行业分会</div>
            <div class="xinxiweihu_right1">不知道</div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">专委会</div>
            <div class="xinxiweihu_right1">这是啥</div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">家庭住址</div>
            <input value="北工大" type="text" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">微信</div>
            <input value="sdfsdfs" type="text" class="xinxiweihu_right"/>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">出生日期</div>
            <div class="xinxiweihu_right1">2017-09-08</div>
        </div>
        <div class="xinxiweihu_row">
            <div class="xinxiweihu_leftcol">职务</div>
            <input value="教授" type="text" class="xinxiweihu_right"/>
        </div>
    </div>
    <div id="xinxiweihu_gap3"></div>
    <div id="baocun">保存</div>
</div>
</body>

</html>
