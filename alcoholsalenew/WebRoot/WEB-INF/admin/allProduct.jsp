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
  <h1 style="text-align:center">商品信息页面</h1>
  <div align="right">
  <a href="addproductUi.action">增加</a>
  </div>
   <table class="table_border">
   <tr><td>编号</td><td>商品名称</td><td>普通价格</td><td>会员价格</td><td>发布日期</td><td>库存量</td><td>商品描述</td><td>修改</td><td>删除</td></tr>
   	<c:forEach items="${allproduct}" var = "productmessage">
   	<tr><td>${productmessage.proid}</td><td>${productmessage.proname}</td><td>${productmessage.normalprice}</td>
   	<td>${productmessage.memberprice}</td><td>${productmessage.pubdate}</td><td>${productmessage.stockid.quantity}</td>
   	<td>${productmessage.descr}</td><td><a href="${pageContext.request.contextPath }/findproduct.action?proid=${productmessage.proid }">修改</a></td>
   	<td><a href="${pageContext.request.contextPath }/deleteproduct.action?proid=${productmessage.proid }">删除</a></td></tr>
   	</c:forEach>
   </table>
   <c:if test="${pageNow!=1 }">
   	<a	href="${pageContext.request.contextPath }/queryallproduct.action?pageNow=${pageNow-1}">上一页</a>
  	</c:if>
  	<c:forEach begin="1" end="${productcount}" var="i">
		<a	href="${pageContext.request.contextPath }/queryallproduct.action?pageNow=${i}">${i}</a>
	</c:forEach>
	
	<c:if  test="${pageNow!=productcount }" >
	<a	href="${pageContext.request.contextPath }/queryallproduct.action?pageNow=${pageNow+1}">下一页</a>
  	</c:if>
  </body>
</html>
