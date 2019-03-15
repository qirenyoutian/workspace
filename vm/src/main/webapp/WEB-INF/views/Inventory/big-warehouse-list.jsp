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

<title>边柜详情</title>
</head>

<body>
<div class="page-container">
 	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span style=" margin-left:4px;">
			<a href="javascript:;" onclick="bigWareHouse_add('添加仓库','/web/bigWareHouseAdd','500','400')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加仓库</a>
		</span>
	</div>
	<table id="bigware_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="11">仓库信息</th>
			</tr>
			<tr class="text-c">
				<th>序号</th>
				<th>仓库名称</th>
				<th>省</th>
				<th>市</th>
				<th>区</th>
				<th>详细街道</th>
				<th>更新时间</th>
				<th>创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
		
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
		
		$.ajax({
			url:"${APP_PATH}/getBigWarehouse",
			type:"GET",
			success:function(result){
				build_roles_table(result);
			}
		});
	}
	
	//时间格式转换
	function timestampToDateTime(timestamp) {
	        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
	        Y = date.getFullYear() + '-';
	        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
	        D = (date.getDate()< 10 ? '0'+ date.getDate(): date.getDate()) + ' ';
	        h = (date.getHours()< 10 ? '0'+ date.getHours(): date.getHours()) + ':';
	        m = (date.getMinutes()< 10 ? '0'+ date.getMinutes(): date.getMinutes()) + ':';
	        s = (date.getSeconds()< 10 ? '0'+ date.getSeconds(): date.getSeconds());
	        return Y+M+D+h+m+s;
	    }
	
	/*
	显示数据
	*/
	function build_roles_table(result){
		//清空table表格
		var a =$("#bigware_table tbody").empty();
		var bigWareHouselist = result.extend.list;
		var y = 1;
		$.each(bigWareHouselist,function(index,item){
			
					var bigWarehouseId = $("<td style='display: none;'></td>").append(item.bigWarehouseId);
					var num = $("<td></td>").append(y).css("text-align","center");
					var bigWarehouseName = $("<td></td>").append(item.bigWarehouseName).css("text-align","center");
					var areas = item.areas;
					var bigWarehouseProvince = $("<td></td>");
					var bigWarehouseCity = $("<td></td>");
					var bigWarehouseDistrict = $("<td></td>");
					$.each(areas,function(i,area){
						if(area.type == 1){
							bigWarehouseProvince = bigWarehouseProvince.append(area.name).css("text-align","center");
						}
						if(area.type == 2){
							bigWarehouseCity = bigWarehouseCity.append(area.name).css("text-align","center");
						}
						if(area.type == 3){
							bigWarehouseDistrict = bigWarehouseDistrict.append(area.name).css("text-align","center");
						}
					})
					var bigWarehouseAddress = $("<td></td>").append(item.bigWarehouseAddress).css("text-align","center");
					var bigWarehouseUpdateTime = $("<td></td>").append(timestampToDateTime(item.bigWarehouseUpdateTime)).css("text-align","center");
					var bigWarehouseCreateTime = $("<td></td>").append(timestampToDateTime(item.bigWarehouseCreateTime)).css("text-align","center");
					
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
									.append($("<span></span>").addClass("glyphicon")).append("编辑");
					editBtn.attr("edit-id",item.bigWarehouseId).attr("onclick"," bigWareHouse_edit('仓库信息编辑','/web/bigWareHouseEdit?id="+item.bigWarehouseId+"','1','500','400')");
					var MoreBtn = $("<button></button>").addClass("btn btn-info btn-sm more_btn")
									.append($("<span></span>").addClass("glyphicon")).append("仓库存储");
					MoreBtn.attr("more-id",item.bigWarehouseId).attr("onclick"," bigWareHouse_inventory('仓库库存','/web/bigWareHouseInventory?id="+item.bigWarehouseId+"','1','900','550')");
					
					var btnTd = $("<td></td>").append(MoreBtn).append(" ").append(editBtn).append(" ").css("width","130px");
					
					$("<tr></tr>").append(num)
						.append(bigWarehouseId)
						.append(bigWarehouseName)
						.append(bigWarehouseProvince)
						.append(bigWarehouseCity)
						.append(bigWarehouseDistrict)
						.append(bigWarehouseAddress)
						.append(bigWarehouseUpdateTime)
						.append(bigWarehouseCreateTime)
						.append(btnTd)
						.appendTo("#bigware_table tbody");
				y++;
		});
	}


/*大仓库-增加*/
function bigWareHouse_add(title,url,w,h){
	layer_show(title,url,w,h);
	
}

/*大仓库-编辑*/
function bigWareHouse_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*大仓库-库存*/
function bigWareHouse_inventory(title,url,id,w,h){
	layer_show(title,url,w,h);
}



</script>
</body>
</html>