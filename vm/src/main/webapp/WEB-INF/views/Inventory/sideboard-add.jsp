<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/page/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/style.css" />


<title>添加管理员</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-Equipment-add">
	<div class="" style="display: none;">
		<input type="text" value="${param.id}" placeholder="" id="equipmentId" name="equipmentId">
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>选择商户：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<select id="commercial" name="commercial" class="input-text">
				<option value="0">----请选择----</option>
			</select>
		</div>
	</div>
	<div class="row cl" id="merchandiseDIV">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>选择商品：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<select id="merchandise"  name="sideboardMerchandiseId" class="input-text">
			    <option value="0">----请选择----</option>
			</select>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品储量：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" id="sideboardCount" name="sideboardCount">
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="save_Sideboard" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/page/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/login/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery.validation/1.14.0/messages_zh.js"></script> 

<script type="text/javascript">
$(function(){
	//加载商户名称
	$.ajax({
		url:"${APP_PATH}/getCommercialTenantName",
		type:"GET",
		async:false,
		success:function(result){
			var point = result.extend.pageInfo;
				$.each(point,function(index,p){
					var ele = $("#commercial");
					var optionEle = $("<option></option>").append(p.commercialTenantName).attr("value",p.commercialTenantId);
					optionEle.appendTo(ele);
				})
		}
	});
});	
	//商品名称
$("#commercial").change(function(){
	var commId = $(this).val();
	if (commId != 0) {
		//alert(commId);
		$("#merchandiseDIV").find("option").remove();
		
		$.ajax({
			url:"${APP_PATH}/getMerchandiseByCommercialId",
			data:{'commercialTenantId':commId},
			type:"POST",
			success:function(result){
			var point = result.extend.list;
			//添加请选择
			var htmlStr = '<option style="text-align:center;"  value="0">'+"---请选择---"+'</option>';
			$("#merchandise").html(htmlStr);
			
					$.each(point,function(index,p){
						var ele = $("#merchandise");
						var optionEle = $("<option></option>").append(p.merchandiseName).attr("value",p.merchandiseId).attr("name","merchandiseId");
						optionEle.appendTo(ele);
					})
			}
		});
	} 
});

	//保存边柜库存
	$("#save_Sideboard").click(function(){
			var equipmentId = $("#equipmentId").val();
			var merchandiseId = $("#merchandise").val();
			var sideboardCount = $("#sideboardCount").val();
		
		
			$.ajax({
				url: "${APP_PATH}/saveSideboard",
				type: 'POST',
				data: {"sideboardEquipmentId":equipmentId,"sideboardMerchandiseId":merchandiseId,"sideboardCount":sideboardCount},
				async:false,
				success: function(result){
					 var a = result.code;
					if (a == 100) {
						layer.msg('添加成功!',{icon:1,time:2000},function(){
							var index = parent.layer.getFrameIndex(window.name);
							parent.$('.btn-refresh').click();
							parent.to_page();
							parent.layer.close(index);
						});
					}else{
						layer.msg('添加失败!',{icon:5,time:3000});
					} 
				}
			});
		});
		
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>