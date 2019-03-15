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
	<div class="row cl" style="display: none;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>类型ID：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" value="${param.id}" id="equipmentClassifyId" name="equipmentClassifyId">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>生产厂家：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" id="manufacturer" name="manufacturer">
			<span id="namespan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>设备型号：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" id="equipmentNumber" name="equipmentNumber">
			<span id="namespan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>设备类型：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" id="equipmentClassifyName" name="equipmentClassifyName">
			<span id="namespan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>货道行数：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" autocomplete="off" id="equipmentClassifyRow" name="equipmentClassifyRow">
			<span id="rowspan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>货道列数：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" autocomplete="off" id="equipmentClassifyLine" name="equipmentClassifyLine">
			<span id="linespan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>设备尺寸：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" autocomplete="off"id="equipmentSize" name="equipmentSize">
			<span id="linespan" style="display:none;"><i  style="color:red;"></i></span>	
		</div>
	</div>
	
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="update_EquipmentClassify" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
		
	
	var equipmentClassifyId = $("#equipmentClassifyId").val();
	//加载数据
	$.ajax({
		url:"${APP_PATH}/getEquipmentClassfiyById",
		data:{"equipmentClassifyId":equipmentClassifyId},
		type:"GET",
		async:false,
		success:function(result){
			var equipment = result.extend.msg;
			$("#manufacturer").val(equipment.equipmentClassifyManufacturer);
			$("#equipmentNumber").val(equipment.equipmentClassifyEquipmentNumber);
			$("#equipmentClassifyName").val(equipment.equipmentClassifyName);
			$("#equipmentClassifyRow").val(equipment.equipmentClassifyRow);
			$("#equipmentClassifyLine").val(equipment.equipmentClassifyLine);
			$("#equipmentSize").val(equipment.equipmentClassifyEquipmentSize);
		}
	});
	

	//修改设备类型
	$("#update_EquipmentClassify").click(function(){
			$.ajax({
				url: "${APP_PATH}/updateEquipmentClassify",
				type: 'POST',
				data: $("#form-Equipment-add").serialize(),
				async:false,
				success: function(result){
					 var a = result.extend.msg;
					if (a == 1) {
						//alert("1111");
						layer.msg('修改成功!',{icon:1,time:2000},function(){
							var index = parent.layer.getFrameIndex(window.name);
							parent.$('.btn-refresh').click();
							parent.to_page(1);
							parent.layer.close(index);
						});
					}else{
						layer.msg('修改失败!',{icon:5,time:3000});
					} 
				}
			});
		});
		
	
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>