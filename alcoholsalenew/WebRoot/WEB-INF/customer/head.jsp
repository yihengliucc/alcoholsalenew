<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 引入jstl标签库 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/customer/head.css" type="text/css" />

    <div class="top-header">
    	<div class="top-head">
    		<div class="top-header-com">
    			<div class="header-left">
    			<c:choose>
    				<c:when test="${empty user}">
    					<p class="font3">欢迎登录品牌酒网！</p>
    					<a href="goLoginUI.action">请登录</a>
    					<a  href="goRegUI.action">免费注册</a>
    				</c:when>
    				<c:otherwise>
    				<p class="font3">欢迎 <font color="#9AB310">${user.username}</font> 登录品牌酒网！</p>
    				<a href="exit.action" >退出</a>
    				</c:otherwise>
    			</c:choose>
    			</div>
    			<div class="header-right">
    				<ul>
    					<li class="hd-n1">
    					<a href="goMyOrderUI.action" target="_blank" >我的订单</a>
    					</li>
    					<li class="hd-n2">
    					<i class="publicIcon"></i>
						<a href="goCart.action" target="_blank" >我的购物车</a>
    					</li>
					
						<c:if test="${not empty cartQuantity}">
							<c:if test="${cartQuantity =='0'}">
		    					<li class="hd-n5" style="display:none;">
		    						<p class="ci-count" id="shopping-amount">${cartQuantity }</p>
		    					</li>
	   						</c:if>
	   						<c:if test="${cartQuantity !='0'}">
		    					<li class="hd-n5" style="display:block;">
		    						<p class="ci-count" id="shopping-amount">${cartQuantity }</p>
		    					</li>
	   						</c:if>
   						</c:if>   						
 
   						<c:if test="${empty cartQuantity}">
	    					<li class="hd-n5" style="display:none;">
	    						<p class="ci-count" id="shopping-amount">${cartQuantity }</p>
	    					</li>
   						</c:if>
   						
    				
    					<li class="hd-n3">
    					<a href="#" target="_blank" >帮助中心</a>
    					</li>
    					<li class="hd-n4">
    					<i class="publicIcon"></i>
    					<p style="color:#8C8A94; width: 175px;" >客服电话：<font style="color:#cc0001;font-weight: bold;FONT-FAMILY: Arial,Helvetica,sans-serif,'宋体';">400-000-0000</font></p>
    					</li>
    				</ul>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="mid-header">
      <div class="top-head">
    		<div class="logo">
    			<p style="background:url(${pageContext.request.contextPath }/images/others/winelogo.png) no-repeat;" class="index">
    				<a target="_blank" href="${pageContext.request.contextPath }/index.jsp"></a>
    			</p>
    		</div>
    		<!-- <div class="header-search">
    			搜索
    		</div> -->
    		<!-- 搜索 -->
    		<div class="searchHome">
				<form action="action" method="get">
					<input id="wd" class="search-form" type="text" name="key" value="" maxlength="50" autocomplete="off">
					<input class="search-btn" type="submit" name="" value="搜&nbsp;索">
					<input id="area" name="area" type="hidden" value="17">
				</form>
			</div>
    	</div>
    </div>
