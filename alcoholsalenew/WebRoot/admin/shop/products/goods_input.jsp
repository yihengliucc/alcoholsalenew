<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<script type="text/javascript" src="../../adminthemes/new/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../../adminthemes/new/js/eop-min.js"></script>
<script type="text/javascript" src="../../adminthemes/new/js/jquery-form-2.33.js"></script>

<link href="../../adminthemes/default/css/dialog.css" rel="stylesheet" type="text/css" />
<link href="../../adminthemes/new/css/global.css" rel="stylesheet" type="text/css" />
<link href="../../adminthemes/new/css/main.css" rel="stylesheet" type="text/css" />

<script	type="text/javascript" src="/editor/ckeditor362/ckeditor.js"></script>
<script	type="text/javascript" src="/editor/ckeditor362/adapters/jquery.js"></script>

<script type="text/javascript" src="../../adminthemes/new/js/jquery.blockUI.js"></script>
<script type="text/javascript" src="../../adminthemes/new/js/jquery.loading.js"></script>
<div class="main">
	<div id="memberpricedlg"></div>
	<div class="input">
		<form method="post" name="theForm"  id="theForm" class="validate">
			<input value="${actionName }" type="hidden" id="goods_inputAction"/>
			<c:if test="${is_edit }">
				<input type="hidden" name="isedit" value="yes" />
				<input type="hidden" name="goods.goods_id" value="${goodsView.goods_id  }" />
			</c:if>
			<div style="display: block;" class="goods_input">
				<div class="contentTab">
					<ul>
						<c:forEach var="tab" items="${pluginTabs}" varStatus="status">
							<li tabid="${tab.key }" <c:if test="${status.index==0 }">class="contentTabS"</c:if>>${tab.value }</li>
						</c:forEach>
					</ul>
				</div>
				<div class="shadowBoxWhite wf100 whiteBox">
					<div class="text">
						<div class="tab-page">
							<c:forEach var="content" items="${pluginHtmls}" varStatus="status">
								<div tabid="${content.key }" <c:if test="${status.index!=0 }">style="display:none"</c:if>  class="tab-panel">
									${content.value }
								</div>
							</c:forEach>
						</div>
						<div class="bottomButtonArea" align="center">
							<table>
								<tr>
									<td >
							 			<input name="submit" type="button" value="确    定 " id="goodsinput" class="button blueButton" />
							  		</td>
							 	</tr>
						 	</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript"> 
var app_path="";
$(function(){
	
	var instance = CKEDITOR.instances['intro']; 
	if (instance) { CKEDITOR.remove(instance); }
	$('#intro').ckeditor(); 
	 
 	 $(".goods_input .contentTab>ul>li").click(function(){
 	 	 var tabid=$(this).attr("tabid");
 	 	
 	 	 $(".goods_input .contentTab>ul>li").removeClass("contentTabS");
 	 	 $(this).addClass("contentTabS");
 	 	 $(".tab-page .tab-panel").hide();
 	 	 $(".tab-panel[tabid="+tabid+"]").show();
 	 });

 	 
	 
	 $("input[type=text]").attr("autocomplete","off");
 
	
	 $("input[type=submit]").click(function(){
		 
		 $.Loading.show('正在保存，请稍侯...');
	 });
	 $("#goodsinput").click(function(){
		 //基本信息
		 if($("input[name='goods.name']").val()==""||$("input[name='goods.name']").val()==null){
			 $.Loading.error("商品名称不能为空");
			 return "";
		 }
		 if($("input[name='goods.sn']").val()==""||$("input[name='goods.name']").val()==null){
			 $.Loading.error("商品编号不能为空");
			 return "";
		 }
		 if(isNaN($("input[name='goods.mktprice']").val())){
			 $.Loading.error("市场价格必须为数字");
			 return "";
		 }
		 if(isNaN($("input[name='goods.point']").val())||$("input[name='goods.point']").val().indexOf('.') > 0){
			 $.Loading.error("积分必须为数字,并且为整数");
			 return "";
		 }
		 //规格
		 
		 if(isNaN($("#price").val())||$("#price").val()==""){
			 $.Loading.error("销售价格必须为数字,并且不能为空");
			 return "";	 
		 }
		 if(isNaN($("#cost").val())||$("#cost").val()==""){
			 $.Loading.error("成本价必须为数字,并且不能为空");
			 return "";	 
		 }
		 if(isNaN($("#weight").val())||$("#weight").val()==""){
			 $.Loading.error("重量必须为数字,并且不能为空");
			 return "";	 
		 }
		 var options = {
					url : $("#goods_inputAction").val()+"?ajax=yes",
					type : "POST",
					dataType : "json",
					success : function(result) {
						$.Loading.error(result.message);
						if(result.result==1){
							window.location.href="goods!list.do";
						}
					},
				 	error : function(e) {
				 		alert("出错了，请重试");
					}
		};
		$('#theForm').ajaxSubmit(options);	
	 });
	 
 
});
	
</script>
