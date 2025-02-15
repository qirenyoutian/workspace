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
<style>
.file-btn{
	width: 100px;
	height: 100px;
	background-color:black;
	position:absolute;
	clip:rect(0 0 0 0);
}
.div{
	width:100px;
	height:100px;
	border: dashed 1.5px #C0C0C0;
	position: relative;
	cursor: pointer;
}

.aaa{
	width:100px;
	height:32px;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
}
.img{
	width:30px;
	height: 30px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -15px; /* 高度的一半 */
    margin-left: -15px; /* 宽度的一半 */
}
.imgshow{
	width: 100px;
	height: 100px;
}
</style>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-commer-add">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户名称：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" id="commercialTenantName" name="commercialTenantName">
			<span id="adminspan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系人：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" id="commercialTenantPerson" name="commercialTenantPerson">
			<span style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系方式：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" id="commercialTenantPhone" name="commercialTenantPhone">
			<span style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	 <div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">联系地址：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" autocomplete="off" id="commercialTenantAttr" name="commercialTenantAttr">
			<span id="namespan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户描述：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" autocomplete="off" id="commercialTenantDescribe" name="commercialTenantDescribe">
			<span id="pwdspan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>支付方式：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<dl class="">
				<dt id="payment">
				   	<ul></ul>
				</dt>
			</dl>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户logo：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:100px;">
			<label class="" for="xFile01">
				<div class="div"><img id="file01"  class="imgshow"  alt="" src=""></div>
			</label>
			<input type="file" name="file01" accept="image/*" id="xFile01" class="file-btn" >
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商户官网：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" name="commercialTenantOfficialWebsite" id="commercialTenantOfficialWebsite">
			<span style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="save_commer" type="button" value="&nbsp;&nbsp;添加&nbsp;&nbsp;">
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
	//提前加载支付方式
	 $.ajax({
			url:"${APP_PATH}/getPaymentAll",
			type:"GET",
			success:function(result){
				var payment = result.extend.pageInfo;
					 $.each(payment,function(index,item){
						//var li = $("#roleMenu ul");
						var checkBoxTd = $("<input type='checkbox' class='check_item'/>");
						checkBoxTd.attr("value",this.paymentId).attr("name","paymentName");
						var paymentName = this.paymentName;
						var spance = $("<br/>");
						$("<lable><li></li></lable>").append(checkBoxTd)
									  .append(paymentName)
									  .append(spance)
							.appendTo("#payment ul");
							
					})
			}
		});
	
	
	
});
		
		$("#save_commer").click(function(){
			var formData  =  new FormData(document.getElementById("form-commer-add"));
			//alert(a);
			
	 		$.ajax({
				url: "${APP_PATH}/saveCommer",
				type: 'POST',
				data: formData,
		        async:false,
		        contentType: false,
		        processData: false,
		    	dataType: 'json',
				success: function(result){
					 var a = result.code;
					if (a == 100) {
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