<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>详情</title>
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

        #div_content10 {
            width: 1000px;
            height: auto;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            border-radius: 8px;
        }

        #input_text {
            width: 800px;
            height: 50px;
            margin-left: 100px;
            border: 1px solid #b1b1b1;
            font-family: "黑体";
            font-size: 30px;
            color: #cccccc;
        }

        #div_gap1 {
            width: 1000px;
            height: 20px;
        }

        #textarea {
            width: 800px;
            height: 300px;
            margin-left: 100px;
            border: 1px solid #b1b1b1;
            font-family: "黑体";
            font-size: 25px;
            color: #cccccc;
        }

        #div_tijiao {
            height: 45px;
            width: 100px;
            margin-left: 100px;
            float: left;
            clear: left;
            background-color: #36abe7;
            border-radius: 8px;
            color: white;
            font-family: "黑体";
            font-size: 25px;
            line-height: 45px;
            text-align: center;
        }

        #content100 {
            height: 45px;
            width: 1000px;
        }

        #content11 {
            height: auto;
            width: 1000px;
        }

        .div_tijiao {
            height: 45px;
            width: 300px;
            margin-left: 50px;
            float: left;
            background-color: #5e6761;
            border-radius: 8px;
            color: white;
            font-family: "黑体";
            font-size: 25px;
            line-height: 45px;
            text-align: center;
        }
        #div_tijiao1 {
            height: 45px;
            width: 100px;
            margin-left: 50px;
            float: left;
            background-color: #36abe7;
            border-radius: 8px;
            color: white;
            font-family: "黑体";
            font-size: 25px;
            line-height: 45px;
            text-align: center;
        }
        .div_content {
            width: 1000px;
            height: 100px;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            border-radius: 8px;
        }
        .div_head {
            width: 1000px;
            height: 37px;
            float: left;
        }
        .shangchuanzhe1 {
            width: auto;
            height: 37px;
            float: left;
            margin-left: 37px;
            line-height: 37px;
            text-align: center;
            font-family: "黑体";
            color: #939393;
            font-size: 25px;
        }
        .div_shijian {
            width: auto;
            height: 37px;
            float: right;
            margin-right: 62px;
            line-height: 37px;
            text-align: center;
            font-family: "黑体";
            color: #939393;
            font-size: 30px;
        }
        .biaoti {
            width: auto;
            height: 39px;
            float: left;
            margin-left: 16px;
            margin-top: 6px;
            line-height: 39px;
            text-align: center;
            font-family: "黑体";
            font-size: 30px;
            clear: left;
        }
        .xiangqing {
            width: 97px;
            height: 39px;
            margin-right: 16px;
            margin-top: 7px;
            float: right;
            clear: right;
            background-image: url(image/xiangqing1_001.jpg);
            border-radius: 8px;
        }
        .chexiao{
            width: 97px;
            height: 39px;
            margin-right: 16px;
            margin-top: 7px;
            float: right;
            border-radius: 8px;
            color: white;
            text-align: center;
            line-height: 39px;
            background-color: #36abe7;
            font-family: "黑体";
            font-size: 20px;
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
    <%
         String id2=(String)request.getParameter("xingming");
%>
    $(function() {
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
        $("#div_tijiao").mouseenter(function(){
            $("#div_tijiao").css("background-color","#478db1");
        });
        $("#div_tijiao1").mouseenter(function(){
            $("#div_tijiao1").css("background-color","#478db1");
        });
        $("#div_tijiao").mouseleave(function(){
            $("#div_tijiao").css("background-color","#36abe7");
        });
        $("#div_tijiao1").mouseleave(function(){
            $("#div_tijiao1").css("background-color","#36abe7");
        });
        $("#tongyi").click(function(){
            $("#tongyi").css("background-color","#36abe7");
        });
        $("#chexiao1").mouseenter(function(){
            $("#chexiao1").css("background-color","#478db1");
        });
        $("#chexiao1").mouseleave(function(){
            $("#chexiao1").css("background-color","#36abe7");
        });
        $("#x1").mouseleave(function(){
            $("#x1").css("background-image","url(image/xiangqing1_001.jpg)");
        });
        $("#x1").mouseenter(function(){
            $("#x1").css("background-image","url(image/xiangqing2_001.jpg)");
        });


        //跳转页面
        $("#div_denglu").click(function(){
            location.href="../jsp/login.jsp";
        });
        $("#div_zhuce").click(function(){
            location.href="..jsp/reg.gsp";
        });
        $("#div_shouye").click(function(){
            location.href="../jsp/index.jsp";
        });
        $("#wo").click(function(){
            location.href="../xinxiweihu/xinxiweihu.html";
        });
        $("#man").click(function(){
            location.href="../xinxiweihu/xinxiweihu.html";
        });
        $("#div_tijiao").click(function(){
            $("form").submit();
        });
    });

</script>
<a href="tianh.jsp?xingming=<%out.print(id2);%>">
<div id="div_header">
    <div id="div_img">
        <div id="div_zhuxiao">注销</div>
        <div id="sousuo"></div>
        <input type="text" name="sousuo" id="input_sousuo" />
        <div id="div_content">
            <div id="div_shouye"></div>
            <div id="div_wengaoguanli"></div>
            <div id="wo"><%out.print(id2);%></div>
            <div id="man"></div>
        </div>
    </div>
</div>
<div id="div_content10">
    <form action="tianh.jsp" method="post">
    <div id="div_gap1"></div>
    <input name="mingcheng" value="添加标题" id="input_text" type="text" />
    <div id="div_gap1"></div>
    <div id="div_gap1"></div>
    <textarea name="neirong" id="textarea" cols=10 style="overflow-x:hidden;overflow-y:hidden" rows="3" cols="20">输入内容
</textarea>
    </form>
    <div id="div_gap1"></div>
    <div id="content11">
    </div>
    <div id="content100">
        <div id="div_tijiao">提交</div>
        <div id="tongyi" class="div_tijiao">我已阅读提案建议要求</div>
        <div id="div_tijiao1">保存</div>
    </div>
    <div id="div_gap1"></div>
</div>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe1">状态</div>
        <div class="shangchuanzhe1">id:100</div>
        <div class="shangchuanzhe1">复议数:0</div>
        <div class="shangchuanzhe1">反对数:100</div>
        <div class="div_shijian">2017-1-2</div>
        <div class="biaoti">这个是标题</div>
        <div id="x1" class="xiangqing"></div>
        <div id="chexiao1" class="chexiao">撤销</div>
    </div>
</div>
</body>

</html>
