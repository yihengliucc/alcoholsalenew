<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 引入jstl标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>我的订单</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/myorder.css"
	type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/mycart/jquery.1.4.2-min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/myorder.js"></script>

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
	<div class="bj_navbar">
		<div class="user clearfix">
			<div class="order-guide">
				<strong> <a
					href="${pageContext.request.contextPath }/index.jsp" target="_self">首页</a>
				</strong> &gt; <span class="det-cur">我的订单</span>
			</div>

			<!-- 左侧导航begin -->
			<div class="sideNav">
				<h1>
					<a href="${pageContext.request.contextPath }/index.jsp"> <i></i>
						<span>我的品牌酒</span>
					</a>
				</h1>
				<div class="userInfo">
					<div class="myInfo clearfix">
						<div class="photo">
							<div class="mask"></div>
							<img id="headImagePath"
								src="${pageContext.request.contextPath }/images/userhead/01.gif"
								width="80" height="80">
							<div class="maskInn"></div>
							<a class="edit" href="#" title="" target="_blank">编辑资料</a>
						</div>
						<div class="info">
							<p class="name">${user.username }</p>
							<p class="level level1">
								<i></i><a href="#" title="会员级别">会员级别</a>
							</p>
						</div>
					</div>
				</div>

				<div class="navList">
					<div class="func func1 clearfix">
						<p class="title">
							<i></i><span>交易管理</span>
						</p>
						<a class="item on" href="javascript:;" title=""><span>我的订单</span><i></i></a>
<!-- 						<a class="item" href="/trademanage/my_task.htm" title=""><span>我的作品</span><i></i></a>
						<a class="item" href="/trademanage/deal_return.htm" title=""><span>退货记录</span><i></i></a>
						<a class="item" href="/trademanage/my_collect.htm?rome=all"
							title=""><span>我的收藏</span><i></i></a> <a class="item"
							href="/trademanage/deal_arrNotice.htm" title=""><span>到货通知</span><i></i></a> -->
					</div>
				</div>
				<!-- 左侧导航end -->
			</div>
			<!-- 右侧begin -->
			<div class="rightBox">
				<div class="rightTit">
					<h2>
						<i></i>我的订单
					</h2>
					<form id="orderForm" name="orderForm" action="#"
						onkeydown="if(event.keyCode==13) return false;">
						<div class="myodSearch">
							<div class="os-search">
								<input type="text" id="orderKey" name="orderKey"
									placeholder="订单编号、商品名称、商品编号 " /><a style="cursor:pointer"
									onclick="queryOrderForm();"><i></i>查询</a>
							</div>
							<div class="os-time">
								<select name="timeFlag" id="timeFlag">
									<option value="0">全部时间</option>
									<option value="1">最近三个月</option>
									<option value="2">今年内</option>
									<option value="3">2015年</option>
									<option value="4">2014年</option>
									<option value="5">2014年以前</option>
								</select>
							</div>
							<div class="os-time">
								<select name="originFlag" id="originFlag">
									<option value="0">全部订单</option>
									<option value="1">普通订单</option>
									<!-- <option value="2">私人订制订单</option>
									<option value="3">金币兑换订单</option> -->
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="rightCon">
					<div class="myordCon">
						<ul class="moConHead">
							<li class="moh1">商品信息</li>
							<li class="moh2">收货人</li>
							<li class="moh3">实付金额</li>
							<li class="moh4">
								<div class="moh-status">
									<select id="status" name="status" onchange="changeStatus();">
										<option value="9" selected="">全部状态</option>
										<option value="0">等待付款</option>
										<option value="5">处理中</option>
										<option value="6">等待收货</option>
										<option value="7">已完成</option>
										<option value="2">已取消</option>
										<option value="8">退货</option>
									</select>
								</div>
							</li>
							<li class="moh5">操作</li>
							<div class="clear"></div>
						</ul>
						
						<c:forEach var="order" items="${orders }">
							
							<div class="moCon-ord">
							<div class="ord-num">
								<span>订单编号：<a
									href="#" target="_blank">${order.orderNo }</a></span><i>|</i><span
									class="ord-tim">下单时间：<em>${order.orderdate }</em></span>
							</div>
							<table class="ord-detailTab" cellpadding="0" cellspacing="0"
								border="0">
								<tbody>
									<tr>
										<td class="tdmoh1">
											<div class="ordPicBox ">
												<a class="proId" value="3" href="#" target="_blank" title=""> 
													<!-- 计算商品总价 -->
													<c:set value="0" var="totalPrice" />
													<c:forEach var="orderitem" items="${order.orderitems}">
														<img
														src="${pageContext.request.contextPath }/images/product/little_images/${orderitem.product.image}"
														width="50" height="50" alt="${orderitem.product.proname}"
														title="${orderitem.product.proname}" />
														<c:set value="${totalPrice + orderitem.unitprice * orderitem.pcount }" var="totalPrice"/>
													</c:forEach>	
													</a>
											</div>
										</td>
										<td class="tdmoh2">${order.consignee }</td>
										<td class="tdmoh3">
											<p class="ord-price">¥${totalPrice }</p>
											<p>在线支付</p>
										</td>
										<td class="tdmoh4">
										
											<!-- 待付款订单 -->
											<c:if test="${order.status == '0'}">
											<div class="opePending">
												<span>等待付款</span>
											</div>
											<div class="opeTracking">
												<input type="hidden" class="_orderId" value="105752917">
												<div class="TraBtn" id="tracking">
													<span class="subtrack" style="display: block;">跟踪</span><i></i>
												</div>
												<div class="delivery" style="display: none;">
													<span class="arrow"></span>
													<div class="headline2 clearfix2">
														<span class="timeD">处理时间</span><span>处理信息</span><a
															href="javascript:;" class="close"></a>
													</div>
													<ul class="infoD">
														<li class="clearfix"><p class="timeD">
																<span>${order.orderdate }</span>
															</p>
															<p>
																<span>您的订单已提交，等待系统审核</span>
															</p></li>
													</ul>
												</div>
											</div>
										</td>
										<td class="tdmoh5">
											<p>
												<a class="ope01" target="_blank"
													href="#">查看</a>
											</p>
											<p>
												<a class="ope04" href="goPay.action?orderid=${order.orderid }" >付款</a>
											</p>
											<p>	
												<a class="ope01 ordPointCancle" id="orderCancel" href="javascript:;"
													">取消订单</a>
												<input type="hidden" value="${order.orderid }" />
											</p>
										</td>
										</c:if>
										
										<!-- 已经付款订单 -->
											<c:if test="${order.status == '1'}">
											<div class="opePending">
												<span>已付款</span>
											</div>
											<div class="opeTracking">
												<input type="hidden" class="_orderId" value="105752917">
												<div class="TraBtn" id="tracking">
													<span class="subtrack" style="display: block;">跟踪</span><i></i>
												</div>
												<div class="delivery" style="display: none;">
													<span class="arrow"></span>
													<div class="headline2 clearfix2">
														<span class="timeD">处理时间</span><span>处理信息</span><a
															href="javascript:;" class="close"></a>
													</div>
													<ul class="infoD">
														<li class="clearfix"><p class="timeD">
																<span>${order.orderdate }</span>
															</p>
															<p>
																<span>您的订单已提交，等待系统审核</span>
															</p></li>
														<li class="clearfix"><p class="timeD">
																<span>${order.paydate }</span>
															</p>
															<p>
																<span>您的订单已付款</span>
															</p></li>
													</ul>
												</div>
											</div>
										</td>
										<td class="tdmoh5">
											<p>
												<a class="ope01" target="_blank"
													href="#">查看</a>
											</p>
											
											<p>	
												<!-- <a class="ope01 ordPointCancle" id="orderCancel" href="javascript:;"
													">取消订单</a> -->
												<input type="hidden" value="${order.orderid }" />
											</p>
										</td>
										</c:if>
										
										<!-- 已取消订单 -->
											<c:if test="${order.status == '2'}">
											
											<div class="opeTracking">
												已取消												
											</div>
										</td>
										<td class="tdmoh5">
											<p>
												<a class="ope01" target="_blank"
													href="#">查看</a>
											</p>
										</td>
										</c:if>
										
									</tr>
								</tbody>
							</table>
						</div>
						</c:forEach>
					</div>
				</div>
				<input id="pageNum" type="hidden" value="1"> <input
					type="hidden" id="currRecordSize" value="1">
				<!-- 翻页begin -->

				<div class="uPageBox ">
					<div class="uPage ">
						<a href="javascript:void(0);" class="uPrevpage">上一页</a> <a
							class="num on">1</a> <a href="javascript:void(0)"
							class="uNnextpage">下一页</a>
					</div>
				</div>
				<!-- 翻页end -->
			</div>
			<!-- 右侧end -->

		</div>

		<!-- 引入尾页面 -->
		<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
