<%@ page import="Sha.Sha" %>
<%@ page import="bean.javabean" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: 卢人玮
  Date: 2017/8/29
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String quanxian=null;
    String user_id=null;

    //接收请求
    String id=request.getParameter("id");
    String password=request.getParameter("password");

    String quanxian1=request.getParameter("quanxian1");

    String xingming=null;


    //刚刚登录
    if(id!=null&&id!=""&&password!=null&&password!=""){
        password=Sha.getSha1(password);
        javabean bean=new javabean();
        bean.connect();
        //验证密码
        ResultSet resultSet=bean.getYonghu(id);
        if(resultSet==null){
            out.print("<h1>用户信息提取错误</h1>");
            return;
        }
        resultSet.last();
        if(resultSet.getRow()==0){
            //response.sendRedirect("../login/login.jsp?msg=1");
            return;
        }
        //密码错误
        if(!resultSet.getString("mima").equals(password)){
            response.sendRedirect("../login/login.jsp?msg=2");
            return;
        }



        //全部正确

        //提取权限
        String id1=resultSet.getString("id");
        resultSet.close();
        resultSet=bean.getQuanxian(id1);
        //测试
        //out.print("<h1>id="+id1+"</h1>");
        if(resultSet==null){
            out.print("<h1>取得权限错误</h1>");
            return;
        }

        resultSet.last();
        if(resultSet.getRow()==0){
            out.print("<h1>没有权限</h1>");
            return;
        }

        quanxian=resultSet.getString("quanxian");
        //关闭结果
        resultSet.close();

        //测试
        //out.print("<h1>quanxian="+quanxian+"</h1>");

        //设置cookie
        if(quanxian!=null) {
            if(!quanxian.equals("0")) {
                Date date = new Date();
                String time = String.valueOf(date.getTime() + 1000 * 60 * 10);
                String hash = Sha.getSha1(id1 + time);
                Cookie cookie = new Cookie("hash", hash);
                cookie.setMaxAge(20 * 60);
                cookie.setPath("/");
                response.addCookie(cookie);

                //插入cookie
                if (!bean.insertCookie(id1, time)) {
                    out.print("<h1>cookie插入数据库错误</h1>");
                    return;
                }
                //删除过期cookie
                if (!bean.deleteCookie()) {
                    out.print("<h1>未能删除过期cookie</h1>");
                    return;
                }
            }
        }
        //关闭数据库
        bean.closeDatabase();
        xingming=id;
    }


    //检查cookie确认登录状态
    String hash = null;
    Cookie[] cookie=request.getCookies();
    if (cookie==null){
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
            hash="";
        }
        //测试
        if (hash != null) {
           // out.print("<h1>hash=" + hash + "</h1>");
        }
    }





    //没有从登录过来
    if(!hash.equals("")) {
        if (!hash.equals("") && hash != null && password == null) {
            javabean bean = new javabean();
            bean.connect();
            //获取cookie
            ResultSet resultSet = bean.checkCookie(hash);
            resultSet.last();
            //cookie不存在
            if (resultSet.getRow() == 0) {
                quanxian = null;
                xingming = null;
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




    //没有权限直接提示
    if(quanxian==null){

    }
    else if(quanxian.equals("")){
    }
    else if(quanxian.equals("0")){
        out.print("<h1>正在审核中，请耐心等待</h1>");
        %>

<html>
<body>
<script type="text/javascript">
    setTimeout(function () {
        location.href="../index/index.jsp"
    },5000);
</script>
</body>
</html>
<%
        return;
    }
    else if(quanxian.equals("2")){
            response.sendRedirect("../tianshenpi/tianshenpi.jsp");
        }

        else if(quanxian.equals("3")){
            response.sendRedirect("../tianshenpi_beian/tianshenpi_beian.jsp");
        }

        else if(quanxian.equals("4")){
            response.sendRedirect("../tianshenpi_lian/tianshenpi_lian.jsp");
        }





    //注销
    String zhuxiao=request.getParameter("zhuxiao");
    if(zhuxiao==null){
        zhuxiao="0";
    }
    if(zhuxiao.equals("1")){
        //设置cookie
        Cookie cookie1=new Cookie("hash","");
        cookie1.setPath("/");
        response.addCookie(cookie1);

        //获取hash

        Cookie[] cookies=request.getCookies();

        String hs=null;

        for (int i=0;i<cookie.length;i++){
            if(cookie[i].getName().equals("hash")){
                hs=cookie[i].getValue();
            }
        }




        //删除数据库cookie
        javabean bean=new javabean();
        bean.connect();
        bean.deleteTheCookie(hs);
        //关闭数据库
        bean.closeDatabase();
        quanxian=null;
    }
    if (xingming==null){
        xingming="";
    }





//
    String sousuo=request.getParameter("sousuo");

%>
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

        //详情动画
        $("#x1").mouseenter(function() {
            $("#x1").css("background-image", "url(image/xiangqing2_001.jpg)")
        });

        $("#x1").mouseleave(function() {
            $("#x1").css("background-image", "url(image/xiangqing1_001.jpg)")
        });

        //整体变色动画
        $(".bianse").mouseenter(function () {
            $(this).css("background-color","rgba(54,130,169,1)");
        });
        $(".bianse").mouseleave(function () {
            $(this).css("background-color","#37abe7");
        });
        $(".xiangqing").mouseenter(function() {
            $(this).css("background-image", "url(image/xiangqing2_001.jpg)")
        });

        $(".xiangqing").mouseleave(function() {
            $(this).css("background-image", "url(image/xiangqing1_001.jpg)")
        });

        //跳转页面
        $("#div_wengaoguanli").click(function(){
            location.href="../tian/tian.jsp";
        });
        $("#div_denglu").click(function(){
            location.href="../login/login.jsp";
        });
        $("#div_zhuce").click(function(){
            location.href="../register/register.jsp";
        });
        $("#wo").click(function(){
            location.href="../xinxiweihu/xinxiweihu.html";
        });
        $("#man").click(function(){
            location.href="../xinxiweihu/xinxiweihu.html";
        });
        $("#div_zhuxiao").click(function () {
            location.href="../index/index.jsp?zhuxiao=1";
        });


        //搜索
        $("#sousuo").click(function(){
            if($("input[name='sousuo']").val()==""){
                alert("搜索不能为空");
            }else {
                location.href="index.jsp?sousuo="+$("input[name='sousuo']").val();
            }
        });
    });
</script>



<div id="div_header">
    <div id="div_img">
        <%
            if(quanxian==null){
        %>
        <div id="div_zhuce"></div>
        <div id="div_denglu"></div>
        <%
            }else {
        %>
        <div class="bianse" id="div_zhuxiao">注销</div>
        <%
            }
        %>
        <div id="sousuo"></div>
        <input type="text" name="sousuo" id="input_sousuo" />
        <div id="div_content">
            <div id="div_shouye"></div>
            <div id="div_wengaoguanli"></div>
            <%
                //如果有管理权限
                if(quanxian!=null){
                    if (!quanxian.equals("0")&&!quanxian.equals("1")){
            %>
            <div id="div_guali"></div>
            <%
                    }
                }
                if(quanxian!=null&&!quanxian.equals("")){
            %>
            <a href="../xinxiweihu/xinxiweihu.jsp">
            <div id="wo">
                <%
                    out.print(xingming);
                %>
            </div>
            <div id="man"></div>
            </a>
            <%
                }
            %>
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
<%
    //提案列表打印
    if(sousuo==null){
    //没有提案
    javabean bean=new javabean();
    bean.connect();
    ResultSet resultSet=bean.getTianSuoyou();
    if(resultSet==null){
        out.print("<h1>提取提案错误，稍后重试</h1>");
    }else
    {
        while (resultSet.next()){
%>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe">
            <%
                out.print(resultSet.getString("zuozhe"));
            %>
        </div>
        <div class="shangchuanzhe1">
            <%
                out.print(resultSet.getString("zhuangtai"));
            %>
        </div>
        <div class="shangchuanzhe1">id:<%
            out.print(resultSet.getString("id"));
        %></div>
        <div class="shangchuanzhe1">复议数:<%
            //复议数
            String tian_id=resultSet.getString("id");
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
            <div class="xiangqing"></div>
        </a>
    </div>
</div>
<%
        }

    }
    }else {
        /////搜索的开头
            //没有提案
            javabean bean=new javabean();
            bean.connect();
            ResultSet resultSet=bean.sousuoTian(sousuo);
            if(resultSet==null){
                out.print("<h1>提取提案错误，稍后重试</h1>");
            }else
            {
                while (resultSet.next()){
%>
<div class="div_content">
    <div class="div_head">
        <div class="shangchuanzhe">
            <%
                out.print(resultSet.getString("zuozhe"));
            %>
        </div>
        <div class="shangchuanzhe1">
            <%
                out.print(resultSet.getString("zhuangtai"));
            %>
        </div>
        <div class="shangchuanzhe1">id:<%
            out.print(resultSet.getString("id"));
        %></div>
        <div class="shangchuanzhe1">复议数:<%
            //复议数
            String tian_id=resultSet.getString("id");
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
            <div class="xiangqing"></div>
        </a>
    </div>
</div>
<%
            }

        }
        }

%>
<%--
<div id="div_bottum">
    <div class="div_y2" style="color: #ffffff;background-color: #36abe7;margin-left: 0px">上一页</div>
    <div class="div_y1">1</div>
</div>
--%>
</body>

</html>

