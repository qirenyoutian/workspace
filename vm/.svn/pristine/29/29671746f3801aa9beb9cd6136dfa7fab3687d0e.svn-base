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
			<a href="javascript:;" onclick="bigWareHouse_add('添加商品','/web/bigWareHouseMerchandiseAdd?id=${param.id}','400','300')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加商品</a>
		</span>
	</div>
	<div class="row cl" style="display:none;">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>仓库id：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${param.id}" placeholder="" id="bigWarehouseId" name="bigWarehouseId">
		</div>
	</div>
	<table id="bigware_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="11">库存信息</th>
			</tr>
			<tr class="text-c">
				<th>序号</th>
				<th>商户名称</th>
				<th>商品名称</th>
				<th>储量</th>
				<th>更新时间</th>
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
		var bigWarehouseId = $("#bigWarehouseId").val();
		
		$.ajax({
			url:"${APP_PATH}/getBigWareInventory",
			data:{"bigWarehouseId":bigWarehouseId},
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
			$.each(item.merchandises,function(index,m){
					var bigWarehouseInventoryId = $("<td style='display: none;'></td>").append(item.bigWarehouseInventoryId);
					var num = $("<td></td>").append(y).css("text-align","center");
					var merchandiseName = $("<td></td>").append(m.merchandiseName).css("text-align","center");
					
					//获取商户名称
					var commercialTenantName=$("<td></td>").append(item.commer.commercialTenantName).css("text-align","center");
					
					var bigWarehouseInventoryCount = $("<td></td>").append(item.bigWarehouseInventoryCount).css("text-align","center");
					var bigWarehouseInventoryUpdateTime = $("<td></td>").append(timestampToDateTime(item.bigWarehouseInventoryUpdateTime)).css("text-align","center");
					
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
									.append($("<span></span>").addClass("glyphicon")).append("编辑");
					editBtn.attr("edit-id",item.bigWarehouseInventoryId).attr("onclick"," bigWareHouse_edit('仓库信息编辑','/web/bigWareHouseMerchandiseEdit?id="+item.bigWarehouseInventoryId+"&merchandiseId="+item.bigWarehouseInventoryMerchandiseId+"','1','400','250')");
					
					var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon")).append("删除");
					//为删除按钮添加一个自定义的属性来表示当前删除的角色id
					delBtn.attr("del-id",item.bigWarehouseInventoryId);
					
					var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn).append(" ").css("width","130px");
					
					$("<tr></tr>").append(num)
					    .append(commercialTenantName)
						.append(bigWarehouseInventoryId)
						.append(merchandiseName)
						.append(bigWarehouseInventoryCount)
						.append(bigWarehouseInventoryUpdateTime)
						.append(btnTd)
						.appendTo("#bigware_table tbody");
		     });
				y++;
		});
	}


/*库存-增加*/
function bigWareHouse_add(title,url,w,h){
	layer_show(title,url,w,h);
	
}

/*库存-编辑*/
function bigWareHouse_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*库存-单个删除*/
	
	$(document).on("click",".delete_btn",function(){
	//1、弹出是否确认删除对话框
	
	var InventoryName = $(this).parents("tr").find("td:eq(2)").text();
		var id = $(this).attr("del-id");
		layer.confirm('确认要删除'+InventoryName+'吗？',function(index){
			 $.ajax({
				type: 'POST',
				url: '${APP_PATH}/deleteInventory',
				data:{"InventoryId":id},
				success: function(result){
					var status = result.code;
						if(status == 100){
							layer.msg('已删除!',{icon:6,time:1000},function(){
								to_page(1);
							});
						}else{
							layer.msg('删除失败！',{icon:5,time:1000});
						}
					
				},
			});
		})
	})
	
	
	/* //对应的商户id对应的商户名称
	function merchandiseIdCommercialTenantName(merchandiseId){
		 $.ajax({
			 type: 'POST',
			 url: '${APP_PATH}/selectCommercialTenantNameByCommerId',
			 data:{"commerId":merchandiseId},
			 success: function(result){
				 var status = result.code;
				 if(status == 100){
					 ctn=result.extend.msg;
					 alert(ctn);
				 }
			 }
		 }) 
}*/
	


</script>
</body>
</html>