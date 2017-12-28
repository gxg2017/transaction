<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <style>
        *{
            margin: 0;
            padding: 0;

        }
        .container{
            width: 990px;
            height: 868px;
            display: flex;
            flex-direction: row;
            margin: 150px auto;
        }
        .container .left{
            width: 139px;
            padding-top: 10px;
            background: coral;
        }
        .container .left p{
            height: 50px;
            line-height: 50px;
            text-align: center;
        }
        .container .left p:hover{
            background: orange;
            color: white;
        }
        .container .right,.right1,.right2{
            width: 850px;
           background: azure;
            border: 1px solid #b799a0;
            padding-left: 50px;
            padding-top: 10px;

        }
        .container  .table{
            margin-top: 30px;
        }
        .container  .table tr{
            height: 70px;
            line-height: 70px;
        }
        .container   .baseInfo{
            height: 100px;
            border-bottom: 1px solid lightcoral;
        }
        .container .right  .baseInfo p{
            height: 30px;
            line-height: 30px;
        }
        .container .right1,.container .right2{
            display: none;
        }

    </style>
    <script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.js"></script>
    <script>
        $(function () {
            $("#myInfo").click(
                function () {
                    $(".right").show()
                    $(".right1").hide()
                    $(".right2").hide()

                }
            )
            $("#password").click(
                function () {
                    $(".right1").show()
                    $(".right").hide()
                    $(".right2").hide()
                }
            )
            $("#address").click(
                function () {
                    $(".right2").show()
                    $(".right").hide()
                    $(".right1").hide()
                }
            )
        })
    </script>
</head>
<body>
<div class="container">
    <div class="left">
        <p id="myInfo">个人资料</p>

        <p id="password">密码修改</p>
        <p id="address">添加收货地址</p>
    </div>
    <div class="right" >
        <form action="/second-transaction/updateFisher.action" method="post">
            <div class="baseInfo">
                <p>基本资料</p>
                <p>账号名：${sessionScope.fisher.account}</p>
                <p>手机号：${sessionScope.fisher.phonenum}</p>
            </div>
            <div>
                <p>
                    完善或修改个人资料
                </p>
            </div>

            <table class="table">

                <tr>
                    <td>昵称</td>
                    <td>
                        <input type="text"  name="nickname" value="${sessionScope.fisher.nickname}"/>
                    </td>
                </tr>

                <tr>
                    <td>生日</td>
                    <td>
                        <input type="date"  name="brith"  value="${sessionScope.fisher.birthday}" />
                    </td>
                </tr>
                <tr>
                    <td>家庭住址</td>
                    <td>
                        <input type="text"  name="address"  value="${sessionScope.fisher.address}" />
                    </td>
                </tr>

                <tr>

                    <td colspan="2" align="center">
                        <input type="submit"  name="btn" value="保存" />
                        <input type="text" name="id" value="${sessionScope.fisher.id}" style="display: none">
                    </td>
                </tr>

                <tr>

                    <td colspan="2" align="center">
                        ${msg}
                    </td>
                </tr>

            </table>

        </form>
    </div>
    <div class="right1">
        <div  class="baseInfo">修改密码</div>
        <form action="/second-transaction/updatePassword.action" method="post">

            <table class="table">
                <tr>
                    <td>请输入密码：</td>
                    <td><input type="text" name="password1" id="password1"></td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td><input type="text" name="password" id="password"></td>
                </tr>
                <tr>

                    <td colspan="2" align="center">
                        <input type="submit"  name="btn" value="保存" />
                        <input type="text" name="id" value="${sessionScope.fisher.id}" style="display: none">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div class="right2">
        <div  class="baseInfo">收货地址</div>
        <form action="/second-transaction/updateShipAddress.action" method="post">
            <table class="table">
                <tr>
                    <td>请输入完整的地址:</td>
                    <td>
                        <input type="text" name="shipaddress" id="shipaddress">
                    </td>
                </tr>
                <tr>

                    <td colspan="2" align="center">
                        <input type="submit"  name="btn" value="保存" />
                        <input type="text" name="id" value="${sessionScope.fisher.id}" style="display: none">
                    </td>
                </tr>
                 <tr>

                    <td colspan="2" align="center">
                        ${msg}
                    </td>
                </tr>
            </table>
        </form>

    </div>
</div>
</body>
</html>