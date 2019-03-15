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
	width:60px;
	height:30px;
	font-family:inherit;
	font-size:12px;
	color:white;
	background-color: #009688;
	border-color: :#009688;
	}
	.aaa:HOVER {
	color:white;
	background-color: #278297;
}

</style>
</head>
<body>
	<!-- 推送信息修改的模态框 -->
	<div class="modal fade" id="MessageUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" style="width: 800px;margin-left: -100px;">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">管理员修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	          <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">id</label>
			    <div class="col-sm-10">
			      <input type="text" name="pushMessageId" class="form-control" id="pushMessageId_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
	          <div class="form-group">
			    <label class="col-sm-2 control-label">消息标题</label>
			    <div class="col-sm-10">
			      <input type="text" name="pushMessageTitle" class="form-control" id="pushMessageTitle_update_input" maxlength="60" placeholder="消息标题">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">消息内容</label>
			    <div class="col-sm-10">
			       <!-- <input type="text" name="pushMessageComit" class="form-control" id="pushMessageComit_update_input" placeholder="消息内容"> -->
			      <textarea rows="8" cols="85" id="pushMessageComit_update_input" name="pushMessageComit" style="border-radius:3px;" maxlength="250">
			      </textarea>
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="message_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 消息添加的模态框 -->
	<div class="modal fade" id="messageAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" style="width: 800px;margin-left: -100px;">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加消息推送</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">消息标题</label>
			    <div class="col-sm-10">
			      <input type="text" name="pushMessageTitle" class="form-control" id="pushMessageTitle" placeholder="消息标题">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">消息内容</label>
			    <div class="col-sm-10">
			      <!-- <input type="text" name="pushMessageComit" class="form-control" id="pushMessageComit" placeholder="消息内容"> -->
			      <textarea rows="8" cols="85" id="pushMessageComit" name="pushMessageComit" style="border-radius:3px;"></textarea>
			      <span class="help-block"></span>
			    </div>
			  </div>
			  	<div class="form-group">
			    <label class="col-sm-2 control-label">用户类型</label>
			    <div class="col-sm-10">
			      <input type="radio" name ="pushMessageType" value="0"  >客户APP
			      <input type="radio" name ="pushMessageType" value="1" >路巡APP
			      <span class="help-block"></span>
			    </div>
			  </div>
			  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 推送的模态框 -->
	<div class="modal fade" id="messagePushModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">消息推送</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label" style="width:180px;">请选择推送的目标用户</label>
			    <div class="col-sm-10" style="width:180px;">
			      <select id = "userType" class="form-control">
			      	<option value = "1">全部用户</option>
			      	<option value = "2">月票用户</option>
			      	<option value = "3">已认证车主用户</option>
			      </select>
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="message_push_btn">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>消息推广列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
			<div class="col-md-8">
			</div>
			<div class="col-md-4">
				<button class="btn btn-primary" id="user_add_modal_btn">新增推送消息</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="user_table">
					<thead>
						<tr>
							<th style="display: none;width: 100px;">主键</th>
							<th>消息标题</th>
							<th style="width: 400px;">消息内容</th>
							<th>发送对象</th>
							<th>推送</th>
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
				url:"${APP_PATH}/getAllPushMessage",
				data:{"pn":pn},
				type:"GET",
				cache:false,
				success:function(result){
					//console.log(result);
					//1、解析并显示角色数据
					build_roles_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		
		function build_roles_table(result){
			//清空table表格
			$("#user_table tbody").empty();
			var user = result.extend.pageInfo.list;
			$.each(user,function(index,item){
				var pushMessageId = $("<td style='display: none;'></td>").append(item.pushMessageId);
				var pushMessageTitle = $("<td></td>").append(item.pushMessageTitle);
				var pushMessageComit = $("<td></td>").append(item.pushMessageComit);
				var pushMessageType;
				var pushBtnHtml;
				if(item.pushMessageType == 0){
					pushMessageType = $("<td></td>").append("用户");
					pushBtnHtml = $("<button></button>").addClass("btn aaa clientpush_btn").append($("<span></span>").addClass("glyphicon glyphicon-file")).append("推送");
					pushBtnHtml.attr("clientpush-id",item.pushMessageId);
				}else{
					pushMessageType = $("<td></td>").append("路巡");
					pushBtnHtml = $("<button></button>").addClass("btn aaa RoadTourpush_btn").append($("<span></span>").addClass("glyphicon glyphicon-file")).append("推送");
					pushBtnHtml.attr("RoadTourpush-id",item.pushMessageId);
				}
				var pushBtn = $("<td></td>").append(pushBtnHtml);
					
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前角色id
				editBtn.attr("edit-id",item.pushMessageId);
				
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的角色id
				delBtn.attr("del-id",item.pushMessageId);
				var btnTd = $("<td></td>").append(editBtn).append("&nbsp;&nbsp;&nbsp;&nbsp;").append(delBtn);
				$("<tr></tr>")
					.append(pushMessageId)
					.append(pushMessageTitle)
					.append(pushMessageComit)
					.append(pushMessageType)
					.append(pushBtn)
					.append(btnTd)
					.appendTo("#user_table tbody");
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
		$("#user_add_modal_btn").click(function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#messageAddModal form");
			//弹出模态框
			$("#messageAddModal").modal({
				backdrop:"static"
			});
		});
		
		function SaveJudgmentisnotempty(){
			var a = $('input:radio[name="pushMessageType"]:checked').val();
			if(a == null || a >= 3){
				bootbox.dialog({
					message: "<span class='bigger-110'>请选择一个类型!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-erro"}}
				});
				$("#user_save_btn").attr("ajax-va","error");
				return;
			}else{
				$("#user_save_btn").attr("ajax-va","success");
			}
		}
		
		//点击保存，保存角色。
		$("#user_save_btn").click(function(){
			//非空判断
			SaveJudgmentisnotempty();
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			$.ajax({
				url:"${APP_PATH}/savePushMessage",
				type:"POST",
				data:$("#messageAddModal form").serialize(),
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
						$("#messageAddModal").modal('hide');
						
						//2、来到最后一页，显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可
						to_page(1);
					}else{
						//显示失败信息
						//console.log(result);
						//有哪个字段的错误信息就显示哪个字段的；
						bootbox.dialog({
						message: "<span class='bigger-110'>"+result.extend.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
					}
				}
			});
		});
		
	
		$(document).on("click",".edit_btn",function(){
			reset_form("#MessageUpdateModal form");
			getMessage($(this).attr("edit-id"));
			//3、把角色的id传递给模态框的更新按钮
			$("#message_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#MessageUpdateModal").modal({
				backdrop:"static"
			});
		});
		function getMessage(id){
			$.ajax({
				url:"${APP_PATH}/getPushMessageById/"+id,
				type:"GET",
				cache:false,
				success:function(result){
					var p = result.extend.pushMessage;
					$("#pushMessageId_update_input").val(p.pushMessageId);
					$("#pushMessageTitle_update_input").val(p.pushMessageTitle);
					$("#pushMessageComit_update_input").val(p.pushMessageComit);
				}
			});
		}
		//点击更新，更新角色信息
		$("#message_update_btn").click(function(){
			$.ajax({
				url:"${APP_PATH}/updatePushMessage/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#MessageUpdateModal form").serialize(),
				success:function(result){
					bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
					//1、关闭对话框
					$("#MessageUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});
		
		//单个删除
		$(document).on("click",".delete_btn",function(){
			//1、弹出是否确认删除对话框
			var userId = $(this).attr("del-id");
			
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result){
					//确认，发送ajax请求删除即可
					$.ajax({
						url:"${APP_PATH}/deletePushMessage/"+userId,
						type:"DELETE",
						success:function(result){
							bootbox.dialog({
								message: "<span class='bigger-110'>"+result.msg+"!</span>",
								buttons: 			
								{ "button":{"label":"确定", "className":"btn-sm btn-success"}}
							});
							//回到本页
							to_page(currentPage);
						}
					});
				}
			});
		});
		//推送用户APP
		$(document).on("click",".clientpush_btn",function(){
			reset_form("#messagePushModal form");
			$("#message_push_btn").attr("clientpush-id",$(this).attr("clientpush-id"));
			//弹出模态框
			$("#messagePushModal").modal({
				backdrop:"static"
			});
		});
		
		$(document).on("click","#message_push_btn",function(){
			var messageId = $(this).attr("clientpush-id");
			var aa = $("#userType").val();
			$.ajax({
				url:"${APP_PATH}/BypushMessage",
				data:{"clientpushId":messageId,"clientpushType":1,"userType":aa},
				type:"POST",
				success:function(result){
					if(result.code == 100){
						bootbox.dialog({
							message: "<span class='bigger-110'>"+result.msg+"!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						//1、关闭对话框
						$("#messagePushModal").modal("hide");
						//回到本页
						to_page(currentPage);
					}
				}
			});
		})
		
		//推送路巡App
		$(document).on("click",".RoadTourpush_btn",function(){
			var RoadTourpushId = $(this).attr("RoadTourpush-id");
			bootbox.confirm("确定要推送此消息吗?", function(result) {
				if(result){
					$.ajax({
						url:"${APP_PATH}/BypushMessage",
						data:{"clientpushId":RoadTourpushId,"clientpushType":2,"userType":0},
						type:"POST",
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
			})
		})
	
	</script>
</body>
</html>