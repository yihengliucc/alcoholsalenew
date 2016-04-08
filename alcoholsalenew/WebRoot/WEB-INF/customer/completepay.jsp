<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 引入jstl标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单支付</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/gopay.css"
	type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/mycart/jquery.1.4.2-min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/gopay.js"></script>

</head>
<body>
	<!-- 引入头页面 -->
	<jsp:include page="head.jsp"></jsp:include>

	<!-- 支付页面 -->
	<div class="payBox">
		<div class="payMain">
			<div class="successWrap">
				<ul class="successCon">
					<li class="sucTit"><i class="payIcon"></i>订单已完成付款，我们马上为您发货！</li>
					</li>
					<li class="sucCon">订单编号：<em> <a
							href="">${order.orderNo }</a>
					<!-- 计算商品总价 -->
					<c:set value="0" var="totalPrice" />
					<c:forEach var="orderitem" items="${order.orderitems}">
						<c:set value="${totalPrice + orderitem.unitprice * orderitem.pcount }" var="totalPrice"/>
					</c:forEach>
							
					</em>订单金额：<b>￥${totalPrice }</b><span class="sucCon-pro">付款接口未打通，模拟付款，数据库中已完成订单状态更改<i
							class="payIcon"></i></span></li>
				</ul>				
			</div>
			
		</div>
	</div>

	<!-- 引入尾页面 -->
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
