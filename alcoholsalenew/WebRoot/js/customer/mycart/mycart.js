function addCart(obj) {
	// 增加一件商品
	$.ajax({
		type: 'POST',
		url: "modCart.action",
		dataType: "json",
		data: {
			modMethod:"add",
			proid: obj.parent().parent().parent().find("#pro_id:first").val(),
		},
		success:function(msg){
		},
		error: function(msg){
		}
	});
			
}

function reduceCart(obj) {
	// 减少一件商品
	$.ajax({
		type: 'POST',
		url: "modCart.action",
		dataType: "json",
		data: {
			modMethod:"reduce",
			proid: obj.parent().parent().parent().find("#pro_id:first").val()
		},
		success:function(msg){
		},
		error: function(msg){
		}
	});
}

// 删除一件商品
function deleteCart(obj) {
	// 删除一件商品
	$.ajax({
		type: 'POST',
		url: "modCart.action",
		dataType: "json",
		data: {
			modMethod:"delete",
			proid: obj.parent().parent().find("#pro_id:first").val()
		},
		success:function(msg){
		},
		error: function(msg){
		}
	});
}