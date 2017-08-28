<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.beans.Statement" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="bean.javabean"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>首页</title>
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
        #div_guali {
            height: 47px;
            width: 101px;
            margin-left: 1px;
            float: left;
            background-image:url(image/guanli_001.jpg);
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

        .div_shijian {
            width: auto;
            height: 37px;
            float: right;
            margin-right: 62px;
            line-height: 37px;
            text-align: center;
            font-family: "黑体";
            color: #939393;
            font-size: 25px;
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

        #div_bottum {
            width: 1000px;
            margin-top: 20px;
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

        #man {
            height: 47px;
            width: 44px;
            background-image: url(image/man_001.jpg);
            float: right;
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

        #s {
            width: 1000px;
            border-radius: 8px;
            height: 48px;
            margin-top: 10px;
            background-color: white;
            margin-left: auto;
            margin-right: auto;
        }

        #shaixuan {
            width: 45px;
            height: 48px;
            float: left;
            background-image: url(image/%EF%BD%93%EF%BD%88%EF%BD%81%EF%BD%89%EF%BD%98%EF%BD%95%EF%BD%81%EF%BD%8E_001.png);
            border-radius: 8px;
        }

        #div_shaixuan {
            width: 59px;
            height: 48px;
            float: left;
            font-family: "黑体";
            font-size: 25px;
            text-align: center;
            line-height: 48px;
            color: #5e6761;
        }

        select {
            -webkit-appearance: none;
            border-radius: 0px;
            border: 0px;
            text-align-last: center;
        }
        option{
            text-align-last: center;
        }
        #paixu{
            height: 48px;
            width: 49px;
            float: left;
            background-image: url(image/%EF%BD%90%EF%BD%81%EF%BD%89%EF%BD%98%EF%BD%95_001.png);
        }
        #div_paixu{
            width: 59px;
            height: 48px;
            float: left;
            font-family: "黑体";
            font-size: 25px;
            text-align: center;
            line-height: 48px;
            color: #5e6761;
        }
        #div_shaixuan1 {
            width: 59px;
            height: 48px;
            float: left;
            font-family: "黑体";
            font-size: 25px;
            text-align: center;
            line-height: 48px;
            color: #5e6761;
        }
    </style>
</head>

<body>
<jsp:useBean id="javabean" scope="page" class="bean.javabean"/>
        <%
                 String xxx=(String)request.getParameter("id4");
    %>


        <%
String[] id3=new String[10];
    String[] address3=new String[10];String[] phone3=new String[10];String[] referee3=new String[10];String[] sex3=new String[10];
    String[] date3=new String[10];String[] industry3=new String[10];String[] committee3=new String[10];String[] password3=new String[10];

    String id1=(String)request.getParameter("id1");
    String quanxian1=(String)request.getParameter("quanxian") ;
    javabean JAVA=new javabean();
    JAVA.connection();
    JAVA.output();
   int i=0;
   for(i=0;i<10;i++){
       id3[i]=JAVA.getID(i);
       address3[i]=JAVA.getadd(i);
       phone3[i]=JAVA.getpho(i);
       referee3[i]=JAVA.getref(i);

       sex3[i]=JAVA.getsex(i);
       date3[i]=JAVA.getdate(i);
       industry3[i]=JAVA.getind(i);
       committee3[i]=JAVA.getcom(i);
       password3[i]=JAVA.getpassword(i);

   }


    //展示
     //response.sendRedirect("index.jsp");
%>
<a href="xiugai.jsp?xingming=<%out.print(xxx);%>">
</a>
    <a href="tian.jsp?xingming=<%out.print(xxx);%>">

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

        //详情动画
        $("#x1").mouseenter(function() {
            $("#x1").css("background-image", "url(image/xiangqing2_001.jpg)")
        });

        $("#x1").mouseleave(function() {
            $("#x1").css("background-image", "url(image/xiangqing1_001.jpg)")
        });

        //跳转页面
        $("#div_wengaoguanli").click(function(){
            location.href="../jsp/tian.jsp";
        });
        $("#x1").click(function(){
            location.href="../xiangqing/xiangqing.html";
        });
        $("#div_denglu").click(function(){
            location.href="../jsp/login.jsp";
        });
        $("#div_zhuce").click(function(){
            location.href="../jsp/re.jsp";
        });
        $("#wo").click(function(){

            location.href="../jsp/xiugai.jsp";
        });
        $("#man").click(function(){
            location.href="../jsp/xiugai.jsp";
        });

        //搜索
        $("#sousuo").click(function(){
            $("#sousuo_form").submit();
        });
    });
</script>



<%
    String id=request.getParameter("id");
%>

<%
String bianhao;
String mingcheng;
String zuozhe;
String data;
String neirong;
                javabean JAVA1=new javabean();
                JAVA1.connectionwendang();
                JAVA1.search2("5");

                bianhao=JAVA1.getwendang();
                mingcheng=JAVA1.getming();
                data=JAVA1.getda();
                zuozhe=JAVA1.getzuo();
                neirong=JAVA1.getnei();
                System.out.println(data);
%>
<div id="div_header">
    <div id="div_img">
        <div id="div_zhuce"></div>
        <div id="div_denglu"></div>
        <div id="sousuo"></div>
        <form id="sousuo_form" method="post" action="searchindex.jsp">
        <input type="text" name="sousuo" id="input_sousuo" />
        </form>
        <div id="div_content">
            <div id="div_shouye"></div>
            <div id="div_wengaoguanli"></div>
            <div id="div_guali"></div>
            <div id="wo"><%out.print(xxx);%></div>
            <div id="man"></div>
        </div>
    </div>
</div>
<div id="s">
    <div id="shaixuan"></div>
    <select id="div_shaixuan">
        <option value="volvo">标题</option>
        <option value="volvo">作者</option>
    </select>
    <div id="paixu"></div>
    <select id="div_shaixuan1">
        <option value="volvo">升序</option>
        <option value="volvo">降序</option>
    </select>
</div>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe">诡辩师</div>
        <div class="shangchuanzhe1">状态</div>
        <div class="shangchuanzhe1">id:100</div>
        <div class="shangchuanzhe1">复议数:0</div>
        <div class="shangchuanzhe1">反对数:100</div>
        <div class="div_shijian">2017-1-2</div>
        <div class="biaoti">这个是标题</div>
        <div id="x1" class="xiangqing"></div>
    </div>
</div>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe">诡辩师</div>
        <div class="shangchuanzhe1">状态</div>
        <div class="shangchuanzhe1">id:100</div>
        <div class="shangchuanzhe1">复议数:0</div>
        <div class="shangchuanzhe1">反对数:100</div>
        <div class="div_shijian">2017-1-2</div>
        <div class="biaoti">这个是标题</div>
        <div id="x1" class="xiangqing"></div>
    </div>
</div>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe">诡辩师</div>
        <div class="shangchuanzhe1">状态</div>
        <div class="shangchuanzhe1">id:100</div>
        <div class="shangchuanzhe1">复议数:0</div>
        <div class="shangchuanzhe1">反对数:100</div>
        <div class="div_shijian">2017-1-2</div>
        <div class="biaoti">这个是标题</div>
        <div id="x1" class="xiangqing"></div>
    </div>
</div>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe">诡辩师</div>
        <div class="shangchuanzhe1">状态</div>
        <div class="shangchuanzhe1">id:100</div>
        <div class="shangchuanzhe1">复议数:0</div>
        <div class="shangchuanzhe1">反对数:100</div>
        <div class="div_shijian">2017-1-2</div>
        <div class="biaoti">这个是标题</div>
        <div id="x1" class="xiangqing"></div>
    </div>
</div>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe">诡辩师</div>
        <div class="shangchuanzhe1">状态</div>
        <div class="shangchuanzhe1">id:100</div>
        <div class="shangchuanzhe1">复议数:0</div>
        <div class="shangchuanzhe1">反对数:100</div>
        <div class="div_shijian">2017-1-2</div>
        <div class="biaoti">这个是标题</div>
        <div id="x1" class="xiangqing"></div>
    </div>
</div>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe">诡辩师</div>
        <div class="shangchuanzhe1">状态</div>
        <div class="shangchuanzhe1">id:100</div>
        <div class="shangchuanzhe1">复议数:0</div>
        <div class="shangchuanzhe1">反对数:100</div>
        <div class="div_shijian">2017-1-2</div>
        <div class="biaoti">这个是标题</div>
        <div id="x1" class="xiangqing"></div>
    </div>
</div>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe">诡辩师</div>
        <div class="shangchuanzhe1">状态</div>
        <div class="shangchuanzhe1">id:100</div>
        <div class="shangchuanzhe1">复议数:0</div>
        <div class="shangchuanzhe1">反对数:100</div>
        <div class="div_shijian">2017-1-2</div>
        <div class="biaoti">这个是标题</div>
        <div id="x1" class="xiangqing"></div>
    </div>
</div>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe">诡辩师</div>
        <div class="shangchuanzhe1">状态</div>
        <div class="shangchuanzhe1">id:100</div>
        <div class="shangchuanzhe1">复议数:0</div>
        <div class="shangchuanzhe1">反对数:100</div>
        <div class="div_shijian">2017-1-2</div>
        <div class="biaoti">这个是标题</div>
        <div id="x1" class="xiangqing"></div>
    </div>
</div>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe">诡辩师</div>
        <div class="shangchuanzhe1">状态</div>
        <div class="shangchuanzhe1">id:100</div>
        <div class="shangchuanzhe1">复议数:0</div>
        <div class="shangchuanzhe1">反对数:100</div>
        <div class="div_shijian">2017-1-2</div>
        <div class="biaoti">这个是标题</div>
        <div id="x1" class="xiangqing"></div>
    </div>
</div>
<div id="div_bottum">
    <div class="div_y2" style="color: #ffffff;background-color: #36abe7;margin-left: 0px">上一页</div>
    <div class="div_y1">1</div>
</div>
</body>

</html>