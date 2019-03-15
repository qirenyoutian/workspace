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
	width:88px;
	height:30px;
	font-family:inherit;
	font-size:13px;
	color:white;
	background-color:black;
	}
</style>
</head>
<body>
		<!-- 路段添加的模态框 -->
	<div class="modal fade" id="adminAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">路段添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">路段名称</label>
			    <div class="col-sm-10">
			      <input type="text" name="routeLocationName" class="form-control" id="routeLocationName_add_input" placeholder="请输入路段名称">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">摄像头IP</label>
			    <div class="col-sm-10">
			    	<select name="routeCameraId" id="routeCameraId_add_input" style="width: 180px;height:34px;padding: 0 2%;margin: 0;">
			    		
			    	</select>
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">计费方式类型</label>
			    <div class="col-sm-10">
			    	<select name="routeBillingMethodType" id="routeBillingMethodType_add_input" style="width: 180px;height:34px;padding: 0 2%;margin: 0;">
			    		<option value="0">时间段</option>
			    		<option value="1">按小时计算制</option>
			    		<option value="2">按15分钟计算制</option>
			    	</select>
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group" id="time_quantum">
			    <label class="col-sm-2 control-label">计费方式(时间段)</label>
			    <div class="col-sm-10">
			    	<select name="routeBillingMethodId" id="routeBillingMethodId_add_input" style="width: 180px;height:34px;padding: 0 2%;margin: 0;">
			    		
			    	</select>
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="admin_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="routeUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">路段修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	         <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">routeid</label>
			    <div class="col-sm-10">
			      <input type="text" name="routeId" class="form-control" id="routeId_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">路段名</label>
			    <div class="col-sm-10">
			      <input type="text" name="routeLocationName" class="form-control" id="routeLocationName_update_input" placeholder="请输入路段名">
				  <span class="help-block"></span>
			    </div>
			  </div>
			  <!-- <div class="form-group">
			    <label class="col-sm-2 control-label">摄像头ip</label>
			    <div class="col-sm-10">
			      <input type="text" name="cameraIp" class="form-control" id="routeCameraIp_update_input" placeholder="请输入摄像头ip">
				  <span class="help-block"></span>
			    </div>
			  </div> -->
			  <div class="form-group">
			    <label class="col-sm-2 control-label">计费方式类型</label>
			    <div class="col-sm-10">
			    	<select name="routeBillingMethodType" id="routeBillingMethodType_update_input" style="width: 180px;height:34px;padding: 0 2%;margin: 0;">
			    		<option value="0">时间段</option>
			    		<option value="1">按小时计算制</option>
			    		<option value="2">按15分钟计算制</option>
			    	</select>
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group" id = "time_quantum_update">
			    <label class="col-sm-2 control-label">计费方式</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethod.billingMethodName" class="form-control" id="routeBillingMethodName_update_input" placeholder="请输入计费方式">
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="route_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="truckSpaceAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="mytimeQuantum">摄像头添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">ip</label>
			    <div class="col-sm-10">
			    	<input type="hidden" name="routeId" id="route_id">
			    	<select name="cameraId" id="cameraId_add_input" style="width: 180px;height:34px;padding: 0 2%;margin: 0;">
			    		
			    	</select>
				  <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="truckSpace_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>路段列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
			<div id="routeInput">
					 <div class="col-md-4">
						<select class="form-control" id="routeSelect" style="height:32px; width:200px;" name="SaveMenuSuperior"></select>
					</div>
				</div>
			<div class="col-md-4">
				<button class="btn btn-primary" id="admin_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="admin_delete_modal_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="route_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th style="display: none;">主键</th>
							<th style="width: 180px;">路段名称</th>
							<th>摄像头IP</th>
							<th>计费方式</th>
							<th style="max-width: 200px;">车位</th>
							<th>车位使用情况</th>
							<th>路段经度</th>
							<th>路段维度</th>
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
		//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
		$(function(){
			to_page(1);
		});
		$(document).ready(function(){
			$("#inquire").click(function(){
				to_page(1);
			});
		});
		
		$("#routeSelect").change(function(){
			to_pageByName(1);
		});
		//根据路段选择查找路段信息
		function to_pageByName(pn){
			var route = $("#routeSelect").val();
			if (route == 0) {
				to_page(pn)
			}else{
				$.ajax({
					url:"${APP_PATH}/getRouteByRoute",
					data:{"pn":pn,"content":route},
					type:"POST",
					success:function(result){
						build_routes_table(result);   //1、解析并显示角色数据
						build_page_info(result);	 //2、解析并显示分页信息
						build_page_nav(result);		 //3、解析显示分页条数据
	
					}
				});
			}
		}
		//查找全部路段信息
		function to_page(pn){
				$.ajax({
					url:"${APP_PATH}/getRoute",
					data:{"pn":pn},
					type:"GET",
					cache:false,
					success:function(result){
						build_routes_table(result);		//1、解析并显示角色数据	
						build_page_info(result);		//2、解析并显示分页信息
						build_page_nav(result);			//3、解析显示分页条数据
					}
				});
				aa();
		}
		//时间格式
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
		function build_routes_table(result){
			//清空table表格
			$("#route_table tbody").empty();
			var route = result.object.list;
			$.each(route,function(index,item){
				$.each(item.cameraRecords,function(i,camera){
					
					var checkBoxTd = $("<td  style='text-align:center;vertical-align:middle;'><input type='checkbox' class='check_item'/></td>");
					var routeId = $("<td style='display: none;text-align:center;vertical-align:middle;'></td>").append(item.routeId);
					var routeLocationName = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.routeLocationName);
					
					var routeCameraIpHtml = "";
					
					var truckSpaceHtml = "";
					var a = 0;
					var b = 0;
					
					routeCameraIpHtml += "<p><span>"+camera.cameraIp+"&nbsp;&nbsp;&nbsp;&nbsp;</span>";
					//routeCameraIpHtml += '<span class="btn btn-sm btn-danger ml5" onclick="deleteTruckSpace('+camera.cameraId+')"><i class="glyphicon glyphicon-remove"></i></span></p>';
					
					$.each(camera.truckSpaces,function(i,ts){
						truckSpaceHtml += "<span>"+ts.truckSpaceName+"&nbsp;&nbsp;</span>";
						if(i > 0 && i%7 == 0){
							truckSpaceHtml += "<br>";
						}
						if(ts.truckSpaceStatus == 0){
							a++;
						}else{
							b++;
						}
					})
					
					var truckSpace = $("<td style='text-align:center;vertical-align:middle;'></td>").append(truckSpaceHtml);
					
					var routeCameraIp = $("<td style='text-align:center;vertical-align:middle;'></td>").append(routeCameraIpHtml);
					var routeBillingMethod;
					if(item.routeBillingMethodType == 0){
						if(item.billingMethod != null){
							routeBillingMethod = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.billingMethod.billingMethodName);
						}else{
							routeBillingMethod = $("<td style='text-align:center;vertical-align:middle;'></td>").append("");
						}
					}else if(item.routeBillingMethodType == 1){
						routeBillingMethod = $("<td style='text-align:center;vertical-align:middle;'></td>").append("按小时制计费方式");
					}else if(item.routeBillingMethodType == 2){
						routeBillingMethod = $("<td style='text-align:center;vertical-align:middle;'></td>").append("按15分钟制计费方式");
					}
					var routeBilling = $("<td style='text-align:center;vertical-align:middle;'></td>").append("<p>已使用："+b+"</p><p>空闲："+a+"</p>");
					var routeLongitude = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.routeLongitude);
					var routeLatitude = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.routeLatitude);
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
					.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
					//为编辑按钮添加一个自定义的属性，来表示当前角色id
					editBtn.attr("edit-id",item.routeId);
					//如果删除可用的情况下删除键出现
					var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
					delBtn.attr("del-id",camera.cameraId);
					var saveBtn = $("<button></button>").addClass("btn aaa save_btn")
					.append($("<span></span>").addClass("")).append("添加摄像头");
					//为编辑按钮添加一个自定义的属性，来表示当前角色id
					saveBtn.attr("save-id",item.routeId);
					var btnTd = $("<td style='text-align:center;vertical-align:middle;'></td>").append(editBtn).append(" ").append(delBtn).append(" ").append(saveBtn);
					//append方法执行完成以后还是返回原来的元素
					$("<tr></tr>").append(checkBoxTd)
						.append(routeId)
						.append(routeLocationName)
						.append(routeCameraIp)
						.append(routeBillingMethod)
						.append(truckSpace)
						.append(routeBilling)
						.append(routeLongitude)
						.append(routeLatitude)
						.append(btnTd)
						.appendTo("#route_table tbody");
				})
			});
		}
		//解析显示分页信息
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.object.pageNum+"页,总"+
					result.object.pages+"页,总"+
					result.object.size+"条记录");
			totalRecord = result.object.total;
			currentPage = result.object.pageNum;
		}
		//解析显示分页条，点击分页要能去下一页....
		function build_page_nav(result){
			//page_nav_area
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			
			//构建元素
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.object.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				//为元素添加点击翻页的事件
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.object.pageNum -1);
				});
			}
			
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(result.object.hasNextPage == false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				nextPageLi.click(function(){
					to_page(result.object.pageNum +1);
				});
				lastPageLi.click(function(){
					to_page(result.object.pages);
				});
			}
			
			//添加首页和前一页 的提示
			ul.append(firstPageLi).append(prePageLi);
			//1,2，3遍历给ul中添加页码提示
			$.each(result.object.navigatepageNums,function(index,item){
				
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if(result.object.pageNum == item){
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
		
		function aa(){
			$("#routeSelect").html("");
			$.ajax({
				url:"${APP_PATH}/getRoute",
				type:"GET",
				success:function(result){
					var sele = $("#routeSelect");
					var optionEle = $("<option></option>").append("全部").attr("value","0");
					optionEle.appendTo(sele);
						$.each(result.object.list,function(){
							var optionEle = $("<option></option>").append(this.routeLocationName).attr("value",this.routeId);
							optionEle.appendTo(sele);
						});
				}
			}); 
		}
		
		//清空表单样式及内容
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		//显示校验结果的提示信息
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		//点击新增按钮弹出模态框。
		$("#admin_add_modal_btn").click(function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#adminAddModal form");
			$.ajax({
				url:"${APP_PATH}/selectCameraIp",
				type:"POST",
				success:function(result){
					var cameras = result.object;
					var html = "";
					$.each(cameras,function(index,item){
						html += '<option value="'+item.cameraId+'" style="text-align:center;">'+item.cameraName+'</option>';
					})
					$("#routeCameraId_add_input").html(html);
				}
			});
			$.ajax({
				url:"${APP_PATH}/selectBillingMethodName",
				type:"POST",
				success:function(result){
					var billingMethods = result.object;
					var html = "";
					$.each(billingMethods,function(index,item){
						html += '<option value="'+item.billingMethodId+'" style="text-align:center;">'+item.billingMethodName+'</option>';
					})
					$("#routeBillingMethodId_add_input").html(html);
				}
			});
			//弹出模态框
			$("#adminAddModal").modal({
				backdrop:"static"
			});
		});
		
		$("#routeLocationName_add_input").blur(function(){
			//发送ajax请求校验菜单名称是否可用
			var routeName = this.value;
			$.ajax({
				url:"${APP_PATH}/checkRouteName",
				data:{"routeName":routeName},
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#routeLocationName_add_input","success","菜单名称可用");
							if($("#admin_save_btn").attr("ajax-va")=="error"){
								$("#admin_save_btn").attr("ajax-va","success");
							}
					}else{
						show_validate_msg("#routeLocationName_add_input","error",result.extend.va_msg);
						$("#admin_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		
		//点击保存
		$("#admin_save_btn").click(function(){
			//1、非空判断
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//2、发送ajax请求保存管理员
			$.ajax({
				url:"${APP_PATH}/saveRoute",
				type:"POST",
				data:$("#adminAddModal form").serialize(),
				success:function(result){
					if(result.code == 100){
						//管理员保存成功；
						bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
						$("#adminAddModal").modal('hide');
						to_page(totalRecord);
					}else{
						bootbox.dialog({
							message: "<span class='bigger-110'>"+result.extend.msg+"!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
					}
				}
			});
		});
		
		//完成全选/全不选功能
		$("#check_all").click(function(){
			//attr获取checked是undefined;
			//我们这些dom原生的属性；attr获取自定义属性的值；
			//prop修改和读取dom原生属性的值
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//点击全部删除，就批量删除
		$("#admin_delete_modal_btn").click(function(){
			//
			var routeNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"),function(){
				//this
				routeNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				//组装角色id字符串
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			//去除roleNames多余的,
			routeNames = routeNames.substring(0, routeNames.length-1);
			//去除删除的id多余的-
			del_idstr = del_idstr.substring(0, del_idstr.length-1);
			if(routeNames == null || routeNames == ""){
				bootbox.dialog({
					message: "<span class='bigger-110'>请选择需要删除的记录!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-erro"}}
				});
				return;
			}
			bootbox.confirm("确定要删除["+routeNames+"]吗?", function(result) {
				if(result){
					//发送ajax请求删除
					$.ajax({
						url:"${APP_PATH}/deleteroute/"+del_idstr,
						type:"DELETE",
						success:function(result){
							bootbox.dialog({
								message: "<span class='bigger-110'>"+result.msg+"!</span>",
								buttons: 			
								{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
							});
							//回到当前页面
							to_page(currentPage);
						}
					});
				}
			});
		});
		
		//单个删除
		$(document).on("click",".delete_btn",function(){
			//1、弹出是否确认删除对话框
			var routeName = $(this).parents("tr").find("td:eq(2)").text();
			var id = $(this).attr("del-id");
			bootbox.confirm("确定要删除"+routeName+"吗?", function(result) {
				if(result){
					//确认，发送ajax请求删除即可
					$.ajax({
						url:"${APP_PATH}/deleteroute/"+id,
						type:"DELETE",
						success:function(result){
							bootbox.dialog({
								message: "<span class='bigger-110'>"+result.msg+"!</span>",
								buttons: 			
								{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
							});
							//回到本页
							to_page(currentPage);
						}
					});
				}
			});
		});
		
		$(document).on("click",".edit_btn",function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#routeUpdateModal form");
			//2、查出数据库表信息，显示数据库表信息
			getRoute($(this).attr("edit-id"));
			//3、把角色的id传递给模态框的更新按钮
			$("#route_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#routeUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		function getRoute(id){
			$("#time_quantum_update").hide();
			$.ajax({
				url:"${APP_PATH}/getRouteById/"+id,
				type:"GET",
				success:function(result){
					var routeRecord = result.object;
					$("#routeId_update_input").val(routeRecord.routeId);
					$("#routeLocationName_update_input").val(routeRecord.routeLocationName);
					//$("#routeCameraIp_update_input").val(routeRecord.camera.cameraIp);
					$("#routeBillingMethodType_update_input").val(routeRecord.routeBillingMethodType);
					if(routeRecord.routeBillingMethodType == 0){
						$("#time_quantum_update").show();
					}
					if(routeRecord.billingMethod != null){
						$("#routeBillingMethodName_update_input").val(routeRecord.billingMethod.billingMethodName);
					}
				}
			});
		}
		
		$("#route_update_btn").click(function(){
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//2、发送ajax请求保存更新的角色数据
			$.ajax({
				url:"${APP_PATH}/updateRoute",
				type:"PUT",
				data:$("#routeUpdateModal form").serialize(),
				success:function(result){
					if(result.code == 100){
						bootbox.dialog({
							message: "<span class='bigger-110'>"+result.msg+"!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						//1、关闭对话框
						$("#routeUpdateModal").modal("hide");
						//2、回到本页面
						to_page(currentPage);
					}else{
						bootbox.dialog({
							message: "<span class='bigger-110'>"+result.extend.msg+"!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
					}
				}
			});
		});
		
		function deleteTruckSpace(id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result){
					//确认，发送ajax请求删除即可
					$.ajax({
						url:"${APP_PATH}/deleteTruckSpace",
						type:"POST",
						data:{"id":id},
						success:function(result){
							bootbox.dialog({
								message: "<span class='bigger-110'>"+result.msg+"!</span>",
								buttons: 			
								{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
							});
							//回到本页
							to_page(currentPage);
						}
					});
				}
			});
		}
		
		$(document).on("click",".save_btn",function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#truckSpaceAddModal form");
			$("#route_id").val($(this).attr("save-id"))
			$.ajax({
				url:"${APP_PATH}/selectCameraIp",
				type:"POST",
				success:function(result){
					var cameras = result.object;
					var html = "";
					$("#cameraId_add_input").html(html);
					$.each(cameras,function(index,item){
						html += '<option value="'+item.cameraId+'" style="text-align:center;">'+item.cameraIp+'</option>';
					})
					$("#cameraId_add_input").html(html);
				}
			});
			//弹出模态框
			$("#truckSpaceAddModal").modal({
				backdrop:"static"
			});
		});
		
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		
		
		$(document).on("click","#truckSpace_save_btn",function(){
			var routeId = $("#route_id").val();
			var cameraId = $("#cameraId_add_input").val();
			$.ajax({
				url:"${APP_PATH}/saveCamera",
				type:"POST",
				data:{"routeId":routeId,"cameraId":cameraId},
				success:function(result){
					if(result.code == 100){
						//分组保存成功；
						bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#truckSpaceAddModal").modal('hide');
						to_page(totalRecord);
					}else{
						bootbox.dialog({
						message: "<span class='bigger-110'>"+result.extend.msg+"!</span>",
						buttons: 			
						{"button":{"label":"确定", "className":"btn-sm btn-success"}}
						});
					}
				}
			})
		})
		
		$("#routeBillingMethodType_add_input").change(function (){
			var i = $("#routeBillingMethodType_add_input").val();
			if(i == 0){
				$("#time_quantum").show();
			}else if(i == 1){
				$("#time_quantum").hide();
			}else if(i == 2){
				$("#time_quantum").hide();
			}
		})
		$("#routeBillingMethodType_update_input").change(function (){
			var i = $("#routeBillingMethodType_update_input").val();
			if(i == 0){
				$("#time_quantum_update").show();
			}else if(i == 1){
				$("#time_quantum_update").hide();
			}else if(i == 2){
				$("#time_quantum_update").hide();
			}
		})
	</script>
</body>
</html>