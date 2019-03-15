<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="keywords" content="scclui框架">
<meta name="description" content="scclui为轻量级的网站后台管理系统模版。">
<title>首页</title>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${APP_PATH }/static/fileinput/css/bootstrap.min.css" rel="stylesheet">
<link href="${APP_PATH }/static/fileinput/css/bootstrap-fileinput.css" rel="stylesheet">
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/swfobject/swfobject.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/swfobject/fullAvatarEditor.js"></script>
<link rel="stylesheet" href="${APP_PATH }/static/common/layui/css/layui.css">

<!-- 弹出窗口 -->
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/window/css/xcConfirm.css"/>
<script src="${APP_PATH }/static/window/js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
<script src="${APP_PATH }/static/window/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
.sgBtn{width: 135px; height: 35px; line-height: 35px; margin-left: 10px; margin-top: 10px; text-align: center; background-color: #0095D9; color: #FFFFFF; float: left; border-radius: 5px;}
</style>

<!-- 删除时确认窗口 -->
<script src="static/js/bootbox.js"></script>
<link rel="stylesheet" href="${APP_PATH }/static/common/css/sccl.css">
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/common/skin/qingxin/skin.css" id="layout-skin" />
</head>

<body>

<!-- 搭建主页面 -->
	<div class="layout-admin">
		<header class="layout-header"> <span class="header-logo">共享停车位后台管理系统</span>
		<a class="header-menu-btn" href="javascript:;"><i
			class="icon-font">&#xe600;</i></a>
		<ul class="header-bar">
			<li class="header-bar-role"><a href="javascript:;">${roleName}</a></li>
			<li class="header-bar-nav"><a href="javascript:;">${Admin.adminAccount}<i
					class="icon-font" style="margin-left: 5px;">&#xe60c;</i></a>
				<ul class="header-dropdown-menu">
					<li><a href="javascript:Persona();">个人信息</a></li>
					<li><a href="javascript:SwitchUser();">切换账户</a></li>
					<li><a href="javascript:LoginOut();">退出</a></li>
				</ul></li>
			<li class="header-bar-nav"><a href="javascript:;" title="换肤">
					<i class="icon-font">&#xe608;</i>
			</a>
				<ul class="header-dropdown-menu right dropdown-skin">
					<li><a href="javascript:;" data-val="qingxin" title="清新">清新</a></li>
					<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
					<li><a href="javascript:;" data-val="molv" title="墨绿">墨绿</a></li>
				</ul></li>
		</ul>
		</header>
		<aside class="layout-side">
		<ul class="side-menu">

		</ul>
		</aside>

		<div class="layout-side-arrow">
			<div class="layout-side-arrow-icon">
				<i class="icon-font">&#xe60d;</i>
			</div>
		</div>

		<section class="layout-main">
		<div class="layout-main-tab">
			<button class="tab-btn btn-left">
				<i class="icon-font">&#xe60e;</i>
			</button>
			<nav class="tab-nav">
			<div class="tab-nav-content">
				<a href="javascript:;" class="content-tab active" data-id="home.jsp">${Admin.adminAccount}首页</a>
				<input type="text" id="roleId" name="roleId" value="${roleId}"
					style="display: none" />

			</div>
			</nav>
			<button class="tab-btn btn-right">
				<i class="icon-font">&#xe60f;</i>
			</button>
		</div>
		<div class="layout-main-body">
			<iframe class="body-iframe" name="iframe0" width="100%" height="99%"
				src="home.jsp" frameborder="0" data-id="home.jsp" seamless></iframe>
		</div>
		</section>
		<div class="layout-footer">COPYRIGHT (©) 2018 桂林金铱星科技发展有限公司</div>
	</div>
	<script type="text/javascript"
		src="${APP_PATH }/static/common/lib/jquery-1.9.0.min.js"></script>
	<script type="text/javascript"
		src="${APP_PATH }/static/common/js/sccl.js"></script>
	<script type="text/javascript"
		src="${APP_PATH }/static/common/js/sccl-util.js"></script>
	<script type="text/javascript"
		src="${APP_PATH }/static/fileinput/js/bootstrap-fileinput.js"></script>
	<script>
		function LoginOut(){
			window.location.href = '${APP_PATH}/jumpLogin';
		}
		
		function Persona(){
				var id = ${Admin.adminId };
			$.ajax({
				url:"${APP_PATH}/getAdminById/"+id,
				type:"GET",
				success:function(result){
					var admin = result.extend.admin;
					
					var txt= "账号："+admin.adminAccount+"<br/>"
					+"密码："+admin.adminPassWord+"<br/>"
					+"真实姓名："+admin.adminRealname+"<br/>"
					+"联系电话："+admin.adminPhoto+"<br/>"
					+"邮箱地址："+admin.adminEmail+"<br/>"
					
					window.wxc.xcConfirm(txt,window.wxc.xcConfirm.typeEnum.info);
				}
			});
			
			
		}
		
		function SwitchUser(){
			window.location.href = '${APP_PATH}/jumpLogin';
		}
		
	</script>
		
</body>
</html>
