<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 引入jstl标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>后台管理</title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/admin1/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/admin1/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/admin1/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/admin1/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/admin1/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/admin1/main.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/admin1/jquery.blockUI.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/admin1/jquery.loading.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/admin1/jquery-Slider.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/admin1/jquery.timers-1.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/admin1/short-msg.js"></script>
<link href="${pageContext.request.contextPath }/css/admin1/main.css"
	rel="stylesheet" type="text/css">

<script>
		var referer = undefined;
</script>
</head>

<body class="easyui-layout layout panel-noscroll">
	<input type="hidden" id="hidout" value="0" />
	<div region="north" border="true" class="cs-north">
		<div class="header">
			<div class="lineOne">
				<div class="logo"></div>
				<div class="downArrow">
					<div class="downArrowIcon"></div>
					<div class="downArrowContent">
						<span id="mm-tabupdate">刷新当前页</span> <span id="mm-tabcloseall">关闭全部</span>
						<span id="mm-tabcloseother">关闭其他</span>
					</div>
				</div>
				<div class="info">
					<div class="sysmenu">
						<ul>
							<li class="message"><a href="javascript:;">消息 <span
									class="num">2</span>
							</a>
								<div class="msglist" style="display: none;">
									<div class="triangle"></div>
									<ul>
										<li><span class="name"><a class="mes"
												href="javascript:void(0);"
												onclick="addTab1(&quot;待发货订单&quot;,&quot;../shop/admin/order!notShipOrder.do&quot;)">有2个订单需要您发货</a></span></li>
										<li><span class="name"><a class="mes"
												href="javascript:void(0);"
												onclick="addTab1(&quot;待结算订单&quot;,&quot;../shop/admin/order!notPayOrder.do&quot;)">有4个新订单需要您结算</a></span></li>
									</ul>
								</div></li>
							<li class="logout"><a href="javascript:;" id="logout_btn"><div
										class="icon"></div>退出</a></li>
							<li class="website"><a
								href="..${pageContext.request.contextPath }" title="浏览网站"
								target="_blank"><div class="icon"></div> 浏览网站</a></li>
							<!-- 
								<li class="website">
									<a href="http://tongji.baidu.com/web/welcome/login" title="浏览网站" target="_blank"><div class="icon"></div>浏览统计</a> 
								</li>
							 -->
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- hearder end -->
	</div>

	<!-- 左边部分begin -->
	<div region="west" border="true" split="true" class="cs-west" >
    	<div class="leftMenu" style="width:110px;margin-right:9px;height:100%;" id="leftMenu" >
	        <div class="lmenuPrev">
	             <a href="javascript:;" id="btnDown">向下</a>
	        </div>
	        <div class="lmenu fl">
					<ul class="roll_ul">
						<li id="parent1" class="parentMenu" rel="1" islast=""><a
							style="cursor: pointer">
								<div class="cover"></div>
								<div class="icon">
									<img
										src="${pageContext.request.contextPath }/images/admin1/menu_01.gif">
								</div>
								<div index="tfun2" style="display:none;" class="newFunction"></div>
								<div topvalue="2" topname="" class="text">商品</div>
						</a>
							<div id="1" class="secondFloat secondFLoat1 "
								style="display: none; top: 22px;">
								<div class="second">
									<ul class="child_width">
										<li>
											<div class="title">商品管理</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun3"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="3"
													src="${pageContext.request.contextPath }/admin/shop/products!list.action"
													class="cs-navi-tab">商品列表</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun4"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="4"
													src="/version4/shop/admin/goods!selectCat.do"
													class="cs-navi-tab">添加商品</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun5"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="5"
													src="/version4/shop/admin/goodsStore!listGoodsStore.do?optype=purchase"
													class="cs-navi-tab">进货</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun6"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="6"
													src="/version4/shop/admin/goodsStore!listGoodsStore.do?optype=view"
													class="cs-navi-tab">库存维护</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">商品设置</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun8"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="8"
													src="/version4/shop/admin/cat!list.do" class="cs-navi-tab">分类列表</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun9"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="9"
													src="/version4/shop/admin/brand!list.do"
													class="cs-navi-tab">品牌列表</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun10"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="10"
													src="/version4/shop/admin/type!list.do" class="cs-navi-tab">类型列表</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun11"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="11"
													src="/version4/shop/admin/spec!list.do" class="cs-navi-tab">规格列表</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">标签管理</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun13"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="13"
													src="/version4/shop/admin/tag!list.do" class="cs-navi-tab">标签列表</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun14"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="14"
													src="/version4/shop/admin/goodsShow!taglist.do"
													class="cs-navi-tab">标签商品设置</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun15"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="15"
													src="/version4/shop/admin/brandsShow!list.do"
													class="cs-navi-tab">品牌标签设置</a>
												</li>
											</ul>
										</li>

									</ul>
								</div>
								<!-- second -->
							</div></li>
						<li id="parent16" class="parentMenu" rel="16" islast=""><a
							style="cursor: pointer">
								<div class="cover"></div>
								<div class="icon">
									<img
										src="${pageContext.request.contextPath }/images/admin1/menu_default.gif">
								</div>
								<div index="tfun2" style="display:none;" class="newFunction"></div>
								<div topvalue="2" topname="" class="text">订单</div>
						</a>
							<div id="16" class="secondFloat secondFLoat2 "
								style="display: none;">
								<div class="second">
									<ul class="child_width">
										<li>
											<div class="title">订单管理</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun18"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="18"
													src="/version4/shop/admin/order!list.do"
													class="cs-navi-tab">订单列表</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun19"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="19"
													src="/version4/shop/admin/order!notPayOrder.do"
													class="cs-navi-tab">待结算订单</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun20"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="20"
													src="/version4/shop/admin/order!notShipOrder.do"
													class="cs-navi-tab">待发货订单</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun21"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="21"
													src="/version4/shop/admin/order!notRogOrder.do"
													class="cs-navi-tab">待收货订单</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">单据管理</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun23"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="23"
													src="/version4/shop/admin/orderReport!paymentList.do"
													class="cs-navi-tab">收款单</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun24"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="24"
													src="/version4/shop/admin/orderReport!returnedList.do"
													class="cs-navi-tab">退货单</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">发票管理</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun26"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="26"
													src="/version4/shop/admin/invoice!list_invoice.do"
													class="cs-navi-tab">发票内容管理</a>
												</li>
											</ul>
										</li>

									</ul>
								</div>
								<!-- second -->
							</div></li>
						<li id="parent27" class="parentMenu" rel="27" islast=""><a
							style="cursor: pointer">
								<div class="cover"></div>
								<div class="icon">
									<img
										src="${pageContext.request.contextPath }/images/admin1/menu_03.gif">
								</div>
								<div index="tfun2" style="display:none;" class="newFunction"></div>
								<div topvalue="2" topname="" class="text">会员</div>
						</a>
							<div id="27" class="secondFloat secondFLoat3 "
								style="display: none;">
								<div class="second">
									<ul class="child_width">
										<li>
											<div class="title">会员管理</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun29"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="29"
													src="/version4/shop/admin/member!memberlist.do"
													class="cs-navi-tab">会员列表</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun30"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="30"
													src="/version4/shop/admin/member!list_lv.do"
													class="cs-navi-tab">会员等级</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">商品评论</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun32"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="32"
													src="/version4/shop/admin/comments!list.do?type=1"
													class="cs-navi-tab">商品评论列表</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun33"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="33"
													src="/version4/shop/admin/comments!list.do?type=2"
													class="cs-navi-tab">购买咨询列表</a>
												</li>
											</ul>
										</li>

									</ul>
								</div>
								<!-- second -->
							</div></li>
						<li id="parent34" class="parentMenu" rel="34" islast=""><a
							style="cursor: pointer">
								<div class="cover"></div>
								<div class="icon">
									<img
										src="${pageContext.request.contextPath }/images/admin1/menu_04.gif">
								</div>
								<div index="tfun2" style="display:none;" class="newFunction"></div>
								<div topvalue="2" topname="" class="text">促销</div>
						</a>
							<div id="34" class="secondFloat secondFLoat4 "
								style="display: none;">
								<div class="second">
									<ul class="child_width">
										<li>
											<div class="title">优惠卷管理</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun36"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="36"
													src="/version4/shop/admin/bonus-type!list.do"
													class="cs-navi-tab">优惠券列表</a>
												</li>
											</ul>
										</li>

									</ul>
								</div>
								<!-- second -->
							</div></li>
						<li id="parent37" class="parentMenu" rel="37" islast=""><a
							style="cursor: pointer">
								<div class="cover"></div>
								<div class="icon">
									<img
										src="${pageContext.request.contextPath }/images/admin1/menu_05.gif">
								</div>
								<div index="tfun2" style="display:none;" class="newFunction"></div>
								<div topvalue="2" topname="" class="text">页面</div>
						</a>
							<div id="37" class="secondFloat secondFLoat5 "
								style="display: none;">
								<div class="second">
									<ul class="child_width">
										<li>
											<div class="title">广告管理</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun39"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="39"
													src="/version4/core/admin/adColumn!list.do"
													class="cs-navi-tab">广告位</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun40"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="40"
													src="/version4/core/admin/adv!list.do" class="cs-navi-tab">广告列表</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">页面设置</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun42"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="42"
													src="/version4/core/admin/siteMenu!list.do"
													class="cs-navi-tab">导航栏管理</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun43"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="43"
													src="/version4/cms/admin/data!list.do?catid=1"
													class="cs-navi-tab">热门关键字</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun44"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="44"
													src="/version4/cms/admin/data!helplist.do"
													class="cs-navi-tab">帮助中心</a>
												</li>
											</ul>
										</li>

									</ul>
								</div>
								<!-- second -->
							</div></li>
						<li id="parent45" class="parentMenu" rel="45" islast=""><a
							style="cursor: pointer">
								<div class="cover"></div>
								<div class="icon">
									<img
										src="${pageContext.request.contextPath }/images/admin1/menu_05.gif">
								</div>
								<div index="tfun2" style="display:none;" class="newFunction"></div>
								<div topvalue="2" topname="" class="text">统计</div>
						</a>
							<div id="45" class="secondFloat secondFLoat6  secondFloatBig "
								style="display: none; top: auto; bottom: 134px;">
								<div class="second">
									<ul class="child_width">
										<li>
											<div class="title">会员分析</div>
											<ul style="width: 480px;">
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun47"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="47"
													src="/version4/shop/admin/memberStatistics!memberAnalysisHtml.do"
													class="cs-navi-tab">会员下单量统计</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun48"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="48"
													src="/version4/shop/admin/memberStatistics!addMemberNumHtml.do"
													class="cs-navi-tab">新增会员统计</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">商品统计</div>
											<ul style="width: 480px;">
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun50"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="50"
													src="/version4/shop/admin/goodsStatis!priceSales.do"
													class="cs-navi-tab">价格销量</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun51"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="51"
													src="/version4/shop/admin/goodsStatis!hotgoods.do?statis_type=1"
													class="cs-navi-tab">热卖商品统计</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun52"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="52"
													src="/version4/shop/admin/goodsStatis!goodsSalesDetail.do"
													class="cs-navi-tab">商品销售明细</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">行业分析</div>
											<ul style="width: 480px;">
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun54"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="54"
													src="/version4/shop/admin/industryStatistics!showPage.do"
													class="cs-navi-tab">行业规模</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun55"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="55"
													src="/version4/shop/admin/industryStatistics!showCollect.do"
													class="cs-navi-tab">概括总览</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">流量分析</div>
											<ul style="width: 480px;">
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun57"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="57"
													src="/version4/shop/admin/flowStatistics!flowStatisticsHtml.do"
													class="cs-navi-tab">流量分析</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun58"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="58"
													src="/version4/shop/admin/flowStatistics!goodsFlowStatisticsHtml.do"
													class="cs-navi-tab">商品流量分析</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">订单、区域、购买、售后统计</div>
											<ul style="width: 480px;">
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun60"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="60"
													src="/version4/shop/admin/salesStatis!orderStatis.do?order_statis_type=1"
													class="cs-navi-tab">订单统计</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun61"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="61"
													src="/version4/shop/admin/salesStatis!saleIncome.do"
													class="cs-navi-tab">销售收入统计</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun62"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="62"
													src="/version4/shop/admin/regionOrderStatistics!regionList.do"
													class="cs-navi-tab">区域分析</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun63"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="63"
													src="/version4/shop/admin/memberStatistics!buyAnalysisHtml.do"
													class="cs-navi-tab">客单价分布图</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun64"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="64"
													src="/version4/shop/admin/orderReturnedStatistics!returnedStatistics.do"
													class="cs-navi-tab">退款统计</a>
												</li>
											</ul>
										</li>

									</ul>
								</div>
								<!-- second -->
							</div></li>
						<li id="parent65" class="parentMenu" rel="65" islast="last">
							<a style="cursor: pointer">
								<div class="cover"></div>
								<div class="icon">
									<img
										src="${pageContext.request.contextPath }/images/admin1/menu_06.gif">
								</div>
								<div index="tfun2" style="display:none;" class="newFunction"></div>
								<div topvalue="2" topname="" class="text">设置</div>
						</a>
							<div id="65" class="secondFloat secondFLoat7  secondFloatBig "
								style="display: none; top: auto; bottom: 64px;">
								<div class="second">
									<ul class="child_width">
										<li>
											<div class="title">网店设置</div>
											<ul style="width: 480px;">
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun67"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="67"
													src="/version4/core/admin/setting!edit_input.do"
													class="cs-navi-tab">系统设置</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun68"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="68"
													src="/version4/core/admin/smtp!list.do" class="cs-navi-tab">smtp设置</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun69"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="69"
													src="/version4/core/admin/sms!list.do" class="cs-navi-tab">短信网关设置</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun70"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="70"
													src="/version4/shop/admin/express!list.do"
													class="cs-navi-tab">快递平台设置</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun108"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="108"
													src="/version4/shop/admin/goods-index.do"
													class="cs-navi-tab">生成索引</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun109"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="109"
													src="/version4/page/admin/page-create.do"
													class="cs-navi-tab">生成静态页</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">配送和支付</div>
											<ul style="width: 480px;">
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun72"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="72"
													src="/version4/shop/admin/payCfg!list.do"
													class="cs-navi-tab">支付方式</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun73"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="73"
													src="/version4/shop/admin/dlyType!list.do"
													class="cs-navi-tab">配送方式</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun74"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="74"
													src="/version4/shop/admin/logi!list_logi.do"
													class="cs-navi-tab">物流公司</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun75"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="75"
													src="/version4/shop/admin/region!list.do"
													class="cs-navi-tab">地区管理</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun76"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="76"
													src="/version4/shop/admin/depot!list.do"
													class="cs-navi-tab">仓库管理</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">快递单管理</div>
											<ul style="width: 480px;">
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun78"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="78"
													src="/version4/shop/admin/printTmpl!list.do"
													class="cs-navi-tab">快递单模板管理</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun79"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="79"
													src="/version4/shop/admin/dlyCenter!list.do"
													class="cs-navi-tab">发货信息管理</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">权限管理</div>
											<ul style="width: 480px;">
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun81"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="81"
													src="/version4/core/admin/userAdmin!list.do"
													class="cs-navi-tab">管理员管理</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun82"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="82"
													src="/version4/core/admin/role!list.do" class="cs-navi-tab">角色管理</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun83"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="83"
													src="/version4/core/admin/auth!list.do" class="cs-navi-tab">权限点管理</a>
												</li>
											</ul>
										</li>

									</ul>
								</div>
								<!-- second -->
							</div>
						</li>
						<li id="parent87" class="parentMenu" rel="87" islast="last">
							<a style="cursor: pointer">
								<div class="cover"></div>
								<div class="icon">
									<img
										src="${pageContext.request.contextPath }/images/admin1/menu_07.gif">
								</div>
								<div index="tfun2" style="display:none;" class="newFunction"></div>
								<div topvalue="2" topname="" class="text">开发者</div>
						</a>
							<div id="87" class="secondFloat secondFLoat8  secondFloatBig "
								style="display: none;">
								<div class="second">
									<ul class="child_width">
										<li>
											<div class="title">工具</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun89"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="89"
													src="/version4/core/admin/themeUri!list.do"
													class="cs-navi-tab">URL映射</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun90"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="90"
													src="/version4/core/admin/menu!tree.do" class="cs-navi-tab">菜单管理</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun91"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="91"
													src="/version4/core/admin/data-export.do"
													class="cs-navi-tab">数据导出</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">页面管理</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun96"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="96"
													src="/version4/cms/admin/model!list.do" class="cs-navi-tab">文章模型</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun97"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="97"
													src="/version4/cms/admin/cat!list.do" class="cs-navi-tab">文章管理</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun98"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="98"
													src="/version4/core/admin/siteMenu!list.do"
													class="cs-navi-tab">导航栏管理</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">网店设置</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun100"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="100"
													src="/version4/core/admin/setting!edit_input.do"
													class="cs-navi-tab">系统设置</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun101"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="101"
													src="/version4/core/admin/smtp!list.do" class="cs-navi-tab">smtp设置</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun102"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="102"
													src="/version4/core/admin/component!list.do"
													class="cs-navi-tab">组件管理</a>
												</li>
											</ul>
										</li>
										<li>
											<div class="title">权限管理</div>
											<ul>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun104"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="104"
													src="/version4/core/admin/userAdmin!list.do"
													class="cs-navi-tab">管理员管理</a>
												</li>
												<li>
													<div class="newFunction"
														style="margin-top: 10px; *margin-left: -20px;display:none;"
														index="tfun105"></div> <a onclick="OpenWindow(this)"
													style="cursor:pointer" index="105"
													src="/version4/core/admin/role!list.do" class="cs-navi-tab">角色管理</a>
												</li>
											</ul>
										</li>

									</ul>
								</div>
								<!-- second -->
							</div>
						</li>
					</ul>
				</div>
				<div class="lmenuNext">
					<a href="javascript:;" id="btnDown">向下</a>
				</div>
			</div>
		</div>
	
	<!-- 左边部分end  -->

	<!-- 右边部分begin -->
	<div id="mainPanle" region="center" border="true" border="false">
        <div id="tabs" class="easyui-tabs" fit="true" border="false">
            <div title="Home">
                <div class="cs-home-remark">
                    &nbsp;
                </div>
            </div>
        </div>
    </div>
    <div id="mm" class="easyui-menu cs-tab-menu">
    </div>
	<!-- 右边部分end -->

	<script type="text/javascript">
		var index = 0;
		$(function(){
			$(".lmenu").Scroll();
			$(".sysmenu .msglist").hide();
			
			$(".sysmenu .message").mouseover(function(){
				if($(".sysmenu .msglist ul>li").length>0){
				    $(".sysmenu .msglist").show();
				};
			});
			
			$(".sysmenu .message").mouseout(function(){
			    $(".sysmenu .msglist").hide();
			});
			$("#logout_btn").click(function(){
				var options = {
					url : "admin/adminExit.action",
					type : "POST",
					dataType : 'json',
					success : function(result) {				
						if(result.result==1){
							var url = "goLoginUI.action";
							location.href=url;
						}else{
							$.Loading.error(result.message);
						}
					},
					error : function(e) {
						$.Loading.error("出现错误，请重试");
					}
				};
				$.ajax(options);		
			})
			 
			
		/* 	//计算偏移量
			$(".lmenu li").mouseover(function(){
				var selfid = $(this).attr("rel");
				var islast = $(this).attr("islast");
				var top_height = $(this).position().top;
				if(islast=="last"){
					if(top_height < 800){
						$("#"+selfid).css({"top":top_height/6,"bottom":"auto"});
					}
					else{
						$("#"+selfid).css({"top":top_height/2,"bottom":"auto"});
					}
				}
				else{
					$("#"+selfid).css({"top":top_height,"bottom":"auto"});
				}
			
			})
			
			 */
		 });   
		
		 function reloadTabGrid(title){
	          if ($("#tabs" ).tabs('exists', title)) {
	               $('#tabs').tabs('select' , title);
	             window.top.reload_Abnormal_Monitor.call();
	         }
	     } 
	</script>

</body>
</html>
