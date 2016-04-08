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
					<li class="sucTit"><i class="payIcon"></i>订单已提交成功，请您立即付款，我们将为您闪电送达！</li>
					<li class="sucPro">请您在<span>24小时</span>内付款，逾期订单将被取消！
					</li>
					<li class="sucCon">订单编号：<em> <a
							href="">${order.orderNo }</a>
					<!-- 计算商品总价 -->
					<c:set value="0" var="totalPrice" />
					<c:forEach var="orderitem" items="${order.orderitems}">
						<c:set value="${totalPrice + orderitem.unitprice * orderitem.pcount }" var="totalPrice"/>
					</c:forEach>
							
					</em>订单金额：<b>￥${totalPrice }</b><span class="sucCon-pro">商品库存有限，过时无效，请尽快进行支付<i
							class="payIcon"></i></span></li>
				</ul>				
			</div>
			
			<!-- 立即支付div -->
			<div class="payWrap">
				    	<div class="payCon">
				        	<div class="paymentUsed"><i class="payIcon radioIcon"></i><em>使用：</em><span class="Payment payment_1 on"><b class="payIcon p_1"></b><i class="payIcon"></i></span></div>
				            <div class="paymentUsed" style="display:none"><b>请选择支付方式：</b></div>
				            <div class="payAmount"><span>支付金额：</span><b>￥${totalPrice }</b></div>
				            <div class="qrcode"><img src="${pageContext.request.contextPath }/images/others/qrcode.png" /></div>
				            
				        </div>
				        <div class="payOpenCon" style="display:block;">
				        	<div class="paymentOpen"><span>其他支付方式</span><i class="payIcon"></i></div>
				        </div>  
				        
				        <div class="payBtnBox"><a class="payBtn" href="completePay.action"><i class="payIcon"></i></a></div>
				    </div>
			
			
		</div>
	</div>

	<!-- 引入尾页面 -->
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
