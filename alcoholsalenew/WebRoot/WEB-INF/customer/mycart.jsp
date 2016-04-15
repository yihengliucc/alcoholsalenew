<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 引入jstl标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>我的购物车</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/productshow.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/mycart.css"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/mycart/jquery.1.4.2-min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/mycart/Calculation.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/mycart/mycart.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquerysession.js"></script>	

<script type="text/javascript">   
	$(document).ready(function () {
	/**进入页面就计算一次商品总价**/
	GetCount();
	
	/**判断购物车是否为空，空显示空页面，不空显示商品页面**/
	var a="${sessionScope.cartQuantity}";
	if (a == null || a == 0 ) {
		$("#main").hide();
		$("#cartEmptyBox").show();
	} else {
		$("#main").show();
		$("#cartEmptyBox").hide();
	}
	
	$(".gwc_tb2 input[name=newslist]").each(function () {  // 所有商品项初始化一下value值
			setTotal($(this));
			});

	//jquery特效制作复选框全选反选取消(无插件)
	// 全选        
	$(".allselect").click(function () {
		
		if($(this).attr("checked")){
			$(".gwc_tb2 input[name=newslist]").each(function () {
				$(this).attr("checked", true);
				// $(this).next().css({ "background-color": "#3366cc", "color": "#ffffff" });
			});
			
			GetCount();
		}
		else
   		{
			$(".gwc_tb2 input[name=newslist]").each(function () {
				if ($(this).attr("checked")) {
					$(this).attr("checked", false);
					//$(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
				} else {
					$(this).attr("checked", true);
					//$(this).next().css({ "background-color": "#3366cc", "color": "#000000" });
				} 
			});
			GetCount();
    
   		}
		
	});

	//反选
	$("#invert").click(function () {
		$(".gwc_tb2 input[name=newslist]").each(function () {
			if ($(this).attr("checked")) {
				$(this).attr("checked", false);
				//$(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
			} else {
				$(this).attr("checked", true);
				//$(this).next().css({ "background-color": "#3366cc", "color": "#000000" });
			} 
		});
		GetCount();
	});

	//取消
	$("#cancel").click(function () {
		$(".gwc_tb2 input[name=newslist]").each(function () {
			$(this).attr("checked", false);
			// $(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
		});
		GetCount();
	});

	// 所有复选(:checkbox)框点击事件
	$(".gwc_tb2 input[name=newslist]").click(function () {
		if ($(this).attr("checked")) {
			//$(this).next().css({ "background-color": "#3366cc", "color": "#ffffff" });
		} else {
			// $(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
		}
	});

	// 输出
	$(".gwc_tb2 input[name=newslist]").click(function () {
		// $("#total2").html() = GetCount($(this));
		$(".gwc_tb2 input[name=newslist]").each(function () {  // 所有商品项初始化一下value值
			setTotal($(this));
		});
		
		GetCount();
		// alert("ok");
	});
	
});
//******************
function GetCount() {
	var conts = 0;
	var aa = 0;
	
	
	$(".gwc_tb2 input[name=newslist]").each(function () {
		if ($(this).attr("checked")) {
			for (var i = 0; i < $(this).length; i++) {
				conts += parseInt($(this).val());
				aa += 1;
				// 设置session中选择商品的isChecked字段值为1
				//alert($(this).parent().find("#pro_id:first").val());
				$.ajax({
					type: 'POST',
					url: "modCart.action",
					dataType: "json",
					data: {
						modMethod:"checked",
						proid: $(this).parent().find("#pro_id:first").val(),
					},
					success:function(msg){
					},
					error: function(msg){
					}
				});
				
			}
		}
		
	});
	$("#shuliang").text(aa);
	$("#zong1").html((conts).toFixed(2));
	$("#jz1").css("display", "none");
	$("#jz2").css("display", "block");
	if (aa == 0) {
		$("button").attr("disabled","disabled");
		$("button").attr("style","background:gray");
	} else {
		$("button").removeAttr("disabled");
		$("button").removeAttr("style");
	}
}
function setTotal(obj) {
	var subTotal = $(obj).parent().parent().find(".sub_total").text();
	$(obj).val(subTotal);
}
	
    </script>

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
		
			<!-- 购物车有物品 -->
			<div id="main" style="display:none;">
				<div id="cart_container" class="cart-container">
					<h4 id="cart-title">
						<span id="cart_goods_count_top">购物车商品总数：<b id="b_cart_goods_count_top">${cartQuantity }</b></span><span
							class="flag"></span>
					</h4>
					<form id="form_cart" action="confirmOrder.action" method="post">
						<ul id="cart_item_label" class="clearfix">
							<li class="c_check"><label> <input class="allselect"
									type="checkbox"> &nbsp;全选
							</label></li>
							<li class="c_pro">&nbsp;</li>
							<li class="c_pro2">商品信息</li>
							<li class="c_price">单价</li>
							<!-- <li class="c_pro3">优惠</li> -->
							<li class="c_num">数量</li>
							<li class="c_sum">小计</li>
							<li class="c_act">操作</li>
						</ul>

						

						<div id="cart_main_wrap">

							<table class="cart-main item" cellpadding="0" cellspacing="0"
								width="100%">
								<colgroup>
									<col class="c_check">
									<col class="c_pro">
									<col class="c_pro2">
									<col class="c_price">
									<col class="c_num">
									<col class="c_sum">
									<col class="c_act">
								</colgroup>
								<thead>
									<tr class="seller_info">
										<th colspan="7">
											<!-- <input type="checkbox" name="is_checkout_seller" class="is_checkout_item seller" checked="checked">
											&nbsp; <span class="name"> 店铺：<a href="/index.php/seller-2.html" title="四川壹玖壹玖酒类供应链管理股份有限公司">四川壹玖壹玖酒类供应链管理股份有限公司</a> </span></th>
											 -->
									</tr>
								</thead>

								<tbody class="cart-item gwc_tb2" >

									
									
									<script type="text/javascript">
										
										// 增加减少数量
										$(document).ready(function() {
											var b_cart_goods_count_top = $("#b_cart_goods_count_top").text();
											
											//加的效果
											$(".add").click(function() {
												var n = $(this).prev().val();
												var num = parseInt(n) + 1;
												if (num == 0) {
													return;
												}
												$(this).prev().val(num);
												b_cart_goods_count_top = parseInt(b_cart_goods_count_top) + 1;
												$("#b_cart_goods_count_top").text(b_cart_goods_count_top);	// 更改顶部购物车商品总数
												$("#shopping-amount").text(b_cart_goods_count_top);			// 更改头部图标商品总数
												//alert($(this).parent().parent().parent().find("#pro_id:first").val());
												setTotal($(this),num); 
												GetCount();
												addCart($(this));   // 改变session中的值
												
											});
											//减的效果
											$(".min").click(function() {
												var n = $(this).next().val();
												var num = parseInt(n) - 1;
												if (num == 0) {
													return
												}
												$(this).next().val(num);
												b_cart_goods_count_top = parseInt(b_cart_goods_count_top) - 1;
												$("#b_cart_goods_count_top").text(b_cart_goods_count_top);	// 更改顶部购物车商品总数
												$("#shopping-amount").text(b_cart_goods_count_top);     	// 更改头部图标商品总数
												setTotal($(this),num); 
												GetCount();
												reduceCart($(this));   // 改变session中的值
												
											});
											
												/****收藏、删除操作****/
											$(".deletePro").click(function(){
												
												var proquantity = $(this).parent().parent().find(".text_box").val();
												b_cart_goods_count_top = parseInt(b_cart_goods_count_top) - proquantity;
												$("#b_cart_goods_count_top").text(b_cart_goods_count_top);	// 更改顶部购物车商品总数
												if (b_cart_goods_count_top == 0){
													$("#shopping-amount").parent().remove();
													
													// 判断商品是否为0，为0显示购物车空页面
													$("#main").hide();
													$("#cartEmptyBox").show();
												} else {
													$("#shopping-amount").text(b_cart_goods_count_top);     	// 更改头部图标商品总数
												}
												// 页面移除商品
												$(this).parent().parent().remove();
												GetCount();
												
												// 到session中去删除
												deleteCart($(this));
											
											});
											
											/******点击提交订单按钮*******/
											$(".action-settle").click(function(){
												// 判断用户是否登录
												var user = "${sessionScope.user}";
												if (user == null || user == "" ) {
													$(".popMask").show();
													$(".loginBox").show();
													return false;  // 阻止表单提交	
												} else {
													//alert("not null");
												}
											});
											
											/***点击关闭按钮*******/
											$(".close").click(function(){
												$(".loginBox").hide();
												$(".popMask").hide();
											});
								
											
											function setTotal(obj,num) {
												var price = $(obj).parent().find("input:first").val();
												$(obj).parent().parent().parent().find(".sub_total").html((num * price).toFixed(2));
												//$(".sub_total").html((num * price).toFixed(2));
												//$(".newslist").val(parseInt(t.val()) * price);
												$(obj).parent().parent().parent().find(".newslist:first").val(num * price);
											}
										})
									</script>
									<c:forEach items = "${cartProducts }" var="cartProduct">
																			
										<tr class="cart-product last">
											<td class="item-checkout"><input class="newslist" id="newslist" type="checkbox"
												value="1" class="can_checkout is_checkout_item"
												name="newslist"  data-sellerid="2"
												value="goods_12958_13112"> <input type="hidden"
												name="seller_id" value="2">
												<input type="hidden" id="pro_id" value="${cartProduct.key }">
												</td>
											<td>
												<!-- 商品id -->
												<input type="hidden" id="pro_id" value="${cartProduct.key }">
												<input type="hidden" name="obj_type" value="goods">
												<input type="hidden" name="goods_ident"
												value="goods_12958_13112"> <input type="hidden"
												name="goods_id" value="12958"> <input type="hidden"
												name="min" value="1"> <input type="hidden" name="max"
												value="8878"> <input type="hidden" name="stock"
												value="8878">
												<div class="p-pic">
													<a target="_blank" href="customershowdetail.action">
														<img
														src="${pageContext.request.contextPath }/images/product/little_images/${cartProduct.value.product.image}"
														alt="${cartProduct.value.product.proname}">
													</a>
												</div></td>
											<td class="item-goodsname">
												<div class="p-title">
													<a target="_blank" href="customershowdetail.action">${cartProduct.value.product.proname}</a>
												</div>
											</td>
											<td class="p-price">
												<p class="price" >￥<i id="price">${cartProduct.value.product.memberprice}</i></p> <del>￥${cartProduct.value.product.normalprice}</del>
											</td>
	
											<td>
												<div class="gw_num">
													<!-- 隐藏商品价格，方便jquery获取值 -->
													<input type="hidden" value="${cartProduct.value.product.memberprice}" />
													<em class="min" id="min">-</em> <input class="text_box" id="text_box" type="text" value="${cartProduct.value.quantity}"
														class="num" /> <em class="add" id="add">+</em>
												</div>
											</td>
											<td class="p-subtotal tot sub_total" id="total" >${cartProduct.value.totalPrice}</td>
											<td class="p-action"><a href="javascript:void(0)"
												class="btn-fav">收藏</a> <i>|</i> <a class="deletePro" href="javascript:void(0);"
												class="btn-delete" >移除</a></td>
										</tr>
									</c:forEach>
									
								</tbody>

								<tfoot>
									<tr>
										<td colspan="7">
											<div class="seller_order_gift">
												<ul class="content"></ul>
											</div>
											<div class="seller_order_promotion" style="display:block">
												<ul class="content">
													<li><b>[全场满39元包邮！]</b>免运费</li>
												</ul>
											</div>
										</td>
									</tr>

								</tfoot>
							</table>
							
							

							
							
							<!---总数---->
							<script type="text/javascript">
								$(function () {
									$(".quanxun").click(function () {
										setTotal();
										//alert($(lens[0]).text());
									});
									function setTotal() {
										var len = $(".tot");
										var num = 0;
										for (var i = 0; i < len.length; i++) {
											num = parseInt(num) + parseInt($(len[i]).text());
							
										}
										alert(len.length);
										$("#zong1").text(parseInt(num).toFixed(2));
										$("#shuliang").text(len.length);
									}
									//setTotal();
								})
							</script>
							
							<table id="cart-total" width="100%" class="cart-main"
								cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td colspan="4">
											<div id="unused_promotion" class="unused-promotion"
												style="display:none;">
												<h3>
													<a href="javascript:void(0);"
														class="btn-collapse action-toggle">-</a>您还未享受到的优惠
												</h3>
												<ul class="content"></ul>
											</div>
										</td>
										<!-- 订单价格 -->
										<td colspan="4" class="order-price" id="order_price">
											<ul>

												<li class="total"><span class="label"><em>合计(不含运费)：</em></span>
													<span class="price"><b id="zong1">￥${cartTotalPrice }</b></span></li>
											</ul>
										</td>
									</tr>
									<tr>
										<!-- 按钮 -->
										<td colspan="4" class="cart-left"><label> <input
												type="checkbox" name="" class="allselect">
												&nbsp;全选
										</label>&nbsp;&nbsp;&nbsp; <span class="action-clean">删除</span></td>
										<td colspan="4" class="cart-right"><span
											id="cart_goods_count">已选择<b id="shuliang">${cartCatalog }</b>件商品
										</span>
											<button rel="_request" data-mask="true" class="action-settle"
												type="submit" id="btn-submit-cart">
												<span>去结算</span>
											</button></td>
									</tr>
								</tbody>
							</table>
						</div>


					</form>
				</div>
			</div>
			
			<!-- 购物车为空 -->
			<div id="cartEmptyBox" style="display:none;">
				<div class="cartEmptyCon">
					<div class="empTit">您的购物车中没有商品，请先去挑选心爱的商品吧！<i class="cartIcon"></i></div>
				</div>
			</div>
			
			<!--遮罩层start-->
			<div class="popMask" style="display: none;"></div>
			<!--遮罩层end-->
			
			<!-- 弹窗 登录 -->
			<div class="loginBox" style="display: none;">
				<div class="loginCon">
					<div class="loginTitle">
						<i class="cartIcon close"></i>
						<ul>
							<li class="cur">登录</li>
							<!-- <li class="">注册</li> -->
						</ul>
					</div>
						<div class="loginMain">
									<div class="logTab tab-1 addTab" style="display: block;">
									<form id="loginform" method="post" action="login.action">
										<div class="loginType">
											<div class="loginItem userNameItem">
												<div class="filter">
													<i class="mark cartIcon"></i>
													
													<i class="markdel cartIcon" style="display: none;"></i><i class="cartIcon status wrong"></i>
												</div>
												<input type="text" class="form01" id="username" placeholder="请输入用户名">
												
											</div>
											
											<div class="loginItem passWordItem">
												<div class="filter">
													<i class="mark cartIcon"></i>
												</div>
												<input class="form01" id="password" type="password" name="password" maxlength="20" autocomplete="off" onpaste="return false" placeholder="请输入密码">
											</div>
											<div class="loginItem yzmItem" id="validcaptcha" style="display:none">
												<div class="filter">
													<i class="mark cartIcon"></i>
													<p class="tip">验证码</p>
													<img class="yzm" id="captchaImage" src="http://public.jiuxian.com/public/captchaimg.htm?timestamp1459313932027">
												</div>
												<input id="verification" class="form01" type="text" name="j_captcha" size="8" maxlength="5" autocomplete="off"> <a class="refresh" id="_captchaImage" href="javascript:void(0)"><i class="cartIcon"></i></a>
												<div class="mistakeTip">请输入验证码</div>
											</div>
											<div class="moreChoice clearfix">
												<div class="auto">
													<input type="checkbox" id="loginAuto" value="yes"><label for="loginAuto">自动登录</label>
												</div>
												<a href="https://login.jiuxian.com/newrecover_pwd.htm" class="forgetPwd">忘记密码</a>
											</div>
											<div class="loginBtn">
												<input type="submit" value="登&nbsp;&nbsp;录" id="loginBtn">
											</div>
						
											<div class="cooperate" style="display:none">
												<p>使用合作账号登录</p>
												<div class="cooperateWay clearfix">
													<a target="_self" _href="http://www.jiuxian.com/union/qq.htm" class="qq" href="http://www.jiuxian.com/union/qq.htm?from=http://cart.jiuxian.com/order/confirm.htm">
														<i class="cartIcon"></i>
													</a> 
													<a target="_self" _href="http://www.jiuxian.com/union/sina_login.htm" class="sina" href="http://www.jiuxian.com/union/sina_login.htm?from=http://cart.jiuxian.com/order/confirm.htm">
														<i class="cartIcon"></i>
													</a>
													<a target="_self" _href="http://www.jiuxian.com/union/alipay_login.htm" class="aliPay" href="http://www.jiuxian.com/union/alipay_login.htm?from=http://cart.jiuxian.com/order/confirm.htm">
														<i class="cartIcon"></i>
													</a>
													<a target="_self" _href="http://www.jiuxian.com/union/baidu_login.htm" class="baidu" href="http://www.jiuxian.com/union/baidu_login.htm?from=http://cart.jiuxian.com/order/confirm.htm">
														<i class="cartIcon"></i>
													</a>
												</div>
											</div>
										</div>
										<input type="hidden" id="exponent" value="010001">
										<input type="hidden" id="modulus" value="0096cb0ce0a468399c2400e8021b6be247a8fe0e37f8f8c310e75491d4fabd6cb2b4dcf49c4ef45c50a8d2adb2833930f844db0864ffa0ca4cb4225870cca85ac01be89db2807ec12fa95e42c59bb0dbf17d04db4fe609123105d2a8d4ffa86708bbd738d002eeec6643f6c85679fe23ad28225573b0669356ef2f7c8f73ce58c7">
										<input type="hidden" id="um" name="um">
										<input type="hidden" id="pwd" name="pwd"> 
										<input type="hidden" id="remember" name="remember">
										<input type="hidden" id="isToSubmit" name="isToSubmit" value="false">
									</form>
									</div>
					</div>
				</div>
			</div>
		
		</div>
	</div>

	<!-- 引入尾页面 -->
	<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>
