<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 引入jstl标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/admin/alluser.css"/>
  </head>
  
  <body>
  <h1 style="text-align:center">用户信息页面</h1>
   <table class="table_border">
   <tr><td>编号</td><td>姓名</td><td>邮箱</td><td>手机号码</td><td>注册时间</td><td>详细信息</td><td>删除</td></tr>
   	<c:forEach items="${alluser}" var = "usermessage">
   	<tr><td>${usermessage.userid}</td><td>${usermessage.username}</td><td>${usermessage.email}</td><td>${usermessage.phone}</td>
   	<td>${usermessage.regdate}</td><td><a href="${pageContext.request.contextPath }/goupdate.action">修改</a></td><td><a href="${pageContext.request.contextPath }/deleteUser.action?userid=${usermessage.userid }">删除</a></td></tr>
   	</c:forEach>
   </table>
   <c:if test="${pageNow!=1 }">
   	<a	href="${pageContext.request.contextPath }/queryuser.action?pageNow=${pageNow-1}">上一页</a>
  	</c:if>
  	<c:forEach begin="1" end="${tusercount}" var="i">
		<a	href="${pageContext.request.contextPath }/queryuser.action?pageNow=${i}">${i}</a>
	</c:forEach>
	
	<c:if  test="${pageNow!=tusercount }" >
	<a	href="${pageContext.request.contextPath }/queryuser.action?pageNow=${pageNow+1}">下一页</a>
  	</c:if>
  </body>
</html>
