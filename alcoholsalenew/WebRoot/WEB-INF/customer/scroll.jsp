<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style type="text/css">
.scroll_div {
	width: 100%;
	height: 450px;
	margin: 0 auto;
	padding: 10px;
	float: left;
	padding: 0px;
}

.scroll_div .pic {
	width: 100%;
	height: 450px;
	overflow: hidden;
	position: relative;
	float: left;
}

.btn_div {
/* 	height: 20px;
    left: 0;
    */
    left: 0px;
    position: absolute;
    text-align: center;
    top: 560px;
    width: 100%;
    z-index: 20; */
}

.scroll_div .pic li {
	width: 100%;
	height: 450px;
	position: absolute;
	top: 0;
	left: 0;
	display: none;
}

.btn_div .btn {
/* 	float: right;
	width: 173px; */
	height: 30px;
}

.btn {
/* 	float: right;
	width: 173px; */
	width: 200px;
	margin: 0 auto;
}

.btn_div .btn li {
	width: 30px;
	height: 30px;
	display: block;
	float: left;
	text-align: center;
	color: #fff;
	font: 10px "微软雅黑";
	font-weight: bold;
	background: #008dd8;
	margin-bottom: 10px;
	line-height: 32px;
	cursor: pointer;
	margin-left:10px;
}

.btn_div .btn li.on {
	background: #d73737;
}

li {
	list-style: none;
}
</style>
<script src="${pageContext.request.contextPath }/js/jquery-1.3.1.js" type=text/javascript></script>
<script type="text/javascript">
	$(function() {
		var listLen = $(".pic li").length, i = 0, setInter, speen = 2000;
		/*图片轮播*/
		$(".btn li:last").css({
			"margin" : "0px 0px 0px 10px"
		});
		$(".btn li:first").addClass("on");
		$(".pic li:first").show();

		$(".btn li").each(function(index, element) {
			$(element).click(function() {
				i = index;
				$(this).addClass("on").siblings().removeClass("on");
				$(".pic li").eq(index).animate({
					opacity : "show"
				}, 300).siblings().animate({
					opacity : "hide"
				}, 300);
			})
			$(element).hover(function() {
				clearInterval(setInter);
			}, function() {
				outPlay();
			});
		})

		out_fun = function() {
			if (i < listLen) {
				i++;
			} else {
				i = 0;
			}
			;
			$(".btn li").eq(i).addClass("on").siblings().removeClass("on");
			$(".pic li").eq(i).animate({
				opacity : "show"
			}, 300).siblings().animate({
				opacity : "hide"
			}, 300);
		}

		outPlay = function() {
			setInter = setInterval("out_fun()", speen);
		}
		outPlay();
	})
</script>

	<div class="scroll_div">
		<ul class="pic">
			<li><img
				src="${pageContext.request.contextPath }/images/others/scroll_1.png" /></li>
			<li><img
				src="${pageContext.request.contextPath }/images/others/scroll_2.png" /></li>
			<li><img
				src="${pageContext.request.contextPath }/images/others/scroll_1.png" /></li>
			<li><img
				src="${pageContext.request.contextPath }/images/others/scroll_2.png" /></li>
			<li><img
				src="${pageContext.request.contextPath }/images/others/scroll_1.png" /></li>
		</ul>
	</div>
	<div class="btn_div">
		<ul class="btn">
			<li>1</li>
			<li>2</li>
			<li>3</li>
			<li>4</li>
			<li>5</li>
		</ul>
	</div>

