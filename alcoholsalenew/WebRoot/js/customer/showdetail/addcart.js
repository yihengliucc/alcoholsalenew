// show add product into cart 
$(function(){
	
	// 点击加入购物车按钮
	$(".scar a").click(function(){
		$(".popMask").show();        // 显示遮罩层，暗灰色
		var cartCount;
		// ajax提交到aciton
		$.ajax({
			type: 'POST',
			url: "addCart.action",
			dataType: "json",
			data: {
				/* val1: $("#txt1").val(),     // 传递页面的值
                 val2: $("#txt2").val(),
                 val3: $("#txt3").val(),
                 val4: $("#txt4").val(),*/
				addquantity:$("#addquantity").val()
			},
			success:function(msg){
				var result = eval(msg);          // 不用eval函数也可以取
	              if(result.info == "ok") {
	                  $("#quantity").text(msg.quantity); 
	                  $(".u-buy-ok").show();
	            	  $(".u-buy-no").hide();
	                  $("#u-buy-layId").show();  	 // 显示提示框
	                 $("#shopping-amount").text(msg.cartQuantity);
	                 $(".hd-n5").show();  	     // 显示顶端购物车小图标,购物车数量从session中读才能保证每个页面都有值
	              }  else {
	            	  $(".u-buy-ok").hide();
	            	  $(".u-buy-no").show();
	            	  $("#u-buy-layId").show();  	 // 显示提示框
	            	  
	              }
			},
			error: function(msg){            // 只要有返回值就不会跳转到这函数
				alert(msg.info + "error");
				 $("#u-buy-layId").show();  	 // 显示提示框
			}
		});
		
		
		// 假设产品充足，不涉及检查库存是否足够
		
		
		
	});
	

	//点击关闭按钮触发 或者 点击继续购物
	$(".u-buy-close, .u-buy-g").click(function(){
		$("#u-buy-layId").hide();
		$(".popMask").hide();
	});
	
});

function saveReport() { 
	alert("saveReport!");
	// jquery 表单提交 
	$("#saveReportForm").ajaxSubmit(function(message) { 
	// 对于表单提交成功后处理，message为提交页面saveReport.htm的返回内容 
		alert("message");
	}); 

	return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转 
}





