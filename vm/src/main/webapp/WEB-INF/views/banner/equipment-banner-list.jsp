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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 设备管理 <span class="c-gray en">&gt;</span> 广告管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	
 	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span style=" margin-left:4px;">
			<a href="javascript:;" onclick="add_banner('添加图片或视频','/web/jumpBannerAdd','400','300')" class="btn btn-info radius"><i class="Hui-iconfont">&#xe600;</i> 添加图片</a>
		</span>
		
	</div>
	<table id="equipment_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="11">设备列表</th>
			</tr>
			<tr class="text-c">
				<th width="50">序号</th>
				<th>广告图片</th>
				<th>点位</th>
				<th>加入时间</th>
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
		to_page(1);
	});
	/**
	* 首页
	*/
	function to_page(pn){
		var content = $("#content").val();
		
		$.ajax({
			url:"${APP_PATH}/getBanner",
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
		var banner = result.extend.list;
		var y = 1;
		$.each(banner,function(index,item){
				var bannerId = $("<td style='display: none;'></td>").append(item.bannerId);
				var yy = $("<td></td>").append(y).css("text-align","center");
				
				
				var path = item.bannerPic;
				var end = path.substr(path.length-3);
				if (end == "mp4") {
					var bannerPic = $("<td></td>").append("<video src='"+item.bannerPic+"' controls='controls' height='100px' width='100px'></vedio>").css("text-align","center");
				}else{
					var bannerPic = $("<td></td>").append("<img src='"+item.bannerPic+"' width='100px'/>").css("text-align","center");
				}
				var bannerCreateTime = $("<td></td>").append(timestampToDateTime(item.bannerCreateTime)).css("text-align","center");
				var point = item.point;
				if (point != null) {
					var bannerPoint = $("<td></td>").append(point.pointName).css("text-align","center");
				}else{
					var bannerPoint = $("<td></td>").append("-").css("text-align","center");
				}
				
				
				var editBtn =  $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon")).append("编辑");
				editBtn.attr("onclick","BannerEdit('设置机器广告','/web/jumpBannerEdit?id="+item.bannerId+"','1','350','200')");
				
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon")).append("删除");
				delBtn.attr("onclick","equipment_del('"+item.bannerId+"')");
				
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn).append(" ").css("width","160px");
				$("<tr></tr>").append(bannerId)
					.append(yy)
					.append(bannerPic)
					.append(bannerPoint)
					.append(bannerCreateTime)
					.append(btnTd)
					.appendTo("#equipment_table tbody");
			y++;
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



/*广告-增加图片*/
function add_banner(title,url,w,h){
	layer_show(title,url,w,h);
	
}

/*广告-编辑*/
function BannerEdit(title,url,id,w,h){
	layer_show(title,url,w,h);
	
}
/*广告-单个删除*/
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

</script>
</body>
</html>