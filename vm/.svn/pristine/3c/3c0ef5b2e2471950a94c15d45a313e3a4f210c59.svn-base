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


<title>货道编辑</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="#form-Aisle-edit">
	<div class="row cl" style="display:none;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>货道id：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${param.id}" placeholder="" id="aisleId" name="aisleId">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>货道编号：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" id="aisleNumber" name="aisleNumber">
		</div>
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
			<select id="merchandise"  name="merchandiseId" class="input-text">
			    <option value="0">----请选择----</option>
			</select>
		</div>
	</div>
	<div class="row cl" id="channelMerchandiseDIV">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>选择渠道商品名称：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<select id="channelMerchandiseId"  name="channelMerchandiseId" class="input-text">
			    <option value="0">----请选择----</option>
			</select>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>货道库存：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" id="aisleInventory" name="aisleInventory">
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="save_Aisle" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
	//提前加载编辑的内容
	var aisleId = $("#aisleId").val();
	$.ajax({
		url:"${APP_PATH}/getAisleInventoryByAisleId",
		data:{"aisleId":aisleId},
		type:"GET",
		async:false,
		success:function(result){
			var aisle = result.extend.pageInfo;
			$.each(aisle,function(index,item){
				$("#aisleNumber").val(item.aisleNumber);
				$("#merchandiseNum").val(item.aisleInventorie.merchandise.merchandiseNumber);
				$("#aisleInventory").val(item.aisleInventorie.aisleInventoryCount);
				
			})
		}
	});
	//getCommercialTenantName
	//装载商户名称
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
	//选择商品
	$("#commercial").change(function(){//
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
				var ele = $("#merchandise");
				var optionEle = $("<option></option>").append("---请选择---").attr("value",0);
					optionEle.appendTo(ele);
						$.each(point,function(index,p){
							optionEle = $("<option></option>").append(p.merchandiseName).attr("value",p.merchandiseId);
							optionEle.appendTo(ele);
							
						})
				}
			});
			
		} 
		
	})
	
	//选择渠道商品名称
	$("#merchandise").change(function(){
		var merchandiseId = $(this).val();
		if (merchandiseId != 0) {
			//alert(commId);
			$("#channelMerchandiseDIV").find("option").remove();
			
			$.ajax({
				url:"${APP_PATH}/getChannelMerchandiseById",
				data:{'MerchandiseId':merchandiseId},
				type:"POST",
				success:function(result){
				var channelMerchandise = result.extend.list;
						$.each(channelMerchandise,function(index,p){
							var ele = $("#channelMerchandiseId");
							var optionEle = $("<option></option>").append("---请选择---").attr("value",0);
							optionEle.appendTo(ele);
								optionEle = $("<option></option>").append(p.channelMerchandiseName).attr("value",p.channelMerchandiseId);
							optionEle.appendTo(ele);
							
						})
				}
			});
			
		} 
		
	})
	
	
	
	

	$("#save_Aisle").click(function(){
		
		var aisleId = $("#aisleId").val();
		var merchandiseNum =  $("#merchandise").val();
		var aisleNumber =  $("#aisleNumber").val();
		var aisleInventory =  $("#aisleInventory").val();
		var channelMerchandiseId =  $("#channelMerchandiseId").val();
		
		//alert(merchandiseNum);
		 $.ajax({
			url:"${APP_PATH}/saveAisle",
			type:'POST',
			data:{"aisleId":aisleId,"merchandiseNum":merchandiseNum,"aisleInventory":aisleInventory,"aisleNumber":aisleNumber,"channelMerchandiseId":channelMerchandiseId},
			async:false,
			success:function(result){
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
		
	})


</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>