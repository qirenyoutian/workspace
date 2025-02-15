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
			<input type="text" class="input-text" value="${param.id}" placeholder="" id="channelId" name="channelId">
			<span id="rolespan" style="display:none;"><i style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>渠道名称：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" id="name" name="channelName">
			<span id="adminspan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>渠道联系人：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" autocomplete="off" id="contact" name="channelContact">
			<span id="pwdspan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	 <div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">渠道联系方式：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" autocomplete="off" id="contact_way" name="channelContactWay">
			<span id="namespan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>渠道样式：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<select id="channelStyle" class="input-text" ></select>
			<span style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>渠道支付方式：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<dl class="">
				<dt id="payment">
				   	<ul></ul>
				</dt>
			</dl>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>渠道下单接口地址：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" name="channelSingleInterfaceAddress" id="single_interface_address">
			<span style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>渠道收银台地址：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" name="channelCheckstandAddress" id="checkstand_address">
			<span style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" id="edit_channel" type="button" value="&nbsp;&nbsp;更新&nbsp;&nbsp;">
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
	//获取支付方式
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
	
	//获取渠道样式
	 /* $.ajax({
			url:"${APP_PATH}/getChannelStyle",
			type:"GET",
			success:function(result){
				var list = result.extend.list;
				var htmlStr = '';
	        	$.each(list,function(index,item){
	        		htmlStr += '<option style="text-align:center;" value="'+item.dictionaryId+'">'+item.dictionaryValue+'</option>';
	        	});
	        	$("#channelStyle").html(htmlStr);
			}
		});  */
	
	
	
	var channelId = $("#channelId").val();
	$.ajax({
		url:"${APP_PATH}/getPaymentByChannelId",
		data:{"channelId":channelId},
		type:"POST",
		success:function(result){
			var channel = result.extend.list;
			$.each(channel,function(index,item){
				$("#channelId").val(item.channelId);
				$("#name").val(item.channelName);
				$("#contact").val(item.channelContact);
				$("#contact_way").val(item.channelContactWay);
				//$("#style").val(item.channelStyle);
				 //获取渠道样式
				 $.ajax({
						url:"${APP_PATH}/getChannelStyle",
						type:"GET",
						success:function(result){
							var list = result.extend.list;
							
							//添加选择框的请选择
							var htmlStr = '<option style="text-align:center;"  value="0">'+"---请选择---"+'</option>';
							$("#channelStyle").html(htmlStr);
				        	
							//var htmlStr = '';
				        	$.each(list,function(index,item){
				        		htmlStr += '<option style="text-align:center;" value="'+item.dictionaryId+'">'+item.dictionaryValue+'</option>';
				        	});
				        	$("#channelStyle").html(htmlStr);
						}
					});
				$("#single_interface_address").val(item.channelSingleInterfaceAddress);
				$("#checkstand_address").val(item.channelCheckstandAddress);
				//获取支付方式
				$.each(item.payments,function(index,p){
					var checkBoxAll = $("input[name='paymentName']");
					var paymentId = p.paymentId;
					$.each(checkBoxAll,function(index,checkbox){
						var checkValue = $(checkbox).val();
				    	 if(paymentId == checkValue){
				    		$(checkbox).attr("checked",true);
				    	} 
					})
					
				})
			})
		}
	}); 

	 
});
	$("#edit_channel").click(function(){
		$.ajax({
			url: "${APP_PATH}/updateChannel",
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