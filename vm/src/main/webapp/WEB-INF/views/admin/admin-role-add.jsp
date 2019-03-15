<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!--_meta 作为公共模版分离出去-->
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

<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>角色添加</title>
</head>
<style>
	.input-text{
		width:250px;
	}

</style>
<body>
<article class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-admin-role-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="roleName" name="roleName">
				<span id="rolespan" style="display:none;"><i style="color:red;"></i></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="roleNote" name="roleNote">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">角色权限：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<dl class="">
					<dt id="roleMenu">
					   	<ul></ul>
					</dt>
				</dl>
				
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<button type="button" class="btn btn-success radius" id="role_save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
			</div>
		</div>
	</form>
</article>

 <!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/layer/2.4/layer.js"></script>
<%--<script type="text/javascript" src="${APP_PATH }/static/page/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/login/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery.validation/1.14.0/messages_zh.js"></script> --%>
<script type="text/javascript">
$(function(){
	
	 $.ajax({
		url:"${APP_PATH}/getMenu",
		type:"GET",
		success:function(result){
			var menu = result.extend.pageInfo;
				 $.each(menu,function(index,item){
					//var li = $("#roleMenu ul");
					var checkBoxTd = $("<input type='checkbox' class='check_item'/>");
					checkBoxTd.attr("value",this.menuId).attr("name","menuName");
					var menuName = this.menuName;
					var spance = $("<br/>");
					$("<lable><li></li></lable>").append(checkBoxTd)
								  .append(menuName)
								  .append(spance)
						.appendTo("#roleMenu ul");
						
				})
		}
	}); 
	
	//检测角色名
			function checkRole(){
			var rolename = $("#roleName").val();
			if (rolename == "" || rolename == " ") {
				$("#rolespan").show();
				$("#rolespan i").text("角色名不能为空！");
				return false;
			}else {
				var b = false;
				$.ajax({
					url:"${APP_PATH}/checkRoleName",
					data:{"roleName":rolename},
					type:'POST',
					async:false,
					success:function(result){
						var a = result.code;
						if (a == 100) {
							$("#rolespan").show();
							$("#rolespan i").text("角色名已存在！");
							b = false;
							return b;
						}else{
							$("#rolespan").hide();
							b = true;
							return b;
						}
					}
				})
				return b;
			}
		}
		/* function checkMenu(){
			var a = false;
			 $.each($('input:checkbox'),function(){
				 if(this.checked){
					 a = true;
					return a;				 
				 }
				 return a;
			  })
				 return a;
		} */
		//保存角色
			$("#role_save").click(function(){
				var a = checkRole();
				//var b = checkMenu();
				//alert(a);
				if (a == true) {
					$.ajax({
						url: "${APP_PATH}/saveRole",
						type: 'POST',
						data: $("#form-admin-role-add").serialize(),
						async:false,
						success: function(result){
							 var a = result.extend.msg;
							if (a == 1) {
								//alert("1111");
								layer.msg('添加成功!',{icon:1,time:2000},function(){
									var index = parent.layer.getFrameIndex(window.name);
									parent.to_page();
									parent.layer.close(index);
								});
							}else{
								layer.msg('添加失败!',{icon:5,time:3000});
							} 
						}
					});
					return;
				}else{
					layer.msg('验证出问题！',{icon:5});
					return;
				}
				});
				
	
/* 	
	$("#form-admin-role-add").validate({
		rules:{
			roleName:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}
	}); */
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>