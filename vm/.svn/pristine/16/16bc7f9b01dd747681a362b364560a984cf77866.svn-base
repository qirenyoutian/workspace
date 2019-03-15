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
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/page/css/bootstrap.css" />


<title>添加管理员</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-plan-add">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>计划标题：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" placeholder="格式:(字母+数字)" id="planTitle" name="planTitle">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>计划内容：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<textarea name="planComit" cols="" rows="" class="textarea"  placeholder="说点什么...100个字符以内" dragonfly="true" onKeyUp="$.Huitextarealength(this,100)"></textarea>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>计划时间：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" id="planTime" placeholder="格式为(X日或者周X)" name="planTime" class="input-text">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>发送对象：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<select id="pavePlanAdminId" class="input-text" ></select>
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="save_plan" type="button" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
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
<script type="text/javascript" src="${APP_PATH }/static/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery.validation/1.14.0/messages_zh.js"></script> 

<script type="text/javascript">
$(function(){
	//获取所有运营人员
	$.ajax({
		url: "${APP_PATH}/getOperaAdmin",
		type: 'GET',
		async:false,
		success: function(result){
			var admin = result.extend.list;
			
			//添加选择框的请选择
			var htmlStr = '<option style="text-align:center;"  value="0">'+"---请选择---"+'</option>';
			$("#pavePlanAdminId").html(htmlStr);
			
			//var htmlStr = '';
			$.each(admin,function(index,item){
				htmlStr += '<option style="text-align:center;" value="'+item.adminId+'">'+item.adminRealname+'</option>';
			})
			$("#pavePlanAdminId").html(htmlStr);
		}
	});
});


//保存系统用户
$("#save_plan").click(function(){

	//alert(a);
		$.ajax({
			url: "${APP_PATH}/savePlan",
			type: 'POST',
			data: $("#form-plan-add").serialize(),
			async:false,
			success: function(result){
				 var a = result.code;
				if (a == 100) {
					//alert("1111");
					layer.msg('添加成功!',{icon:1,time:2000},function(){
						var index = parent.layer.getFrameIndex(window.name);
						parent.$('.btn-refresh').click();
						parent.to_page(1);
						parent.layer.close(index);
					});
				}else{
					layer.msg(result.extend.msg,{icon:5,time:3000});
				} 
			}
		});
	});
	
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>