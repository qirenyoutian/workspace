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
<!-- 时间选择器 -->
<script type="text/javascript" src="${APP_PATH }/static/datetime/js/jedate.js"></script>
<link type="text/css" rel="stylesheet" href="${APP_PATH }/static/datetime/js/skins/jedate.css">

<style type="text/css">
	table tr td,th{text-align: center;}
	.aaa{
	width:60px;
	height:30px;
	font-family:inherit;
	font-size:13px;
	color:white;
	background-color:black;
	}
	.bbb{
	width:80px;
	height:30px;
	font-family:inherit;
	font-size:13px;
	color:white;
	background-color:#ffc64c;
	}
	.month_card{
	width:80px;
	height:30px;
	font-family:inherit;
	font-size:13px;
	color:white;
	background-color:#3fabff;
	}
</style>
</head>
<body>
	<!-- 菜单修改的模态框 -->
	<div class="modal fade" id="userUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">用户修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	         <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">id</label>
			    <div class="col-sm-10">
			      <input type="text" name="userId" class="form-control" id="userId_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			 <div class="form-group">
			    <label class="col-sm-2 control-label">用户昵称</label>
			    <div class="col-sm-10">
			      <input type="text" name="userNickname" class="form-control" id="userNickname_update_input" placeholder="用户昵称">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-10">
			      <input type="text" name="userPassWord" class="form-control" id="userPassWord_update_input" placeholder="不填则不修改">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">真实姓名</label>
			    <div class="col-sm-10">
			      <input type="text" name="userFullName" class="form-control" id="userFullName_update_input" placeholder="用户真实姓名">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">用户性别</label>
			    <div class="col-sm-10">
			      <input type="text" name="userGender" class="form-control" id="userGender_update_input" placeholder="用户性别">
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="user_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 添加用户的模态框 -->
	<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加用户</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">电话号码</label>
			    <div class="col-sm-10">
			      <input type="text" name="userAccount" class="form-control" id="userAccount" placeholder="电话号码" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');">
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
	    </div>
	  </div>
	</div>
	
	<!-- 停车记录的模态框 -->
	<div class="modal fade" id="MonthCardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" style="width: 800px;margin-left: -80px;">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myMonthCard">月票信息</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			  <table class="table table-hover" id="MonthCard_table">
					<thead>
						<tr>
							<th>月卡名称</th>
							<th>所属路段</th>
							<th>开始时间</th>
							<th>结束时间</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			  </div>
			</form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>用户列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
			<div class="col-md-8" style="width:750px;">
				<div class="col-md-4">
					<input type="text" id="content" class="form-control" placeholder="请输入用户电话号码" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');">
				</div>
						<div class="input-group"style="float:left;">
							<div class="demo2">
<!-- 								<input placeholder="请输入日期" id="startTime" style="width:180px;height:30px; border-radius:3px;" class="laydate-icon" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
 -->								<input type="text" id="startTime" class="jeinput" style="height:32px;" placeholder="请输入日期">
									<input type="text" id="endTime" class="jeinput" style="height:32px;" placeholder="请输入日期">
							</div>
						</div>
					<button type="button" id="inquire" class="btn btn-primary" style="float:left;">查询</button>
			</div>
			<div class="col-md-4" style="width:150px; margin-left: 20px;">
				<button class="btn btn-primary" id="user_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="user_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="user_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th style="display: none;">主键</th>
							<th>序号</th>
							<th>用户账号</th>
							<th>真实姓名</th>
							<th>性别</th>
							<!-- <th>邮箱</th> -->
							<th>余额</th>
							<th>积分</th>
							<th>用户创建时间</th>
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
	<script type="text/javascript" src="${APP_PATH }/static/datetime/js/test/demo.js"></script>	
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
			var content = $("#content").val();
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();
			$.ajax({
				url:"${APP_PATH}/getUserAll",
				data:{"pn":pn,"content":content,"startTime":startTime,"endTime":endTime},
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
			var i = 1;
			var user = result.extend.pageInfo.list;
			$.each(user,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var userId = $("<td style='display: none;'></td>").append(item.userId);
				var ss = $("<td></td>").append(i);
				var userAccount = $("<td></td>").append(item.userAccount);
				var userFullName = $("<td></td>").append(item.userFullName);
				var userGender = $("<td></td>").append(item.userGender);
				var userMailbox = $("<td></td>").append(item.userMailbox);
				var userBalance = $("<td></td>").append(item.userBalance);
				var userIntegral = $("<td></td>").append(item.userIntegral);
				var userCreationTime = $("<td></td>").append(item.userCreationTime);
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前角色id
				editBtn.attr("edit-id",item.userId);
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				
				var blackBtn =  $("<button></button>").addClass("btn aaa black_btn")
								.append($("<span></span>").addClass("")).append("拉黑");
				
				var relieveblackBtn =  $("<button></button>").addClass("btn aaa relieveblack_btn")
				.append($("<span></span>").addClass("")).append("解除");
				
				var EzStopBtn =  $("<button></button>").addClass("btn bbb EzStop_btn")
				.append($("<span></span>").addClass("")).append("停车记录");
				
				var monthCardBtn =  $("<button></button>").addClass("btn month_card monthCard_btn")
				.append($("<span></span>").addClass("")).append("月票信息");
				
				//为删除按钮添加一个自定义的属性来表示当前删除的角色id
				delBtn.attr("del-id",item.userId);
				blackBtn.attr("del-id",item.userId);
				relieveblackBtn.attr("del-id",item.userId);
				EzStopBtn.attr("del-id",item.userId);
				monthCardBtn.attr("del-id",item.userId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn).append(" ").append(EzStopBtn).append(" ").append(monthCardBtn);
				if(item.userBlack == "1"){
					btnTd.append(" ").append(relieveblackBtn);
				}else{
					btnTd.append(blackBtn);
				}
				i++;
				//var delBtn = 
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd)
					.append(userId)
					.append(ss)
					.append(userAccount)
					.append(userFullName)
					.append(userGender)
					//.append(userMailbox)
					.append(userBalance)
					.append(userIntegral)
					.append(userCreationTime)
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
			reset_form("#userAddModal form");
			//发送ajax请求，查出上级菜单信息，显示在下拉列表中
			getuserSuperior("#userAddModal select");
			//弹出模态框
			$("#userAddModal").modal({
				backdrop:"static"
			});
		});
		function getuserSuperior(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			/* $.ajax({
				url:"${APP_PATH}/getuser",
				type:"GET",
				success:function(result){
					var optionEle = $("<option></option>").append('主菜单').attr("value",'主菜单');
					optionEle.appendTo(ele);
					$.each(result.extend.userList,function(){
						var optionEle = $("<option></option>").append(this.userName).attr("value",this.userName);
						optionEle.appendTo(ele);
					});
				}
			}); */
		}
		//校验菜单名称是否可用
		$("#userName_add_input").change(function(){
			//发送ajax请求校验菜单名称是否可用
			var userName = this.value;
			$.ajax({
				url:"${APP_PATH}/checkuserName",
				data:"userName="+userName,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#userName_add_input","success","菜单名称可用");
						if($("#user_save_btn").attr("ajax-va")!="error"){
							$("#user_save_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#userName_add_input","error",result.extend.va_msg);
						$("#user_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		
		
		//点击保存，保存角色。
		$("#user_save_btn").click(function(){
			var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;  
	        if (!myreg.test($("#userAccount").val())) { 
	        	bootbox.dialog({
					message: "<span class='bigger-110'>手机号码格式不对!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-erro"}}
				});
	        	return;
	        }
			$.ajax({
				url:"${APP_PATH}/saveuser",
				type:"POST",
				data:{"userAccount":$("#userAccount").val()},
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
						$("#userAddModal").modal('hide');
						
						//2、来到最后一页，显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可
						
						to_page(1);//totalRecord
						
					}else{
						//显示失败信息
						//console.log(result);
						//有哪个字段的错误信息就显示哪个字段的；
						if(undefined != result.extend.errorFields.userName){
							show_validate_msg("#userName_add_input", "error", result.extend.errorFields.userName);
						}
						if(undefined != result.extend.errorFields.userDetail){
							show_validate_msg("#userDetail_add_input", "error", result.extend.errorFields.userDetail);
						}
						if(undefined != result.extend.errorFields.userUrl){
							show_validate_msg("#userUrl_add_input", "error", result.extend.errorFields.userUrl);
						}
					}
				}
			});
		});
		
		//1、我们是按钮创建之前就绑定了click，所以绑定不上。
		//1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
		//jquery新版没有live，使用on进行替代
		$(document).on("click",".edit_btn",function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#userUpdateModal form");
			getuserSuperior("#userUpdateModal select");
			//2、查出数据库表信息，显示数据库表信息
			getuser($(this).attr("edit-id"));
			//3、把角色的id传递给模态框的更新按钮
			$("#user_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#userUpdateModal").modal({
				backdrop:"static"
			});
		});
		function getuser(id){
			$.ajax({
				url:"${APP_PATH}/getuserById/"+id,
				type:"GET",
				success:function(result){
					var user = result.object;
					$("#userId_update_input").val(user.userId);
					$("#userNickname_update_input").val(user.userNickname);
					$("#userGender_update_input").val(user.userGender);
					$("#userFullName_update_input").val(user.userFullName);
					$("#userUpdateModal select").val([user.userSuperior]);
				}
			});
		}
		//校验菜单名称是否可用
		$("#userName_update_input").change(function(){
			//发送ajax请求校验用户名是否可用
			var userName = this.value;
			$.ajax({
				url:"${APP_PATH}/checkuserName",
				data:"userName="+userName,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#userName_update_input","success","菜单名称可用");
						if($("#user_update_btn").attr("ajax-va")!="error"){
							$("#user_update_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#userName_update_input","error",result.extend.va_msg);
						if(result.extend.va_msg == "菜单名称已存在,不能重复"){
							$.ajax({
								url:"${APP_PATH}/getuserById/"+$("#userId_update_input").val(),
								type:"GET",
								success:function(result){
									var user = result.extend.user;
									if(user.userName != $("#userName_update_input").val()){
										$("#user_update_btn").attr("ajax-va","error");
									}else{
										show_validate_msg("#userName_update_input","success","菜单名称可用");
										if($("#user_update_btn").attr("ajax-va")!="error"){
											$("#user_update_btn").attr("ajax-va","success");
										}
									}
								}
							});
						}else{
							$("#user_update_btn").attr("ajax-va","error");
						}
					}
				}
			});
		});
		//校验菜单路径是否可用
		$("#userUrl_update_input").change(function(){
			//发送ajax请求校验菜单路径是否可用
			var userUrl = this.value;
			$.ajax({
				url:"${APP_PATH}/checkuserUrl",
				data:"userUrl="+userUrl,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#userUrl_update_input","success","菜单路径可用");
						$("#user_update_btn").attr("ajax-va","success");
					}else{
						show_validate_msg("#userUrl_update_input","error",result.extend.va_msg);
						if(result.extend.va_msg == "菜单路径已存在,不能重复"){
							$.ajax({
								url:"${APP_PATH}/getuserById/"+$("#userId_update_input").val(),
								type:"GET",
								success:function(result){
									var user = result.extend.user;
									if(user.userUrl != $("#userUrl_update_input").val()){
										$("#user_update_btn").attr("ajax-va","error");
									}else{
										show_validate_msg("#userUrl_update_input","success","菜单路径可用");
										if($("#user_update_btn").attr("ajax-va")!="error"){
											$("#user_update_btn").attr("ajax-va","success");
										}
									}
								}
							});
						}else{
							$("#user_update_btn").attr("ajax-va","error");
						}
					}
				}
			});
		});
		 
		//点击更新，更新角色信息
		$("#user_update_btn").click(function(){
			//非空验证
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//2、发送ajax请求保存更新的角色数据
			$.ajax({
				url:"${APP_PATH}/updateuser",
				type:"POST",
				data:$("#userUpdateModal form").serialize(),
				success:function(result){
					if(result.code == 100){
						bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						//1、关闭对话框
						$("#userUpdateModal").modal("hide");
						//2、回到本页面
						to_page(currentPage);
					}else{
						show_validate_msg("#userGender_update_input","error",result.msg);
						$("#userUpdateModal").attr("ajax-va","error");
					}
					
				}
			});
		});
		
		//单个删除
		$(document).on("click",".delete_btn",function(){
			//1、弹出是否确认删除对话框
			var userName = $(this).parents("tr").find("td:eq(3)").text();
			var userId = $(this).attr("del-id");
			bootbox.confirm("确定要删除["+userName+"]吗?", function(result) {
				if(result){
					//确认，发送ajax请求删除即可
					$.ajax({
						url:"${APP_PATH}/deleteuser/"+userId,
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
		//拉黑
		$(document).on("click",".black_btn",function(){
			var userName = $(this).parents("tr").find("td:eq(3)").text();
			var userId = $(this).attr("del-id");
			bootbox.confirm("确定要拉黑["+userName+"]吗?", function(result) {
				if(result){
					//确认，发送ajax请求删除即可
					$.ajax({
						url:"${APP_PATH}/blackuser/"+userId,
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
		//解除拉黑
		$(document).on("click",".relieveblack_btn",function(){
			var userName = $(this).parents("tr").find("td:eq(3)").text();
			var userId = $(this).attr("del-id");
			bootbox.confirm("确定要解除["+userName+"]吗?", function(result) {
				if(result){
					//确认，发送ajax请求删除即可
					$.ajax({
						url:"${APP_PATH}/relieveblackuser/"+userId,
						type:"POST",
						success:function(result){
							bootbox.dialog({
								message: "<span class='bigger-110'>"+result.msg+"!</span>",
								buttons: {"button":{"label":"确定","className":"btn-sm btn-success"}}
							});
							
							//回到本页
							to_page(currentPage);
						}
					});
				}
			})
		})
		function timestampToDateTime(timestamp) {
	        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
	        Y = date.getFullYear() + '-';
	        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
	        D = (date.getDate()< 10 ? '0'+ date.getDate(): date.getDate()) + ' ';
	        h = (date.getHours()< 10 ? '0'+ date.getHours(): date.getHours()) + ':';
	        m = (date.getMinutes()< 10 ? '0'+ date.getMinutes(): date.getMinutes());
	        s = (date.getSeconds()< 10 ? '0'+ date.getSeconds(): date.getSeconds());
	        return M+D+h+m;
	    }
		function DateTimeToYMDHms(timestamp) {
	        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
	        Y = date.getFullYear() + '-';
	        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
	        D = (date.getDate()< 10 ? '0'+ date.getDate(): date.getDate()) + ' ';
	        h = (date.getHours()< 10 ? '0'+ date.getHours(): date.getHours()) + ':';
	        m = (date.getMinutes()< 10 ? '0'+ date.getMinutes(): date.getMinutes()) + ':';
	        s = (date.getSeconds()< 10 ? '0'+ date.getSeconds(): date.getSeconds());
	        return Y+M+D+h+m+s;
	    }
		//停车记录
		function getuserEzStop(id,pn) {
			$("#EzStop_table tbody").html('');
			$.ajax({
				url:"${APP_PATH}/getuserEzStop?userId="+id+"&pn="+pn,
				type:"GET",
				success:function(result){
					build_parking_info(result);
					build_page_info_parking(result);
					build_page_nav_parking(result);
				}
			});
		}
		var totalRecord_page,currentPage_page;
		function build_parking_info(result){
			var i = 0;
			$.each(result.extend.pageInfo.list,function(){
				i ++ ;
				var a = $("<td></td>").append(i);
				var routeName = $("<td></td>").append(this.singleCarRouteName);
				var truckSpace = $("<td></td>").append(this.singleCarTruckSpace);
				var licensePlate = $("<td></td>").append(this.singleCarLicensePlate);
				var startTime;
				if(this.singleCarStartTime != null){
					startTime = $("<td></td>").append(timestampToDateTime(this.singleCarStartTime));
				}else{
					startTime = $("<td></td>").append("无");
				}
				var endTime;
				if(this.singleCarEndTime != null){
					endTime = $("<td></td>").append(timestampToDateTime(this.singleCarEndTime));
				}else{
					endTime = $("<td></td>").append("无");
				}
				var singleCarPrice = $("<td></td>").append(this.singleCarPrice);
				var type;
				if(this.singleCarType == "0"){
					type = $("<td></td>").append("停车中");
				}else if(this.singleCarType == "1"){
					type = $("<td></td>").append("代付款");
				}else if(this.singleCarType == "2"){
					type = $("<td></td>").append("已完成");
				}
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>")
					.append(a)
					.append(routeName)
					.append(truckSpace)
					.append(licensePlate)
					.append(startTime)
					.append(endTime)
					.append(singleCarPrice)
					.append(type)
					.appendTo("#EzStop_table tbody");
			});
		}
		
		/* 停车记录的分页信息 */	
		function build_page_info_parking(result){
			$("#page_info_parking").empty();
			$("#page_info_parking").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
					result.extend.pageInfo.pages+"页,总"+
					result.extend.pageInfo.total+"条记录");
			totalRecord_page = result.extend.pageInfo.total;
			currentPage_page = result.extend.pageInfo.pageNum;
		}
		
		//解析显示分页条，点击分页要能去下一页....
		function build_page_nav_parking(result){
			$("#page_nav_parking").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			
			//构建元素
			var firstPageLi_parking = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi_parking = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.extend.pageInfo.hasPreviousPage == false){
				firstPageLi_parking.addClass("disabled");
				prePageLi_parking.addClass("disabled");
			}else{
				//为元素添加点击翻页的事件
				firstPageLi_parking.click(function(){
					getuserEzStop($(".EzStop_btn").attr("del-id"),1);
				});
				prePageLi_parking.click(function(){
					getuserEzStop($(".EzStop_btn").attr("del-id"),result.extend.pageInfo.pageNum -1);
				});
			}
			
			var nextPageLi_parking = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi_parking = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(result.extend.pageInfo.hasNextPage == false){
				nextPageLi_parking.addClass("disabled");
				lastPageLi_parking.addClass("disabled");
			}else{
				nextPageLi_parking.click(function(){
					getuserEzStop($(".EzStop_btn").attr("del-id"),result.extend.pageInfo.pageNum +1);
				});
				lastPageLi_parking.click(function(){
					getuserEzStop($(".EzStop_btn").attr("del-id"),result.extend.pageInfo.pages);
				});
			}
			
			//添加首页和前一页 的提示
			ul.append(firstPageLi_parking).append(prePageLi_parking);
			//1,2，3遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if(result.extend.pageInfo.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					getuserEzStop(11,item);
				});
				ul.append(numLi);
			});
			
			//添加下一页和末页 的提示
			ul.append(nextPageLi_parking).append(lastPageLi_parking);
			
			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_parking");
		}
		
		
		//停车记录
		$(document).on("click",".EzStop_btn",function(){
			var userId = $(this).attr("del-id");
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#EzStopModal form");
			//发送ajax请求，查出上级菜单信息，显示在下拉列表中
			getuserEzStop($(this).attr("del-id"),1);
			//弹出模态框
			$("#EzStopModal").modal({
				backdrop:"static"
			});
		});
		
		function getUserMonthCard(id) {
			$("#MonthCard_table tbody").html('');
			$.ajax({
				url:"${APP_PATH}/getUserMonthCard?userId="+id,
				type:"GET",
				acync:false,
				success:function(result){
					$.each(result.object,function(index,t){
						var monthCardName = $("<td></td>").append(t.monthCardName);
						var routeName = $("<td></td>").append(t.routeName);
						var startTime;
						var endTime;
						 if(this.startTime != null){
							startTime = $("<td></td>").append(DateTimeToYMDHms(this.startTime));
						}else{
							startTime = $("<td></td>").append('');
						}
						//var endTime;
						if(this.endTime != null){
							endTime = $("<td></td>").append(DateTimeToYMDHms(this.endTime));
						}else{
							endTime = $("<td></td>").append('');
						} 
						//append方法执行完成以后还是返回原来的元素
						$("<tr></tr>")
							.append(monthCardName)
							.append(routeName)
							.append(startTime)
							.append(endTime)
							.appendTo("#MonthCard_table tbody");
					});
				}
			});
		}
		
		//月票信息
		$(document).on("click",".monthCard_btn",function(){
			var userId = $(this).attr("del-id");
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#MonthCardModal form");
			//发送ajax请求，查出上级菜单信息，显示在下拉列表中
			getUserMonthCard($(this).attr("del-id"));
			//弹出模态框
			$("#MonthCardModal").modal({
				backdrop:"static"
			});
		});
		
		//完成全选/全不选功能
		$("#check_all").click(function(){
			//attr获取checked是undefined;
			//我们这些dom原生的属性；attr获取自定义属性的值；
			//prop修改和读取dom原生属性的值
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//check_item
		$(document).on("click",".check_item",function(){
			//判断当前选择中的元素是否5个
			var flag = $(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		
		//点击全部删除，就批量删除
		$("#user_delete_all_btn").click(function(){
			//
			var userNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"),function(){
				//this
				userNames += $(this).parents("tr").find("td:eq(3)").text()+",";
				//组装角色id字符串
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			//去除roleNames多余的,
			userNames = userNames.substring(0, userNames.length-1);
			//去除删除的id多余的-
			del_idstr = del_idstr.substring(0, del_idstr.length-1);
			if(userNames == null || userNames == ""){
				bootbox.dialog({
					message: "<span class='bigger-110'>请选择需要删除的记录!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-erro"}}
				});
				return;
			}
			bootbox.confirm("确定要删除["+userNames+"]吗?", function(result) {
				if(result){
					//发送ajax请求删除
					$.ajax({
						url:"${APP_PATH}/deleteuser/"+del_idstr,
						type:"DELETE",
						success:function(result){
							if(result.code == 100){
								bootbox.dialog({
									message: "<span class='bigger-110'>"+result.msg+"!</span>",
									buttons: 			
									{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
								});
								//回到当前页面
								to_page(currentPage);
							}
						}
					});
				}
			});
		})
		
	</script>
	

</body>
</html>