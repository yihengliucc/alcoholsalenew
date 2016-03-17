<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>购品牌酒，就上品牌酒网！</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/productdetail.css"
	type="text/css" />
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/comm.css" type="text/css" /> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/productshow.css"
	type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/showdetail/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/showdetail/jquery-1.2.6.pack.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/showdetail/base.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/showdetail/js_z.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/showdetail/lib.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/showdetail/zzsc.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/customer/thems.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/customer/reset.css"/>
	 --%>
<script type="text/javascript">
    $(function(){			
       $(".jqzoom").jqueryzoom({
            xzoom:400,
            yzoom:384,
            offset:10,
            position:"right",
            preload:1,
            lens:1
        });
        $("#spec-list").jdMarquee({
            deriction:"left",
            width:452,
            height:120,
            step:2,
            speed:4,
            delay:10,
            control:true,
            _front:"#spec-right",
            _back:"#spec-left"
        });
        $("#spec-list img").bind("mouseover",function(){
            var src=$(this).attr("src");
            $("#spec-n1 img").eq(0).attr({
                src:src.replace("\/n5\/","\/n1\/"),
                jqimg:src.replace("\/n5\/","\/n0\/")
            });
            $(this).css({
                "border":"1px solid #E90E22",
            });
        }).bind("mouseout",function(){
            $(this).css({
                "border":"1px solid #aaa",
            });
        });				
    })
    
    // 增加减少数量
    $(document).ready(function(){
	//加的效果
	$(".add").click(function(){
		var n=$(this).prev().val();
		var num=parseInt(n)+1;
		if(num==0){ return;}
		$(this).prev().val(num);
	});
	//减的效果
	$(".jian").click(function(){
			var n=$(this).next().val();
			var num=parseInt(n)-1;
			if(num==0){ return}
			$(this).next().val(num);
		});
	})
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
	<div class="main">
		<div class="main2">
			<div class="detail-guide">
				<strong> <a
					href="${pageContext.request.contextPath }/index.jsp" target="_self">首页</a>
				</strong> &gt; <span class="det-cur">53°茅台五星500ml</span>
			</div>

			<!-- 商品详情  -->
			<div class="pro_d">
				<div class="pro_da clearfix">
					<div class="pro_dal">
						<div id="preview">
							<div class="jqzoom" id="spec-n1" onclick="">
								<img height="384"
									src="${pageContext.request.contextPath }/images/product/detail/pic1_1.jpg"
									jqimg="${pageContext.request.contextPath }/images/product/detail/pic1_1.jpg"
									width="452" alt="">
							</div>
							<div id="spec-n5">
								<div id="spec-list">
									<div
										style="position:relative;overflow:hidden;z-index:1;width:452px;height:120px;">
										<ul class="list-h"
											style="width: 459px; overflow: hidden; position: absolute; left: 0px; top: 0px; margin-top: 0px; margin-left: 459px;">
											<li><img
												src="${pageContext.request.contextPath }/images/product/detail/pic1_1.jpg"></li>
											<li><img
												src="${pageContext.request.contextPath }/images/product/detail/pic1_2.jpg"></li>
											<li><img
												src="${pageContext.request.contextPath }/images/product/detail/pic1_3.jpg"></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 左侧确定购买部分 -->
					<div class="pro_dar">
						<h1>53°茅台五星500ml</h1>
						<!--   <table cellpadding="0" cellspacing="0">
		                  <tbody><tr>
		                    <td>货号：HC0008131</td>
		                    <td>18K金重：2.36g</td>
		                    <td>PT金重：3.36g</td>
		                  </tr>
		                  <tr>
		                    <td>主石：0.195ct</td>
		                    <td>副石：无副石</td>
		                    <td>&nbsp;</td>
		                  </tr>
		                </tbody></table>
		                -->

						<div style="margin-top:20px">
							<p class="pri">
								价&nbsp;&nbsp;&nbsp;&nbsp;格：<s style="padding-left:5px;">￥899.00</s>
							</p>
						</div>

						<div class="price">
							促销价：<em style="padding-left:5px;"><font
								style="font-size:15px;font-style:normal;font-family:'微软雅黑';">￥</font>
								868.00</em>
						</div>
						
						<!-- 数量 -->
						<div class="count">
							<span style="padding-right:5px;">数&nbsp;&nbsp;&nbsp;&nbsp;量：</span>
							<div class="gw_num" >
								
								<em class="jian">-</em>
								<input type="text" value="1" class="num"/>
								<em class="add">+</em>
							</div>
						</div>
						
						<div class="scar">
							<a href="goCart.action">加入购物车</a>
						</div>
					</div>
				</div>
				<div class="space_hx">&nbsp;</div>
				<div class="pro_dm">
					<div class="pro_head">
						<span>商品详情</span>
					</div>
					<div class="pm_ctn">
						<img
							src="${pageContext.request.contextPath }/images/product/detail/bigdetailpic1.jpg"
							alt=""> <img
							src="${pageContext.request.contextPath }/images/product/detail/bigdetailpic2.jpg"
							alt=""> <img
							src="${pageContext.request.contextPath }/images/product/detail/bigdetailpic3.jpg"
							alt="">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 引入尾页面 -->
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
