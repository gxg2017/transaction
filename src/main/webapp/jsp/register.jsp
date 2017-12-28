<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>京东注册</title>
    <link rel="stylesheet" href="/second-transaction/css/jd.css">
</head>
<body>
	<div>${msg}</div>
    <div class="contain">
        <div class="header">
            <div class="reg">
                <img src="/second-transaction/images/xianyu.png" alt="">
                <p class="p1">欢迎注册</p>
            </div>
            <div class="reg">
                <p class="p2">已有账号？</p>
                <a href="">请登录</a>
            </div>
        </div>
        <div class="header-line"></div>
        <div >
            <form action="" class="center" method="post" name="form1">
            <div class="left">
                <div class="cin">
                    <p>用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名</p>
                    <input type="text" name="account" placeholder="您的账户名和登录名" id="input1" onfocus="show1()" onblur="hidden1()">
                </div>
                <div class="hint" id="hint1">
                    <p class="i-def">!</p>
                    <p>支持中文、字母、数字、“-”“_”的组合，4-20个字符</p>
                </div>
                <div class="cin">
                    <p>设&nbsp;置&nbsp;密&nbsp;码</p>
                    <input type="password" name="password1" placeholder="建议至少使用两种字符组合" id="input2" onfocus="show2()" onblur="hidden2()">
                </div>
                <div class="hint" id="hint2">
                    <p class="i-def">!</p>
                    <p>建议至少使用两种字符组合</p>
                </div>
                <div class="cin">
                    <p>确&nbsp;认&nbsp;密&nbsp;码</p>
                    <input type="password" name="password" placeholder="请再次输入密码" id="input3" onfocus="show3()" onblur="hidden3()">
                </div>
                <div class="hint" id="hint3">
                    <p class="i-def">!</p>
                    <p>请再次输入密码</p>
                </div>
                <div class="cin">
                    <p>中国&nbsp;0086</p>
                    <input type="tel" name="phonenum" placeholder="建议使用常用手机" id="input4" onfocus="show4()" onblur="hidden4()">
                </div>
                <nav>
                    <a href="">邮箱验证</a>
                </nav>
                <div class="hint" id="hint4">
                    <p class="i-def">!</p>
                    <p>完成验证后，你可以用该手机登录和找回密码</p>
                </div>
                <div class="cin">
                    <p>验&nbsp;&nbsp;证&nbsp;&nbsp;码</p>
                    <input type="text" name="code" placeholder="请输入验证码  " id="input5" onfocus="show5()" onblur="hidden5()">
                    <div class="registerCode" id="regCode">GXg6</div>
                </div>
                <div class="hint" id="hint5">
                    <p class="i-def">!</p>
                    <p>看不清？点击图片更换验证码"</p>
                </div>
                <div class="cin cin-img">
                    <p>手机验证码</p>
                    <input type="text" name="telCode" placeholder="请输入手机验证码" id="input6" onfocus="show6()" onblur="hidden6()">
                    <img src="image/5.png" alt="">
                </div>
                <div  >
                    <input type="submit" value="注册"  class="user-register" id="register" />
                </div>

            </div>
            <div class="center-line">

            </div>
            <div class="right">
                <div class="log1 log-line">
                    <div></div>
                    <a href="">企业用户注册</a>
                </div>

                <div class="log2">
                    <div></div>
                    <a href="">INTERNATIONAL CUSTOMERS</a>

                </div>
            </div>
            </form>
        </div>
        <div class="bottom">
            <nav>
                <a href="">关于我们</a>
                <a href="">联系我们</a>
                <a href="">人才招聘</a>
                <a href="">商家入驻</a>
                <a href="">广告服务</a>
                <a href="">手机京东</a>
                <a href="">友情链接</a>
                <a href="">销售联盟</a>
                <a href="">京东社区</a>
                <a href="">京东公益</a>
                <a href="" class="last-a">English Site</a>

            </nav>
            <p>Copyright©2004-2016  京东JD.com 版权所有</p>
        </div>
    </div>
    <script>
        function show1() {
            document.getElementById('hint1').style.display="block";
            document.getElementById('input1').setAttribute('placeholder','');
        };
        function hidden1() {
            document.getElementById('hint1').style.display="none";
            document.getElementById('input1').setAttribute('placeholder','您的账户名和登录名');
            var getValue=document.getElementById('input1').value;
            var reg=/^[\u4e00-\u9fa5a-zA-Z0-9\-]{4,20}$/;
            if(getValue!==''){
                if(!reg.test(getValue)){
                    alert("输入的用户名有误,请输入正确的用户名");
                }
            }
        };
        function show2() {
            document.getElementById('hint2').style.display="block";
            document.getElementById('input2').setAttribute('placeholder','');
        };
        function hidden2() {
            document.getElementById('hint2').style.display="none";
            document.getElementById('input2').setAttribute('placeholder','建议至少使用两种字符组合');
            var getValue=document.getElementById('input2').value;
            var reg=/[0-9]/;
            if(getValue!==''){
                if(!reg.test(getValue)){
                    alert("输入的密码不合理,请重新输入");
                }
            }
        };
        function show3() {
            document.getElementById('hint3').style.display="block";
            document.getElementById('input3').setAttribute('placeholder','');
        };
        function hidden3() {
            document.getElementById('hint3').style.display="none";
            document.getElementById('input3').setAttribute('placeholder','请再次输入密码');
            var getValue=document.getElementById('input3').value;
            var getPassword=document.getElementById('input2').value;

            if(getValue!==''){
                if(getValue!=getPassword){
                    alert("两次输入的密码不一样,请重新输入");
                }
            }
        };
        function show4() {
            document.getElementById('hint4').style.display="block";
            document.getElementById('input4').setAttribute('placeholder','');
        };
        function hidden4() {
            document.getElementById('hint4').style.display="none";
            document.getElementById('input4').setAttribute('placeholder','建议使用常用手机');
            var getValue=document.getElementById('input4').value;
            var reg=/^1[34578]\d{9}$/;
            if(getValue!==''){
                if(!reg.test(getValue)){
                    alert("请输入正确的手机号");
                }
            }
        };
        function show5() {
            document.getElementById('hint5').style.display="block";
            document.getElementById('input5').setAttribute('placeholder','');
        };
        function hidden5() {
            document.getElementById('hint5').style.display="none";
            document.getElementById('input5').setAttribute('placeholder','请输入验证码');
            var getValue=document.getElementById('input5').value;
            var getCode=document.getElementById('regCode').innerHTML;
            console.log(getCode);
            var reg=/^[a-zA-Z0-9]{4}$/;
            if(getValue!==''){
                if(!reg.test(getValue)){
                    alert("验证码输入有误");
                }else {
                    if(getValue!=getCode){
                        alert("输入的验证码不正确");
                    }
                }
            }
        };
        function show6() {
            document.getElementById('input6').setAttribute('placeholder','');
        };
        function hidden6() {
            document.getElementById('input6').setAttribute('placeholder','请输入手机验证码');
            var getValue=document.getElementById('input6').value;
            var reg=/^[0-9]{6}$/;
            if(getValue!==''){
                if(!reg.test(getValue)){
                    alert("手机验证码有误");
                }
            }
        }

            var  button=document.getElementById('register');
            button.onclick=function () {
                if(document.getElementById('input1').value==''){
                    alert('用户名不能为空');
                    return false;
                }else if(document.getElementById('input2').value==''){
                    alert('密码不能为空');
                    return false;
                }else if(document.getElementById('input3').value==''){
                    alert('请再次输入密码');
                    return false;
                }else if(document.getElementById('input4').value==''){
                    alert('请输入手机号码');
                    return false;
                }else  if(document.getElementById('input5').value==''){
                    alert('请输入验证码');
                    return false;
                }else if(document.getElementById('input6').value==''){
                    alert('请输入手机验证码');
                    return false;
                }else{
                	form1.action="http://localhost:8080/second-transaction/saveFisher.action";
                	form1.submit();
                }
            }
            

        var regStr='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';//0-61
        var  code=document.getElementById('regCode');
        function getRandom(n,m) {
            if(n>m){
                var temp=n;
                n=m;
                m=temp;
            };
            Math.ceil(n);
            Math.floor(m);
            return Math.round(Math.random()*(m-n)+n);
        }
        function updateStr() {
            var str='';
            for(var i=0;i<4;i++){
                var index=getRandom(0,61);
                str+=regStr[index];
            }
            code.innerHTML=str;
        }
        updateStr();
        code.onclick=updateStr;
        

    </script>
</body>
</html>