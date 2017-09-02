<%--
  Created by IntelliJ IDEA.
  User: 卢人玮
  Date: 2017/8/30
  Time: 12:56
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



    //撤销提案
    if(chexiao_id!=null){
        if (!chexiao_id.equals("")){
            javabean bean=new javabean();
            bean.connect();
            bean.deleteTianById(chexiao_id);
            bean.closeDatabase();
        }
    }



%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>提案编辑</title>
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
        #div_guali {
            height: 47px;
            width: 101px;
            margin-left: 1px;
            float: left;
            background-image:url(image/guanli_001.jpg);
        }
    </style>
</head>

<body>
<script type="text/javascript">
    $(function() {
        <%
        //提示，超出最大未审核数
        String msg=request.getParameter("msg");
        if(msg!=null){
            if (msg.equals("9")){
                %>
        alert("已超出最大未审核数量");
        <%
            }
        }
        %>



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
            if(tongyi==0) {
                $("#tongyi").css("background-color", "#36abe7");
                tongyi=1;
            }
        });
        $("#chexiao1").mouseenter(function(){
            $("#chexiao1").css("background-color","#478db1");
        });
        $("#chexiao1").mouseleave(function(){
            $("#chexiao1").css("background-color","#36abe7");
        });
        $(".xiangqing").mouseenter(function() {
            $(this).css("background-image", "url(image/xiangqing2_001.jpg)")
        });

        $(".xiangqing").mouseleave(function() {
            $(this).css("background-image", "url(image/xiangqing1_001.jpg)")
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
        $("#wo").click(function(){
            location.href="../xinxiweihu/xinxiweihu.html";
        });
        $("#man").click(function(){
            location.href="../xinxiweihu/xinxiweihu.html";
        });
        $("#div_tijiao").click(function () {
            if(tongyi==1) {
                $("form").submit();
            }else {
                alert("同意提案建议要求，才能提交");
            }
        });
        $("#div_tijiao1").click(function(){
            if(tongyi==1) {
                $("form").attr("action","../xiangqing/xiangqing.jsp?caogao=1");
                $("form").submit();
            }else {
                alert("同意提案建议要求，才能提交");
            }
            }
        );
        $("#div_zhuxiao").click(function () {
            location.href="../index/index.jsp?zhuxiao=1";
        });
        //整体变色动画
        $(".bianse").mouseenter(function () {
            $(this).css("background-color","rgba(54,130,169,1)");
        });
        $(".bianse").mouseleave(function () {
            $(this).css("background-color","#37abe7");
        });


        //同意协议
        var tongyi=0;


        //变色动画
        $(".chexiao").mouseenter(function () {
            $(this).css("background-color","rgba(54,130,169,1)");
        });
        $(".chexiao").mouseleave(function () {
            $(this).css("background-color","#37abe7");
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
            <div id="wo">
                <%
                    out.print(xingming);
                %>
            </div>
            <div id="man"></div>
            </a>
        </div>
    </div>
</div>
<form action="../xiangqing/xiangqing.jsp?msg=1" method="post">
<div id="div_content10">
    <div id="div_gap1"></div>
    <input value="添加标题" name="biaoti" id="input_text" type="text" />
    <div id="div_gap1"></div>
    <div id="div_gap1"></div>
    <textarea id="textarea" name="neirong" cols=10 style="overflow-x:hidden;overflow-y:hidden" rows="3" cols="20">输入内容
</textarea>
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
</form>
<%
    //自己得到投稿位置
    javabean bean=new javabean();
    bean.connect();
    ResultSet resultSet=bean.getTianByName(xingming);
    if(resultSet!=null){
        resultSet.last();
        if(resultSet.getRow()!=0){
            int count=resultSet.getRow();
            resultSet.first();
            for(int i=0;i<count;i++){
                String tian_id=resultSet.getString("id");
%>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe1">
            <%
                out.print(resultSet.getString("zhuangtai"));
            %>
        </div>
        <div class="shangchuanzhe1">
            <%
                out.print(resultSet.getString("id"));
            %>
        </div>
        <div class="shangchuanzhe1">复议数:<%
            //复议数
            if (tian_id!=null){
                if(!tian_id.equals("")){
                    javabean bean1=new javabean();
                    bean1.connect();
                    ResultSet resultSet1=bean1.getFuyiCount(tian_id);
                    if(resultSet1!=null){
                        resultSet1.last();
                        if(resultSet1.getRow()!=0){
                            out.print(resultSet1.getString("COUNT(*)"));
                        }
                    }
                    resultSet1.close();
                    bean1.closeDatabase();
                }
            }

        %></div>
        <div class="shangchuanzhe1">反对数:<%
            //反对数
            if (tian_id!=null){
                if(!tian_id.equals("")){
                    javabean bean1=new javabean();
                    bean1.connect();
                    ResultSet resultSet1=bean1.getfanduiCount(tian_id);
                    if(resultSet1!=null){
                        resultSet1.last();
                        if(resultSet1.getRow()!=0){
                            out.print(resultSet1.getString("COUNT(*)"));
                        }
                    }
                    resultSet1.close();
                    bean1.closeDatabase();
                }
            }
        %></div>
        <div class="div_shijian">
            <%
                out.print(resultSet.getString("riqi"));
            %>
        </div>
        <div class="biaoti">
            <%
                out.print(resultSet.getString("biaoti"));
            %>
        </div>
        <a href="../xiangqing/xiangqing.jsp?tian_id=<%
        out.print(resultSet.getString("id"));
        %>">
            <div id="x1" class="xiangqing"></div>
        </a>
        <a href="tian.jsp?chexiao_id=<%
        out.print(resultSet.getString("id"));
        %>">
            <div id="chexiao1" class="chexiao">撤销</div>
        </a>
    </div>
</div>
<%
                resultSet.next();
            }
        }
    }
%>
</body>

</html>

