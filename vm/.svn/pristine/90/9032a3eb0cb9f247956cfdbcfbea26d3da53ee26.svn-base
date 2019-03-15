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
	<form class="form form-horizontal" id="form-equipment-edit">
	<div class="row cl" style="display:none;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>设备id：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${param.id}" placeholder="" id="equipmentId" name="equipmentId">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>编号：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;" id="equipmentNumber">
			
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>名称：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" autocomplete="off" id="equipmentName" name="equipmentName">
		</div>
	</div>
	
	<!-- 添加经纬度 -->
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>经度：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" autocomplete="off" id="equipmentLongitude" name="equipmentLongitude">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>纬度：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" autocomplete="off" id="equipmentLatitude" name="equipmentLatitude">
		</div>
	</div>
	
	
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>设备型号：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<select id="equipmentType" name="equipmentType" class="input-text">
			</select>
		</div>
	</div>
	 <div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>点位设置：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<!-- <input type="text" class="input-text" autocomplete="off" id="equipmentPointId" name="equipmentPointId"> -->
			<select id="equipmentPointId" name="equipmentPointId" class="input-text"></select>
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="save_equipment" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
	var equipmentId = $("#equipmentId").val();
	//加载数据
	$.ajax({
		url:"${APP_PATH}/getEquipmentById",
		data:{"id":equipmentId},
		type:"GET",
		async:false,
		success:function(result){
			var equipment = result.extend.equipment;
			$("#equipmentNumber").text(equipment.equipmentNumber);
			$("#equipmentName").val(equipment.equipmentName);
			$("#equipmentLongitude").val(equipment.equipmentLongitude);
			$("#equipmentLatitude").val(equipment.equipmentLatitude);
		}
	});
	//装载设备类型
	$.ajax({
		url:"${APP_PATH}/getEquipmentClassFiy",
		type:"GET",
		async:false,
		success:function(result){
			var point = result.extend.list;
			//添加选择框的请选择
			var htmlStr = '<option style="text-align:center;"  value="0">'+"---请选择---"+'</option>';
			$("#equipmentType").html(htmlStr);
			
				$.each(point,function(index,p){
					var ele = $("#equipmentType");
					var optionEle = $("<option></option>").append(p.equipmentClassifyEquipmentNumber).attr("value",p.equipmentClassifyId);
					optionEle.appendTo(ele);
					
				})
		}
	});
	//装载点位名称
	$.ajax({
		url:"${APP_PATH}/getPoint",
		type:"GET",
		data:{"content":""},
		async:false,
		success:function(result){
			var point = result.extend.msg;
			//添加选择框的请选择
			var htmlStr = '<option style="text-align:center;"  value="0">'+"---请选择---"+'</option>';
			$("#equipmentPointId").html(htmlStr);
			
				$.each(point,function(index,p){
					var ele = $("#equipmentPointId");
					var optionEle = $("<option></option>").append(p.pointName).attr("value",p.pointId);
					optionEle.appendTo(ele);
					
				})
		}
	});

	/* 
	//检测手机号
	//$("#phone").blur(function(){
		function checkphone(){
		var phone = $("#phone").val();
		var checkphonenum = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		if (phone == "" || phone == " ") {
			$("#phonespan").show();
			$("#phonespan i").text("手机号码不能为空！");
			return false;
		}else if (checkphonenum.test(phone)) {
			$("#phonespan").hide();
			return true;
		}else{
			$("#phonespan").show();
			$("#phonespan i").text("手机号码不正确！");
			return false;
		}
	} */
	
	
	
	//修改设备信息
	$("#save_equipment").click(function(){

			$.ajax({
				url: "${APP_PATH}/updateEquipment",
				type: 'POST',
				data: $("#form-equipment-edit").serialize(),
				async:false,
				success: function(result){
					 var a = result.code;
					if (a == 100) {
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
		})
		
	
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>