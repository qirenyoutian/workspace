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

<title>管理员列表</title>
</head>
<style>
	.btn-black {
	  color: #fff;
	  background-color: orange;
	  border-color: #e5800b;
	}
	.btn-black:HOVER {
	  color: #fff;
	  background-color: #f68604;
	  border-color: #e5800b;
	}
	
</style>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 设备管理 <span class="c-gray en">&gt;</span> 设备管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 输入设备名称：
		<input type="text" class="input-text" style="width:250px" id="content" name="">
		<button type="button" class="btn btn-success btn-sm" id="select_admin" name=""><i class="Hui-iconfont">&#xe665;</i> 搜设备</button>
	</div>
 	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span style=" margin-left:4px;">
			<a href="javascript:;" onclick="equipment_reflash()" class="btn btn-info radius"><i class="Hui-iconfont">&#xe6bd;</i> 缓存刷新</a>
			<a href="javascript:;" onclick="equipment_stop()" class="btn btn-warning radius"><i class="Hui-iconfont">&#xe706;</i> 停用设备</a>
			<a href="javascript:;" onclick="equipment_remove()" class="btn btn-primary radius">解除停用</a>
		</span>
		<span style="float: right; margin-right: 170px;">
			<a href="javascript:;" onclick="equipment_Export()" class="btn btn-success radius">导出信息</a>
		</span>
	</div>
	<table id="equipment_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="11">设备列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>设备编号</th>
				<th>设备IP</th>
				<th>设备名称</th>
				<th>设备类型</th>
				<th>设备点位</th>
				<th>GPS坐标</th>
				<th>设备状态</th>
				<th>加入时间</th>
				<th>更新时间</th>
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


	
	window.setInterval(to_page,5000);
	
	
	$(function(){
	  	//去首页
		to_page(1);
	});
	/**
	* 首页
	*/
	function to_page(pn){
		var content = $("#content").val();
		
		$.ajax({
			url:"${APP_PATH}/getEquipmentAndPoint",
			data:{"pn":pn,"content":content},
			type:"GET",
			success:function(result){
				//1、解析并显示角色数据
				build_roles_table(result);
				//build_admin_page(result);
				build_page_info(result);
				build_page_nav(result);
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
		var equipmentlist = result.extend.pageInfo.list;
		$.each(equipmentlist,function(index,item){
			$.each(item.equipments,function(index,e){
			
					var checkBoxTd = $("<td><input type='checkbox' name='equipmentId' value="+e.equipmentId+" class='check_item'/></td>").css("padding-left","14px");
					var equipmentId = $("<td style='display: none;'></td>").append(e.equipmentId);
					var equipmentNumber = $("<td></td>").append(e.equipmentNumber).css("text-align","center").css("background-color","#FFFFE0");
					var equipmentIp = $("<td></td>").append(e.equipmentIp).css("text-align","center").css("background-color","#FFFFE0");
					var equipmentName = $("<td></td>").append(e.equipmentName).css("text-align","center").addClass("redTr");
					var equipmentType = e.equipmentClassify;
					if (equipmentType == null) {
						equipmentType = $("<td></td>").append("").css("text-align","center");
					}else{
						equipmentType = $("<td></td>").append(equipmentType.equipmentClassifyName).css("text-align","center");
					}
						
					var pointName = $("<td></td>").append(item.pointName).css("text-align","center");
					
					//增加GPS栏
					var equipmentGPS;
					if(e.equipmentLongitude == null || e.equipmentLatitude == null){
						equipmentGPS =  $("<td></td>").append("--- , ---").css("text-align","center");
					}else{
						equipmentGPS =  $("<td></td>").append(e.equipmentLongitude+" , "+e.equipmentLatitude).css("text-align","center");
					}
					
					
					var equipmentStatus =e.equipmentStatus;
						if (equipmentStatus == 1) {
							equipmentStatus = $("<td></td>").append("在线").css("text-align","center").css("background-color","#FFFFE0");
						}else if(equipmentStatus == 2){
							equipmentStatus = $("<td></td>").append("停用").css("text-align","center").css("background-color","yellow");
						}else{
							equipmentStatus = $("<td></td>").append("离线").css("text-align","center").css("background-color","red");
						}
					
					var equipmentCreateTime = $("<td></td>").append(timestampToDateTime(e.equipmentCreateTime)).css("text-align","center").css("background-color","#FFFFE0");
					var equipmentChangeTime = $("<td></td>").append(timestampToDateTime(e.equipmentChangeTime)).css("text-align","center").css("background-color","#FFFFE0");
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
									.append($("<span></span>").addClass("glyphicon")).append("编辑");
					editBtn.attr("edit-id",e.equipmentId).attr("onclick"," equipment_edit('设备信息编辑','/web/EquipmentEdit?id="+e.equipmentId+"','1','500','400')");
					var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
									.append($("<span></span>").addClass("glyphicon")).append("删除");
					delBtn.attr("onclick","equipment_del('"+e.equipmentId+"')");
					var aisleBtn =  $("<button></button>").addClass("btn btn-info btn-sm aisle_btn")
									.append($("<span></span>").addClass("glyphicon")).append("货道信息");
					aisleBtn.attr("onclick","equipment_aisle('"+e.equipmentName+"货道信息','/web/EquipmentAisle?id="+e.equipmentId+"','1','850','550')");
					
					var sideboardBtn =  $("<button></button>").addClass("btn btn-black btn-sm aisle_btn")
									.append($("<span></span>").addClass("glyphicon")).append("边柜信息");
					sideboardBtn.attr("onclick","equipment_aisle('"+e.equipmentName+"  边柜','/web/EquipmentSiboard?id="+e.equipmentId+"','1','850','550')");
					
					var btnTd = $("<td></td>").append(aisleBtn).append(" ").append(editBtn).append(" ").append(sideboardBtn).append(" ")
					.append(delBtn).append(" ").css("width","290px");
					$("<tr></tr>").append(checkBoxTd)
						.append(equipmentId)
						.append(equipmentNumber)
						.append(equipmentIp)
						.append(equipmentName)
						.append(equipmentType)
						.append(pointName)
						.append(equipmentGPS)
						.append(equipmentStatus)
						.append(equipmentCreateTime)
						.append(equipmentChangeTime)
						.append(btnTd)
						.appendTo("#equipment_table tbody");
				
			});
		});
	}
	
	$("#select_admin").click(function(){
			var content = $("#content").val();
			 if (content != "" && content != " ") {
				$.ajax({
					url:"${APP_PATH}/getEquipmentAndPoint",
					data:{"content":content},
					type:"GET",
					success:function(result){
						//1、解析并显示角色数据
						build_roles_table(result);
						build_page_info(result);
						build_page_nav(result);
					}
				});
			}else{
				to_page(1);
			}
			
	})



/*设备-增加*/
function equipment_add(title,url,w,h){
	layer_show(title,url,w,h);
	
}
/*设备-单个删除*/
function equipment_del(id){
	debugger;
	layer.confirm('确认要删除吗？',function(index){
		 $.ajax({
			type: 'POST',
			url: '${APP_PATH}/deleteEquipment',
			data:{"equipmenId":id,"equipmenIds":null},
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
/*设备-批量删除*/
function equipment_dels(){
	
	var checkBoxAll = $("input[name='equipmentId']:checked");
	var ids = [];
	$.each(checkBoxAll,function(index,cc){
		var a = $(cc).val();
		ids.push(a);
	})
	if (ids != "") {
		layer.confirm('确认要删除吗？',function(index){
			 
			//var params = $("#equipment").serialize();
			
			var checkBoxAll = $("input[name='equipmentId']:checked");
			var ids = [];
			$.each(checkBoxAll,function(index,cc){
				var a = $(cc).val();
				ids.push(a);
			})
		 		  $.ajax({
					type: 'POST',
					url: '${APP_PATH}/deleteEquipment',
					data:{"equipmenId":0,"equipmenIds":ids},
					traditional :true,
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
}

/*设备-详细信息*/
function equipment_edits(title,url,id,w,h){
	layer_show(title,url,w,h);
}

/*设备-编辑*/
function equipment_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

/*设备-货道*/
function equipment_aisle(title,url,id,w,h){
	layer_show(title,url,w,h);
}




//解析显示分页信息
function build_page_info(result){
	$("#page_info_area").empty();
	$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
			result.extend.pageInfo.pages+"页,总"+
			result.extend.pageInfo.total+"条记录");
	totalRecord = result.extend.pageInfo.total;
	currentPage = result.extend.pageInfo.pageNum;
}
//解析显示分页条，点击分页要能去下一页....
function build_page_nav(result){
	//page_nav_area
	$("#page_nav_area").empty();
	var ul = $("<ul></ul>").addClass("pagination");
	
	//构建元素
	var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
	var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
	if(result.extend.pageInfo.hasPreviousPage == false){
		firstPageLi.addClass("disabled");
		prePageLi.addClass("disabled");
	}else{
		//为元素添加点击翻页的事件
		firstPageLi.click(function(){
			to_page(1);
		});
		prePageLi.click(function(){
			to_page(result.extend.pageInfo.pageNum -1);
		});
	}
	
	var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
	var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
	if(result.extend.pageInfo.hasNextPage == false){
		nextPageLi.addClass("disabled");
		lastPageLi.addClass("disabled");
	}else{
		nextPageLi.click(function(){
			to_page(result.extend.pageInfo.pageNum +1);
		});
		lastPageLi.click(function(){
			to_page(result.extend.pageInfo.pages);
		});
	}
	
	
	
	//添加首页和前一页 的提示
	ul.append(firstPageLi).append(prePageLi);
	//1,2，3遍历给ul中添加页码提示
	$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
		
		var numLi = $("<li></li>").append($("<a></a>").append(item));
		if(result.extend.pageInfo.pageNum == item){
			numLi.addClass("active");
		}
		numLi.click(function(){
			to_page(item);
		});
		ul.append(numLi);
	});
	//添加下一页和末页 的提示
	ul.append(nextPageLi).append(lastPageLi);
	
	//把ul加入到nav
	var navEle = $("<nav></nav>").append(ul);
	navEle.appendTo("#page_nav_area");
}
//停用设备
function equipment_stop(){
	
	var checkBoxAll = $("input[name='equipmentId']:checked");
	var ids = [];
	$.each(checkBoxAll,function(index,cc){
		var a = $(cc).val();
		ids.push(a);
	})
	if(ids == ""){
		layer.msg('选择为空！',{icon:5,time:1000});
	}else{
		$.ajax({
			url:"${APP_PATH}/stopEquipment",
			data:{"equipmentIds":ids},
			type:"POST",
			traditional: true,//这里设置为true
			success:function(result){
				var res = result.code;
				if (res == 100) {
					layer.msg('处理成功！',{icon:6,time:1000});
				}else{
					layer.msg('处理失败！',{icon:5,time:1000});
				}
				
			}
		});
	}
	//alert(ids);
	
}
//解除设备停用
function equipment_remove(){
	
	var checkBoxAll = $("input[name='equipmentId']:checked");
	var ids = [];
	$.each(checkBoxAll,function(index,cc){
		var a = $(cc).val();
		ids.push(a);
	})
	if(ids == ""){
		layer.msg('选择为空！',{icon:5,time:1000});
	}else{
		$.ajax({
			url:"${APP_PATH}/RemoveEquipment",
			data:{"equipmentIds":ids},
			type:"POST",
			traditional: true,//这里设置为true
			success:function(result){
				var res = result.code;
				if (res == 100) {
					layer.msg('处理成功！',{icon:6,time:1000});
				}else{
					layer.msg('处理失败！',{icon:5,time:1000});
				}
				
			}
		});
	}
	//alert(ids);
	
}
//设备刷新缓存
function equipment_reflash(){
	
	var checkBoxAll = $("input[name='equipmentId']:checked");
	var ids = [];
	$.each(checkBoxAll,function(index,cc){
		var a = $(cc).val();
		ids.push(a);
	})
	
	if(ids == ""){
		layer.msg('选择为空！',{icon:5,time:1000});
	}else{
		$.ajax({
			url:"${APP_PATH}/equipmentReflash",
			data:{"equipmentIds":ids},
			type:"POST",
			traditional: true,//这里设置为true
			success:function(result){
				var res = result.code;
				if (res == 100) {
					layer.msg('处理成功！',{icon:6,time:1000});
				}else{
					layer.msg('处理失败！',{icon:5,time:1000});
				}
			}
		});
	}
	//alert(ids);
	
}
//导出信息

function equipment_Export(){
	var content = $("#content").val();
	var url="${APP_PATH}/ExportEquipmentMessage?content="+content;
	window.open(url);
	
}



</script>
</body>
</html>