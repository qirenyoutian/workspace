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

<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 设备管理 <span class="c-gray en">&gt;</span> 设备类型<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 输入设备型号：
		<input type="text" class="input-text" style="width:250px" id="content" name="">
		<button type="button" class="btn btn-success btn-sm" id="select_admin" name=""><i class="Hui-iconfont">&#xe665;</i> 搜设备</button>
	</div>
 	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
		<a href="javascript:;" onclick="equipment_dels()" class="btn btn-danger radius">
			<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
		</a> 
		<a href="javascript:;" onclick="equipment_add('添加设备类型','/web/EquipmentClassifyAdd','400','500')" class="btn btn-primary radius">
			<i class="Hui-iconfont">&#xe600;</i> 添加设备类型
		</a></span>
	</div>
	<table id="equipment_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="11">设备列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>设备厂家</th>
				<th>设备型号</th>
				<th>设备类型</th>
				<th>设备尺寸</th>
				<th>货道行数</th>
				<th>货道列数</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
			<!-- 显示分页信息 -->
			<!-- 
		<div class="row" style=" width:80%;">
			分页文字信息 
			<div class="col-md-6" id="page_info_area"></div>
			分页条信息
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div> -->
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
		to_page(1);
	});
	/**
	* 首页
	*/
	function to_page(pn){
		var content = $("#content").val();
		
		$.ajax({
			url:"${APP_PATH}/getEquipmentClassify",
			data:{"pn":pn,"content":content},
			type:"GET",
			success:function(result){
				//1、解析并显示角色数据
				build_roles_table(result);
				/* //build_admin_page(result);
				build_page_info(result);
				build_page_nav(result); */
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
		var equipmentlist = result.extend.pageInfo;
		$.each(equipmentlist,function(index,e){
					var checkBoxTd = $("<td><input type='checkbox' name='equipmentClassifyId' value="+e.equipmentClassifyId+" class='check_item'/></td>").css("padding-left","14px");
					var equipmentClassifyId = $("<td style='display: none;'></td>").append(e.equipmentClassifyId);
					var equipmentClassifyName = $("<td></td>").append(e.equipmentClassifyName).css("text-align","center");
					var equipmentClassifyNum = $("<td></td>").append(e.equipmentClassifyEquipmentNumber).css("text-align","center");
					var equipmentClassifyEquipmentSize = $("<td></td>").append(e.equipmentClassifyEquipmentSize).css("text-align","center");
					var equipmentClassifyRow = $("<td></td>").append(e.equipmentClassifyRow).css("text-align","center");
					var equipmentClassifyLine = $("<td></td>").append(e.equipmentClassifyLine).css("text-align","center");
					var equipmentClassifyManufacturer = $("<td></td>").append(e.equipmentClassifyManufacturer).css("text-align","center");
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
									.append($("<span></span>").addClass("glyphicon")).append("编辑");
					editBtn.attr("edit-id",e.equipmentClassifyId).attr("onclick"," equipment_edit('设备类型编辑','/web/EquipmentClassifyUpdate?id="+e.equipmentClassifyId+"','1','400','500')");
					var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
									.append($("<span></span>").addClass("glyphicon")).append("删除");
					delBtn.attr("onclick","equipment_del('"+e.equipmentClassifyId+"')");
					
					var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn).append(" ").css("width","130px");
					$("<tr></tr>").append(checkBoxTd)
						.append(equipmentClassifyId)
						.append(equipmentClassifyManufacturer)
						.append(equipmentClassifyNum)
						.append(equipmentClassifyName)
						.append(equipmentClassifyEquipmentSize)
						.append(equipmentClassifyRow)
						.append(equipmentClassifyLine)
						.append(btnTd)
						.appendTo("#equipment_table tbody");
		});
	}
	
	$("#select_admin").click(function(){
			var content = $("#content").val();
			 if (content != "" && content != " ") {
				$.ajax({
					url:"${APP_PATH}/getEquipmentClassify",
					data:{"content":content},
					type:"GET",
					success:function(result){
						//1、解析并显示角色数据
						build_roles_table(result);
						/* build_page_info(result);
						build_page_nav(result); */
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
			url: '${APP_PATH}/deleteEquipmentClassify',
			data:{"equipmenClassifyId":id,"equipmenClassifyIds":null},
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
	layer.confirm('确认要删除吗？',function(index){
		var checkBoxAll = $("input[name='equipmentClassifyId']:checked");
		var ids = [];
		$.each(checkBoxAll,function(index,cc){
			var a = $(cc).val();
			ids.push(a);
		})
		//alert(ids);
	 		    $.ajax({
				type: 'POST',
				url: '${APP_PATH}/deleteEquipmentClassify',
				data:{"equipmenClassifyId":0,"equipmenClassifyIds":ids},
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

/* 


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

 */



</script>
</body>
</html>