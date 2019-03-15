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
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/page/css/bootstrap.css" />

<title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 货道管理 <span class="c-gray en">&gt;</span> 货道列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入货道名称" id="content" name="">
		<button type="button" class="btn btn-success" id="select_admin" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
			

	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
		<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
			<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
		</a> 
		<a href="javascript:;" onclick="channel_add('添加货道','/web/addChannel','800','700')" class="btn btn-primary radius">
			<i class="Hui-iconfont">&#xe600;</i> 添加货道
		</a></span>
	</div>
	<table id="admin_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">货道列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>设备id</th>
				<th>商品id</th>
				<th>货道横坐标</th>
				<th>货道纵坐标</th>
				<th>货道状态</th>
				<th>软件版本</th>
				<th>数量</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
			<!-- 显示分页信息 -->
		<div class="row" style="width:80%;">
			<!--分页文字信息  -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/page/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/login/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->



<script type="text/javascript" src="${APP_PATH }/static/login/js/bootbox.js"></script> 
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${APP_PATH }/static/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/laypage/1.2/laypage.js"></script>
<!-- 删除时确认窗口 -->

<!-- 分页相关 -->
<script src="${APP_PATH }/static/HDpaging/jquery-1.11.1.min.js"></script>
<script src="${APP_PATH }/static/HDpaging/paging.js"></script>


<script type="text/javascript">
var totalRecord,currentPage;
		$(function(){
		  	//去首页
			to_page(1);
		});
		function to_page(pn){
			var startTime = $("#datemin").val();
			var endTime = $("#datemax").val();
			var content = $("#content").val();
			$.ajax({
				url:"${APP_PATH}/getAisleAll",
				data:{"pn":pn,"startTime":startTime,"endTime":endTime,"content":content},
				type:"GET",
				success:function(result){
					//1、解析并显示角色数据
					build_roles_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		
		//显示数据
		function build_roles_table(result){
			debugger;
			//清空table表格
			$("#admin_table tbody").empty();
			var menu = result.extend.pageInfo.list;
			$.each(menu,function(index,item){
				debugger;
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>").css("padding-left","14px");
				var aisleId = $("<td style='display: none;'></td>").append(item.aisleId);
				var aisleEquipmentId = $("<td></td>").append(item.aisleEquipmentId).css("text-align","center");
				var aisleInventoryMerchandisId = $("<td></td>").append(item.aisleInventoryMerchandisId).css("text-align","center");
				var aisleAbscissa = $("<td></td>").append(item.aisleAbscissa).css("text-align","center");
				var aisleOrdinate = $("<td></td>").append(item.aisleOrdinate).css("text-align","center");
				var aisleStatus = $("<td></td>").append(item.aisleStatus).css("text-align","center");
				var aisleVersions = $("<td></td>").append(item.aisleVersions).css("text-align","center");
				var aisleInventoryCount = $("<td></td>").append(item.aisleInventoryCount).css("text-align","center");
				
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前角色id
				editBtn.attr("edit-id",item.channelId).attr("onclick","channel_edit('商品编辑','/web/EditChannel?id="+item.channelId+"',"+item.channelId+",'800','500')");
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的角色id
				delBtn.attr("del-id",item.channelId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn).append(" ").css("width","130px");
				//var delBtn = 
				//append方法执行完成以后还是返回原来的元素
				debugger;
				$("<tr></tr>").append(checkBoxTd)
					.append(aisleId)
					.append(aisleEquipmentId)
					.append(aisleInventoryMerchandisId)
					.append(aisleAbscissa)
					.append(aisleOrdinate)
					.append(aisleStatus)
					.append(aisleVersions)
					.append(aisleInventoryCount)
					.append(btnTd)
					.appendTo("#admin_table tbody");
			});
		}
		
		
		
		
		
		
		
		
		
</script>
</body>
</html>