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
<style>

</style>
<body>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	</div>
	<input style="display: none;" id="recordId" name="recordId" value="${param.id}">
	<table id="admin_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">消息列表</th>
			</tr>
			<tr class="text-c">
				<th style="display: none;">主键</th>
				<th>设备名称</th>
				<th>边柜/货道</th>
				<th>原库存</th>
				<th>新库存</th>
				<th>铺货前照片</th>
				<th>铺货后照片</th>
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

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${APP_PATH }/static/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/laypage/1.2/laypage.js"></script>

<!-- 分页相关 -->
<script src="${APP_PATH }/static/HDpaging/jquery-1.11.1.min.js"></script>
<script src="${APP_PATH }/static/HDpaging/paging.js"></script>


<script type="text/javascript">

	$(function(){
	  	//去首页
		to_page();
	});
	/**
	* 首页
	*/
	function to_page(){
		
		var recordId = $("#recordId").val();
		$.ajax({
			url:"${APP_PATH}/getPaveDetail",
			data:{"paveRecordId":recordId},
			type:"GET",
			success:function(result){
				//1、解析并显示角色数据
				build_roles_table(result);
			}
		});
	}

	
	/*
	显示数据
	*/
	function build_roles_table(result){
		//清空table表格
		var a =$("#admin_table tbody").empty();
		var pglist = result.extend.list;
		$.each(pglist,function(index,item){
			$.each(item.equipments,function(index,e){
					var paveRecordDetailId = $("<td style='display: none;'></td>").append(item.paveRecordDetailId);
					var paveRecordDetailEquipmentId = $("<td></td>").append(e.equipmentName).css("text-align","center");
					var paveRecordDetailAisleId = e.aisles;
					var oldInventory = null;//老库存
					var newInventory = null;//新库存
					if (paveRecordDetailAisleId == null || paveRecordDetailAisleId.length == 0) {
						paveRecordDetailAisleId = $("<td></td>").append("边柜").css("text-align","center");
						oldInventory = $("<td></td>").append(item.paveRecordDetailOldInventory).css("text-align","center");
						newInventory = $("<td></td>").append(item.paveRecordDetailNewInventory).css("text-align","center");
					}else{
						$.each(e.aisles,function(index,a){
							paveRecordDetailAisleId = $("<td></td>").append("货道("+a.aisleNumber+")").css("text-align","center");
							oldInventory = $("<td></td>").append(item.paveRecordDetailOldInventory).css("text-align","center");
							newInventory = $("<td></td>").append(item.paveRecordDetailNewInventory).css("text-align","center");
						});
					}
					var paveRecordEtailAfterPhoto = $("<td></td>").append("<img src='"+item.paveRecordEtailAfterPhoto+"' width='100px'/>").css("text-align","center");
					var paveRecordEtailBeforePhoto = $("<td></td>").append("<img src='"+item.paveRecordEtailBeforePhoto+"' width='100px'/>").css("text-align","center");
					
					
					
					
					$("<tr></tr>").append(paveRecordDetailId)
						.append(paveRecordDetailEquipmentId)
						.append(paveRecordDetailAisleId)
						.append(oldInventory)
						.append(newInventory)
						.append(paveRecordEtailAfterPhoto)
						.append(paveRecordEtailBeforePhoto)
						.appendTo("#admin_table tbody");
				
				//});
			});
		});
	}
	
	

/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}


</script>
</body>
</html>