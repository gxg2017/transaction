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
    <title>咸鱼.淘宝二手-轻松卖闲置</title>
    <style>
        *{
            margin: 0;
            padding: 0;

        }
        a{
            text-decoration: none;
        }
        .contain .header{
            background: #F5F5F5;
            height: 36px;

        }
        .contain .header .header-top{
            margin: 0 auto;
            height: 35px;
            width: 1190px;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            font-size: 14px;
            line-height: 35px;

        }
        .contain .header .header-top a{
            margin-left: 8px;
        }
        .contain .header .header-top .left-header{
            display: flex;
            flex-direction: row;

        }
        .contain .header .header-top .right-header{

            display: flex;
            flex-direction: row;
        }
        .contain .header-title{
            background: #ffda44;
            height: 90px;
            line-height: 90px;
            display: flex;
            flex-direction: row;
        }
        .contain .header-title .header-title-left{
            display: flex;
            flex-direction: row;
            width: 208px;
            height: 46px;
            margin-left: 200px;
        }
        .contain .header-title  .info  a,.contain .header-title  .info span{
            margin-left: 25px;

        }



        .contain .center{

            height: 266px;
            width: 1190px;
            margin: 10px auto;
            display: flex;
            flex-direction: row;
            font-size: 14px;
            justify-content: space-around;
            /*background: aquamarine;*/
        }
        .contain .center .center-left{
            border: 1px solid #e6e6e6;
            background-color: #fff;
            width: 238px;
        }
        .contain .center .center-left div{
            border-top: 1px solid #f2f2f2;
            overflow: hidden;
            padding: 10px 0px;
            height: 24px;
            line-height: 24px;
            margin-top: -1px;
        }
        .contain .center .center-left div .one{
        	font-size: 14px;
        	color: black;
        	margin-left: 30px;
        }
        .contain .center .center-left div .one:hover{
        	text-decoration: underline;
        }
        .contain .center .center-left div  .other{
        	font-size: 12px;
        	color: #979797;
        	margin-left: 9px;
        }
        
        .contain .center .center-left div  .other:hover{
        	color: green;
        	text-decoration: underline;
        }
        .contain .center .center-center{
            width: 640px;


        }
        .contain .center .center-center img{
            width: 640px;
            height: 270px;
        }
        .contain .center .center-right{

            width: 290px;


        }
        .contain .center .center-right .center-right-top{
            height: 133px;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
           align-items: center;
            background: whitesmoke;
        }
        .contain .center .center-right .center-right-top div{
            width: 125px;
            height: 80px;
            background: white;
            text-align: center;

            padding-top: 15px;


        }
        .contain .center .center-right .center-right-top div p a {
            font-size: 18px;
            font-weight: bold;
            color: black;

        }
        .contain .center .center-right .center-right-top div p{
            font-size: 12px;
            color: #333;
            margin-top: 10px;
        }
        .contain .center .center-right .download{
            height: 133px;
            text-align: center;
            line-height: 133px;
            font-size: 23px;
            border-bottom: 5px solid aquamarine;
        }
        .contain .productList{
        	
            width: 1190px;
            margin: 10px auto;
            display: flex;
            flex-direction: row;
            flex-wrap:wrap;
        }
        .contain .productList .idle{
        	margin-top:10;
        	height: 250px;
        	width: 238px;
        	border-bottom:  1px solid 	#00FFCC;
        	text-align: center;
        	font-size: 14px;
        }
        .contain .productList .idle img{
        	height:100px;
        	width: 100px; 
        	
        }
        .contain .productList .idle p{
        	margin-top: 3px;
        }
        .contain .productList .idle .price{
        	color: #FF3333 ;
        	font-size: 14px;
        	font-weight: bold;
        }
        .contain .productList .idle .location{
        	color: #000088;
        }
       
    </style>
    <script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
     $(function(){
     	$('.idle').click(
     		function(){
     			$().click()
     		}
     	)
     
     
     })
     
   
    

    
	

    </script>

</head>
<body>

    <div  class="contain">
    	
        <div class="header">
            <div class="header-top">
                <div class="left-header">
                	<c:if test="${sessionScope.fisher==null}">
                		<a href="/second-transaction/jsp/login.jsp">亲，请登录</a>
                    	<a href="/second-transaction/jsp/register.jsp">免费注册</a>
                	</c:if>
                	<c:if test="${sessionScope.fisher!=null}">
                		
                    	<a href="/second-transaction/jsp/updateInfo.jsp">${sessionScope.fisher.account}</a>
                	</c:if>
                    
                    <a href="">手机逛淘宝</a>
                </div>
                <div class="right-header">
                    <a href="">淘宝网首页</a>
                    <a href="">我的淘宝</a>
                    <a href="">购物车</a>
                    <a href="">收藏夹</a>
                    <a href="">商品分类</a>
                    <a href="">卖家中心</a>
                    <a href="">联系客服</a>
                    <a href="">网站导航</a>

                </div>
            </div>

        </div>
        <div class="header-title">
            <div class="header-title-left">
                <h1>闲鱼</h1>
                <p>让你的闲置游起来</p>
            </div>
            <div class="info">
                <a href="">首页</a>
                <a href="">手机二手</a>
                <a href="">二手车估价</a>
                <a href="">降降降</a>
                <span>|</span>
                <a href="showPublishPage.action">发布闲置</a>
                <a href="/second-transaction/jsp/myProduct.jsp">我的闲置</a>
            </div>
        </div>

        <div class="center">
            <div class="center-left">
              <c:forEach items="${idleTypeList}" var="idleType">
              	<div>
              		<a href="" class="one">
              		<c:out value="${idleType.typename}"></c:out>
              		</a>
              		<%-- <a href="" class="other" id="a_idtype">
              		<c:out value="${idleType.enumerate}"></c:out>
              		</a> --%>
              		
              		<c:forEach items="${idleType.enumerateArr}" var="str">
              			<a href="" class="other">${str}</a>
              		</c:forEach>
              		
              		<%-- <c:forEach items=" ${fn:split(idleType.enumerate,',')} " var="num">
              			<a href="" class="other">
              			<c:out value="${num}"></c:out>
              			</a>
              		</c:forEach> --%>
              		
              	</div>
              </c:forEach>
            </div>

            <div class="center-center">
                <img src="/second-transaction/images/2.jpg" alt="无法显示图片" >

            </div>

            <div class="center-right">
                <div class="center-right-top">
                    <div>
                        <p><a href="showPublishPage.action">发布闲置</a></p>
                        <p>闲置换钱，快速出手</p>
                    </div>
                    <div>
                        <p><a href="">一键转卖</a></p>
                        <p>转卖已买到的宝贝</p>
                    </div>
                </div>
                <div class="download">
                    咸鱼客户端下载
                </div>
            </div>

        </div>
          <div class="productList">
        	<c:forEach items="${idleList}" var="idle">
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
        			<p class="location">
        			所在地：<c:out value="${idle.location }"></c:out>
        			</p>
        			<p>
        				<a href="getIdleById.action?id=${idle.id }" style="display:" class="binfo">详情</a>
        			</p>
        			
        			
        		</div>
        	
        	</c:forEach>
        

        </div>
      
  </div>
</body>
</html>