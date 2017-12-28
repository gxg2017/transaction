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
            width: 1190px;
            margin: 100px auto;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }
        .container .left{
            width: 730px;
            height: 490px;
            background: whitesmoke;
        }
        .container .left img{
        	width: 680px;
        	height: 490px;
        }
        .container .right{
            width: 440px;
            height: 490px;
          
            text-align: center;
        }
        .container .right p{
        	height: 65px;
        	line-height: 65px;
        	
        }
        .container .right .title{
        	font-size: 25px;
        	font-weight: bold;
        }
        .container .right .price{
        	color: #f40;
        	font-size: 20px;
        }
         .container .right .location{
         	color: 	#0000CC ;
         	font-weight: bold;
         	font-size: 20px;
         }
         .container .right .btn{
         	background: #f40;
         	border-radius: 2px;
         	width: 150px;
         	height: 45px;
         	line-height:45px;
         	text-align: center;
         	margin: 0 auto;
         	margin-top: 25px;
         	color: white;
         	font-size: 20px;
         	
         }
        
    </style>
    
    <script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
    	$(function(){
    		/* $('.btn').click(
    			function(){
    				var idleId=$('.idleId').text();
    				var idleids=parseInt(idleId);
    				var amount=$("#num").val();
    				var amounts=parseFloat(amount);
    				
    				var params={"id":idleids,"amount":amounts};
    				var paramstr=JSON.stringify(params);
    				alert(paramstr)
    				var url="buyIdle.action";
    				$.ajax({
    						type:'post',
			  				async:true,
			  				contentType : "application/json;charset=UTF-8",//发送数据的格式
			  				url:url,
			  				data:paramstr,
			  				dataType:'json',
			  				success:function (jsonData){
			  					
			  						alert(jsonData.amount);
			  					
			  					}
    					
    				})
    			}
    		
    		) */
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

        <div class="left">
            <img src="/upload/${idle.idleimg}" alt="">
        </div>
        <div class="right">
        			
        			<p class="title">
					商品名称：<c:out value="${idle.name}"></c:out>
        			</p>
        			<p>
        			商品数量：<c:out value="${idle.amount}"></c:out>
        			</p>
        			<p >
        			购买价格：<span class="price">￥<c:out value="${idle.original_price }"></c:out></span>
        			</p>
        			<p >
        			转让价格：<span class="price">￥<c:out value="${idle.transfer_price }" ></c:out></span>
        			</p>
        			<p>
        			交易方式：<c:if test="${idle.transfer_mode==1 }">线上交易</c:if>
        					<c:if test="${idle.transfer_mode==2 }">线下交易</c:if>
        					<c:if test="${idle.transfer_mode==3 }">两者均可</c:if>
        			</p>
        			<p class="location">
        			所在地：<c:out value="${idle.location }"></c:out>
        			</p>
        			
        			<form action="buyIdlePage.action?id=${idle.id}" method="post" name="form1">
        				<div>
        					
	        				<label>请选择数量：</label>
	        				<input type="number" name="amount" id="amount">
        				</div>
        				<div class="btn">
        					立即购买
        				</div>
        			</form>
        			
        </div>
    </div>
</body>
</html>