$(document).ready(function() {
	// 显示添加地址界面，并获取所有默认省市县信息
	$(".address-add").click(function() {
		$(".addresPopBox").show();
		$(".popMask").show();

		// 提交到action获取地址信息
		$.ajax({
			type : 'POST',
			url : "getAddress.action",
			dataType : "json",
			data : {
				addrflag : "all"
			},
			success : function(data) {
				var provinces="";
				provinces += "<option value='0'>请选择</option>";
				$.each(data.provinces, function(idx, item){
					provinces += "<option value='" + item.provinceid + "'>" + item.provincename + "</option>";
				});
				$("#new_province").html(provinces);
				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				// 调试时打开
			/*	alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
				alert(errorThrown);*/
			},
			complete : function(XMLHttpRequest, textStatus) {
				this; // 调用本次AJAX请求时传递的options参数
			}
		});

	});
	// 关闭添加地址界面
	$(".oIcon").click(function() {
		$(".addresPopBox").hide();
		$(".popMask").hide();
	});
	
	// 删除地址
	$(".addDelete").click(function(){
		$(this).parent().parent().remove();
		// 提交action到数据库删除
		$.ajax({
			type : 'POST',
			url : "delAddress.action",
			dataType : "json",
			data : {
				addressid : $(this).parent().parent().find("#addressid:first").val()
			},
			success : function(data) {
				if ("delsuccess" == data.deleteinfo) {
					alert("删除成功！");
				}
			},
			error : function(data) {
				alert("无返回值或返回值错误！")
			}
		});
	});
	
//	// 点击地址变成选中状态
//	$(".item").click(function(){
//		alert("点击！");
//	/*	$(".on").removeClass("on");
//		$(this).addClass("on");*/
//		alert("item" + $(this).html());
//	});
	
	$(".subBtnBox").click(function(){
		alert("提交订单");
		$("#orderFrom").submit(function(){
			
		});
	});

});

// 获取市,传入省id
function getCity(value) {

	// 提交到action获取地址信息
	$.ajax({
		type : 'POST',
		url : "getAddress.action",
		dataType : "json",
		data : {
			addrflag : "city",
			provinceid: value
		},
		success : function(data) {
			var cities="";
			cities += "<option value='0'>请选择</option>";
			$.each(data.cities, function(idx, item){
				cities += "<option value='" + item.cityid + "'>" + item.cityname + "</option>";
			});
			$("#new_city").html(cities);
		},
		error : function(msg) {
			alert("返回值错误，无返回值！");
		}
	});
}
// 获取县
function getTown(value) {
	// 提交到action获取地址信息
	$.ajax({
		type : 'POST',
		url : "getAddress.action",
		dataType : "json",
		data : {
			addrflag : "town",
			cityid: value
		},
		success : function(data) {
			var towns="";
			towns += "<option value='0'>请选择</option>";
			$.each(data.towns, function(idx, item){
				towns += "<option value='" + item.townid + "'>" + item.townname + "</option>";
			});
			$("#new_county").html(towns);
		},
		error : function(msg) {
			alert("返回值错误，无返回值！");
		}
	});
}

// 将地址添加到数据库
function addAddress() {
	// 提交到action添加地址到数据库
	$.ajax({
		type : 'POST',
		url : "addAddress.action",
		dataType : "json",
		data : {
			consignee : $("#new_username").val(),
			shippingAddress: $("#new_province").find("option:selected").text() + "-" + $("#new_city").find("option:selected").text() + "-" + $("#new_county").find("option:selected").text() + "-" + $("#new_detail").val(),
			phone: $("#new_phone").val()
		},
		success : function(data) {
			if ("addsuccess" == data.addinfo) {
				alert("添加成功！");
				$(".addresPopBox").hide();
				$(".popMask").hide();
				// 在页面动态展示刚才添加的收货人信息
				consignee = $("#new_username").val();
				shippingAddress = $("#new_province").find("option:selected").text() + "-" + $("#new_city").find("option:selected").text() + "-" + $("#new_county").find("option:selected").text() + "-" + $("#new_detail").val();
				phone = $("#new_phone").val();
				var newItem = "<li class='item new' einv='false' onclick='checked(this)'><input type='hidden' value='" + data.addressid + "' addressname='江西省-南昌市-新建县' regionid='1967'><div class='address-tit'><b>" + consignee + "</b><span>" + phone + "</span></div><div class='address-con'>" + shippingAddress + "</div><div class='address-ope'><a class='addAlter' href='javascript:;' _di='107793439'>修改</a><a class='addDelete' href='javascript:;' _di='107793439'>删除</a></div><div class='defaultBtn' _di='107793439' onclick='setDefault(this)'>设为默认地址</div><div class='addDefault oIcon'></div></li>";
				$(".addressList").prepend(newItem);
				$(".item").removeClass("on");
				$(".new").addClass("on");
				
			} else if ("nologin" == data.addinfo){
				alert("用户未登录！");
			}
		},
		error : function(msg) {
			alert("返回值错误或用户未登录！");
		}
	});
	
}

function checked(obj) {
	// 点击地址变成选中状态
//		alert("点击！======" + $(obj).html());
		$(".item").removeClass("on");
		$(obj).addClass("on");
}

function setDefault(obj) {
	alert("设为默认...功能待完善！");
}
