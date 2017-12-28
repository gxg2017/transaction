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
    <title>Title</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .container {
            border-top: 1px solid aquamarine;
            width: 1190px;
            margin: 80px auto;
            padding-top: 20px;
        }
        .container .productInfo{
            width: 1190px;
            height: 200px;
            background: whitesmoke;
            display: flex;
            flex-direction: row;

        }
         .container .productInfo div{
            width: 200px;
            height: 180px;
           
            text-align: center;
        }
        .container .productInfo .title{
        	margin-top: 5px;
        	color: 	#000088 ;
        	font-size: 20px;
        }
        .container .productInfo .comment{
        	margin-top: 60px;
        	color: #CC0000 ;
        	height:100px;
        	
        	
        }
        .container .productInfo .comImg{
        	margin-top: 45px;
        }
        .container .productInfo .comImg img{
        	width: 50px;
        	height: 50px;
        	vertical-align:middle;
        }
        .container .productInfo .comImg span{
        	display: inline-block;
        	vertical-align:middle;
        }
        .container .productInfo .btn{
        	
        	width: 100px;
        	height: 50px;
        	line-height:50px;
        	background: #FF8800 ;
        	 border-radius: 5px;
        	 color: white;
        	 margin: 60px auto;
        	 text-align: center;
        }

    </style>
    <script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$('.btn').click(
    			function(){
    				form1.submit();
    			}
    		)
    	})
    	
    </script>
</head>
<body>
    <div class="container">
        <div class="productInfo">
        	<div>
        		<p class="title">闲置商品名称</p>
        		<p class="comImg">
        			<img alt="" src="/upload/${newIdle.idleimg}">
        			<span>${newIdle.name}</span>
        		</p>
        	</div>
        	<div>
        		<p class="title">购买数量</p>
        		<p class="comment">${newIdle.amount}</p>
        	</div>
        	<div>
        		<p class="title">单价</p>
        		<p class="comment">${newIdle.transfer_price}</p>
        	</div>
        	<div>
        		<p class="title">小计</p>
        		<p class="comment">${newIdle.amount*newIdle.transfer_price}</p>
        	</div>
        	<div>
        		<p class="title">闲置商品发布者</p>
        		<p class="comment">${fisher.nickname}</p>
        	</div>
        	<div>
        		<p class="title">操作</p>
        		<form action="placeOrder.action" method="post" name="form1">
        			<div style="display: none">
        				<input type="text" name="productname" value="${newIdle.name}">
        				<input type="text" name="num" value="${newIdle.amount}">
        				<input type="text" name="price" value="${newIdle.transfer_price}">
        				<input type="text" name="totalprice" value="${newIdle.transfer_price*newIdle.amount}">
        				<input type="text" name="fisher_id" value="${fisher.id}">
        				<input type="text" name="amount" value="${newIdle.amount}">
        				<input type="text" name="id" value="${newIdle.id}">
        				
        			</div>
        			<p class="btn">确认购买</p>
        		</form>
        		
        	</div>

        </div>

    </div>
</body>
</html>