<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>购品牌酒，就上品牌酒网！</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/customer/index.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/comm.css" type="text/css" /> 	 
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
	
	<!-- 引入轮播图片 -->
	<jsp:include page="scroll.jsp"></jsp:include>
    
    <!-- 商品展示 -->
 	<%-- <div class="main">
 		商品展示	
 		<img alt="茅台" src="${pageContext.request.contextPath }/images/product/0_1_001.png">
 	</div> --%>
 	<jsp:include page="productshow.jsp"></jsp:include>
 	
 	<!-- 引入尾页面 -->
    <jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
