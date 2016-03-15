<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>品牌酒登录</title>
<meta name="description" content="cc">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/customer/login.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/comm.css"
	type="text/css" />
</head>
<body>
	<!--login start-->
	<div class="logo">
		<p style="background:url(${pageContext.request.contextPath }/images/others/winelogo.png) no-repeat;" class="logo">
		</p>
	</div>
	<div class="login">
		<div class="l_title">
			<span>欢迎登录</span>
		</div>
		<div class="l_user">
			<form action="login" method="post">
			<input type="text" class="name" name="username" placeholder="请输入用户名" /> 
			<input type="password" class="pass" name="password" placeholder="请输入密码" /> 
			<!-- <input type="password" class="pass" name="checkcode" placeholder="请输入验证码" /> -->
			<input type="submit" value="登录" class="sub" />
			<p class="erroinfo" >${logininfo }</p>
			<p class="reghref" ><a href="goRegUI.action">免费注册</a></p>
			</form>
		</div>
	</div>
	</div>
	<!--login end-->
</body>
</html>