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
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>设备名称：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" placeholder="设备名称" id="equipmentName" name="equipmentName">
			<span id="namespan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>设备编号：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" autocomplete="off" placeholder="设备编号" id="equipmentNumber" name="equipmentNumber">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>设备型号：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" autocomplete="off" placeholder="设备型号" id="equipmentModelNumber" name="equipmentModelNumber">
			<span id="modelspan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">设备备注：</label>
		<div class="formControls col-xs-8 col-sm-9"style="width:350px;" >
			<textarea name="equipmentNote" id="equipmentNote" cols="" rows="" class="textarea"  placeholder="说点什么...100个字符以内"></textarea>
		</div>
	</div>
	
<!-- 	 <div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">设备类型：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<select>
				<option></option>
				<option></option>
			</select>
		</div>
	</div> -->
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="save_Equipment" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
	
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	function reset_form(ele){
		$(ele).hide();
	}
	//显示校验结果的提示信息
	function show_validate_msg(ele,status,msg){
		//清除当前元素的校验状态
		$(ele).next("span").text("");
		if("success"==status){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		}else if("error" == status){
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}
	
	//检测用户名
		function checkEquipmentName(){
		var equipmentName = $("#equipmentName").val();
		if (equipmentName == "" || equipmentName == " ") {
			$("#namespan").show();
			$("#namespan i").text("设备名不能为空！");
			return false;
		}else{
			
			return true;
		}
	}
		function checkEquipmentModelNumber(){
		var equipmentModelNumber = $("#equipmentModelNumber").val();
		if (equipmentModelNumber == "" || equipmentModelNumber == " ") {
			$("#modelspan").show();
			$("#modelspan i").text("设备型号不能为空！");
			return false;
		}else{
			return true;
		}
	}

	//保存系统用户
	$("#save_Equipment").click(function(){
		var a = checkEquipmentName();
	 	var b = checkEquipmentModelNumber();
		//alert(a);
		if (a == true && b== true) {
			$.ajax({
				url: "${APP_PATH}/saveEquipment",
				type: 'POST',
				data: $("#form-Equipment-add").serialize(),
				async:false,
				success: function(result){
					 var a = result.extend.msg;
					if (a == 1) {
						//alert("1111");
						layer.msg('添加成功!',{icon:1,time:2000},function(){
							var index = parent.layer.getFrameIndex(window.name);
							parent.$('.btn-refresh').click();
							parent.to_page(1);
							parent.layer.close(index);
						});
					}else{
						layer.msg('添加失败!',{icon:5,time:3000});
					} 
				}
			});
			return;
		}else{
			layer.msg('验证出问题',{icon:5});
			return;
		}
		});
		
	
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>