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
    
    <title>My JSP 'index.jsp' starting page</title>
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
          <form action="identifyFisher.action" method="post">
          	<table>
          		<tr>
          		<td>登录名</td>
          		<td><input type="text" name="account" id="account"  ></td>
          		</tr>
          		<tr>
          		<td>密码</td>
          		<td><input type="password" name="password" id="password"  ></td>
          		</tr>
          		<tr>
          			<td colspan="2" align="center"><input type="submit"  value="登录" name="identify" ></td>
          		</tr>
          		<tr><td>${msg}</td></tr>
          	</table>
          
          </form>
       </div>
  </body>
</html>
