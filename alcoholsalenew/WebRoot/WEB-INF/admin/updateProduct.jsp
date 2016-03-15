<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'updateProduct.jsp' starting page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/admin/alluser.css"/>
  </head>
  
  <body>
     <h1 style="text-align:left">商品修改页面</h1>
  <form action="updateproduct!updateProduct" method="post"  >
   <table class="table_border">
   <tr><td>商品名称</td><td ><input type="text" name="product.proname" style="width:500px" value="${product.proname}"/></td></tr>
   <tr><td>普通价格</td><td><input type="text" name="product.normalprice" style="width:500px" value="${product.normalprice}" /></td></tr>
   <tr><td>会员价格</td><td><input type="text" name="product.memberprice" style="width:500px" value="${product.memberprice}" /></td></tr>
   <tr><td>库存</td><td><input type="text" name="stock.quantity" style="width:500px" value="${product.stockid.quantity}" /></td></tr>
   <tr><td>商品描述</td><td><textarea name="product.descr" style="width:500px">${product.descr}</textarea></td></tr>
   <tr><td><input type="submit" value="修改"/><input type="reset" value="重置"/></td></tr>
   </table>
   </form>
  </body>
</html>
