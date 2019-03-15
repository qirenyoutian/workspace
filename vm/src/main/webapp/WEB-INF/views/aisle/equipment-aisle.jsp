<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">

<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/style.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/page/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/page/css/bootstrap.css" media="screen"/>

<title>货道列表</title>
</head>
<style>
.btn-lock{
	background-color: #f05b00;
	color: white;
}
.btn-lock:HOVER {
	background-color: #cd5004;
	color: white;
}
.bigPhoto:HOVER img{
	transform: scale(3.5);
	transition: all 1s ease 0s;
	-webkit-transform: scale(3.5);
	-webkit-transform: all 1s ease 0s;
	
}


</style>
<body>
<div class="page-container">
	<div class="row cl" style="display:none;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>设备id：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${param.id}" placeholder="" id="ThisEquipmentId" name="ThisEquipmentId">
		</div>
	</div>
	<table id="Aisle_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="11">货道列表</th>
			</tr>
			<tr class="text-c">
				<th>序号</th>
				<th>货道编号</th>
				<th>商品名称</th>
				<th>商品图片</th>
				<th>销售价格</th>
				<th>剩余库存</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
			<!-- 显示分页信息 -->
		<div class="row" style="width:600px;">
			<!--分页文字信息  -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area" ></div>
		</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/page/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/login/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${APP_PATH }/static/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>

<script type="text/javascript">

	$(function(){
	  	//去首页
		to_page();
	});
	/**
	* 首页
	*/
	function to_page(){
		var equipmentId = $("#ThisEquipmentId").val();
 		$.ajax({
			url:"${APP_PATH}/getAlsieByEquipmentId",
			data:{"equipmentId":equipmentId},
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
		var a =$("#Aisle_table tbody").empty();
		var aislelist = result.extend.pageInfo;
		var y = 1;
		$.each(aislelist,function(index,item){
				var num = $("<td></td>").append(y).css("text-align","center");
				var aisleId = $("<td style='display: none;'></td>").append(item.aisleId);
				var aisleNumber = $("<td></td>").append(item.aisleNumber).css("text-align","center");
				var merchandiseName;
			    var merchandiseImages;
				var merchandisePrice;
				var aisleInventory;
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
				.append($("<span></span>").addClass("glyphicon"));
				editBtn.attr("edit-id",item.aisleId);
				
				if (item.aisleInventorie == null) {
					merchandiseName = $("<td></td>").append("").css("text-align","center");
				    merchandiseImages = $("<td></td>").append("").css("text-align","center");
					merchandisePrice = $("<td></td>").append("").css("text-align","center");
					aisleInventory = $("<td></td>").append("").css("text-align","center");
					var ThisEquipmentId = $("#ThisEquipmentId").val();
					editBtn.append("上架").attr("onclick","merchandise_edit('货道商品编辑','/web/AisleMerChandiseUpload?id="+item.aisleId+"&&equipmentId="+ThisEquipmentId+"','"+item.aisleId+"','500','400')");;
					
				}else{
					var inventory = item.aisleInventorie;
					var merchandise = inventory.merchandise;
					var channelMerchandise = inventory.channelMerchandise;
					if (merchandise == null) {
						merchandiseName = $("<td></td>").append("").css("text-align","center");
					    merchandiseImages = $("<td></td>").append("").css("text-align","center");
					}else{
						merchandiseName = $("<td></td>").append(merchandise.merchandiseName).css("text-align","center");
					    merchandiseImages = $("<td class='bigPhoto'></td>").append("<img src='"+merchandise.merchandiseImageUrl+"' width='50px;' height='50px; ' >").css("text-align","center");
					}
					if (channelMerchandise == null) {
						merchandisePrice = $("<td></td>").append("").css("text-align","center");
					}else{
						merchandisePrice = $("<td></td>").append(channelMerchandise.channelMerchandisePrice).css("text-align","center");
					}
						aisleInventory = $("<td></td>").append(inventory.aisleInventoryCount).css("text-align","center");
						editBtn.append("编辑").attr("onclick","merchandise_edit('货道商品编辑','/web/AisleMerChandiseEdit?id="+item.aisleId+"','"+item.aisleId+"','500','400')");
				}
						
						
					var status = item.aisleStatus;
					if (status == 0) {
						
						var delBtn =  $("<button></button>").addClass("btn btn-lock btn-sm outlock_btn").append($("<span></span>").addClass("glyphicon")).append("解锁");
							delBtn.attr("lock-btn",item.aisleId).attr("status",status);
						
					} else {
						
						var delBtn =  $("<button></button>").addClass("btn btn-sm uplock_btn").append($("<span></span>").addClass("glyphicon")).append("锁定");
							delBtn.attr("lock-btn",item.aisleId).attr("status",status);
					}
					
					var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn).append(" ").css("width","140px");
					$("<tr></tr>").append(num)
						.append(aisleId)
						.append(aisleNumber)
						.append(merchandiseName)
						.append(merchandiseImages)
						.append(merchandisePrice)
						.append(aisleInventory)
						.append(btnTd)
						.appendTo("#Aisle_table tbody");
					
			y++;
		});
	}
	


/*货道-上锁*/
$(document).on("click",".uplock_btn",function(){
	var aisleId = $(this).attr("lock-btn");
	var status = $(this).attr("status");
	layer.confirm('确认要锁定该货道吗？',function(index){
		 $.ajax({
			type: 'POST',
			url: '${APP_PATH}/lockAisle',
			data:{"aisleId":aisleId,"status":status},
			success: function(result){
				var status = result.code;
					if(status == 100){
						layer.msg('已锁定!',{icon:6,time:1000},function(){
							to_page(1);
						});
					}else{
						layer.msg('锁定失败！',{icon:5,time:1000});
					}
				
			},
		});
	});
})
/*货道-解锁*/

$(document).on("click",".outlock_btn",function(){
	var aisleId = $(this).attr("lock-btn");
	var status = $(this).attr("status");
	layer.confirm('确认要解锁该货道吗？',function(index){
		 $.ajax({
			type: 'POST',
			url: '${APP_PATH}/lockAisle',
			data:{"aisleId":aisleId,"status":status},
			success: function(result){
				var status = result.code;
					if(status == 100){
						layer.msg('已解除锁定!',{icon:6,time:1000},function(){
							to_page(1);
						});
					}else{
						layer.msg('解锁失败！',{icon:5,time:1000});
					}
				
			},
		});
	});
})


/*货道-编辑*/
function merchandise_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}






</script>
</body>
</html>