<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'addProduct.jsp' starting page</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/admin/alluser.css"/>
  </head>
  <script type="text/javascript">
	function add(){
		//获取需要添加的元素的单元格对象
		var td = document.getElementById("main");
		//创建file控件按钮换行符
		var file = document.createElement("input");
		var remove = document.createElement("input");
		var br = document.createElement("br");
		//当前控件的类型为file
		file.type = "file";
		file.style="width:500px";
		file.name = "myfile"; //name属性为myfile
		remove.type="button";
		remove.value="动态删除";
		//为删除按钮添加事件 移除元素
		remove.onclick = function(){
			td.removeChild(br);
			td.removeChild(file);
			td.removeChild(remove);
		}
		//将创建的控件 按钮 换行符添加的单元格中
		td.appendChild(br);
		td.appendChild(file);
		td.appendChild(remove);
	}
  </script>
  <body>
   <h1 style="text-align:left">商品增加页面</h1>
  <form action="addproduct!addproduct" method="post" enctype="multipart/form-data" >
   <table class="table_border">
   <tr><td>商品名称</td><td ><input type="text" name="product.proname" style="width:500px"/></td></tr>
   <tr><td>普通价格</td><td><input type="text" name="product.normalprice" style="width:500px"/></td></tr>
   <tr><td>会员价格</td><td><input type="text" name="product.memberprice" style="width:500px"/></td></tr>
   <tr><td>库存</td><td><input type="text" name="stock.quantity" style="width:500px"/></td></tr>
   <tr><td>商品描述</td><td><textarea name="product.descr" style="width:500px"></textarea></td></tr>
   <tr><td>商品图片上传</td><td id="main"><input type="file" name="myfile" style="width:500px" /><input type="button" style="align:left" value="增加更多" onclick="add()"/></td></tr>
   <tr><td><input type="submit" value="提交"/><input type="reset" value="重置"/></td></tr>
   </table>
   </form>
  </body>
</html>
