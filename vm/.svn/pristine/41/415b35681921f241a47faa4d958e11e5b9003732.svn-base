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


<title>分配角色</title>
</head>
<style>
.col-xs-4{
	margin-left: 100px;
}
.col-xs-8{
	width:150px;
}
</style>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-admin-add">
	<div class="row cl" style="display: none;">
		<label class="form-label col-xs-4 col-sm-3">用户ID：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input id="adminId" name="adminId" value="${param.id }" >
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3" style="width:100px;">选择角色：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<select id="roleId" class="input-text" style="width:200px;" ></select>
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="save_admin" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
	 $.ajax({
		url:"${APP_PATH}/getRole",
		type:"GET",
		success:function(result){
			var role = result.extend.role;
			$.each(role,function(index,item){
				var ele = $("#roleId");
				var optionEle = $("<option></option>").append(this.roleName).attr("value",this.roleId);
				optionEle.appendTo(ele);
			})
		}
	});
	

	
	//保存系统用户
	$("#save_admin").click(function(){
		var roleId = $("#roleId").val();
		var adminId = $("#adminId").val();
		//alert(a);
			$.ajax({
				url: "${APP_PATH}/saveAdminRole",
				type: 'POST',
				data: {"adminId":adminId,"roleId":roleId},
				async:false,
				success: function(result){
					 var a = result.code;
					if (a == 100) {
						//alert("1111");
						layer.msg('分配成功!',{icon:1,time:2000},function(){
							var index = parent.layer.getFrameIndex(window.name);
							parent.to_page(1);
							parent.layer.close(index);
						});
					}else{
						layer.msg('分配失败!',{icon:5,time:3000});
					} 
				}
			});
		});
		
	
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>