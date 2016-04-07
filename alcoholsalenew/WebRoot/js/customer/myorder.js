$(document).ready(function() {

	/*	$(".TraBtn").mouseover(function() {
	 // 显示商品跟踪详情
	 $(this).next().show();
	 // 阻止冒泡行为
	 if(t!=null)clearTimeout(t);  
	 t=null;  
	 }).mouseout(function() {
	 // 隐藏商品详情
	 $(this).next().hide();
	 // 阻止冒泡行为
	 clearTimeout(t);
	 t=setTimeout(zoomIn,400); 
	
	 });*/

	
	$(".subtrack").mouseover(function() {
		// 隐藏商品跟踪详情
		/* $(this).parent().next().show();*/
		 console.log("鼠标进入");
		 $(this).parent().parent().find(".delivery:first").show();
		 
		 $(".subtrack").mouseout(function() {
				// 显示商品跟踪详情
				/*$(this).parent().next().hide();*/
				console.log("鼠标移除");
				$(this).parent().parent().find(".delivery:first").hide();
			});
	});
	
/*	$(".TraBtn span").hover(function(){
		$(this).next().attr("style","display:block;");
	    },function(){
	    $(this).next().attr("style","display:none;");
	  });*/

})
