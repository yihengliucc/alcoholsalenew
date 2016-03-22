<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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


<script type="text/javascript">   
	$(document).ready(function () {

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
			}
		}
	});
	$("#shuliang").text(aa);
	$("#zong1").html((conts).toFixed(2));
	$("#jz1").css("display", "none");
	$("#jz2").css("display", "block");
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
			<div id="main">
				<div id="cart_container" class="cart-container">
					<h4 id="cart-title">
						<span id="cart_goods_count_top">购物车商品总数：<b>2</b></span><span
							class="flag"></span>
					</h4>
					<form id="form_cart" action="goMyOrderUI.action" method="post">
						<ul id="cart_item_label" class="clearfix">
							<li class="c_check"><label> <input class="allselect"
									type="checkbox" checked="checked"> &nbsp;全选
							</label></li>
							<li class="c_pro">&nbsp;</li>
							<li class="c_pro2">商品信息</li>
							<li class="c_price">单价</li>
							<!-- <li class="c_pro3">优惠</li> -->
							<li class="c_num">数量</li>
							<li class="c_sum">小计</li>
							<li class="c_act">操作</li>
						</ul>

						<!---商品加减算总数---->
						<script type="text/javascript">
							$(function () {
								var t = $("#text_box1");
								var price = $("#price1").text();
								$("#add1").click(function () {
									t.val(parseInt(t.val()) + 1)
									setTotal(); GetCount();
								})
								$("#min1").click(function () {
									if(t.val()>0){
										t.val(parseInt(t.val()) - 1)
										setTotal(); GetCount();
									}
								})
								function setTotal() {
									// alert(price);
									$("#total1").html((parseInt(t.val()) * price).toFixed(2));
									$("#newslist-1").val(parseInt(t.val()) * price);
								}
								setTotal();
							})
							</script>

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

								<tbody class="cart-item gwc_tb2">

									<tr class="cart-product last">
										<td class="item-checkout"><input id="newslist-1" type="checkbox"
											value="1" class="can_checkout is_checkout_item"
											name="newslist" checked="checked" data-sellerid="2"
											value="goods_12958_13112"> <input type="hidden"
											name="seller_id" value="2"></td>
										<td><input type="hidden" name="obj_type" value="goods">
											<input type="hidden" name="goods_ident"
											value="goods_12958_13112"> <input type="hidden"
											name="goods_id" value="12958"> <input type="hidden"
											name="min" value="1"> <input type="hidden" name="max"
											value="8878"> <input type="hidden" name="stock"
											value="8878">
											<div class="p-pic">
												<a target="_blank" href="customershowdetail.action">
													<img
													src="${pageContext.request.contextPath }/images/product/detail/pic1_1.jpg"
													alt="53°茅台五星500ml#">
												</a>
											</div></td>
										<td class="item-goodsname">
											<div class="p-title">
												<a target="_blank" href="customershowdetail.action">53°茅台五星500ml#</a>
											</div>
										</td>
										<td class="p-price">
											<p class="price" >￥<i id="price1">269.00</i></p> <del>￥459.00</del>
										</td>

										<td>
											<div class="gw_num">
												<em class="jian" id="min1">-</em> <input id="text_box1" type="text" value="1"
													class="num" /> <em class="add" id="add1">+</em>
											</div>
										</td>
										<td class="p-subtotal tot" id="total1" >￥269.00</td>
										<td class="p-action"><a href="javascript:void(0)"
											class="btn-fav">收藏</a> <i>|</i> <a href="javascript:void(0);"
											class="btn-delete">移除</a></td>
									</tr>
									
									<!---第二件商品加减算总数---->
						<script type="text/javascript">
							$(function () {
								var t = $("#text_box2");
								var price = $("#price2").text();
								$("#add2").click(function () {
									t.val(parseInt(t.val()) + 1)
									setTotal(); GetCount();
								})
								$("#min2").click(function () {
									if(t.val()>0){
										t.val(parseInt(t.val()) - 1)
										setTotal(); GetCount();
									}
								})
								function setTotal() {
									// alert(price);
									$("#total2").html((parseInt(t.val()) * price).toFixed(2));
									$("#newslist-2").val(parseInt(t.val()) * price);
								}
								setTotal();
							})
							</script>

									<!-- 第二件商品 -->
									<tr class="cart-product last">
										<td class="item-checkout"><input id="newslist-2" type="checkbox"
											value="1" class="can_checkout is_checkout_item"
											name="newslist" checked="checked" data-sellerid="2"
											value="goods_12958_13112"> <input type="hidden"
											name="seller_id" value="2"></td>
										<td><input type="hidden" name="obj_type" value="goods">
											<input type="hidden" name="goods_ident"
											value="goods_12958_13112"> <input type="hidden"
											name="goods_id" value="12958"> <input type="hidden"
											name="min" value="1"> <input type="hidden" name="max"
											value="8878"> <input type="hidden" name="stock"
											value="8878">
											<div class="p-pic">
												<a target="_blank" href="customershowdetail.action">
													<img
													src="${pageContext.request.contextPath }/images/product/detail/pic1_1.jpg"
													alt="53°茅台五星500ml#">
												</a>
											</div></td>
										<td class="item-goodsname">
											<div class="p-title">
												<a target="_blank" href="customershowdetail.action">53°茅台五星500ml#</a>
											</div>
										</td>
										<td class="p-price">
											<p class="price" >￥<i id="price2">269.00</i></p> <del>￥459.00</del>
										</td>

										<td>
											<div class="gw_num">
												<em class="jian" id="min2">-</em> <input id="text_box2" type="text" value="1"
													class="num" /> <em class="add" id="add2">+</em>
											</div>
										</td>
										<td class="p-subtotal tot" id="total2" >￥269.00</td>
										<td class="p-action"><a href="javascript:void(0)"
											class="btn-fav">收藏</a> <i>|</i> <a href="javascript:void(0);"
											class="btn-delete">移除</a></td>
									</tr>
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
										//alert(len.length);
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
													<span class="price"><b id="zong1">￥538.00</b></span></li>
											</ul>
										</td>
									</tr>
									<tr>
										<!-- 按钮 -->
										<td colspan="4" class="cart-left"><label> <input
												type="checkbox" name="" class="allselect" checked="checked">
												&nbsp;全选
										</label>&nbsp;&nbsp;&nbsp; <span class="action-clean">删除</span></td>
										<td colspan="4" class="cart-right"><span
											id="cart_goods_count">已选择<b id="shuliang">2</b>件商品
										</span>
											<button rel="_request" data-mask="true" class="action-settle"
												type="submit" id="btn-submit-cart">
												<span>提交订单</span>
											</button></td>
									</tr>
								</tbody>
							</table>
						</div>


					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 引入尾页面 -->
	<jsp:include page="foot.jsp"></jsp:include>

</body>
</html>
