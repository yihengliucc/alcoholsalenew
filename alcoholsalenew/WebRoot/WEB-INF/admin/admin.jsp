<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'admin.jsp' starting page</title>
  </head>
  
<frameset cols="15%,70%">
  <frame name="left" src="left.action" />
  <frame name="right" src="right.action" />
</frameset>
</html>
