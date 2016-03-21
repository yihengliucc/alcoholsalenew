<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'updateuser.jsp' starting page</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/admin/alluser.css"/>
  </head>
  <script type="text/javascript">
	function add(){
		//获取需要添加的元素的单元格对象
		var td = document.getElementById("main");
		var file = document.createElement("input");
		var remove = document.createElement("input");
		var br = document.createElement("br");
		//当前控件的类型为file
		file.type = "text";
		file.style="width:500px";
		file.name = "newaddress.addressname"; 
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
    <h1 style="text-align:left">用户信息修改</h1>
  <form action="updateuser!updateUser" method="post" enctype="multipart/form-data" >
   <table class="table_border">
   <tr><td><input type="hidden" name="user.userid" value="${updateuser.userid}"/></td></tr>
   <tr><td>用户姓名</td><td ><input type="text" name="user.username" style="width:500px" value="${updateuser.username}"/></td></tr>
   <tr><td>用户密码</td><td><input type="text" name="user.password" style="width:500px" value="${updateuser.password }"/></td></tr>
   <tr><td>用户邮箱</td><td><input type="text" name="user.email" style="width:500px" value="${updateuser.email}" /></td></tr>
   <tr><td>联系电话</td><td><input type="text" name="user.phone" style="width:500px" value="${updateuser.phone }"/></td></tr>
   <c:forEach items="${updateuser.address}" var="taddress">
    <tr><td>收货地址</td><td><textarea name="newaddress.addressname" style="width:500px" >${taddress.addressname}</textarea></td></tr>
   </c:forEach>
   <tr><td>新增收货地址</td><td id="main"><textarea name="newaddress.addressname" style="width:500px" ></textarea><input type="button" style="align:left" value="增加更多" onclick="add()"/></td></tr>
   <tr><td><input type="submit" value="提交"/><input type="reset" value="重置"/></td></tr>
   </table>
   </form>
  </body>
</html>
