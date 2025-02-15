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

<title>添加商品</title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-admin-update">
	<div class="row cl" style="display:none;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品id：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${param.id}" placeholder="" id="merchandiseId" name="merchandiseId">
			<span id="rolespan" style="display:none;"><i style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品名称：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" id="merchandiseName_update_input" name="merchandiseName">
			<span id="adminspan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<!-- <div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">商品编号：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<label id="merchandiseNumber_update_input"></label>
			<span id="pwdspan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div> -->
	 <div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">商户名称：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<select class="input-text" id="merchandiseCommercialTenantNumber_update_input" name="merchandiseCommercialTenantNumber_update_input"></select>
			<span id="namespan" style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品分类：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<select id="merchandiseClassify_update_input" name="merchandiseClassify" class="input-text" style="width: auto;padding: 0 2%;margin: 0;">
			</select>
			<span style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品价格：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<input type="text" class="input-text" name="merchandisePrice" id="merchandisePrice_update_input">
			<span style="display:none;"><i  style="color:red;"></i></span>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品图片：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:130px; float: left;">
			<label class="" for="xFile01"><div class="div">
				<img id="file01"  class="imgshow"  alt="" src=""></div></label>
			<input type="file" name="file01" accept="image/*" id="xFile01" class="file-btn" >
		</div>
		<div class="formControls col-xs-8 col-sm-9" style="width:130px; float: left;">
			
			<label class="" for="xFile02"><div class="div">
				<img id="file02"  class="imgshow"  alt="" src=""></div></label>
			<input type="file" name="file02" accept="image/*" id="xFile02" class="file-btn" >
			
		</div>
		<div class="formControls col-xs-8 col-sm-9" style="width:130px; float: left;">
			
			<label class="" for="xFile03"><div class="div">
				<img id="file03"  class="imgshow"  alt="" src=""></div></label>
			<input type="file" name="file03" accept="image/*" id="xFile03" class="file-btn" >
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">商品状态：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width:250px;">
			<label id="merchandiseStatus_update_input"></label>
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

<script type="text/javascript">
$(function(){
	var merchandiseId = $("#merchandiseId").val();
	$.ajax({
		url:"${APP_PATH}/getMerchandiseById",
		data:{"merchandiseId":merchandiseId},
		type:"GET",
		success:function(result){
			var menu = result.extend.list;
			$("#merchandiseId_update_input").val(menu.merchandiseId);
			$("#merchandiseName_update_input").val(menu.merchandiseName);
			//$("#merchandiseNumber_update_input").html(menu.merchandiseNumber);
			if(menu.commercialTenant != null){
		        var ab = new Array;
			    $("#merchandiseCommercialTenantNumber_update_input option").each(function(){
			    	var text = $(this).val();   //获取option值   
			        if(text != ''){
			        	ab.push(text);
			        }
		        var aa = menu.commercialTenant.commercialTenantId;
		        $.each(ab,function(index,checkbox){
				       	if(aa == checkbox){
				       		$("#merchandiseCommercialTenantNumber_update_input option[value='"+checkbox+"']").attr("selected","selected");
			    		}   
				})
			    });
			}else{
				$("#merchandiseCommercialTenantNumber_update_input").html("-");
			}
			$("#merchandiseClassify_update_input").val(menu.merchandiseClassify);
			$("#merchandisePrice_update_input").val(menu.merchandisePrice);
			if(menu.merchandiseImageUrl != null){
				$("#merchandiseImageUrl_update_input").attr("src",menu.merchandiseImageUrl);
				$("#default_image").css("display","none");
				$("#merchandiseImageUrl_update_input").css("display","block");
			}
			if(menu.merchandiseStatus == 0){
				$("#merchandiseStatus_update_input").html("未上架");
			}else if(menu.merchandiseStatus == 1){
				$("#merchandiseStatus_update_input").html("已上架");
			}else{
				$("#merchandiseStatus_update_input").html("-");
			}
			$("#file01").attr("src",menu.merchandiseImageUrl);
			$("#file02").attr("src",menu.merchandiseExhibitionImageUrl);
			$("#file03").attr("src",menu.merchandiseH5ImageUrl);
			$("#merchandiseTime_update_input").html(timestampToDateTime(menu.merchandiseTime));
			$("#merchandiseUploadTime_update_input").html(timestampToDateTime(menu.merchandiseUploadTime));
			$("#merchandiseUpdateTime_update_input").html(timestampToDateTime(menu.merchandiseUpdateTime));
		}
	}); 
	
	
	//修改
	$("#edit_admin").click(function(){
		var formData  =  new FormData(document.getElementById("form-admin-update"));
		
		//var text = $("#merchandiseCommercialTenantNumber_update_input").val(); 
		//alert(text);
		 $.ajax({
			url: "${APP_PATH}/updateMerchandise",
			 type: "POST",
		        data: formData,
		        async:false,
		        contentType: false,
		        processData: false,
		    	dataType: 'json',
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
	
	getClassify();
	getCommerName();
	
});
	//获取商户名称
	function getCommerName(){
		$("#merchandiseCommercialTenantNumber_update_input").html('');
		$.ajax({
			url: "${APP_PATH}/getCommercialTenantName",
	        type: "POST",
	        success: function(result){
	        	var list = result.extend.pageInfo;
	        	
	        	//添加选择框的请选择
				var htmlStr = '<option style="text-align:center;"  value="0">'+"---请选择---"+'</option>';
				$("#merchandiseCommercialTenantNumber_update_input").html(htmlStr);
				
	        	//var htmlStr = '';
	        	$.each(list,function(index,item){
	        		htmlStr += '<option style="text-align:center;" value="'+item.commercialTenantId+'">'+item.commercialTenantName+'</option>';
	        	});
	        	$("#merchandiseCommercialTenantNumber_update_input").html(htmlStr);
	        }
		});
	}

	

//获取商品分类
function getClassify(){
	$("#merchandiseClassify_update_input").html('');
	$.ajax({
		url: "${APP_PATH}/getClassify",
        type: "POST",
        async: false,
        success: function(result){
        	var list = result.object;
        	
        	//添加选择框的请选择
			var htmlStr = '<option style="text-align:center;"  value="0">'+"---请选择---"+'</option>';
			$("#merchandiseClassify_update_input").html(htmlStr);
			
        	//var htmlStr = '';
        	$.each(list,function(index,item){
        		htmlStr += '<option style="text-align:center;" value="'+item.merchandiseClassifyId+'">'+item.merchandiseClassifyName+'</option>';
        	});
        	$("#merchandiseClassify_update_input").html(htmlStr);
        }
	});
}


//图片处理
function image(id,imgId){
	var file = $('#'+id).get(0).files[0];
	var reader = new FileReader();
      var a = reader.readAsDataURL(file);  
      reader.onloadend = function(e){
        $('#'+imgId).attr("src",""+e.target.result+"");
        $('#'+imgId).css("display","block");
    }
}

function clickImage(){
	$("#fileId").click();
}

function changeImage(fileId,imgId,default_image){
	var file = $('#'+fileId).get(0).files[0];
	var reader = new FileReader();
      var a = reader.readAsDataURL(file);  
      reader.onloadend = function(e){
      $('#'+imgId).attr("src",""+e.target.result+"");
      $("#"+default_image).css("display","none");
      $('#'+imgId).css("display","block");
    }
}

/* 时间格式 */
function timestampToDateTime(timestamp) {
	if(timestamp != null){
	    var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
	    Y = date.getFullYear() + '-';
	    M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
	    D = (date.getDate()< 10 ? '0'+ date.getDate(): date.getDate()) + ' ';
	    h = (date.getHours()< 10 ? '0'+ date.getHours(): date.getHours()) + ':';
	    m = (date.getMinutes()< 10 ? '0'+ date.getMinutes(): date.getMinutes());
	    s = (date.getSeconds()< 10 ? '0'+ date.getSeconds(): date.getSeconds());
	    return Y+M+D+h+m;
	}else{
		return "-";
	}
}

</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>