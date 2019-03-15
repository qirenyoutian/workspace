﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/page/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/skin/green/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/style.css" />
<title>便利通后台管理</title>
</head>
<style>
.mysel{
margin-left:50px;
margin-top:10px;
}
/* ul>li{
	padding-left:15px;
} */
</style>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">便利通系统</a> 
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>${adminRole}</li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A">${adminAccount} <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:void(0);" onClick="myselfinfo()">个人信息</a></li>
						<li><a href="#">切换账户</a></li>
						<li><a href="javascript:void(0)" onclick="loginOut()">退出</a></li>
				</ul>
			</li>
				<!-- <li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li> -->
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2" id = "messageDIV">
	<dl id="adminMessage">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 账号管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="/web/AdminList" data-title="账号列表" href="javascript:void(0)"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;账号列表</a></li>
					<!-- <li><a data-href="/web/AdminRole" data-title="角色管理" href="javascript:void(0)"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;角色管理</a></li> -->
					<!-- <li><a data-href="/web/AdminPermission" data-title="权限管理" href="javascript:void(0)"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;权限管理</a></li> -->
			</ul>
		</dd>
	</dl>
	<dl id="equipmentMessage">
			<dt><i class="Hui-iconfont">&#xe63c;</i> 设备管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="/web/jumpEquipmentManage" data-title="设备类型" href="javascript:void(0)"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;设备类型</a></li>
					<li><a data-href="/web/jumpEquipment" data-title="设备管理" href="javascript:void(0)"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;设备管理</a></li>
					<li><a data-href="/web/jumpEquipmentMessage" data-title="设备监控" href="javascript:void(0)"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;设备监控</a></li>
					<li><a data-href="/web/jumpEquipmentBanner" data-title="广告设置" href="javascript:void(0)"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;广告设置</a></li>
			</ul>
		</dd>
	</dl>
	<dl id="channelMessage">
			<dt><i class="Hui-iconfont">&#xe66a;</i> 渠道商品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="/web/CommercialTenantList" data-title="商户列表" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;商户列表</a></li>
					<li><a data-href="/web/CommodityList" data-title="商品列表" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;商品列表</a></li>
					<li><a data-href="/web/ChannelList" data-title="渠道列表" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;渠道列表</a></li>
					<li><a data-href="/web/MerchandiselList" data-title="渠道商品列表" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;渠道商品列表</a></li>
				</ul>
		</dd>
	</dl>
	<dl id="pointMessage">
			<dt><i class="Hui-iconfont">&#xe6c9;</i> 点位管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="/web/PointList" data-title="点位列表" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;点位列表</a></li>
				</ul>
		</dd>
	</dl>
	
	<dl id="orderMessage">
			<dt><i class="Hui-iconfont">&#xe687;</i> 订单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="/web/jumpOrder" data-title="订单管理" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;订单管理</a></li>
					<!-- <li><a data-href="" data-title="取货码" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;取货码</a></li> -->
				</ul>
		</dd>
	</dl>
	<dl id="inventoryMessage">
			<dt><i class="Hui-iconfont">&#xe6b5;</i> 库存管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<!-- <li><a data-href="/web/jumpSideboard" data-title="边柜库存" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;边柜库存</a></li> -->
					<li><a data-href="/web/jumpbigWarehouse" data-title="大仓库存" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;大仓库存</a></li>
				</ul>
		</dd>
	</dl>
	<dl id="dataMessage">
			<dt><i class="Hui-iconfont">&#xe61e;</i> 数据分析<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="/web/jumpPointQuery" data-title="点位销售报表" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;点位销售报表</a></li>
					<li><a data-href="/web/jumpCommerReport" data-title="商户销售报表" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;商户销售报表</a></li>
					<li><a data-href="/web/jumpMerchandiseRank" data-title="商品销售报表" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;商品销售报表</a></li>
				</ul>
		</dd>
	</dl>
	<dl id="papaMessage">
			<dt><i class="icon Hui-iconfont">&#xe6f5;</i> 运营管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="/web/jumpPavePlan" data-title="铺货计划" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;铺货计划</a></li>
					<li><a data-href="/web/jumpPaveRecord" data-title="铺货记录" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;铺货记录</a></li>
					<!-- <li><a data-href="/web/jumpPaveQuery" data-title="铺货记录查询" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;铺货记录查询</a></li> -->
					<li><a data-href="/web/jumpQuestion" data-title="跟办问题" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;跟办问题</a></li>
					<!-- <li><a data-href="/web/jumpQuestionQuery" data-title="跟办问题查询" href="javascript:;"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;跟办问题查询</a></li> -->
				</ul>
		</dd>
	</dl>
		
		<dl id="systemMessage">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="/web/jumpDataDictionory" data-title="数据字典" href="javascript:void(0)"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;数据字典</a></li>
					<li><a data-href="/web/jumpSystemLog" data-title="系统日志" href="javascript:void(0)"><i class="icon Hui-iconfont">&#xe6d7;</i>&nbsp;系统日志</a></li>
			</ul>
		</dd>
	</dl>
</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="首页" data-href="welcome.html">首页</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" id="ifram"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/page/js/H-ui.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/login/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){
	
	 
	   　　var myName="<%=session.getAttribute("roleId")%>"; 
	   	 //alert(myName); 
	   	 if (myName != 1) {
	   		
		    //$("#systemMessage").css("display","none");
		    
		    $("#systemMessage").css("display","none");
		    $("#inventoryMessage").css("display","none");
		    $("#dataMessage").css("display","none");
		   	$("#pointMessage").css("display","none");
		   	$("#orderMessage").css("display","none");
		   	$("#channelMessage").css("display","none");
		   	$("#equipmentMessage").css("display","none");
		   	$("#adminMessage").css("display","none");
		}
	   	 
	
});
/*
 * 进来就是主页
 */
	$(document).ready(function(){
		$("#ifram").attr("src","/web/index");
	})

/*个人信息*/
function myselfinfo(){
	layer.open({
		type: 1,
		area: ['300px','300px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '查看信息',
		content: 
			 '<div class="mysel" style="margin-top:20px;">账号：${adminAccount}</div>'
			+'<div class="mysel">密码：${adminPassword}</div>'
			+'<div class="mysel">姓名：${adminRealname}</div>'
			+'<div class="mysel">手机：${adminPhonenum}</div>'
			+'<div class="mysel">邮箱：${adminEmail}</div>'
			+'<div class="mysel">创建时间：${adminCreateTime}</div>'
	});
}


/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
function loginOut(){
	$.ajax({
		url:"${APP_PATH}/LoginOut",
		type:"POST",
		success:function(result){
			alert(result.extend.msg);
		}
	})
	location.href="/jumpLogin";
}
</script> 
</body>
</html>