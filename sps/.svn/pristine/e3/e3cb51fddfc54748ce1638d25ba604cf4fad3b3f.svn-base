<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分组列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
	table tr td,th{text-align: center;}
	.aaa{
	width:98px;
	height:30px;
	font-family:inherit;
	font-size:12px;
	color:white;
	background-color:black;
	}
	.aaa:HOVER {
	color: white;
}
</style>
</head>
<body>
	
	
		<!-- 相机名称的模态框 -->
	<div class="modal fade" id="UpdateNameModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" style="width: 600px;margin-left: -80px;">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">修改相机名称</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			 <div class="form-group">
			    <label class="col-sm-2 control-label">相机名称</label>
			    <div class="col-sm-10">
			      <input type="text" name="CameraName" style="width:200px;" class="form-control" id="CameraName_update_input" placeholder="请输入相机名称">
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
		<!-- 停车记录的模态框 -->
	<div class="modal fade" id="EzStopModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" style="width: 800px;margin-left: -80px;">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">停车记录</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			  <table class="table table-hover" id="EzStop_table">
					<thead>
						<tr>
							<th>序号</th>
							<th>路段名</th>
							<th>车位名</th>
							<th>车牌</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>停车费用</th>
							<th>车单状态</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
		    	<!-- 显示分页信息 -->
				<div class="row">
					<!--分页文字信息  -->
					<div class="col-md-6" id="page_info_parking"></div>
					<!-- 分页条信息 -->
					<div class="col-md-6" id="page_nav_parking">
						
					</div>
				</div>
	    </div>
	  </div>
	</div>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>监控IP列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
			<div id="routeInput">
				</div>
			<div class="col-md-4">
				<!-- <button class="btn btn-primary" id="admin_add_modal_btn">新增</button> -->
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="route_table">
					<thead>
						<tr>
							<th style="display: none;">主键</th>
							<th>序号</th>
							<th>相机名称</th>
							<th>相机IP</th>
							<th>内存大小</th>
							<th>已用内存</th>
							<th>剩余内存</th>
							<th>CPU使用率</th>
							<th>设备在线</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
	</div>
	<!-- 删除时确认窗口 -->
	<script src="static/js/bootbox.js"></script>
	<script type="text/javascript">
		var totalRecord,currentPage;
		$(function(){
			//去首页
			to_page(1);
		});
		
		function to_page(pn){
			
			$.ajax({
				url:"${APP_PATH}/getcameraAll",
				data:{"pn":pn},
				type:"GET",
				success:function(result){
					//console.log(result);
					//1、解析并显示角色数据
					build_routes_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		function build_routes_table(result){
			//清空table表格
			$("#route_table tbody").empty();
			var camera = result.extend.pageInfo.list;
			var i = 1;
			$.each(camera,function(index,item){
					var cameraId = $("<td style='display: none;'></td>").append(item.cameraId);
					var camI = $("<td></td>").append(i);
					//var rr = $("<a></a>").append(item.cameraIp).attr('','').css('text-decoration','none').css('color','black');
					var routeName = item.cameraAppRoute;
						if (routeName == null) {
							routeName = $("<td></td>").append("");
						}else{
							routeName = $("<td></td>").append(item.cameraAppRoute.routeLocationName);
						}
					var cameraName = $("<td></td>").append(item.cameraName);
					var cameraIp = $("<td></td>").append(item.cameraIp);
					var cameraMemTotal = $("<td></td>").append(item.cameraMemTotal);
					var cameraMemUsed = $("<td></td>").append(item.cameraMemUsed);
					var cameraMemFree = $("<td></td>").append(item.cameraMemFree);
					var cameraCpuRate = $("<td></td>").append(item.cameraCpuRate+"%");
					var cameraApp = item.cameraApp;
					if(cameraApp == 0){
						cameraApp = $("<td></td>").append("不在线");
					}else{
						cameraApp = $("<td></td>").append("在线");
					}
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
					.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改相机名");
					editBtn.attr("edit-id",item.cameraId);
					var seeBtn = $("<button></button>").addClass("btn aaa parking_btn")
					.append($("<span></span>").addClass("glyphicon")).append("查看停车记录");
					seeBtn.attr("parking-id",item.cameraId);
					
					var btn = $("<td></td>").append(editBtn).append(" ").append(seeBtn);
					i++;
					//append方法执行完成以后还是返回原来的元素
					$("<tr></tr>").append(cameraId)
						.append(camI)
						.append(cameraName)
						.append(cameraIp)
						.append(cameraMemTotal)
						.append(cameraMemUsed)
						.append(cameraMemFree)
						.append(cameraCpuRate)
						.append(cameraApp)
						.append(btn)
						.appendTo("#route_table tbody");
			});
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
		//清空表单样式及内容
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		//停车记录
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
		//修改相机名称
		$(document).on("click",".edit_btn",function(){
			
			reset_form("#UpdateNameModal form");
			getCameraName($(this).attr("edit-id"));
			$("#save_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#UpdateNameModal").modal({
				backdrop:"static"
			});
		});
		
		function getCameraName(id){
			$.ajax({
				url:"${APP_PATH}/getCameraNameById",
				data:{"CameraId":id},
				type:"GET",
				success:function(result){
					var camera = result.extend.cameraList;
					$.each(camera,function(index,item){
						$("#CameraName_update_input").val(item.cameraName);
					})
				}
			});
		}
		
		$(document).on("click","#save_btn",function(){
			var id = $(this).attr("edit-id");
			var name = $("#CameraName_update_input").val();
			$.ajax({
				url:"${APP_PATH}/updateCameraName",
				type:"POST",
				data:{"cameraid":id,"cameraName":name},
				success:function(result){
					bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
					//1、关闭对话框
					$("#UpdateNameModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		})
		
		
		
		
		
		
		//停车记录
		var totalRecord,currentPage;
		$(document).on("click",".parking_btn",function(){
			to_pageforSingleCar(1,$(this).attr("parking-id"));
			$("#EzStopModal").modal({
				backdrop:"static"
			});
		});
		function to_pageforSingleCar(pn,cameraId){
			
			$.ajax({
				url:"${APP_PATH}/getuserEzStopForDate",
				data:{"pn":pn,"cameraId":cameraId},
				type:"GET",
				success:function(result){
					build_routes_table_page(result);
					//build_page_info_page(result);
					//build_page_nav_page(result);
				}
			});
		}
		function build_routes_table_page(result){
			//清空table表格
			$("#EzStop_table tbody").empty();
			var i = 1;
			var camera = result.extend.pageInfo.list;
			$.each(camera,function(index,item){
					var ss = $("<td></td>").append(i);
					var singleCarId = $("<td style='display: none;'></td>").append(item.singleCarId);
					//var rr = $("<a></a>").append(item.cameraIp).attr('','').css('text-decoration','none').css('color','black');
					var routeName = item.singleCarRouteName;
						if (routeName == null || routeName == 0) {
							routeName = $("<td></td>").append("");
						}else{
							routeName = $("<td></td>").append(item.singleCarRouteName);
						}
					var singleCarTruckSpace = $("<td></td>").append(item.singleCarTruckSpace);
					var singleCarLicensePlate = $("<td></td>").append(item.singleCarLicensePlate);
					var singleCarStartTime = $("<td></td>").append(timestampToDateTime(item.singleCarStartTime));
					var singleCarEndTime = $("<td></td>").append(timestampToDateTime(item.singleCarEndTime));
					var singleCarPrice = $("<td></td>").append(item.singleCarPrice);
					var singleCarType = item.singleCarType;
					if(singleCarType == 0){
						singleCarType = $("<td></td>").append("未完成停车");
					}else if(singleCarType == 1){
						singleCarType = $("<td></td>").append("待付款");
					}else{
						singleCarType = $("<td></td>").append("已完成");
					}
					i++;
					$("<tr></tr>").append(singleCarId)
						.append(ss)
						.append(routeName)
						.append(singleCarTruckSpace)
						.append(singleCarLicensePlate)
						.append(singleCarStartTime)
						.append(singleCarEndTime)
						.append(singleCarPrice)
						.append(singleCarType)
						.appendTo("#EzStop_table tbody");
			});
		}
		//解析显示分页信息
		function build_page_info_page(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
					result.extend.pageInfo.pages+"页,总"+
					result.extend.pageInfo.total+"条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		//解析显示分页条，点击分页要能去下一页....
		function build_page_nav_page(result){
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

		
		
		
		
		
	</script>
</body>
</html>