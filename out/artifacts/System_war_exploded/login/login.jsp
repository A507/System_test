<%--
  Created by IntelliJ IDEA.
  User: 卢人玮
  Date: 2017/8/29
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bean.javabean" %>
<%@ page import="java.sql.ResultSet" %>
<%
    request.setCharacterEncoding("UTF-8");
    String quanxian1;
    javabean JAVA=new javabean();

    //int id=4;


    JAVA.connect();

    //JAVA.SETquanxian(id,"2");

    //quanxian1=JAVA.GETquanxian(id);
    //System.out.println(quanxian1);



    %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <script src="https://code.jquery.com/jquery-3.2.1.js">
    </script>
    <style>
        #login {
            border-radius: 10px;
            width: 515px;
            height: 597px;
            background-color: rgba(235, 235, 235, 0.9);
            margin-top: 150px;
            margin-left: auto;
            margin-right: auto;
        }

        body {
            background-image: url(image/interface.png);
        }

        #backgruang {
            display: flex;
            width: 100%;
            height: 100%;
        }

        #header_image {
            background-image: url("image/header_001.png");
            margin-top: 56px;
            margin-left: 56px;
            width: 408px;
            height: 73px;
        }

        #div_font {
            margin-top: 25px;
            font-family: "黑体";
            font-size: 19px;
        }

        #input_id {
            margin-top: 66px;
            background-color: white;
            margin-left: 60px;
            width: 382px;
            height: 59px;
            border: 0px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            font-family: "黑体";
            font-size: 30px;
            padding-left: 10px;
            font-weight: 100;
            color: #cccccc;
        }

        #input_id1 {
            margin-top: 2px;
            background-color: white;
            margin-left: 60px;
            width: 382px;
            height: 59px;
            border: 0px;
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
            font-family: "黑体";
            font-size: 30px;
            padding-left: 10px;
            font-weight: 100;
            color: #cccccc;
        }

        #div_button1 {
            height: 60px;
            width: 392px;
            background-color: #37abe7;
            margin-top: 49px;
            margin-left: 60px;
            border-radius: 10px;
        }

        #div_button2 {
            height: 60px;
            width: 392px;
            background-color: #37abe7;
            margin-top: 7px;
            margin-left: 60px;
            border-radius: 10px;
        }

        #font_button {
            font-family: "黑体";
            font-size: 30px;
            color: white;
            width: 392px;
            height: 60px;
        }

        #div_error {
            font-family: "黑体";
            font-size: 19px;
            width: 100%;
            height: 25px;
            margin-top: 20px;
            color: red;
            float: left;
            line-height: 25px;
            text-align: center;
        }
    </style>
</head>

<body>




<script type="text/javascript">
    function inputBlur1() {
        if ($("input[name='id']").val() == "") {
            $("input[name='id']").val("姓名/id");
            $("#input_id").css("color", "#cccccc");
        }
    }

    function inputFocus() {
        if ($("input[name='id']").val() == "姓名/id") {
            $("input[name='id']").val("");
            $("#input_id").css("color", "#000000");
        }
    }

    function inputBlur2() {
        if ($("input[name='password']").val() == "") {
            $("input[name='password']").val("密码");
            $("#input_id1").css("color", "#cccccc");
            $("#input_id1").attr("type", "text")
        }
    }

    function inputFocus1() {
        if ($("input[name='password']").val() == "密码") {
            $("input[name='password']").val("");
            $("#input_id1").css("color", "#000000");
            $("#input_id1").attr("type", "password");
        }
    }

    function fontButtononMouseOver1() {
        $("#div_button1").css("background-color", "rgba(54,130,169,1)");
    }

    function div_button_onMouseOut1() {
        $("#div_button1").css("background-color", "#37abe7");
    }

    function fontButtononMouseOver2() {
        $("#div_button2").css("background-color", "rgba(54,130,169,1)");
    }

    function div_button_onMouseOut2() {
        $("#div_button2").css("background-color", "#37abe7");
    }

    $(function() {
        //跳转页面
        $("#div_button2").click(function() {
            location.href = "../register/register.jsp";
        });

        //提交
        $("#div_button1").click(function() {
            if (check1()) {
                $("form").submit();
            }
        });

        //检查表单
        function check1() {
            if ($("#input_id").css("color") == "rgb(204, 204, 204)") {
                $("#div_error").html("姓名不能为空");
                return false;
            }
            if ($("#input_id1").css("color") == "rgb(204, 204, 204)") {
                $("#div_error").html("密码不能为空");
                return false;
            }
            return true;
        }
    });
</script>



<div id="backgruang">
    <div id="login">
        <div id="header_image"></div>
        <table id="div_font" style="margin-top: 19px" width="515px" height="19px">
            <tr>
                <td align="center" valign="center">让生活更便捷</td>
            </tr>
        </table>
        <form action="../index/index.jsp" method="post">
            <input name="id" onblur="inputBlur1()" onfocus="inputFocus()" value="姓名/id" style="color: #cccccc" type="text" id="input_id" />
            <input onblur="inputBlur2()" onfocus="inputFocus1()" name="password" style="color: #cccccc" value="密码" type="text" id="input_id1" />
        </form>
        <div id="div_error"><%
            //用户名不存在
            String msg=request.getParameter("msg");
            if(msg==null){
                msg="";
            }
            if(msg.equals("1")){
                out.print("用户名不存在");
            }
            //密码错误
            if(msg.equals("2")){
                out.print("密码错误");
            }
        %></div>
        <div onmouseover="fontButtononMouseOver1()" onmouseout="div_button_onMouseOut1()" id="div_button1">
            <table id="font_button">
                <tr>
                    <td align="center" valign="center">登录</td>
                </tr>
            </table>
        </div>
        <div onmouseover="fontButtononMouseOver2()" onmouseout="div_button_onMouseOut2()" id="div_button2">
            <table id="font_button">
                <tr>
                    <td align="center" valign="center">注册</td>
                </tr>
            </table>
        </div>
        <table id="div_font" style="margin-top: 38px;font-size: 10px" width="515px" height="19px">
            <tr>
                <td align="center" valign="center">@ ASM System</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
