<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'comment.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/admin/alluser.css"/>

  </head>
  
  <body>
  <h1 style="text-align:center">商品评论查询页面</h1>
   <table class="table_border">
   <tr><td>买家</td><td style="width:200px">商品名称</td><td style="width:500px">评论内容</td></tr>
   	<tr><td>张三</td><td>波尔图红酒</td><td>酒的质量挺好的</td>
   	<tr><td>李四</td><td>衡水老白干酒</td><td>酒精比较重</td>
   	<tr><td>王五</td><td>贵州茅台</td><td>果然是好酒</td>
   	<tr><td>测试</td><td>法国红酒</td><td>酒的质量挺好的</td>
	</tr>
   </table>
   <c:if test="${pageNow!=1 }">
   	<a	href="${pageContext.request.contextPath }/queryComment.action?pageNow=${pageNow-1}">上一页</a>
  	</c:if>
  	<c:forEach begin="1" end="${commentsize}" var="i">
		<a	href="${pageContext.request.contextPath }/queryComment.action?pageNow=${i}">${i}</a>
	</c:forEach>
	
	<c:if  test="${pageNow!=productcount }" >
	<a	href="${pageContext.request.contextPath }/queryComment.action?pageNow=${pageNow+1}">下一页</a>
  	</c:if>
  </body>
</html>
