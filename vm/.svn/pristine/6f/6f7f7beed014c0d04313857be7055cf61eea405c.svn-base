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


<title>添加商品</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-admin-add">
	<div class="row cl" style="display:none;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>id：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${param.id}" placeholder="" id="bannerId" name="bannerId">
			<span id="rolespan" style="display:none;"><i style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label style="margin-left: 30px; float: left;">点位名称：</label>
		<div style="width:250px; float: left;">
			<select id="PointName" name="pointName" class="input-text" style="width:200px;">
				
			</select>
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="edit_banner" type="button" value="&nbsp;&nbsp;更新&nbsp;&nbsp;">
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
	//加载点位名称
	$.ajax({
			url:"${APP_PATH}/getPointForSelect",
			type:"GET",
			success:function(result){
				var payment = result.extend.list;
	       	var htmlStr = '<option value="">---请选择---</option>';
	       	
	       	$.each(payment,function(index,item){
	       		htmlStr += '<option style="text-align:center;" value="'+item.pointId+'">'+item.pointName+'</option>';
	       	});
	       	$("#PointName").html(htmlStr);
			}
		});
	
})

	$("#edit_banner").click(function(){
		$.ajax({
			url: "${APP_PATH}/updateBanner",
			type: 'POST',
			data: $("#form-admin-add").serialize(),
			async:false,
			success: function(result){
				 var a = result.code;
				if (a == 100) {
					layer.msg('修改成功!',{icon:1,time:2000},function(){
						var index = parent.layer.getFrameIndex(window.name);
						parent.to_page(1);
						parent.layer.close(index);
					});
				}else{
					layer.msg('修改失败!',{icon:5,time:3000});
				} 
			}
		});
		return;
		
	});
	
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>