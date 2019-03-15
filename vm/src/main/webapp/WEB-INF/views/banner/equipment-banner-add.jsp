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
	width:120px;
	height:120px;
	border: dashed 1.5px #C0C0C0;
	position: relative;
	cursor: pointer;
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
	width: 120px;
	height: 120px;
}
</style>

<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-admin-add" enctype="multipart/form-data">
	
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"></label>
		<div class="formControls col-xs-8 col-sm-9" style="width:130px; float: left;">
			<label class="" for="xFile01">
				<div class="div">
					<img class="img" id="add01" alt="" src="../../../static/images/add.jpg">
					<img id="file01"  class="imgshow"  alt="" src="">
				</div>
			</label>
			<input type="file" name="file01" id="xFile01" class="file-btn" >
		</div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" style="margin-left:20px;" id="save_banner" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
	
	//获取显示第一张图片
	$("#xFile01").change(function(){
		var file = $('#xFile01').get(0).files[0];
		var reader = new FileReader();
	      var a = reader.readAsDataURL(file);  
	      //alert(a);
	      reader.onloadend = function(e){
	        $('#file01').attr("src",""+e.target.result+"");
	        $("#add01").css("display","none");
	        $('#file01').css("display","block");
	    }
	})
	
	
	$("#save_banner").click(function(){
		var formData  =  new FormData(document.getElementById("form-admin-add"));
		$.ajax({
			url: "${APP_PATH}/saveBanner",
	        type: "POST",
	        data: formData,
	        async:false,
	        contentType: false,
	        processData: false,
	    	dataType: 'json',
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
	});

});


</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>