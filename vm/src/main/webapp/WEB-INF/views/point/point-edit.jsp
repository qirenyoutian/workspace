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
	<form class="form form-horizontal" id="form-admin-add">
	<div class="row cl" style="display:none;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>id：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${param.id}" placeholder="" id="pointId" name="pointId">
			<span id="rolespan" style="display:none;"><i style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>点位名称：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" id="pointName" name="pointName">
			<span id="adminspan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>省：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<select id="province" class="input-text" name="pointProvince">
            	<option value="">请选择</option><option value="110000">北京市</option><option value="120000">天津市</option><option value="130000">河北省</option><option value="140000">山西省</option><option value="150000">内蒙古</option><option value="210000">辽宁省</option><option value="220000">吉林省</option><option value="230000">黑龙江省</option><option value="310000">上海市</option><option value="320000">江苏省</option><option value="330000">浙江省</option><option value="340000">安徽省</option><option value="350000">福建省</option><option value="360000">江西省</option><option value="370000">山东省</option><option value="410000">河南省</option><option value="420000">湖北省</option><option value="430000">湖南省</option><option value="440000">广东省</option><option value="450000">广西省</option><option value="460000">海南省</option><option value="500000">重庆市</option><option value="510000">四川省</option><option value="520000">贵州省</option><option value="530000">云南省</option><option value="540000">西藏自治区</option><option value="610000">陕西省</option><option value="620000">甘肃省</option><option value="630000">青海省</option><option value="640000">宁夏省</option><option value="650000">新疆自治区</option><option value="710000">台湾省</option><option value="810000">香港</option><option value="820000">澳门</option><option value="90000">外国</option>
            </select>
			<span id="pwdspan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	 <div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">市：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<select id="city" class="input-text" name="pointCity"></select>
			<span id="namespan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>区：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<select id="area" class="input-text" name="pointDistrict"></select>
			<span style="display:none;"><i style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>详细位置（街道）：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" name="pointAddress" id="pointAddress">
			<span style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="edit_admin" type="button" value="&nbsp;&nbsp;更新&nbsp;&nbsp;">
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
	var pointId = $("#pointId").val();
	$.ajax({
		url:"${APP_PATH}/getPointById",
		data:{"pointId":pointId},
		type:"GET",
		success:function(result){
			var menu = result.extend.menu;
			var areas = menu.areas;
			$("#pointId").val(menu.pointId);
			$("#pointName").val(menu.pointName);
			$.each(areas,function(i,area){
				if(area.type == 1){
					$("#province").val(area.id);
					province(area.id);
				}
				if(area.type == 2){
					$("#city").val(area.id);
					city(area.id);
				}
				if(area.type == 3){
					$("#area").val(area.id);
				}
			})
			$("#pointAddress").val(menu.pointAddress);
		}
	}); 
	
	$("#edit_admin").click(function(){
		$.ajax({
			url: "${APP_PATH}/updatepoint",
			type: 'POST',
			data: $("#form-admin-add").serialize(),
			async:false,
			success: function(result){
				 var a = result.code;
				if (a == 100) {
					layer.msg('修改成功!',{icon:1,time:2000},function(){
						var index = parent.layer.getFrameIndex(window.name);
						parent.location.reload();
						parent.layer.close(index);
					});
				}else{
					layer.msg('修改失败!',{icon:5,time:3000});
				} 
			}
		});
		return;
		
	});
	
	$("#province").change(function(){
		var t = $(this).val();
		province(t);
	});
	function province(t){
		$.grep(cities,function(value){
			if(value.parent==t){
				var list = value.list;
				var html = "";
				var str = "";
				html += "<option value=''>请选择</option>";
				for(var i = 0; i<list.length ; i++){
					str ="<option value='"+list[i].id+"'>"+list[i].name+"</option>";
					html += str;
				}
				$("#city").html(html);
			}
		});
	}
	$("#city").change(function(){
		var t = $(this).val();
		city(t);
	});
	function city(t){
		$.grep(counties,function(value){
			if(value.parent==t){
				var list = value.list;
				var html = "";
				var str = "";
				html += "<option value=''>请选择</option>";
				for(var i = 0; i<list.length ; i++){
					str ="<option value='"+list[i].id+"'>"+list[i].name+"</option>";
					html += str;
				}
				$("#area").html(html);
			}
		});
	}
	
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>