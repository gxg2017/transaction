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
        .container{
            display: flex;
            flex-direction: row;
            width: 80%;
            margin: 100px auto;
        }
        .container .left{
            width: 20%;
            height: 600px;
            background: lightcoral;

            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container .left .info{
            height: 50%;
            width: 100%;
            text-align: center;
        }
        .container .left .info div{
            height: 50px;
            line-height: 50px;


        }
        .container .left .info div:hover{
            background: chocolate;
            color: white;
        }
        .container .right{
            width: 80%;
            height: 600px;
            border: 1px  solid #333333;

        }
        .container .right .productList{
        	display: flex;
            flex-direction: row;
            flex-wrap: wrap;
        }
        .container .right .productList div{
        	height: 200px;
        	width: 200px;
        	 border-bottom: 1px solid #0099FF;
        	text-align: center;
        }
        .container .right .productList img{
        	height: 50px;
        	width: 50px;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="left">
            <div class="info">
                <img alt="" src="">
                <p>${sessionScope.fisher.account}</p>
                <p>用户您好，请选择您的操作</p>
            </div>
            <div class="info">
                <div>
                    <a href="/second-transaction/getMyIdleList.action">我的闲置</a>
                </div>
                <div>
                    <a>已售出</a>
                </div>
            </div>
        </div>
        <div class="right">
			<div class="productList">
        	<c:forEach items="${myIdleList}" var="idle">
        		<div class="idle">
        			<img alt="" src="/upload/${idle.idleimg}">
        			<p>
        			商品名称：<c:out value="${idle.name}"></c:out>
        			</p>
        			<p>
        			商品数量：<c:out value="${idle.amount}"></c:out>
        			</p>
        			<p class="price">
        			购买价格：<c:out value="${idle.original_price }"></c:out>
        			</p>
        			<p class="price">
        			转让价格：<c:out value="${idle.transfer_price }" ></c:out>
        			</p>
        			<p>
        			交易方式：<c:if test="${idle.transfer_mode==1 }">线上交易</c:if>
        					<c:if test="${idle.transfer_mode==2 }">线下交易</c:if>
        					<c:if test="${idle.transfer_mode==3 }">两者均可</c:if>
        			</p>
        			
        			
        			
        		</div>
        	
        	</c:forEach>
        </div>
        </div>
        
    </div>
</body>
</html>