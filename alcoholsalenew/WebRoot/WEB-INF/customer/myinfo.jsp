<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 引入jstl标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>我的信息</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/myorder.css"
	type="text/css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/myinfo.css"
	type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/mycart/jquery.1.4.2-min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/customer/myinfo.js"></script>

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
				</strong> &gt; <span class="det-cur">我的信息</span>
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
						<a class="item on" href="goMyOrderUI.action" title=""><span>我的订单</span><i></i></a>
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
						<i></i>我的信息
					</h2>

				</div>
				<div class="rightCon">
					<div class="zpBaseInfo">
						<div class="zpBaseInfoTitle" style="display: block;">
							<ul class="clearfix">
								<li class="on">个人信息</li>
							</ul>
						</div>
						<form action="modifyUserInfo.action" method="post" >
							<div class="zpInfo">

								<ul class="basePart">
									<li class="clearfix">
										<p class="zpName">用户名：</p> <span class="userCheckContact">${user.username }</span>
									</li>
									<li class="baseInfoTip">为了您的账户安全，请<a href="#"
										target="_blank">验证邮箱</a>，功能待实现。
									</li>
									<li class="clearfix">
										<p class="zpName">
											<strong>*</strong>昵称：
										</p> <input type="text" class="name" name="nickname"
										id="anotherName" value="${user.nickname }" maxlength="20">
										<div class="acc">
											<div class="accNotic" style="display:none">
												<i></i><span>请输入昵称</span>
											</div>
										</div>
									</li>
									<li class="clearfix">
										<p class="zpName">真实姓名：</p> <input type="text"
										class="realName" name="reallyname" id="realName"
										value="${user.reallyname }" maxlength="20">
										<div class="acc">
											<div id="realNameTS" class="accNotic" style="display:none">
												<i></i><span>请输入真实姓名</span>
											</div>
										</div>
									</li>
									<li class="clearfix">
										<p class="zpName">
											<strong>*</strong>性别：
										</p> <input class="zpSex" type="radio" name="sex"
										<c:if test="${user.sex == '男' }">checked="checked"</c:if>
										 value="1"><span class="zpSexText">男</span>
										<input class="zpSex" type="radio" name="sex"
										<c:if test="${user.sex == '女' }">checked="checked"</c:if>
										value="2"><span
										class="zpSexText">女</span>
									</li>
									<li class="clearfix">
										<p class="zpName">
											<strong>*</strong>生日：
										</p> <input type="text" name="birthday"
										class="birthday Wdate hasDatepicker" id="setBirthday" value="${user.birthday}"
										　readonly="readonly"> 
										<div class="acc">
											<div class="accNotic" style="display:none">
												<i></i><span>请选择生日</span>
											</div>
										</div>
									</li>
								</ul>

								<ul>
									<li class="clearfix">
										<p class="zpName">邮箱：</p> <span
										class="userCheckContact uPhone"> ${user.email } </span> <a
										href="#" target="_blank" class="modifyCheckContact">修改</a>
									</li>
									<li class="clearfix">
										<p class="zpName">手机：</p> <span
										class="userCheckContact uPhone"> ${user.phone } </span> <a
										href="#" target="_blank" class="modifyCheckContact">修改</a>
									</li>
									<li class="clearfix">
										<p class="zpName">详细地址：</p> <input class="detailAdd valid"
										type="text" id="addressMore" name="useraddress" value="${user.useraddress }"
										maxlength="60">
										<div class="acc">
											<div id="addressMoreTS" class="accNotic" style="display:none">
												<i></i><span></span>
											</div>
										</div>
									</li>
								</ul>

								<!-- 提交按钮 -->
								<input type="submit" class="submitZpInfo" value="提&nbsp;交&nbsp;修&nbsp;改"
									id="saveInfo">
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- 引入尾页面 -->
			<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
