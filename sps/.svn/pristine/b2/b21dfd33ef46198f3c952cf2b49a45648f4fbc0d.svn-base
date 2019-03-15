<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>共享停车位后台管理</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"
	href="${APP_PATH }/static/login/css/bootstrap.css">
<link href="iconfont/style.css"
	type="${APP_PATH }/static/login/text/css" rel="stylesheet">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	color: #fff;
	font-family: "微软雅黑";
	font-size: 14px;
}

.wrap1 {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	margin: auto
} /*把整个屏幕真正撑开--而且能自己实现居中*/
.main_content {
	background: url(${APP_PATH }/static/login/images/main_bg.png) repeat;
	margin-left: auto;
	margin-right: auto;
	text-align: left;
	float: none;
	border-radius: 8px;
}

.form-group {
	position: relative;
}

.login_btn {
	display: block;
	background: #3872f6;
	color: #fff;
	font-size: 15px;
	width: 100%;
	line-height: 50px;
	border-radius: 3px;
	border: none;
}

.login_input {
	width: 100%;
	height:50px;
	border: 1px solid #3872f6;
	border-radius: 3px;
	line-height: 40px;
	padding: 2px 5px 2px 30px;
	background: none;
}

.icon_font {
	position: absolute;
	bottom: 15px;
	left: 10px;
	font-size: 18px;
	color: #3872f6;
}

.font16 {
	font-size: 16px;
}

.mg-t20 {
	margin-top: 20px;
}

@media ( min-width :200px) {
	.pd-xs-20 {
		padding: 20px;
	}
}

@media ( min-width :768px) {
	.pd-sm-50 {
		padding: 50px;
	}
}

#grad {
	background: -webkit-linear-gradient(#4990c1, #52a3d2, #6186a3);
	/* Safari 5.1 - 6.0 */
	background: -o-linear-gradient(#4990c1, #52a3d2, #6186a3);
	/* Opera 11.1 - 12.0 */
	background: -moz-linear-gradient(#4990c1, #52a3d2, #6186a3);
	/* Firefox 3.6 - 15 */
	background: linear-gradient(#4990c1, #52a3d2, #6186a3); /* 标准的语法 */
}
</style>

</head>

<body
	style="background:url(${APP_PATH }/static/login/images/bg.jpg) no-repeat;">

	<div class="container wrap1" style="height: 450px;">
		<h2 class="mg-b20 text-center">共享停车位后台管理登录页面</h2>
		<div
			class="col-sm-8 col-md-5 center-auto pd-sm-50 pd-xs-20 main_content">
			<p class="text-center font16">用户登录</p>
			<form>
				<div class="form-group mg-t20">
					<i class="icon-user icon_font"></i> <input type="text"
						class="login_input" id="account" placeholder="请输入用户名" />
				</div>
				<div class="form-group mg-t20">
					<i class="icon-lock icon_font"></i> <input type="password"
						class="login_input" id="password" placeholder="请输入密码" />
				</div>
				<div class="checkbox mg-b25">
					<i style="float: right;" title="请联系桂林金铱星科技发展有限公司，联系电话：0773-2316235">
						<a href="JavaScript:void(0);" onclick="msg()" style="color: white; text-decoration: none;">忘记密码？</a>
					</i>
				</div>
				<button type="button" onclick="login()" class="login_btn">登录</button>
			</form>
		</div>
		<!--row end-->
	</div>
	<!--container end-->
	<div class="alert alert-danger alert-dismissable"
		style="display: none;text-align: center;" id="alertDangerDiv">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">&times;</button>
		<span id="alertDangerDivSpan">错误！请进行一些更改。</span>
	</div>
	<div class="alert alert-success alert-dismissable"
		style="display: none;" id="alertSuccessDiv">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">&times;</button>
		<span id="alertSuccessDivSpan">登录成功。</span>
	</div>
	<script type="text/javascript">
	function snap() {
		$.ajax({
			url : "${APP_PATH}/snap/snap",
			data :JSON.stringify({
				"camera_ip":"192.168.18.199", 
				"photograph1":""
			}),
			type : "POST",
			contentType: "application/json; charset=utf-8",  
	        dataType: "json",  
			success : function(result) {
				if (result.code == 100) {
					alert("ok")
				}
			}
		})
	}
	function snapshot() {
		$.ajax({
			url : "http://39.108.239.193:8081/snapshot",
			data :JSON.stringify({
				"camera_ip":"192.168.18.199"
			}),
			type : "POST",
			contentType: "application/json; charset=utf-8",  
	        dataType: "json",  
			success : function(result) {
				if (result.code == 100) {
					alert("ok")
				}
			}
		})
	}
	        
	function monitoringInformation() {
		$.ajax({
			url : "${APP_PATH}/monitoringInformation",
			data :JSON.stringify({
				"cameraName":"camera", 
		        "cameraIp":"192.168.1.194",
		        "cameraMemTotal":171,
		        "cameraMemUsed":126,
		        "cameraMemFree":45,
		        "cameraCpuRate":6.12,
		        "cameraApp":1,
		        "cameraRTMP":"rtmp://222.52.51.133/oflaDemo/194", 
		        "cameraLng":"110.30963500000",
		        "cameraLat":"25.3347330000"
				}),
			type : "POST",
			contentType: "application/json; charset=utf-8",  
	        dataType: "json",  
			success : function(result) {
				if (result.code == 100) {
					alert("ok")
				}
			}
		})
	}
	function enterOrAppear() {
		$.ajax({
			url : "${APP_PATH}/enterOrAppear",
			data :JSON.stringify({
				"camera_ip":"192.168.1.197",
				"truck_space":"25",
				"routeName":"桂林市七星区毅峰路",
				"license_plate":"浙B3DH27",
				"license_plate_image":"",
				"photograph1":"",
				"photograph2":"",
				"video":"",
				"triggerDate":"2018-01-17 11:00:00",
				"type":1,
				}),
			type : "POST",
			contentType: "application/json; charset=utf-8",  
	        dataType: "json",  
			success : function(result) {
				if (result.code == 100) {
					alert("ok")
				}
			}
		})
	}
		function login() {
			var account = $("#account").val();
			var password = $("#password").val();
			var i = verification(account, password);
			if (i == 0) {
				$("#alertDangerDiv").hide();
				//开始登录
				$.ajax({
					url : "${APP_PATH}/loginAdmin",
					data : {
						"account" : account,
						"password" : password
					},
					type : "POST",
					success : function(result) {
						if (result.code == 100) {
							//成功
							$("#alertSuccessDiv").show();
							window.location.href = '${APP_PATH}/jumpIndex';
						} else {
							//失败
							$("#alertDangerDivSpan").html(
									result.extend.va_msg);
							$("#alertDangerDiv").show();
						}
						/* //console.log(result);
						//1、解析并显示城市数据
						build_roles_table(result);
						//2、解析并显示分页信息
						build_page_info(result);
						//3、解析显示分页条数据
						build_page_nav(result); */
					}
				});
			}
			/* alert(i);
			alert($("#account").val());
			if($("#account").val() == ""){
				alert($("#account").val());
			} */
			/* $.ajax({
				url:"${APP_PATH}/getByCityAll",
				data:{"pn":pn,"content":$("#content").val()},
				type:"GET",
				success:function(result){
					//console.log(result);
					//1、解析并显示城市数据
					build_roles_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			}); */
		}
		function verification(account, password) {
			var type = 0;
			if (account == "") {
				$("#alertDangerDivSpan").html("账号不能为空，请进行更改。");
				$("#alertDangerDiv").show();
				type = 1;
				return type;
			}
			if (password == "") {
				$("#alertDangerDivSpan").html("密码不能为空，请进行更改。");
				$("#alertDangerDiv").show();
				type = 1;
				return type;
			}
			return type;
		}
		$(".close").click(function(){
			location.reload();
		})
		
		function msg(){
			$('#alertDangerDivSpan').html('请联系桂林金铱星科技发展有限公司，联系电话：0773-2316235');
			$('#alertDangerDiv').show();
		}
		
		
		
	</script>
</body>
</html>