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


<title>添加点位</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-bigware-add">
	 <div class="row cl" style="display:none;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>仓库id：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${param.id}" placeholder="" id="bigWarehouseId" name="bigWarehouseId">
		</div>
	</div>
	 <div class="row cl" style="display:none;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品id：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${param.merchandiseId}" placeholder="" id="merchandiseId" name="merchandiseId">
		</div>
	</div>
	
	<div class="row cl" id="merchandiseDIV">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品名称：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;" id="merchandise">
		</div>
	</div>
	
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品库存：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" name="Inventory" id="Inventory">
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="save_bigwareInventory" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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

<script src="${APP_PATH }/static/page/js/map.js"></script> 
<script type="text/javascript">
$(function(){
	//加载商品名称
	var merchandiseId = $("#merchandiseId").val();
			$.ajax({
				url:"${APP_PATH}/getMerchandiseById",
				data:{'merchandiseId':merchandiseId},
				type:"POST",
				success:function(result){
					var merchandiseName = result.extend.list;
					$("#merchandise").text(merchandiseName.merchandiseName);
				}
			});
	//加载库存信息
	var bigWarehouseId = $("#bigWarehouseId").val();
			$.ajax({
				url:"${APP_PATH}/getInventoryById",
				data:{'bigWarehouseId':bigWarehouseId},
				type:"POST",
				success:function(result){
					var inventory = result.extend.list;
					$.each(inventory,function(index,item){
						$("#Inventory").val(item.bigWarehouseInventoryCount);
					})
				}
			});
});
		
		$("#save_bigwareInventory").click(function(){
			
			var merchandiseId = $("#merchandise").val();//getInventoryByMerchandise
			var flag;
				$.ajax({
					url: "${APP_PATH}/getInventoryByMerchandise",
					type: 'POST',
					data: {"MerchandiseId":merchandiseId},
					async:false,
					success: function(result){
						flag = result.code;
					}
				});
			if (flag == 200) {
				layer.confirm('该商品已存在，确定重复添加？',function(index){
					$.ajax({
						url: "${APP_PATH}/saveBigwareInventory",
						type: 'POST',
						data: $("#form-bigware-add").serialize(),
						async:false,
						success: function(result){
							if (result.code == 100) {
								layer.msg('添加成功!',{icon:1,time:2000},function(){
									var index = parent.layer.getFrameIndex(window.name);
									parent.to_page(1);
									parent.layer.close(index);
								});
							}else{
								layer.msg(result.extend.msg,{icon:5,time:3000});
							} 
						}
					});
				})
			}else{

				$.ajax({
					url: "${APP_PATH}/saveBigwareInventory",
					type: 'POST',
					data: $("#form-bigware-add").serialize(),
					async:false,
					success: function(result){
						if (result.code == 100) {
							layer.msg('添加成功!',{icon:1,time:2000},function(){
								var index = parent.layer.getFrameIndex(window.name);
								parent.to_page(1);
								parent.layer.close(index);
							});
						}else{
							layer.msg(result.extend.msg,{icon:5,time:3000});
						} 
					}
				});
			}
			
		});


</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>