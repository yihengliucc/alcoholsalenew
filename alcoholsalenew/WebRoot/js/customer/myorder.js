$(document).ready(function() {

	$(".subtrack").mouseover(function() {
		// 隐藏商品跟踪详情
		 console.log("鼠标进入");
		 $(this).parent().parent().find(".delivery:first").show("slow");
	}).mouseout(function() {
		// 显示商品跟踪详情
		console.log("鼠标移除");
		$(this).parent().parent().find(".delivery:first").hide("slow");
	});
	
	$("#orderCancel").click(function(){
		var obj = $(this);
		$.ajax({
			type : 'POST',
			url : "cancelOrder.action",
			dataType : "json",
			data : {
				orderid : $(this).next().val()
			},
			success : function(data) {
				if ("canclesuccess" == data.deleteinfo) {
					
					obj.parent().parent().parent().find(".opePending:first").html("已取消");
					obj.parent().parent().parent().find(".opeTracking:first").remove();
					obj.parent().parent().find(".ope04:first").remove();
					obj.parent().remove();
				}
			},
			error : function(data) {
				alert("无返回值或返回值错误！")
			}
		});
	});
	
})
