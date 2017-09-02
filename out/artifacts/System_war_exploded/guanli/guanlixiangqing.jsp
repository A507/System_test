<%--
  Created by IntelliJ IDEA.
  User: solow
  Date: 2017/9/2
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bean.javabean" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>

<%
    request.setCharacterEncoding("UTF-8");

    String id=request.getParameter("id");
    String panduan=request.getParameter("panduan");
    int id1=Integer.valueOf(id);


    javabean JAVA=new javabean();
    JAVA.connect();
    String quanxian1;

    quanxian1=JAVA.GETquanxian(id1);





%>

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

        #chakan_content {
            width: 1000px;
            margin-top: 10px;
        ;
            margin-left: auto;
            margin-right: auto;
            height: auto;
            background-color: white;
            border-radius: 8px;
        }

        .biaoti_chakan {
            width: 1000px;
            height: 60px;
        }

        .biaoti_chakan1 {
            width: 150px;
            height: 40px;
            margin-top: 10px;
            margin-left: 20px;
            font-family: "黑体";
            font-size: 25px;
            background-color: #cccccc;
            line-height: 40px;
            float: left;
            text-align: center;
            border-radius: 5px;
        }

        .text_chakan {
            width: 1000px;
            height: 360px;
        }

        .text_left_chakan {
            width: 500px;
            height: 60px;
            line-height: 60px;
            text-align: right;
            font-family: "黑体";
            font-size: 25px;
            color: dimgrey;
            float: left;
        }

        .text_right_chakan {
            width: 500px;
            height: 60px;
            line-height: 60px;
            text-align: left;
            font-family: "黑体";
            font-size: 25px;
            color: dimgrey;
            float: left;
        }

        .text_chakan1 {
            width: 1000px;
            height: 720px;
        }
        #text_chakan2{
            width: 400px;
            height: 300px;
            text-align: right;
            font-family: "黑体";
            font-size: 25px;
            color: dimgrey;
            float: left;
        }
        #text_chakan3{
            width: 400px;
            height: 300px;
            text-align: left;
            font-family: "黑体";
            font-size: 25px;
            color: dimgrey;
            float: left;
            margin-left: 10px;
        }
        .button_chakan{
            width: 97px;
            height: 39px;
            margin-left: 120px;
            float: left;
            border-radius: 8px;
            background-color: #29ace2;
            font-family: "黑体";
            font-size: 20px;
            line-height: 39px;
            text-align: center;
            color: white;
        }
        .button_content_chakan{
            width: 1000px;
            margin-top: 10px;
            height: 39px;
        }
        .gap_chakan{
            width: 1000px;
            height: 50px;
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
        #div_guali {
            height: 47px;
            width: 101px;
            margin-left: 1px;
            float: left;
            background-image:url(image/guanli1_001.jpg);
        }
    </style>
</head>

<body>
<script type="text/javascript">
    $(function(){
        $(".bianse").mouseenter(function () {
            $(this).css("background-color","rgba(54,130,169,1)");
        });
        $(".bianse").mouseleave(function () {
            $(this).css("background-color","#37abe7");
        });
    });
</script>

<div id="div_header">
    <div id="div_img">
        <div id="div_zhuxiao" class="bianse">注销</div>
        <div id="sousuo"></div>
        <input type="text" name="sousuo" id="input_sousuo" />
        <div id="div_content">
            <div id="div_shouye"></div>
            <div id="div_wengaoguanli"></div>
            <div id="div_guali"></div>
            <div id="wo">诡辩师</div>
            <div id="man"></div>
        </div>
    </div>
</div>
<div id="chakan_content">
    <div class="biaoti_chakan">
        <div class="biaoti_chakan1">用户信息</div>
    </div>
    <div class="text_chakan">
        <div class="text_left_chakan">姓名:</div>
        <div class="text_right_chakan">张三</div>
        <div class="text_left_chakan">性别:</div>
        <div class="text_right_chakan">男</div>
        <div class="text_left_chakan">出生日期:</div>
        <div class="text_right_chakan">1990-01-01</div>
        <div class="text_left_chakan">家庭住址:</div>
        <div class="text_right_chakan">xxxxxxx</div>
        <div class="text_left_chakan">联系方式:</div>
        <div class="text_right_chakan">xxxxxxxx</div>
        <div class="text_left_chakan">推荐人:</div>
        <div class="text_right_chakan">李四</div>
    </div>
    <div class="button_content_chakan">
        <div class="button_chakan">会员</div>
        <a href="../guanli/guanlixiangqing.jsp?panduan=2&id=<%out.print(id);%>">
        <div class="button_chakan" style="background-color: darkgray">推荐</div>
        </a>
        <a href="../guanli/guanlixiangqing.jsp?panduan=3&id=<%out.print(id);%>">
        <div class="button_chakan" style="background-color: darkgray">备案</div>
        </a>
            <a href="../guanli/guanlixiangqing.jsp?panduan=4&id=<%out.print(id);%>">
        <div class="button_chakan" style="background-color: darkgray">立案</div>
            </a>
        <%if(panduan!=null) {
            if (panduan.equals("2")) {
                JAVA.SETquanxian(id1, "2");
            }
            if (panduan.equals("3")) {
                JAVA.SETquanxian(id1, "3");
            }
            if (panduan.equals("4")) {
                JAVA.SETquanxian(id1, "4");
            }
        }%>
    </div>
    <div class="gap_chakan"></div>
</div>
</body>

</html>
