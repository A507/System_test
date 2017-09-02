<%--
  Created by IntelliJ IDEA.
  User: 卢人玮
  Date: 2017/8/29
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>注册</title>
    <script src="https://code.jquery.com/jquery-3.2.1.js">
    </script>
    <style>
        body {
            background-image: url(image/interface.png);
        }

        #login {
            border-radius: 10px;
            width: 515px;
            height: auto;
            background-color: rgba(235, 235, 235, 0.9);
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
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

        #div_lijizhuce {
            margin-top: 48px;
            width: 100%;
            height: 39px;
            font-family: "黑体";
            font-size: 35px;
            text-align: center;
            color: #565656;
        }

        #backgruang {
            display: flex;
            width: 100%;
            height: 100%;
        }

        .input {
            width: 382px;
            height: 59px;
            border: 0px;
            border-radius: 8px;
            font-family: "黑体";
            font-size: 30px;
            padding-left: 10px;
            font-weight: 100;
            background-color: white;
            margin-left: 60px;
            float: left;
            margin-top: 40px;
            color: #cccccc;
        }

        .div_xing {
            width: 20px;
            height: 59px;
            float: left;
            text-align: center;
            font-family: "黑体";
            color: red;
            font-size: 20px;
            margin-top: 40px;
        }

        #div_sex {
            margin-left: 60px;
            margin-top: 40px;
            width: 392px;
            height: 59px;
            border: 0px;
            border-radius: 8px;
            background-color: white;
            margin-left: 60px;
            float: left;
        }

        #div_sex_ {
            width: 382px;
            height: 59px;
            border: 0px;
            border-radius: 8px;
            font-family: "黑体";
            font-size: 30px;
            padding-left: 10px;
            font-weight: 100;
            background-color: white;
            float: left;
            color: #cccccc;
            line-height: 59px;
        }

        .div_sex_ {
            width: 382px;
            height: 59px;
            border: 0px;
            font-family: "黑体";
            font-size: 30px;
            padding-left: 10px;
            font-weight: 100;
            background-color: white;
            float: left;
            color: #000000;
            line-height: 59px;
        }

        #div_button1 {
            height: 60px;
            width: 392px;
            background-color: #37abe7;
            margin-top: 20px;
            margin-left: 60px;
            border-radius: 10px;
            font-family: "黑体";
            font-size: 30px;
            color: white;
            float: left;
            line-height: 60px;
            text-align: center;
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

        #div_button2 {
            height: 60px;
            width: 392px;
            background-color: #37abe7;
            margin-top: 20px;
            margin-left: 60px;
            border-radius: 10px;
            font-family: "黑体";
            font-size: 30px;
            color: white;
            float: left;
            line-height: 60px;
            text-align: center;
        }

        #div_gap {
            height: 100px;
            width: 200px;
            float: left;
        }
    </style>
</head>

<body>
<script type="text/javascript">
    $(function() {
        $("#input1").focus(function() {
            var str = $("#input1").css("color");
            if (str == "rgb(204, 204, 204)") {
                $("#input1").css("color", "#000000");
                $("input[name='xingming']").val("");
            }
        });
        $("#input2").focus(function() {
            var str = $("#input2").css("color");
            if (str == "rgb(204, 204, 204)") {
                $("#input2").css("color", "#000000");
                $("input[name='jiatingzhuzhi']").val("");
            }
        });
        $("#input3").focus(function() {
            var str = $("#input3").css("color");
            if (str == "rgb(204, 204, 204)") {
                $("#input3").css("color", "#000000");
                $("input[name='lianxifangshi']").val("");
                $("#input3").attr("type", "tel");
            }
        });
        $("#input4").focus(function() {
            var str = $("#input4").css("color");
            if (str == "rgb(204, 204, 204)") {
                $("#input4").css("color", "#000000");
                $("input[name='tuijianren']").val("");
            }
        });
        $("#input5").focus(function() {
            var str = $("#input5").css("color");
            if (str == "rgb(204, 204, 204)") {
                $("#input5").css("color", "#000000");
                $("#input5").attr("type", "date");
            }
        });
        $("#input6").focus(function() {
            var str = $("#input6").css("color");
            if (str == "rgb(204, 204, 204)") {
                $("#input6").css("color", "#000000");
                $("input[name='hangyefenhui']").val("");
            }
        });
        $("#input7").focus(function() {
            var str = $("#input7").css("color");
            if (str == "rgb(204, 204, 204)") {
                $("#input7").css("color", "#000000");
                $("input[name='zhuanweihui']").val("");
            }
        });
        $("#input8").focus(function() {
            var str = $("#input8").css("color");
            if (str == "rgb(204, 204, 204)") {
                $("#input8").css("color", "#000000");
                $("input[name='mima']").val("");
                $("#input8").attr("type", "password");
            }
        });
        $("#input9").focus(function() {
            var str = $("#input9").css("color");
            if (str == "rgb(204, 204, 204)") {
                $("#input9").css("color", "#000000");
                $("input[name='mima1']").val("");
                $("#input9").attr("type", "password");
            }
        });


        $("#input1").blur(function() {
            if ($("input[name='xingming']").val() == "") {
                $("input[name='xingming']").val("姓名");
                $("#input1").css("color", "#cccccc");
            }
        });
        $("#input2").blur(function() {
            if ($("input[name='jiatingzhuzhi']").val() == "") {
                $("input[name='jiatingzhuzhi']").val("家庭住址");
                $("#input2").css("color", "#cccccc");
            }
        });
        $("#input3").blur(function() {
            if ($("input[name='lianxifangshi']").val() == "") {
                $("input[name='lianxifangshi']").val("联系方式");
                $("#input3").css("color", "#cccccc");
                $("#input3").attr("type", "text");
            }
        });
        $("#input4").blur(function() {
            if ($("input[name='tuijianren']").val() == "") {
                $("input[name='tuijianren']").val("推荐人");
                $("#input4").css("color", "#cccccc");
            }
        });
        $("#input5").blur(function() {
            if ($("input[name='chushengriqi']").val() == "") {
                $("#input5").attr("type", "text");
                $("input[name='chushengriqi']").val("出生日期");
                $("#input5").css("color", "#cccccc");
            }
        });
        $("#input6").blur(function() {
            if ($("input[name='hangyefenhui']").val() == "") {
                $("input[name='hangyefenhui']").val("行业分会");
                $("#input6").css("color", "#cccccc");
            }
        });
        $("#input7").blur(function() {
            if ($("input[name='zhuanweihui']").val() == "") {
                $("input[name='zhuanweihui']").val("专委会");
                $("#input7").css("color", "#cccccc");
            }
        });
        $("#input8").blur(function() {
            if ($("input[name='mima']").val() == "") {
                $("input[name='mima']").val("密码");
                $("#input8").css("color", "#cccccc");
                $("#input8").attr("type", "text");
            }
        });
        $("#input9").blur(function() {
            if ($("input[name='mima1']").val() == "") {
                $("input[name='mima1']").val("再次输入密码");
                $("#input9").css("color", "#cccccc");
                $("#input9").attr("type", "text");
            }
        });
        //性别菜单状态
        var sex = 0;
        var sex_open = 0;
        //隐藏菜单
        $(".div_sex_").hide();
        $("#div_sex_").click(function() {
            if (sex_open == 0) {
                sex_open = 1;
                $("#div_sex").css("height", "177px");
                $(".div_sex_").show();
            } else {
                $("#div_sex").css("height", "59px");
                $(".div_sex_").hide();
                sex_open = 0;
            }
        });
        $("#sex").hide();
        //点击男
        $("#m").click(function() {
            sex_open = 0;
            $("#div_sex").css("height", "59px");
            $("#div_sex_").css("color", "#000000");
            $("#div_sex_").html("男");
            $(".div_sex_").hide();
            $("input[name='sex']").val("m");
        });
        //点击女
        $("#wm").click(function() {
            sex_open = 0;
            $(".div_sex_").hide();
            $("#div_sex").css("height", "59px");
            $("#div_sex_").css("color", "#000000");
            $("#div_sex_").html("女");
            $("input[name='sex']").val("w");
        });
        //button变色
        $("#div_button1").mouseenter(function() {
            $("#div_button1").css("background-color", "rgba(54,130,169,1)");
        });
        $("#div_button1").mouseout(function() {
            $("#div_button1").css("background-color", "#37abe7");
        });
        $("#div_button2").mouseenter(function() {
            $("#div_button2").css("background-color", "rgba(54,130,169,1)");
        });
        $("#div_button2").mouseout(function() {
            $("#div_button2").css("background-color", "#37abe7");
        });

        //跳转页面
        $("#div_button2").click(function() {
            location.href = "../login/login.html";
        });
        $("#div_button1").click(function () {
            $("form").submit();
        });

        //提交
        $("#div_button1").click(function() {
            if (check1()) {
                $("form").submit();
            }
        });
        //表单验证
        function check1() {
            if ($("#input1").css("color") == "rgb(204, 204, 204)") {
                $("#div_error").html("姓名不能为空");
                return false;
            }
            if ($("#input2").css("color") == "rgb(204, 204, 204)") {
                $("#div_error").html("家庭住址不能为空");
                return false;
            }
            if ($("#input3").css("color") == "rgb(204, 204, 204)") {
                $("#div_error").html("联系方式不能为空");
                return false;
            }
            if ($("#input5").css("color") == "rgb(204, 204, 204)") {
                $("#div_error").html("出生日期不能为空");
                return false;
            }
            if ($("#input6").css("color") == "rgb(204, 204, 204)") {
                $("#div_error").html("行业分会不能为空");
                return false;
            }
            if ($("#input7").css("color") == "rgb(204, 204, 204)") {
                $("#div_error").html("专委会不能为空");
                return false;
            }
            if ($("#input8").css("color") == "rgb(204, 204, 204)") {
                $("#div_error").html("密码不能为空");
                return false;
            }
            if ($("#input9").css("color") == "rgb(204, 204, 204)") {
                $("#div_error").html("再次输入密码不能为空");
                return false;
            }
            if ($("input[name='mima']").val() != $("input[name='mima1']").val()) {
                $("#div_error").html("两次输入的密码不一致");
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
        <div id="div_lijizhuce">立即注册</div>
        <form action="../zhuce.jsp" method="post">
            <input name="xingming" maxlength="12" id="input1" value="姓名" class="input" style="margin-top: 47px;" type="text" />
            <div style="margin-top: 47px;" class="div_xing">
                <p>*</p>
            </div>
            <input id="input2" name="jiatingzhuzhi" maxlength="12" value="家庭住址" class="input" type="text" />
            <div class="div_xing">
                <p>*</p>
            </div>
            <input id="input3" name="lianxifangshi" maxlength="12" value="联系方式" class="input" type="text" />
            <div class="div_xing">
                <p>*</p>
            </div>
            <input id="input4" name="tuijianren" maxlength="12" value="推荐人" class="input" type="text" />
            <div class="div_xing">
                <p></p>
            </div>
            <div id="div_sex">
                <div id="div_sex_">性别</div>
                <div class="div_sex_" id="m">男</div>
                <div class="div_sex_" id="wm">女</div>
            </div>
            <div class="div_xing">
                <p>*</p>
            </div>
            <input id="input5" name="chushengriqi" value="出生日期" class="input" type="text" />
            <div class="div_xing">
                <p>*</p>
            </div>
            <input id="input6" name="hangyefenhui" maxlength="12" value="行业分会" class="input" type="text" />
            <div class="div_xing">
                <p>*</p>
            </div>
            <input id="input7" name="zhuanweihui" maxlength="12" value="专委会" class="input" type="text" />
            <div class="div_xing">
                <p>*</p>
            </div>
            <input id="input8" name="mima" maxlength="20" value="密码" class="input" type="text" />
            <div class="div_xing">
                <p>*</p>
            </div>
            <input id="input9" name="mima1" maxlength="20" value="再次输入密码" class="input" type="text" />
            <div class="div_xing">
                <p>*</p>
            </div>
            <div id="div_error">
                <%
                    String msg=request.getParameter("msg");
                    if (msg==null){
                        msg="0";
                    }
                    if(msg.equals("1")){
                        out.print("用户名已存在");
                    }
                %>
            </div>
            <input type="text" name="sex" id="sex" />
        </form>
        <div id="div_button1">注册</div>
        <a href="../login/login.jsp" target="_self">
            <div id="div_button2">登录</div>
        </a>
        <div id="div_gap"></div>
    </div>
</div>
</body>

</html>
