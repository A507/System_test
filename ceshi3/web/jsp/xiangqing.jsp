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

        #div_biaoti {
            width: 1000px;
            height: 51px;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
        }

        #div_font {
            width: auto;
            height: 51px;
            margin-left: 60px;
            float: left;
            line-height: 51px;
            font-family: "黑体";
            font-size: 30px;
        }

        #div_biaoti_content {
            width: 1000px;
            height: 118px;
            margin-top: 10px;
            background-color: white;
            border-radius: 8px;
            margin-left: auto;
            margin-right: auto;
        }

        #div_fandui {
            height: 50px;
            width: 1000px;
            margin-top: 11px;
        }

        #div_tian1 {
            margin-left: 56px;
            width: 79px;
            height: 50px;
            background-image: url(image/tian_001.jpg);
            float: left;
        }

        #div_jiezhiriqi {
            float: left;
            width: 123px;
            height: 50px;
            background-image: url(image/jiezhiriqi_001.jpg);
        }

        #div_tian2 {
            width: 52px;
            height: 17px;
            margin-top: 27px;
            float: left;
            font-family: "黑体";
            font-size: 20px;
            text-align: center;
            line-height: 17px;
        }

        #div_jiezhiriqi2 {
            width: 118px;
            height: 18px;
            margin-top: 27px;
            float: left;
            font-family: "黑体";
            font-size: 20px;
            text-align: center;
            line-height: 17px;
        }

        #div_pinglun_content {
            width: 1000px;
            height: auto;
            margin-top: 10px;
            background-color: white;
            border-radius: 8px;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
        }

        #t {
            width: 1000px;
            height: 70px;
        }

        #div_icon1 {
            width: 68px;
            height: 70px;
            float: left;
            margin-left: 61px;
            background-image: url(image/zuozhe_001.jpg);
        }

        #div_mingzi {
            width: auto;
            height: 30px;
            margin-top: 25px;
            margin-left: 6px;
            float: left;
            font-family: "黑体";
            font-size: 25px;
            line-height: 30px;
        }

        #div1 {
            height: 71px;
            width: 1000px;
        }

        #div_fandui3 {
            width: 84px;
            height: 71px;
            margin-left: 72px;
            float: left;
            background-image: url(image/fandui_001.jpg);
        }

        .div2 {
            height: 24px;
            width: 84px;
            margin-top: 44px;
            font-family: "黑体";
            font-size: 24px;
            line-height: 24px;
            text-align: center;
        }

        #div_fuyi {
            width: 84px;
            height: 71px;
            margin-left: 72px;
            float: left;
            background-image: url(image/fuyi_001.jpg);
        }

        #div_pinglun2 {
            width: 84px;
            height: 71px;
            margin-left: 72px;
            float: left;
            background-image: url(image/pinglun_001.jpg);
        }

        #div3 {
            width: 1000px;
            height: 25px;
            background-image: url(image/fengexian_001.jpg);
        }

        #div4 {
            width: 866px;
            margin-top: 7px;
            margin-left: 65px;
            height: auto;
            font-family: "黑体";
            font-size: 25px;
            background-color: #eeeeee;
        }

        #div5 {
            width: 1000px;
            height: 20px;
        }

        #div6 {
            width: 1000px;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            height: 74px;
            background-color: white;
            border-radius: 8px;
        }

        #input_1 {
            width: 757px;
            height: 40px;
            margin-left: 64px;
            margin-top: 18px;
            border: 1px solid #b1b1b1;
            font-family: "黑体";
            font-size: 20px;
            float: left;
        }

        #div_int {
            width: 95px;
            height: 42px;
            margin-left: 11px;
            margin-top: 18px;
            border-radius: 8px;
            background-color: #36abe7;
            float: left;
            font-family: "黑体";
            font-size: 20px;
            color: white;
            text-align: center;
            line-height: 42px;
        }

        #div_buttom {
            width: 1000px;
            height: auto;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            border-radius: 8px;
        }

        #div_pinglunimg {
            width: 1000px;
            height: 39px;
            background-image: url(image/pinglun2_001.jpg);
        }

        #div_gap1 {
            width: 1000px;
            height: 8px;
        }

        #div_content1 {
            height: 45px;
            width: 1000px;
        }

        #div_tupian {
            height: 45px;
            width: 49px;
            margin-left: 67px;
            background-image: url(image/pinglun1_001.jpg);
            float: left;
        }

        #div_fontcontent {
            height: 45px;
            width: auto;
            line-height: 45px;
            font-family: "黑体";
            font-size: 20px;
            float: left;
        }

        #div_fontcontent1 {
            height: 45px;
            width: auto;
            line-height: 45px;
            font-family: "黑体";
            font-size: 20px;
            color: #5e6761;
            float: right;
            margin-right: 73px;
        }

        #fontcontent {
            height: auto;
            width: 867px;
            margin-left: 69px;
            margin-top: 5px;
            font-family: "黑体";
            font-size: 20px;
        }

        #div_bottum {
            width: 1000px;
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            height: 50px;
        }

        .div_y1 {
            font-family: "黑体";
            font-size: 30px;
            color: black;
            background-color: white;
            border-radius: 8px;
            line-height: 50px;
            height: 50px;
            width: 50px;
            margin-left: 20px;
            float: left;
            text-align: center;
        }

        .div_y2 {
            font-family: "黑体";
            font-size: 25px;
            color: black;
            background-color: white;
            border-radius: 8px;
            line-height: 50px;
            height: 50px;
            width: 120px;
            margin-left: 20px;
            float: left;
            text-align: center;
        }
    </style>
</head>

<body>
<script type="text/javascript">
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

        $("#div_int").mouseenter(function() {
            $("#div_int").css("background-color", "#468eb1");
        });
        $("#div_int").mouseleave(function() {
            $("#div_int").css("background-color", "#36abe7");
        });


        //跳转页面
        $("#div_denglu").click(function() {
            location.href = "../login/login.html";
        });
        $("#div_zhuce").click(function() {
            location.href = "../register/register.html";
        });
        $("#man").click(function() {
            location.href = "../xinxiweihu/xinxiweihu.html";
        });
        $("#wo").click(function() {
            location.href = "../xinxiweihu/xinxiweihu.html";
        });
        $("#div_shouye").click(function(){
            location.href="../index/index.html";
        });
        $("#div_wengaoguanli").click(function(){
            location.href="../tian/tian.html";
        });

        //评论点击，复议点击
        $("#div_fandui3").click(function() {
            $("#div_fandui3").css("background-image", "url(image/fandui1_001.jpg)");
            var x = $("#fandui_1").html();
            x++;
            $("#fandui_1").html(x);
        });
        $("#div_fuyi").click(function() {
            $("#div_fuyi").css("background-image", "url(image/fuyi1_001.jpg)");
            var x = $("#fuyi_1").html();
            x++;
            $("#fuyi_1").html(x);
        });
    });
</script>

<div id="div_header">
    <div id="div_img">
        <div id="div_zhuce"></div>
        <div id="div_denglu"></div>
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
<div id="div_biaoti_content">
    <div id="div_biaoti">
        <div id="div_font">大家好，我是标题，凑凑字数</div>
    </div>
    <div id="div_fandui">
        <div id="div_tian1">
            <div id="div_tian2">1000</div>
        </div>
        <div id="div_jiezhiriqi">
            <div id="div_jiezhiriqi2">2017-12-12</div>
        </div>
    </div>
</div>
<div id="div_pinglun_content">
    <div id="t">
        <div id="div_icon1"></div>
        <div id="div_mingzi">某个人</div>
    </div>
    <div id="div1">
        <div id="div_fandui3">
            <div id="fandui_1" class="div2">200</div>
        </div>
        <div id="div_fuyi">
            <div id="fuyi_1" class="div2">220</div>
        </div>
        <div id="div_pinglun2">
            <div id="pinglun_1" class="div2">222</div>
        </div>
    </div>
    <div id="div3"></div>
    <div id="div4">一、关系知乎的关系更复杂一些1. 用户和用户之间的关系（更紧密的SNS关系）2. 用户和话题之间的关系（关注话题，汲取知识）3. 用户和问题之间的关系（关注问题，提出问题）4. 用户和答案之间的关系（回答，顶别人的回答，评论别人的回答）5. 问题和问题之间的关系（相似推荐）有了这些关系，经过不断的调教，知乎会越来越懂你，知道你感兴趣什么样的话题，什么样的人，什么人适合回答你的问题，什么回答对你来说更有价值最后可能会根据兴趣形成讨论圈子，话题小组而百度知道的关系要简单一些不会有太多社会化关系，不会有太多推荐系统二、用户知乎面向精英用户，百度面向草根用户正如quora和formspring的关系一样 作者：elya 链接：https://www.zhihu.com/question/19551114/answer/12216137 来源：知乎 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
    </div>
    <div id="div3"></div>
    <div id="div5"></div>
</div>
<div id="div6">
    <input name="pinglun" id="input_1" />
    <div id="div_int">评论</div>
</div>
<div id="div_buttom">
    <div id="div_gap1"></div>
    <div id="div_pinglunimg"></div>
    <div id="div_content1">
        <div id="div_tupian"></div>
        <div id="div_fontcontent">诡辩师</div>
        <div id="div_fontcontent1">2017-1-1</div>
    </div>
    <div id="fontcontent">大家好，我是你们的评论，哈哈哈哈哈哈</div>
    <div id="div3"></div>
    <div id="div_gap1"></div>
</div>
<div id="div_bottum">
    <div class="div_y2" style="color: #ffffff;background-color: #36abe7;margin-left: 0px">上一页</div>
    <div class="div_y1">1</div>
</div>
</body>

</html>
