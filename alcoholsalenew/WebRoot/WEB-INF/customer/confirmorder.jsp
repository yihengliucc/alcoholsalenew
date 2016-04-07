<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 引入jstl标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>确认订单</title>

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/productshow.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/confirmorder.css"
	type="text/css" />

<!-- JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/mycart/jquery.1.4.2-min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/confirmorder.js"></script>

</head>

<body>

	<!-- 引入头页面 -->
	<jsp:include page="head.jsp"></jsp:include>

	<div class="cartWrap">
		<form id="orderFrom" action="orderAdd.action" method="post">
		<div class="orderInfo">
			<!-- 收货地址begin -->
			<div class="orderItemsBox orderAddress">
				<div class="itemsTitle">
					<b>收货地址</b><a href="javascript:;" class="addNewAdd" style="">使用新地址</a>
				</div>
				<div class="itemsWrap">
					<ul class="addressList clearfix">
						<c:forEach var="address" items="${addresses }" varStatus="stat">
							<c:if test="${stat.first }">
								<input id="checkAddressId" type="hidden" name="checkAddressId" value="${address.addressid }"/>
								<li class="item on" einv="false" onclick="checked(this);"><input
									id="addressid" type="hidden" value="${address.addressid }"
									addressname="${address.address }" regionid="1967">
									<div class="address-tit">
										<b>${address.name }</b><span>${address.phone }</span>
									</div>
									<div class="address-con">${address.address }</div>
									<div class="address-ope">
										<a class="addAlter" href="javascript:;" _di="107793439">修改</a><a
											class="addDelete" href="javascript:;" _di="107793439">删除</a>
									</div>
									<c:if test="${address.isdefault == '1' }">
										<div class="defaultBtn" _di="107793439">默认地址</div>
									</c:if>
									<c:if test="${address.isdefault != '1' }">
										<div class="defaultBtn" _di="107793439"
										onclick="setDefault(this)">设为默认地址</div>
									</c:if>
										
									<div class="addDefault oIcon"></div></li>
							</c:if>
							<c:if test="${!stat.first }">
								<li class="item" einv="false" onclick="checked(this);"><input
									id="addressid" type="hidden" value="${address.addressid }"
									addressname="${address.address }" regionid="1967">
									<div class="address-tit">
										<b>${address.name }</b><span>${address.phone }</span>
									</div>
									<div class="address-con">${address.address }</div>
									<div class="address-ope">
										<a class="addAlter" href="javascript:;" _di="107793439">修改</a><a
											class="addDelete" href="javascript:;" _di="107793439">删除</a>
									</div>
									<div class="defaultBtn" _di="107793439"
										onclick="setDefault(this)">设为默认地址</div>
									<div class="addDefault oIcon"></div></li>
							</c:if>
							
						</c:forEach>
						<li class="add"><div class="address-add">
								<i class="oIcon"></i><span>增加新地址</span>
							</div></li>
					</ul>

					<div class="addOpenBox">
						<span class="addressOpen" style="display: none;"><b>展开</b><i
							class="oIcon"></i></span>
					</div>
				</div>
			</div>
			<!-- 收货地址end -->
			<!-- 支付方式begin -->
			<div class="orderItemsBox orderPayment">
				<div class="itemsTitle">
					<b>支付方式</b>
				</div>
				<div class="itemsWrap">
					<ul class="paymentList">
						<!-- <li><label><input name="sel_pay" type="radio" value="1" _ind="0" id="huodaofukuan"><span class="listTitle">货到付款</span></label><span class="listPro">送货上门后再付款，使用现金或刷银行卡，免手续费。</span><em class="conPro03" style="display: none;">所选商品不支持货到付款！</em></li>
		         -->
						<li><label><input name="sel_pay" type="radio"
								value="2" _ind="1" checked="checked" class="zhifu" id="zhifu"><span
								class="listTitle">在线支付</span></label><span class="listPro">支持多个支付平台。</span></li>
						<li id="aliBill" style="display:none"><label><input
								name="sel_pay" type="radio" value="4" id="aliBillPay"><span
								class="listTitle">支付宝扫码支付</span></label><span class="listPro">送货上门后支付宝钱包扫码支付。</span><a
							target="_blank"
							href="http://special.jiuxian.com/topic/zfbhdfk/pay.html">如何使用？</a></li>
					</ul>
					<input id="payid" type="hidden" value="101">
				</div>
			</div>
			<!-- 支付方式end -->
			<!-- 商品信息begin -->
			<div class="orderItemsBox orderCommodity">
				<div class="itemsTitle">
					<b>商品信息</b><a href="goCart.action"
						onclick="ga('send','event','cart_Back','link','BacktoCart')">返回购物车</a>
				</div>
				<div></div>
				<div class="itemsWrap">
					<table class="comTable">
						<thead>
							<tr>
								<th width="460">商品名称</th>
								<th width="140">酒仙价</th>
								<th width="140">购买数量</th>
								<th width="140">库存</th>
								<th width="138">小计</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items = "${cartProducts }" var="cartProduct">
						<c:if test="${cartProduct.value.isChecked == '1' }" >
							<tr>
								<td width="542">
									<div class="productImg">
										<a href="customershowdetail.action"
											target="_blank"> <img
											src="${pageContext.request.contextPath }/images/product/little_images/${cartProduct.value.product.image}"
											alt="${cartProduct.value.product.proname}" width="52" height="52">
										</a>
									</div>
									<div class="productName">
										<p class="oneName">
											<a href="customershowdetail.action"
												target="_blank" title="${cartProduct.value.product.proname}">${cartProduct.value.product.proname}</a>
										</p>
									</div>
								</td>
								<td width="165" rowspan="1">
									<div class="productPriM">￥${cartProduct.value.product.memberprice}</div>
								</td>
								<td width="130" rowspan="1">
									<div class="productNum">
										<span>${cartProduct.value.quantity}</span>
									</div>
								</td>
								<td width="140" rowspan="1">
									<div class="com productStock">有货</div>
								</td>
								<td width="150" rowspan="1" class="bb">
									<div class="productPri">￥${cartProduct.value.totalPrice}</div>
								</td>
							</tr>
						</c:if>
						</c:forEach>
						
						</tbody>
					</table>
				</div>
			</div>
			<!-- 商品信息end -->
			<!-- 结算信息begin -->
			<div class="orderItemsBox orderAccount">
				<div class="itemsTitle">
					<b>结算信息</b>
				</div>
				<div class="itemsWrap">
					<div class="settlementList">
						<ul class="accountInfo">


							<li id="leaveComBox">
								<div class="settlementWrap">
									<div class="settlementTitle" id="leaveComments">
										<i class="oIcon off"></i><span>留言信息</span>
									</div>
								</div>
								<div class="invoiceWrap" id="liuyanxinxi"
									style="display: block;">
									<div class="invoiceCon invCon03">
										<div class="paymentWrapLam">
											<div class="psValBg">
												<input id="order_PS_VAL" name="order_PS_VAL" maxlength="45"
													class="form-8">
											</div>
											<em class="conPro01" style="display: none;">留言含有非法字符</em><em>限45个字</em>
										</div>
									</div>
								</div>
							</li>

							<li class="bb">
								<div class="comTotalBox">
									<p>
										<span><b id="productcount">${cartCatalog }</b>件商品，商品金额：</span><span
											class="comTotalSum" id="zje_i">￥${cartTotalPrice }</span>
									</p>
									<p id="yf_div" style="">
										<span>运费：</span><span class="comTotalSum" id="yf_i">￥0.00</span>
									</p>
									<p id="yh_div" style="display:none">
										<span style="color:#cc0000">优惠：</span><span
											class="comTotalSum" id="yh_i"></span>
									</p>
									<p id="yhq_div" style="display:none">
										<span>优惠券：</span><span class="comTotalSum" id="yhq_i">-￥15.00</span>
									</p>
									<p id="ye_div" style="display:none">
										<span>余额：</span><span class="comTotalSum" id="ye_i"></span>
									</p>
									<p id="fx_div" style="display:none">
										<span>返现：</span><span class="comTotalSum" id="fx_i"></span>
									</p>
									<p id="lpk_div" style="display:none">
										<span>礼品卡：</span><span class="comTotalSum" id="lpk_i"></span>
									</p>
								</div>
							</li>
						</ul>
						<div class="step_offset"></div>
						<div class="orderTotalFixed" id="orderTotal">
							<div class="orderTotalCon">

								<!-- <div class="subBtnBox">
									<span class="subBtn"><i class="oIcon"></i></span>
									<div class="submit-pro"></div>
								</div> -->
								<button rel="_request" data-mask="true" class="action-settle" type="submit" id="btn-submit-order">
												<span>提交订单</span>
											</button>
								<div class="toPay">
									<strong>应付总金额：</strong><b id="payPrice">￥${cartTotalPrice }</b>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
			<!-- 结算信息end -->

			<!--遮罩层start-->
			<div class="popMask" style="display: none;"></div>
			<!--遮罩层end-->

			<!-- 新增地址begin -->
			<div class="addresPopBox" style="display: none;">
				<div class="addresPop">
					<div class="addPopTit">
						<b></b><strong>新增地址</strong><i class="popClose oIcon"></i>
					</div>
					<div class="addPopCon">
						<ul>
							<li><span class="addTit"><i class="xing">*</i>收货人：</span><input
								name="" type="text" class="addFrom f1 receName" value=""
								id="new_username" a="0" maxlength="10"><input name=""
								type="hidden" id="ID" value=""><em class="addPro"
								id="alertstyle1">请填写收货人姓名</em></li>
							<li><span class="addTit"><i class="xing">*</i>选择地区：</span> <select
								name="new_province" id="new_province"
								onchange="getCity(this.value)">
									<option value="">请选择&nbsp;&nbsp;&nbsp;</option>
									<!-- <option value="2">北京</option><option value="3">安徽省</option><option value="4">福建省</option><option value="5">甘肃省</option><option value="6">广东省</option><option value="7">广西省</option><option value="8">贵州省</option><option value="9">海南省</option><option value="10">河北省</option><option value="11">河南省</option><option value="12">黑龙江省</option><option value="13">湖北省</option><option value="14">湖南省</option><option value="15">吉林省</option><option value="16">江苏省</option><option value="17">江西省</option><option value="18">辽宁省</option><option value="19">内蒙古省</option><option value="20">宁夏</option><option value="21">青海省</option><option value="22">山东省</option><option value="23">山西省</option><option value="24">陕西省</option><option value="25">上海</option><option value="26">四川省</option><option value="27">天津</option><option value="28">西藏</option><option value="29">新疆</option><option value="30">云南省</option><option value="31">浙江省</option><option value="32">重庆</option>
			     -->
							</select> <select name="new_city" id="new_city" class="city"
								onchange="getTown(this.value)">
									<option value="">请选择&nbsp;</option>
									<!-- <option value="52">北京市</option> -->
							</select> <select name="new_county" id="new_county" class="country">
									<option value="">请选择</option>
									<!-- <option value="500">东城区</option><option value="501">西城区</option><option value="502">海淀区</option><option value="503">朝阳区</option><option value="504">崇文区</option><option value="505">宣武区</option><option value="506">丰台区</option><option value="507">石景山区</option><option value="508">房山区</option><option value="509">门头沟区</option><option value="510">通州区</option><option value="511">顺义区</option><option value="512">昌平区</option><option value="513">怀柔区</option><option value="514">平谷区</option><option value="515">大兴区</option><option value="516">密云县</option><option value="517">延庆县</option><option value="3451">其它区</option> -->
							</select><em class="addPro" id="alertstyle2">请输选择地区</em></li>
							<li><span class="addTit"><i class="xing">*</i>详细地址：</span><input
								class="addFrom f2 detailAdd" type="text" maxlength="50"
								id="new_detail"><em class="addPro" id="alertstyle3">请填写收货人详细地址</em></li>
							<li><span class="addTit"><i class="xing">*</i>手机：</span><input
								class="addFrom f1 recePhone" type="text" id="new_phone"
								maxlength="11"> <!-- <span class="addTit2">或固定电话：</span><input class="addFrom f1 receTle" type="text" id="new_tele"><span class="addTit3">格式：区号-电话</span><em class="addPro" id="alertstyle5">请填写手机号码</em> --></li>
							<li class="btnBox"><a href="javascript:;" class="addSubmit"
								onclick="addAddress()">确定</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 新增地址end -->
		</div>
	</form>
	</div>
	<!-- 引入尾页面 -->
	<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>
