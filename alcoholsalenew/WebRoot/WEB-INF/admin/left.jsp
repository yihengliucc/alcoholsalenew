<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/admin/SimpleTree.css"/>


  </head>
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/jquery-1.6.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/admin/SimpleTree.js"></script>
<script type="text/javascript">
$(function(){
	$(".st_tree").SimpleTree({
	});
});
</script>
  <body>
   <div class="st_tree" style="width:400px;margin:0 auto;">
  
	<ul>
		<li><a href="exit.action"  target="_top">退出登入</a></li>
		<li><a href="#" ref="xtgl">系统管理</a></li>
		<ul show="true">
			<li><a href="queryuser.action?pageSize=4&&pageNow=1" target="right">用户管理</a></li>
			<li><a href="#" ref="rzck">添加用户</a></li>
		</ul>
		<li><a href="#" ref="ckgl">商品管理</a></li>
		<ul>
			<li><a href="queryallproduct.action?pageSize=1&&pageNow=1" target="right">库存管理</a></li>
			<!--  <li><a href="#" ref="shgl">收货管理</a></li>-->
			<li><a href="#" ref="fhgl">订单管理</a></li>
			<ul>
				<li><a href="queryNoSendOrder.action?pageSize=1&&pageNow=1" target="right">未发货物管理</a></li>
				<li><a href="querySendOrder.action?pageSize=1&&pageNow=1" target="right">已发货管理</a></li>
			<!--  	<li><a href="#" ref="rzck">日志查看</a></li>-->
			</ul>
		</ul>
			<li><a href="#" ref="fhgl">评价管理</a></li>
			<ul>
				<li><a href="queryComment.action" target="right">货物评价</a></li>
			</ul>
	</ul>
</div>
  </body>
</html>
