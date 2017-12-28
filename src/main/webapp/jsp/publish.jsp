<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'publish.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div>
    	<form action="saveIdle.action" method="post" enctype="multipart/form-data">
    		<table>
    			<tr>
    				<td>标题</td>
    				<td><input type="text" name="name" /></td>
    			</tr>
    			<tr>
    				<td>数量</td>
    				<td><input type="number" name="amount" /></td>
    			</tr>
    			<tr>
    				<td>所在地</td>
    				<td><input type="text" name="location" /></td>
    			</tr>
    			<tr>
    				<td>购买时间</td>
    				<td><input type="text" name="purchasing_date" /></td>
    			</tr>
    			<tr>
    				<td>购买价格</td>
    				<td><input type="number" name="original_price" /></td>
    			</tr><tr>
    				<td>转让价格</td>
    				<td><input type="number" name="transfer_price" /></td>
    			</tr>
    			<tr>
    				<td>交易方式</td>
    				<td>
    					<select name="transfer_mode">
    						<option value="1" >线上交易</option>
    						<option value="2" >线上交易</option>
    						<option value="3" >两者均可</option>
    					</select>
    				</td>
    			</tr> 
    			<tr>
    				<td>新旧</td>
    				<td>
    				全新 <input type="radio"  name="percentage" value="1" />
    				八成新<input type="radio"  name="percentage"  value="2" />
    				半层新<input type="radio"  name="percentage"  value="3" />
    				半层以下<input type="radio"  name="percentage"  value="4" />
    				
    				</td>
    			</tr>
    			<tr>
    				<td>所属类型</td>
    				<td>
    					<select name="fk_idletype">
    					<c:forEach items="${idleTypeList}" var="idleType">
    						<option value="${idleType.id }">${idleType.typename }</option>
    					</c:forEach>
    					</select>
    				</td>
    			</tr>
    			<tr>
    				<td>商品图片</td>
    				<td><input type="file"  name="img" /></td>
    			</tr>
    			
    			<tr>
    				
    				<td colspan="2" align="center">
    					<input type="submit"  name="btn"  value="发布" />
    				
    				</td>
    			</tr>
    		
    		
    		</table>
    	
    	</form>
    
    </div>
  </body>
</html>
