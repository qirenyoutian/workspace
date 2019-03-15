<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
	table tr td,th{text-align: center;}
	.aaa{
	width:58px;
	height:30px;
	font-family:inherit;
	font-size:13px;
	color:white;
	background-color:#FFB90F;
	}
	.aaa:HOVER {
	background-color: #FF7F00;
	color: white; 
}

</style>
</head>
<body>
	<!-- 菜单修改的模态框 -->
	<div class="modal fade" id="monthCardUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">月卡修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			   <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">id</label>
			    <div class="col-sm-10">
			      <input type="text" name="menuId" class="form-control" id="monthCardId_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">月卡名字</label>
			    <div class="col-sm-10">
			      <input type="text" name="monthCardName" class="form-control" id="monthCardName_update_input" placeholder="月卡名字">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">适用路段</label>
			    <div class="col-sm-10">
			      <select class="form-control" name="monthCardRoute" id="monthCardRoute_update_sele"></select>
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">月卡价格</label>
			    <div class="col-sm-10">
			      <input type="text" name="monthCardPrice" class="form-control" id="monthCardPrice_update_input" placeholder="月卡价格">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">是否启用</label>
			    <div class="col-sm-10" style="margin-top:7px;">
			      <input type="radio" name="monthCardStatus" value="0" id="monthCardStatus0">未启用&nbsp;&nbsp;&nbsp;&nbsp;
			      <input type="radio" name="monthCardStatus" value="1" id="monthCardStatus1">启用
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="monthCard_update_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 菜单添加的模态框 -->
	<div class="modal fade" id="monthCardAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">月卡添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">月卡名字</label>
			    <div class="col-sm-10">
			      <input type="text" name="monthCardName" class="form-control" id="monthCardName_add_input" placeholder="月卡名字">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">适用路段</label>
			    <div class="col-sm-10">
			      <select class="form-control" name="monthCardRoute" id="monthCardRoute_add_sele"></select>
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">月卡价格</label>
			    <div class="col-sm-10">
			      <input type="text" name="monthCardPrice" class="form-control" id="monthCardPrice_add_input" placeholder="月卡价格">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">是否启用</label>
			    <div class="col-sm-10" style="margin-top:7px;">
			      <input type="radio" name="monthCardStatus" value="0" >未启用&nbsp;&nbsp;&nbsp;&nbsp;
			      <input type="radio" name="monthCardStatus" value="1" >启用
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="monthCard_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>月卡列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
			 <div class="col-md-8"></div>
			<div class="col-md-4">
				<button class="btn btn-primary" id="monthCard_add_modal_btn">新增月卡</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="user_table">
					<thead>
						<tr>
							<th style="display: none;">主键</th>
							<th>月卡名称</th>
							<th>适用路段</th>
							<th>月卡价格</th>
							<th>使用人数</th>
							<th>月卡状态</th>
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
			//去首页
			to_page(1);
		});
		$(document).ready(function(){
			$("#inquire").click(function(){
				to_page(1);
			});
		});
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/getAllMonthCard",
				data:{"pn":pn},
				type:"GET",
				cache:false,
				success:function(result){
					//1、解析并显示角色数据
					build_roles_table(result);
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		
		function build_roles_table(result){
			//清空table表格
			$("#user_table tbody").empty();
			var monthCard = result.extend.monthCardList.list;
			$.each(monthCard,function(index,item){
					var monthCardId = $("<td style='display: none;'></td>").append(item.monthCardId);
					var monthCardName = $("<td></td>").append(item.monthCardName);
					var monthCardRoute = $("<td></td>").append(item.route.routeLocationName);
					var monthCardPrice = $("<td></td>").append(item.monthCardPrice);
					var count = $("<td></td>").append("");
						if(monthCardId != null || monthCardId != ""){
								$.ajax({
									url:"${APP_PATH}/getMonthCardCount",
									data:{"id":item.monthCardId},
									type:"GET",
									success:function(result){
										count = $("<td></td>").append(result.extend.count);
										var monthCardStatus = item.monthCardStatus;
											if (monthCardStatus == 0) {
												monthCardStatus = $("<td></td>").append("未启用");
												//未启用就用启用按钮
												var statusBtn = $("<button></button>").addClass("btn btn-primary btn-sm enable_btn")
												.append($("<span></span>").addClass("glyphicon glyphicon-ok-sign")).append("启用");
												//为编辑按钮添加一个自定义的属性，来表示当前角色id
												statusBtn.attr("enable-id",item.monthCardId);
												var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
												.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
												//为删除按钮添加一个自定义的属性来表示当前删除的角色id
												delBtn.attr("del-id",item.monthCardId);
												
											}else{
												monthCardStatus = $("<td></td>").append("已启用");
												var statusBtn = $("<button></button>").addClass("btn aaa disable_btn")
												.append($("<span></span>").addClass("glyphicon glyphicon-remove")).append("停用");
												//为编辑按钮添加一个自定义的属性，来表示当前角色id
												statusBtn.attr("disable-id",item.monthCardId);
												
												var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
												.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除").attr("disabled","true");
												//为删除按钮添加一个自定义的属性来表示当前删除的角色id
												delBtn.attr("del-id",item.monthCardId);
											}
										var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
											.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
											//为编辑按钮添加一个自定义的属性，来表示当前角色id
										editBtn.attr("edit-id",item.monthCardId);
										
										var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn).append(statusBtn).append(" ");
										//var delBtn = 
										//append方法执行完成以后还是返回原来的元素
										$("<tr></tr>").append(monthCardId)
											.append(monthCardName)
											.append(monthCardRoute)
											.append(monthCardPrice)
											.append(count)
											.append(monthCardStatus)
											.append(btnTd)
											.appendTo("#user_table tbody");
									}
								});
						}
			});
		}
		//解析显示分页信息
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.extend.monthCardList.pageNum+"页,总"+
					result.extend.monthCardList.pages+"页,总"+
					result.extend.monthCardList.total+"条记录");
			totalRecord = result.extend.monthCardList.total;
			currentPage = result.extend.monthCardList.pageNum;
		}
		//解析显示分页条，点击分页要能去下一页....
		function build_page_nav(result){
			//page_nav_area
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			
			//构建元素
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.extend.monthCardList.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				//为元素添加点击翻页的事件
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.extend.monthCardList.pageNum -1);
				});
			}
			
			
			
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(result.extend.monthCardList.hasNextPage == false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				nextPageLi.click(function(){
					to_page(result.extend.monthCardList.pageNum +1);
				});
				lastPageLi.click(function(){
					to_page(result.extend.monthCardList.pages);
				});
			}
			
			
			
			//添加首页和前一页 的提示
			ul.append(firstPageLi).append(prePageLi);
			//1,2，3遍历给ul中添加页码提示
			$.each(result.extend.monthCardList.navigatepageNums,function(index,item){
				
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if(result.extend.monthCardList.pageNum == item){
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
		$("#monthCard_add_modal_btn").click(function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#monthCardAddModal form");
			//发送ajax请求，查出上级菜单信息，显示在下拉列表中
			getMonthCardRoute("#monthCardAddModal select");
			//弹出模态框
			$("#monthCardAddModal").modal({
				backdrop:"static"
			});
		});
		function getMonthCardRoute(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/getRoute",
				type:"GET",
				success:function(result){
					var optionEle = $("<option></option>").append('---路段选择---').attr("value",'0');
					optionEle.appendTo(ele);
					$.each(result.object.list,function(){
						var optionEle = $("<option></option>").append(this.routeLocationName).attr("value",this.routeId);
						optionEle.appendTo(ele);
					});
				}
			});
		}
		
		function SaveJudgmentisnotempty(){
			var a = $('input:radio[name="monthCardStatus"]:checked').val();
			if(a == null || a >= 3){
				bootbox.dialog({
					message: "<span class='bigger-110'>请选择一个启用类型!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
				$("#monthCard_save_btn").attr("ajax-va","error");
			}else{
					$("#monthCard_save_btn").attr("ajax-va","success");
			}
		}
		
		
		
		
		//点击保存，保存角色。
		$("#monthCard_save_btn").click(function(){
			
			var monthCardName = $("#monthCardName_add_input").val();
			var monthCardRoute = $("#monthCardRoute_add_sele").val();
			var monthCardPrice = $("#monthCardPrice_add_input").val();
			var monthCardStatus = $('input:radio[name="monthCardStatus"]:checked').val();
			SaveJudgmentisnotempty();
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//发送ajax请求保存角色
			$.ajax({
				url:"${APP_PATH}/saveMonthCard",
				type:"GET",
				data:{"monthCardName":monthCardName,"monthCardRoute":monthCardRoute,"monthCardPrice":monthCardPrice,"monthCardStatus":monthCardStatus},
				success:function(result){
					if(result.code == 100){
						//管理员保存成功；
						bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
						//角色保存成功；
						//1、关闭模态框
						$("#monthCardAddModal").modal('hide');
						to_page(totalRecord);
					}else{
						bootbox.dialog({
							message: "<span class='bigger-110'>"+result.extend.msp+"!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
					}
				}
			});
		});
		
		//修改功能
		
		//点击修改按钮弹出模态框。
		$(document).on("click",".edit_btn",function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#monthCardUpdateModal form");
			//发送ajax请求，查出上级菜单信息，显示在下拉列表中
			getMonthCardRoute("#monthCardUpdateModal select");
			//获取月卡信息
			getMonthCard($(this).attr("edit-id"))
			//传个Id给按钮
			$("#monthCard_update_btn").attr("edit-id",$(this).attr("edit-id"));
			//弹出模态框
			$("#monthCardUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		function getMonthCard(id){
			$.ajax({
				url:"${APP_PATH}/getmonthCardById/"+id,
				type:"GET",
				success:function(result){
					var mc = result.extend.monthCard;
					$("#monthCardName_update_input").val(mc.monthCardName);
					$("#monthCardPrice_update_input").val(mc.monthCardPrice);
					$("#monthCardRoute_update_sele").val(mc.monthCardRoute);
					$("#monthCardStatus"+mc.monthCardStatus).click();
				}
			});
		}
		function getMonthCardRoute(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/getRoute",
				type:"GET",
				async: false,
				success:function(result){
					var optionEle = $("<option></option>").append('---路段选择---').attr("value",'0');
					optionEle.appendTo(ele);
					$.each(result.object.list,function(){
						var optionEle = $("<option></option>").append(this.routeLocationName).attr("value",this.routeId);
						optionEle.appendTo(ele);
					});
				}
			});
		}
		
		function SaveJudgmentisnotempty(){
			var a = $('input:radio[name="monthCardStatus"]:checked').val();
			if(a == null || a >= 3){
				bootbox.dialog({
					message: "<span class='bigger-110'>请选择一个启用类型!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
				$("#monthCard_update_btn").attr("ajax-va","error");
			}else{
					$("#monthCard_update_btn").attr("ajax-va","success");
			}
		}
		
		
		
		//点击提交，更改信息。
		$("#monthCard_update_btn").click(function(){
			
			var monthCardId = $(this).attr("edit-id");
			var monthCardName = $("#monthCardName_update_input").val();
			var monthCardRoute = $("#monthCardRoute_update_sele").val();
			var monthCardPrice = $("#monthCardPrice_update_input").val();
			var monthCardStatus = $('input:radio[name="monthCardStatus"]:checked').val();
			SaveJudgmentisnotempty();
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//发送ajax请求保存角色
			$.ajax({
				url:"${APP_PATH}/updateMonthCard",
				type:"GET",
				data:{"monthCardId":monthCardId,"monthCardName":monthCardName,"monthCardRoute":monthCardRoute,"monthCardPrice":monthCardPrice,"monthCardStatus":monthCardStatus},
				success:function(result){
					if(result.code == 100){
						//管理员保存成功；
						bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
						//角色保存成功；
						//1、关闭模态框
						$("#monthCardUpdateModal").modal('hide');
						to_page(totalRecord);
					}else{
						alert("error");
					}
				}
			});
		});
		
		
		//启用功能
		$(document).on("click",".enable_btn",function(){
			var enableId = $(this).attr("enable-id");
			$.ajax({
				url:"${APP_PATH}/updateMonthCardStatus",
				type:"GET",
				data:{"status":1,"id":enableId},
				cache:false,
				success:function(result){
					if(result.code == 100){
						bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
						//1、关闭模态框
						$("#monthCardAddModal").modal('hide');
						to_page(totalRecord);
					}else{
						alert("error");
					}
				}
			});
		})
		
		//停用功能
		$(document).on("click",".disable_btn",function(){
			var disableId = $(this).attr("disable-id");
			
			$.ajax({
				url:"${APP_PATH}/updateMonthCardStatus",
				type:"GET",
				data:{"status":0,"id":disableId},
				cache:false,
				success:function(result){
					if(result.code == 100){
						bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
						//1、关闭模态框
						$("#monthCardAddModal").modal('hide');
						to_page(totalRecord);
					}else{
						alert("error");
					}
				}
			});
		})
		
		
		
		//单个删除
		$(document).on("click",".delete_btn",function(){
			//1、弹出是否确认删除对话框
			var userName = $(this).parents("tr").find("td:eq(2)").text();
			var userId = $(this).attr("del-id");
			bootbox.confirm("要删除【"+userName+"】吗?", function(result) {
				if(result){
					//确认，发送ajax请求删除即可
					$.ajax({
						url:"${APP_PATH}/deleteMonthCard/"+userId,
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

	</script>
</body>
</html>