<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>购物车</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/productshow.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/mycart.css"
	type="text/css" />

  </head>
  
  <body>
	<!-- 引入头页面 -->
	<jsp:include page="head.jsp"></jsp:include>

	<!-- 导航条 -->
	<div class="navWrap">
		<div class="navCategoryMenu">
			<h2>全部商品分类</h2>
			<ul>
				<li></li>
			</ul>
		</div>
	</div>
	
	<!-- 大框  -->
	<div class="cart">
		<div class="all-wrap">
			<div id="main">
				<div id="cart_container" class="cart-container">
					<h4 id="cart-title"><span id="cart_goods_count_top">购物车商品总数：<b>2</b></span><span class="flag"></span></h4>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 引入尾页面 -->
	<jsp:include page="foot.jsp"></jsp:include>	
	
  </body>
</html>
