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
        #div_guanli_header{
            height: 55px;
            width: 1000px;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            border-radius: 8px;
        }
        #guanli_gap1{
            width: 33px;
            height: 55px;
            float: left;
        }
        .guanli_header{
            width: 130px;
            height: 55px;
            float: left;
            background-color: #36abe7;
            color: white;
            text-align: center;
            font-family: "黑体";
            font-size: 20px;
            line-height: 55px;
        }
        #guanl_sousuo_content{
            width: 1000px;
            height: 83px;
            background-color: white;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            border-radius: 8px;
        }
        #guanli_sousuo_{
            width: 62px;
            height: 83px;
            margin-right: 50px;
            float: right;
            background-image: url(image/sousuo_guanli_001.jpg);
        }
        #input_content1{
            width: 188px;
            height: 83px;
            margin-right: 8x;
            float: right;
        }
        #input_guanli{
            width: 188px;
            height: 34px;
            margin-top: 23px;
            border: 1px solid #b1b1b1;
            float: right;
            font-family: "黑体";
            color: #cccccc;
            font-size: 20px;
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
        .shangchuanzhe {
            width: auto;
            height: 37px;
            float: left;
            margin-left: 37px;
            line-height: 37px;
            text-align: center;
            font-family: "黑体";
            color: #636363;
            font-size: 25px;
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
        .xiangqing {
            width: 97px;
            height: 39px;
            margin-right: 16px;
            margin-top: 7px;
            float: right;
            border-radius: 8px;
            background-color: #29ace2;
            font-family: "黑体";
            font-size: 20px;
            line-height: 39px;
            text-align: center;
            color: white;
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
        .xuanze {
            width: 97px;
            height: 39px;
            margin-right: 16px;
            margin-top: 7px;
            float: right;
            border-radius: 8px;
            background-color: grey;
            font-family: "黑体";
            font-size: 20px;
            line-height: 39px;
            text-align: center;
            color: white;
        }
        #tongyi{
            width: 97px;
            height: 39px;
            margin-right: 16px;
            margin-top: 7px;
            float: left;
            border-radius: 8px;
            background-color: #29ace2;
            font-family: "黑体";
            font-size: 20px;
            line-height: 39px;
            text-align: center;
            color: white;
        }
        .content_guanli2{
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            width: 1000px;
            height: auto;
        }
        #tongyi1{
            width: 97px;
            height: 39px;
            margin-right: 16px;
            margin-top: 7px;
            float: left;
            border-radius: 8px;
            background-color: #29ace2;
            font-family: "黑体";
            font-size: 20px;
            line-height: 39px;
            text-align: center;
            color: white;
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
<div id="div_guanli_header">
    <div id="guanli_gap1"></div>
    <div class="guanli_header">身份管理</div>
</div>
<div id="guanl_sousuo_content">
    <div id="guanli_sousuo_"></div>
    <div input_content1>
        <input type="text" value="姓名" id="input_guanli"/>
    </div>
</div>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe">诡辩师</div>
        <div class="shangchuanzhe1">状态</div>
        <div class="shangchuanzhe1">id:100</div>
        <div class="shangchuanzhe1">复议数:0</div>
        <div class="shangchuanzhe1">反对数:100</div>
        <div class="biaoti">这个是标题</div>
        <div id="x1" class="xiangqing">查看</div>
        <div class="xuanze">未选择</div>
    </div>
</div>
<div class="content_guanli2">
    <div id="tongyi">同意</div>
    <div id="tongyi1">拒绝</div>
</div>
</body>

</html>
