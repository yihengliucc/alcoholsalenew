<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/customer/productshow.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/customer/page/pageGroup.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/customer/pageGroup.js"></script>

<div class="lay_1 clearfix contentFirst">
	<div style="width:120px;height:600px;float:left;"></div>
	<div class="indexTabBox">
		<div class="indexTabNav">
			<ul>
				<li class="n1 on">疯狂抢购</li>
				<!-- <li class="n2">热卖推荐</li>
				<li class="n3">猜你喜欢</li>
				<li class="n4">新品上架</li>
				<li class="n5">多买多优惠</li> -->
			</ul>
		</div>
		<div class="indexTabConWrap">
			<div class="indexTabCon" style="display: block;">
				<ul class="clearfix">
				<c:forEach items="${products}" var="product">				
					<li><div class="indexTabPic">
							<a
								href="customershowdetail.action?proid=${product.proid }"
								target="_blank" title="${product.proname }"><img
								src="${pageContext.request.contextPath }/images/product/little_images/${product.image}"
								width="160" height="160" alt="${product.proname}"></a>
						</div>
						<div class="indexTabTit">
							<a
								href="#"
								target="_blank" title="${product.proname }">${product.proname}</a>
						</div>
						<div class="indexTabPrice homegoodPrice">
							<strong goodid="3" class="jxIndex_nowPrice_3">￥${product.normalprice}</strong>
						</div></li>
		</c:forEach>				
				</ul>
				
				<!-------------------------------------------分页----------------------------------------------------------------->
				<div id="pageGro" class="cb">
					<div class="pageUp">上一页</div>
				    <div class="pageList">
				        <ul>
				        	<!-- 获取页数的session，写入html元素供js获取 -->
				        	<input id="pageCount" type="hidden" value="${pageCount }" />
				        	<input id="pageNow" type="hidden" value="${pageNow }" />
				            <li>1</li>
				            <li>2</li>
				            <li>3</li>
				            <li>4</li>
				            <li>5</li>
				        </ul>
				    </div>
				    <div class="pageDown">下一页</div>
				    <div>&nbsp;&nbsp;&nbsp;共 ${pageCount }页</div>
				</div>
				<!-------------------------------------------END 分页----------------------------------------------------------------->

			</div>
		</div>
	</div>
	
	<div style="width:40px;height:600px;float:right;"></div>
	
	<!-- 右边公告栏 -->
	<div class="indexTabRight">
		<div class="indexTabNew">
			<div class="indexTabNewNav">
				<ul>
					<li class="s1 on">公告信息</li>
					<!-- <li class="s2">促销信息</li> -->
				</ul>
			</div>
			<div class="indexTabNewCon">
				<div class="indexTabNewList">
					<!-- 公告信息Start -->
					<ul class="clearfix">
						<li><a href="#"
							target="_blank" title="低度酒水全国配送" rel="nofollow">低度酒水全国配送</a></li>
						<li><a href="#"
							target="_blank" title="社区猜酒谜活动" rel="nofollow">社区猜酒谜活动</a></li>
						<li><a href="#"
							target="_blank" title="低度酒水全国配送" rel="nofollow">低度酒水全国配送</a></li>
						<li><a href="#"
							target="_blank" title="双地址订单公告" rel="nofollow">双地址订单公告</a></li>
						<li><a href="#"
							target="_blank" title="双地址订单公告" rel="nofollow">双地址订单公告</a></li>
						<li><a href="#"
							target="_blank" title="双地址订单公告" rel="nofollow">双地址订单公告</a></li>
					</ul>
					<!-- 公告信息End -->
				</div>
				<div class="indexTabNewList" style="display:none;">
					<!-- 促销信息文字广告Start -->
					<ul class="clearfix">
						
					<!-- 促销信息文字广告End -->
				</div>
			</div>
		</div>
		<div class="indexTuanBox mt10 sliderBox">
			<div class="indexTuanList">
				<ul class="bigUl" style="margin-left: 0px;">
					<li><a
						href="customershowdetail.action?proid=30"
						target="_blank" rel="nofollow"><img
							src="${pageContext.request.contextPath }/images/product/recommend1.png"
							_src="" width="268" height="157"></a></li>
				</ul>
			</div>
		</div>

		<div class="indexTuanBox mt10 sliderBox">
			<div class="indexTuanList">
				<ul class="bigUl" style="margin-left: 0px;">
					<li><a
						href="customershowdetail.action?proid=31"
						target="_blank" rel="nofollow"><img
							src="${pageContext.request.contextPath }/images/product/recommend2.png"
							_src="" width="268" height="157"></a></li>
				</ul>
			</div>
		</div>
		
	</div>
</div>