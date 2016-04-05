<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body onload="document.pform.submit();">
<%--     <jsp:forward page="/WEB-INF/customer/index.jsp"></jsp:forward> --%>
	<!-- 自动跳转到action -->
	<form name="pform" action="goIndex.action" method="post">
		<input type="hidden" name="pageNow" value="1" >
	</form>
  </body>
</html>
