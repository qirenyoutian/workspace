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
 	<div class="" style="display: none;">
		<input type="text" value="${param.id}" placeholder="" id="equipmentId" name="equipmentId">
	</div>
 	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span style=" margin-left:4px;">
			<a href="javascript:;" onclick="Siboard_add('添加商品','/web/SiboardAdd?id=${param.id}','500','300')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加商品</a>
		</span>
	</div>
	<table id="equipment_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="11">边柜信息</th>
			</tr>
			<tr class="text-c">
				<th>序号</th>
				<th>商品名称</th>
				<th>商品库存</th>
				<th>上次更新时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
			<!-- 显示分页信息 -->
		<div class="row" style=" width:80%;">
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
		
		var equipmentId = $("#equipmentId").val();
		$.ajax({
			url:"${APP_PATH}/getsideboardById",
			data:{"equipmentId":equipmentId},
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
		var a =$("#equipment_table tbody").empty();
		var equipmentlist = result.extend.msg;
		var y = 1;
		$.each(equipmentlist,function(index,item){
			
					var sideboardId = $("<td style='display: none;'></td>").append(item.sideboardId);
					var num = $("<td></td>").append(y).css("text-align","center");
					var sideboardMerchandiseId = $("<td></td>").append(item.merchandise.merchandiseName).css("text-align","center");
					var sideboardCount = $("<td></td>").append(item.sideboardCount).css("text-align","center");
					var sideboardChangeTime = $("<td></td>").append(timestampToDateTime(item.sideboardChangeTime)).css("text-align","center");
					
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
									.append($("<span></span>").addClass("glyphicon")).append("编辑");
					editBtn.attr("edit-id",item.sideboardId).attr("onclick"," equipment_edit('设备信息编辑','/web/EquipmentEdit?id="+item.sideboardId+"','1','500','350')");
					
					var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
									.append($("<span></span>").addClass("glyphicon")).append("删除");
					delBtn.attr("edit-id",item.sideboardId).attr("onclick","sideboard_del('"+item.sideboardId+"')");
					
					
					
					var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn).append(" ").css("width","120px");
					$("<tr></tr>").append(num)
						.append(sideboardId)
						.append(sideboardMerchandiseId)
						.append(sideboardCount)
						.append(sideboardChangeTime)
						.append(btnTd)
						.appendTo("#equipment_table tbody");
				y++;
		});
	}


/*设备-增加*/
function Siboard_add(title,url,w,h){
	layer_show(title,url,w,h);
	
}

/*设备-编辑*/
function equipment_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*设备-单个删除*/
function sideboard_del(id){
	
	//alert(id);
	 layer.confirm('确认要删除吗？',function(index){
		 $.ajax({
			type: 'POST',
			url: '${APP_PATH}/deleteSideboard',
			data:{"sideboardId":id},
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
	}); 
}



</script>
</body>
</html>