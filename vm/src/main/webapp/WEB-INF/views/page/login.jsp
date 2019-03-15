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
<![endif]-->
<link href="${APP_PATH }/static/page/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${APP_PATH }/static/login/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="${APP_PATH }/static/login/css/style.css" rel="stylesheet" type="text/css" />
<link href="${APP_PATH }/static/login/css/hui.css" rel="stylesheet" type="text/css" />
<link href="${APP_PATH }/static/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${APP_PATH }/static/login/js/hui.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>便利通后台登录</title>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="adminAccount" name="adminAccount" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="adminPassWord" name="adminPassWord" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <span id="login_msg" style="width:150px;height:35px;display: none;"></span>
<!--       <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
          <img src=""> <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div>
      </div> -->
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online">
            <input type="checkbox" name="online" id="online" value="">
            使我保持登录状态</label>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" id="login" type="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 便利通有限公司</div>
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/page/js/H-ui.min.js"></script>
<script type="text/javascript">
	
	$(document).keyup(function(event){
		  if(event.keyCode ==13){
		    $("#login").trigger("click");
		  }
		});
	
	
	hui('#login').click(function(){
		var a = $("#adminAccount").val();
		var b = $("#adminPassWord").val();
		$.ajax({
			url:"${APP_PATH}/Login",
			type:"POST",
			data:{"adminAccount":a,"adminPassWord":b},
			success:function(result){
				if(result.code == 100){
					location.href="/web/jumpIndex";				
				}
					hui.iconToast(result.extend.msg);
			}
		})
	});
</script>
</body>
</html>