<%--
  Created by IntelliJ IDEA.
  User: 卢人玮
  Date: 2017/8/30
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="bean.javabean" %>
<%
    request.setCharacterEncoding("UTF-8");




    //获取参数
    String quanxian=null;
    String password=null;
    String user_id=null;
    String xingming=null;
    String caogao=request.getParameter("caogao");





    //获得hash
    //检查cookie确认登录状态
    String hash = null;
    Cookie[] cookie=request.getCookies();
    if (cookie==null){
        //测试
        //out.print("<h1>cookie=null</h1>");
        hash="";
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
           // out.print("<h1>hash=" + hash + "</h1>");
        }
    }






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
                return;
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


    //未验证不允许通过
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







    //测试接收的信息
    String biaoti=request.getParameter("biaoti");
    String neirong=request.getParameter("neirong");
    String msg=request.getParameter("msg");
    String tian_id=request.getParameter("tian_id");
    String tian=null;
    //out.print("<h1>标题："+biaoti+"</h1>");
    //out.print("<h1>内容："+neirong+"</h1>");
    //out.print("<h1>msg="+msg+"</h1>");
    if(biaoti==null){
        biaoti="";
    }
    //内容不能为空
    if(tian_id==null) {
        if (neirong == null) {
            response.sendRedirect("../tian/tian.jsp?msg=1");
            return;
        } else if (neirong.equals("")) {
            response.sendRedirect("../tian/tian.jsp?msg=1");
            return;
        }
        if(msg==null){
            msg="";
        }
        if (msg.equals("")){
            response.sendRedirect("../index/index.jsp");
            return;
        }
    }






    //提交
    if (tian_id!=null){
        if (tian_id.equals("")){
            response.sendRedirect("../tian/tian.jsp");
            return;
        }
        javabean bean=new javabean();
        bean.connect();
        ResultSet resultSet=bean.getTianById(tian_id);
        if(resultSet==null){
            response.sendRedirect("../index/index.jsp");
            bean.closeDatabase();
        }
        resultSet.last();
        if(resultSet.getRow()==0){
            response.sendRedirect("../index/index.jsp");
            return;
        }
        tian="1";
        biaoti=resultSet.getString("biaoti");
        neirong=resultSet.getString("neirong");
        resultSet.close();
        bean.closeDatabase();
    }
    else if(msg.equals("1")){
        javabean bean=new javabean();
        bean.connect();
        String count=bean.getTianShuLiang(xingming);
        //测试
        out.print("<h1>count="+count+"</h1>");
        if(count==null){
            response.sendRedirect("../tian/tian.jsp");
            return;
        }
        else if (Integer.valueOf(count)>=3){
            response.sendRedirect("../tian/tian.jsp?msg=9");
            return;
        }else {
            if (!bean.insertTian(biaoti, neirong, xingming, "未审核")) {
                out.print("<h1>插入服务器错误，请稍后重试</h1>");
            }
        }
        bean.closeDatabase();
    }



    //评论
    //接受评论参数
    String pinglun=request.getParameter("pinglun");
    if(pinglun!=null){
        if (tian_id!=null){
            if (!tian_id.equals("")){
                if (!pinglun.equals("")){
                    javabean bean=new javabean();
                    bean.connect();
                    bean.insertPinglun(xingming,tian_id,pinglun);
                    bean.closeDatabase();
                    //测试
                    //out.print("<h1>评论成功</h1>");
                }
            }
        }
    }


    //复议
    String fuyi=request.getParameter("fuyi");
    String dianzan=null;
    if (fuyi!=null){
        if (fuyi.equals("1")){
            if (tian_id!=null){
                if (!tian_id.equals("")){
                    javabean bean=new javabean();
                    bean.connect();
                    //判断是否点赞过
                    ResultSet resultSet=bean.checkFuyi(xingming,tian_id);
                    if (resultSet!=null){
                     resultSet.last();
                     //没点赞
                     if (resultSet.getString("COUNT(*)").equals("0")){
                         bean.insertFuyi(tian_id,xingming);
                     }
                     //已经点赞
                        else{
                         bean.deleteFuyi(xingming,tian_id);
                     }
                    }
                }
            }
        }
    }







    //反对
    String fandui=request.getParameter("fandui");
    String fandui_1=null;
    if (fandui!=null){
        if (fandui.equals("1")){
            if (tian_id!=null){
                if (!tian_id.equals("")){
                    javabean bean=new javabean();
                    bean.connect();
                    //判断是否点赞过
                    ResultSet resultSet=bean.checkFandui(xingming,tian_id);
                    if (resultSet!=null){
                        resultSet.last();
                        //没点赞
                        if (resultSet.getString("COUNT(*)").equals("0")){
                            bean.insertFandui(tian_id,xingming);
                        }
                        //已经点赞
                        else{
                            bean.deleteFandui(xingming,tian_id);
                        }
                    }
                }
            }
        }
    }


    //是否反对
    if(fandui_1==null){
        if(tian_id!=null){
            if (!tian_id.equals("")){
                javabean bean=new javabean();
                bean.connect();
                ResultSet resultSet=bean.checkFandui(xingming,tian_id);
                if(resultSet!=null){
                    resultSet.last();
                    //点赞过
                    if(resultSet.getString("COUNT(*)").equals("0")){
                        fandui_1="0";
                    }else {
                        fandui_1="1";
                    }
                }
            }
        }
    }



    //是否点赞过
    if(dianzan==null){
        if(tian_id!=null){
            if (!tian_id.equals("")){
                javabean bean=new javabean();
                bean.connect();
                ResultSet resultSet=bean.checkFuyi(xingming,tian_id);
                if(resultSet!=null){
                    resultSet.last();
                    //点赞过
                    if(resultSet.getString("COUNT(*)").equals("0")){
                        dianzan="0";
                    }else {
                        dianzan="1";
                    }
                }
            }
        }
    }





    //保存草稿
    if(caogao!=null) {
        if(caogao.equals("1")) {
            if (neirong != null) {
                if (!neirong.equals("")) {
                    javabean bean = new javabean();
                    bean.connect();
                    bean.insertTianCaogao(biaoti, neirong, xingming);
                    bean.closeDatabase();
                }
            }
        }
    }
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
            background-image: url(image/fandui<%
            if (fandui_1!=null){
                if(fandui_1.equals("1")){
                    out.print("1");
                }
            }
            %>_001.jpg);
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
            background-image: url(image/fuyi<%
            if(dianzan!=null){
                if (dianzan.equals("1")){
                    out.print("1");
                }
            }
            %>_001.jpg);
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
        $("#div_int").click(function() {
            $("form").submit();
        });

        //评论点击，复议点击



        //整体变色动画
        $(".bianse").mouseenter(function () {
            $(this).css("background-color","rgba(54,130,169,1)");
        });
        $(".bianse").mouseleave(function () {
            $(this).css("background-color","#37abe7");
        });

        $("#div_zhuxiao").click(function () {
            location.href="../index/index.jsp?zhuxiao=1";
        });
        $("#div_shouye").click(function () {
            location.href="../index/index.jsp";
        });



        //搜索
        $("#sousuo").click(function(){
            if($("input[name='sousuo']").val()==""){
                alert("搜索不能为空");
            }else {
                location.href="../index/index.jsp?sousuo="+$("input[name='sousuo']").val();
            }
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
            <a href="../xinxiweihu/xinxiweihu.jsp">
            <div id="wo"><%
                if(xingming!=null){
                    if(!xingming.equals("")){
                        out.print(xingming);
                    }
                }
            %></div>
            <div id="man"></div>
            </a>
        </div>
    </div>
</div>
<div id="div_biaoti_content">
    <div id="div_biaoti">
        <div id="div_font">
            <%
                if (biaoti==null){
                    biaoti="";
                }
                out.print(biaoti);
            %>
        </div>
    </div>
    <div id="div_fandui">
        <div id="div_tian1">
            <div id="div_tian2"><%
                if (tian_id!=null){
                    if(!tian_id.equals("")){
                        out.print(tian_id);
                    }
                }
            %></div>
        </div>
        <div id="div_jiezhiriqi">
            <div id="div_jiezhiriqi2">2017-12-12</div>
        </div>
    </div>
</div>
<div id="div_pinglun_content">
    <div id="t">
        <div id="div_icon1"></div>
        <div id="div_mingzi">
            <%
                out.print(xingming);
            %>
        </div>
    </div>
    <div id="div1">
        <a href="xiangqing.jsp?fandui=1&tian_id=<%
        if(tian_id!=null){
            out.print(tian_id);
        }
        %>">
        <div id="div_fandui3">
            <div id="fandui_1" style="color: black" class="div2">
                <%
                    //反对数
                    if (tian_id!=null){
                        if(!tian_id.equals("")){
                            javabean bean=new javabean();
                            bean.connect();
                            ResultSet resultSet=bean.getfanduiCount(tian_id);
                            if(resultSet!=null){
                                resultSet.last();
                                if(resultSet.getRow()!=0){
                                    out.print(resultSet.getString("COUNT(*)"));
                                }
                            }
                            resultSet.close();
                            bean.closeDatabase();
                        }
                    }
                %>
            </div>
        </div>
        </a>
        <a href="xiangqing.jsp?fuyi=1&tian_id=<%
        if(tian_id!=null){
            out.print(tian_id);
        }
        %>">
        <div id="div_fuyi">
            <div id="fuyi_1" style="color: black" class="div2"><%
                //复议数
                if (tian_id!=null){
                    if(!tian_id.equals("")){
                        javabean bean=new javabean();
                        bean.connect();
                        ResultSet resultSet=bean.getFuyiCount(tian_id);
                        if(resultSet!=null){
                            resultSet.last();
                            if(resultSet.getRow()!=0){
                                out.print(resultSet.getString("COUNT(*)"));
                            }
                        }
                        resultSet.close();
                        bean.closeDatabase();
                    }
                }
            %></div>
        </div>
        </a>
        <div id="div_pinglun2">
            <div id="pinglun_1" class="div2"><%
                if (tian_id!=null){
                    if (!tian_id.equals("")){
                        javabean bean=new javabean();
                        bean.connect();
                        out.print(bean.getPinglunShu(tian_id));
                        bean.closeDatabase();
                    }
                }
            %></div>
        </div>
    </div>
    <div id="div3"></div>
    <div id="div4">
        <%
            out.print(neirong);
        %>
    </div>
    <div id="div3"></div>
    <div id="div5"></div>
</div>
<div id="div6">
    <form method="post" action="xiangqing.jsp?tian_id=<%
    out.print(tian_id);
    %>">
        <input name="pinglun" id="input_1" />
    </form>
    <div id="div_int">评论</div>
</div>
<div id="div_buttom">
    <div id="div_gap1"></div>
    <div id="div_pinglunimg"></div>
    <%
        if(tian_id!=null){
            if(!tian_id.equals("")){
        javabean bean=new javabean();
        bean.connect();
        ResultSet resultSet=bean.getPinglunByTianId(tian_id);
        resultSet.last();
        if (resultSet.getRow()!=0){
            int count=resultSet.getRow();
            resultSet.first();
            for(int i=0;i<count;i++){
    %>
    <div id="div_content1">
        <div id="div_tupian"></div>
        <div id="div_fontcontent"><%
            out.print(resultSet.getString("pinglunren"));
        %></div>
        <div id="div_fontcontent1"><%
            out.print(resultSet.getString("shijian"));
        %></div>
    </div>
    <div id="fontcontent">
        <%
            out.print(resultSet.getString("pinglun"));
        %>
    </div>
    <div id="div3"></div>
    <%
                        resultSet.next();
                    }
                }
            }
        }

    %>
    <div id="div_gap1"></div>
</div>
<div id="div_bottum">
    <div class="div_y2" style="color: #ffffff;background-color: #36abe7;margin-left: 0px">上一页</div>
    <div class="div_y1">1</div>
</div>
</body>

</html>

