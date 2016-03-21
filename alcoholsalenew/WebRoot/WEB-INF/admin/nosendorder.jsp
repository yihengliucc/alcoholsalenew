<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'nosendorder.jsp' starting page</title>
    
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
  <h1 style="text-align:center">未发货订单查询页面</h1>
   <table class="table_border">
   <tr><td>编号</td><td>商品名称</td><td>单价</td><td>购买数量</td><td>订单提交日期</td><td>点击发货</td></tr>
   	<c:forEach items="${nosendorder}" var = "detailorder">
   	<tr><td>${detailorder.orderid}</td><td>${detailorder.orderitem.TProduct.proname}</td><td>${detailorder.orderitem.TProduct.normalprice}</td><td>${detailorder.orderitem.pcount}</td>
   	<td>${detailorder.oderdate}</td><td><a href="${pageContext.request.contextPath }/sendaction.action?orderid=${detailorder.orderid}">点击发货</a></td>
	</tr>
   	</c:forEach>
   </table>
   <c:if test="${pageNow!=1 }">
   	<a	href="${pageContext.request.contextPath }/queryNoSendOrder.action?pageNow=${pageNow-1}">上一页</a>
  	</c:if>
  	<c:forEach begin="1" end="${nosendordercount}" var="i">
		<a	href="${pageContext.request.contextPath }/queryNoSendOrder.action?pageNow=${i}">${i}</a>
	</c:forEach>
	
	<c:if  test="${pageNow!=productcount }" >
	<a	href="${pageContext.request.contextPath }/queryNoSendOrder.action?pageNow=${pageNow+1}">下一页</a>
  	</c:if>
  </body>
</html>
