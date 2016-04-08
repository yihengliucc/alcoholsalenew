<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>帮助中心</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/help.css"
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
	<div class="help_main_box">
		<div class="help_left">
			<div class="help_title">
				<p>帮助中心</p>
			</div>
			<div class="help_nav_box">
				<ul>
										
					<li>
						<div class="nav_1ji">
							<p
								style="background-position: 13px -79px; background-repeat: no-repeat;">售后服务</p>
						</div>
						<div class="nav_2ji" style="display: block;">
							<ul>
								<li><a href="javascript:;"
									class="hover">品质保证</a></li>
								<li><a href="javascript:;">退换货政策</a></li>
								<li><a href="javascript:;">退换货流程</a></li>
							</ul>
						</div>
					</li>
					<li>
						<div class="nav_1ji">
							<p>特色服务</p>
						</div>
						<div class="nav_2ji" style="display: none;">
							<ul>
								<li><a target="_blank"
									href="http://jifen.jiuxian.com/club_index.htm">会员俱乐部</a></li>
								<li><a target="_blank"
									href="http://member.jiuxian.com/company.htm">企业客户</a></li>
								<!--<li><a target="_blank" href="http://www.jiuxian.com/info/new_sagent.php">个人代理</a></li>-->
								<!--<li><a target="_blank" href="http://www.jiuxian.com/topic/giftcard/giftcard.html">礼品卡</a></li>-->
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="help_right">
			<div class="content_box">
				<span id="bz_1">品质保证</span>
				<div class="content_text">
					<p>品牌酒网保证所有商品都是通过正规进货渠道购进的放心酒水。品牌酒网为用户制定了优质的售后服务。</p>

					<p>如果您在购买商品后发现质量问题，请与客服中心400-000-0000联系，我们将针对您提出的具体问题，作出合适的处理！</p>

					<p>让您购物放心、省心、舒心！</p>

					<p>以下情况属于商品质量问题：</p>

					<p>酒类质量问题</p>

					<p>(1) 酒品酒标，瓶盖，瓶塞及酒瓶爆裂等外包装损坏；</p>

					<p>(2) 酒品出现酒液外流现象；</p>

					<p>(3) 酒品超过产品出厂指定保质期；</p>

					<p>(4) 酒品不符合规定标准、行业标准的；</p>

					<p>(5) 酒品中发现以假充真、以次充好的。</p>
					&nbsp;

					<p class="fw">保障承诺:</p>

					<p>每一位在品牌酒网购物的顾客都可以享有"假一罚五"的权利。</p>

					<p>注：如果您认为购买的商品是假货，并能提供质检机构的证明文件，经确认后，在全额返还商品金额的同时，
						再以礼券形式返还五倍的商品金额。</p>
				</div>
			</div>

			<div class="content_box">
				<span id="bz_2">退换货政策</span>

				<div class="content_text">
					<p class="fw">退换货承诺</p>

					<p>品牌酒网承诺：自您签收商品之日起7日内，为您提供退换货服务！</p>
					&nbsp;

					<p class="fw">退换货办理方式</p>

					<p>如签收后酒水有破、漏、损情况；请将订单号及问题酒水照片发邮件至xxxx ；</p>

					<p>除酒水破、漏、损外的其它问题：请将单号及问题酒水图片（包装外观、打开包装打包格局）发邮件至xxxxx.com；</p>

					<p>（客服24小时内联系为您办理，请保持手机畅通）</p>

					<p>如有疑问 请拨打品牌酒网客服中心电话400-000-000人工咨询。</p>
					&nbsp;

					<p class="fw">退换货须知</p>

					<p>1.客户签收时应当场开箱验货，核对酒品种类、数量、规格、赠品、金额是否与订单一致，确认无误后再签收，若有问题，请及时拨打品牌酒网客服热线400000000沟通解决。</p>

					<p>2.如酒水有质量或破损渗漏等问题，可免运费退换货一次。如商品无任何问题，自实际收到货物日期起7日内，只要未使用且包装完好无损，可全额退货，运费需要您自行承担。</p>

					<p>3.客户办理退换货业务时，要求退换酒品包装完整。要求退换酒品无外包装时，需满足酒瓶未开启；酒品所附赠品和发票齐全且保存完好，批号相符。如丢失发票的，不予办理退换货。</p>

					<p>4.我司不接受用户回寄酒水，如您的酒品存在商品质量问题并且所在地满足品牌酒网配送条件时，将由配送人员上门服务，收回酒品、附属物品并填写退换货登记卡；若不满足派送条件，需您亲自将酒品、附属物品和退换货登记卡送至指定地点。</p>

					<p>5.如果您在使用时对商品质量表示置疑，您可出具相关书面鉴定，我们会按法律规定予以处理。</p>
				</div>
			</div>

			<div class="content_box">
				<span id="bz_3">退换货流程</span>

				<div class="pict_list">
					<p>
						<!-- <img src="xx"
							style="width: 742px; height: 128px;"> -->
					</p>
				</div>
			</div>
		</div>

		<div class="clear">&nbsp;</div>
	</div>
	</div>>


	<!-- 引入尾页面 -->
	<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>
