<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分组列表</title>
<%pageContext.setAttribute("APP_PATH", request.getContextPath());%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
	table tr td,th{text-align: center;}
</style>
</head>
<body>
	<!-- 管理员修改的模态框 -->
	<div class="modal fade" id="adminUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">管理员修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	         <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">管理员id</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminId" class="form-control" id="adminId_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <!-- <div class="form-group">
			    <label class="col-sm-2 control-label">管理员账号</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminAccount" class="form-control" id="adminAccount_update_input" placeholder="请输入要修改的管理员账号">
			      <span class="help-block"></span>
			    </div>
			  </div> -->
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员密码</label>
			    <div class="col-sm-10">
			      <input type="password" name="adminPassWord" class="form-control" id="adminPassWord_update_input" placeholder="请输入要修改的管理员密码">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员名字</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminRealname" class="form-control" id="adminRealname_update_input" placeholder="请输入要修改的管理员密码">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员邮箱</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminEmail" class="form-control" id="adminEmail_update_input" placeholder="请输入要修改的管理员密码">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员创建时间</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminCreationTime" readonly="readonly" class="form-control" id="adminCreationTime_update_input" placeholder="请输入要修改的管理员创建时间">
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="admin_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 系统管理员添加的模态框 -->
	<div class="modal fade" id="adminAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">管理员添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员账号</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminAccount" class="form-control" id="adminAccount_add_input" placeholder="请输入要添加的管理员账号" maxlength='50'>
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员密码</label>
			    <div class="col-sm-10">
			      <input type="password" name="adminPassWord" class="form-control" id="adminPassWord_add_input" placeholder="请输入要添加的管理员密码" maxlength='50'>
			      <span class="help-block"></span>
			    </div>
			  </div>
			    <div class="form-group">
			    <label class="col-sm-2 control-label">管理员名字</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminRealname" class="form-control" id="adminRealname_add_input" placeholder="请输入要增加的管理员名字" maxlength='20'>
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员邮箱</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminEmail" class="form-control" id="adminEmail_add_input" placeholder="请输入要增加的管理员邮箱" maxlength='30'>
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
	<!-- 修改管理员角色的模态框 -->
	<div class="modal fade" id="adminUpdataRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">管理员角色修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	          <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">管理员id</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminId" class="form-control" id="adminId_updataRole_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员账号</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminAccount" class="form-control" readonly="readonly" id="adminAccount_updataRole_input" placeholder="请输入要添加的管理员账号">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员密码</label>
			    <div class="col-sm-10">
			      <input type="password" name="adminPassWord" class="form-control" readonly="readonly" id="adminPassWord_updataRole_input" placeholder="请输入要添加的管理员密码">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员角色</label>
			    <div class="col-sm-10" id="adminRole_updataRole_div">
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="admin_updataRole_btn">提交</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 修改管理员角色的模态框 -->
	<div class="modal fade" id="adminUpdataGroupingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">管理员分组修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	          <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">管理员id</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminId" class="form-control" id="adminId_updataGrouping_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员账号</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminAccount" class="form-control" readonly="readonly" id="adminAccount_updataGrouping_input" placeholder="请输入要添加的管理员账号">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员密码</label>
			    <div class="col-sm-10">
			      <input type="password" name="adminPassWord" class="form-control" readonly="readonly" id="adminPassWord_updataGrouping_input" placeholder="请输入要添加的管理员密码">
			      <span class="help-block"></span>
			    </div>
			  </div>
			
			  <div class="form-group">
			    <label class="col-sm-2 control-label">管理员分组</label>
			    <div class="col-sm-10" id="adminGrouping_updataGrouping_div">
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="admin_updataGrouping_btn">提交</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>系统用户列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
			<div class="col-md-8">
				<div class="col-md-3">
					<select class="form-control" name="roleType" id="roleType"></select>
				</div>
				<div class="col-md-3">
					<input type="text" id="adminAccount" class="form-control" placeholder="请输入用户账号">
				</div>
				<div class="col-md-2">
					<button type="button" id="inquire" class="btn btn-primary">查询</button>
				</div>
			</div>
			<div class="col-md-4">
				<button class="btn btn-primary" id="admin_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="admin_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="admin_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th style="display: none;">主键</th>
							<th>序号</th>
							<th>系统用户账号</th>
							<th>系统用户姓名</th>
							<th>系统用户角色</th>
							<th>路巡定位位置</th>
							<th>系统用户创建时间</th>
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
			//加载全部角色
			$.ajax({
				url:"${APP_PATH}/getRole",
				type:"GET",
				success:function(result){
					var sele = $("#roleType");
					var optionEle = $("<option></option>").append('全部人员').attr("value",'0');
					optionEle.appendTo(sele);
					$.each(result.extend.rolelist,function(){
						var optionEle = $("<option></option>").append(this.roleName).attr("value",this.roleId);
						optionEle.appendTo(sele);
					});
				}
			});
			//去首页
			to_page(1);
		});
		$(document).ready(function(){
			$("#inquire").click(function(){
				to_page(1);
			});
		});
		
		$("#roleType").dblclick(function(){
			$("#roleType").empty();
			$.ajax({
				url:"${APP_PATH}/getRole",
				type:"GET",
				success:function(result){
					var sele = $("#roleType");
					var optionEle = $("<option></option>").append('全部人员').attr("value",'0');
					optionEle.appendTo(sele);
					$.each(result.extend.rolelist,function(){
						var optionEle = $("<option></option>").append(this.roleName).attr("value",this.roleId);
						optionEle.appendTo(sele);
					});
				}
			});
		})
		
		function to_page(pn){
			var roleType;
			if($("#roleType").val() == null){
				roleType = 0;
			}else{
				roleType = $("#roleType").val();
			}
			$.ajax({
				url:"${APP_PATH}/getAdminAll",
				data:{"pn":pn,"roleType":roleType,"adminAccount":$("#adminAccount").val()},
				type:"GET",
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
			$("#admin_table tbody").empty();
			var admin = result.extend.pageInfo.list;
			var i = 1;
			$.each(admin,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				
				var adminId = $("<td style='display: none;'></td>").append(item.adminRoleAdminId);
				var adminI = $("<td></td>").append(i);
				var adminAccount = $("<td></td>").append(item.adminRoleAdmin.adminAccount);
				var adminRealname = $("<td></td>").append(item.adminRoleAdmin.adminRealname);
				var roleName;
				if(item.adminRoleRole != null){
					roleName = $("<td></td>").append(item.adminRoleRole.roleName);
				}else{
					roleName = $("<td></td>").append('');
				}
				var adminPosition = $("<td></td>").append(item.adminRoleAdmin.adminPosition);
				var adminCreationTime = $("<td></td>").append(item.adminRoleAdmin.adminCreationTime);
				
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前角色id
				editBtn.attr("edit-id",item.adminRoleAdmin.adminId);
				
				var disBtn = $("<button></button>").addClass("btn btn-warning btn-sm dis_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("分配角色");
				//为编辑按钮添加一个自定义的属性，来表示当前id
				disBtn.attr("dis-id",item.adminRoleAdmin.adminId);
				var groupingBtn = $("<button></button>").addClass("btn btn-primary btn-sm grouping_btn")
				.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改分组");
				//为编辑按钮添加一个自定义的属性，来表示当前id
				groupingBtn.attr("grouping-id",item.adminRoleAdmin.adminId);
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的角色id
				delBtn.attr("del-id",item.adminRoleAdmin.adminId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(disBtn).append(" ").append(delBtn).append(" ").append(groupingBtn);
				//append方法执行完成以后还是返回原来的元素
				i++;
				$("<tr></tr>").append(checkBoxTd)
					.append(adminId)
					.append(adminI)
					.append(adminAccount)
					.append(adminRealname)
					.append(roleName)
					.append(adminPosition)
					.append(adminCreationTime)
					.append(btnTd)
					.appendTo("#admin_table tbody");
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
		$("#admin_add_modal_btn").click(function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#adminAddModal form");
			//弹出模态框
			$("#adminAddModal").modal({
				backdrop:"static"
			});
		});
		
		//校验管理员账号是否可用
		$("#adminAccount_add_input").change(function(){
			//发送ajax请求校验管理员账号是否可用
			var adminAccount = this.value;
			$.ajax({
				url:"${APP_PATH}/checkAdminAccount",
				data:"adminAccount="+adminAccount,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#adminAccount_add_input","success","管理员账号可用");
						if($("#admin_save_btn").attr("ajax-va")!="error"){
							$("#admin_save_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#adminAccount_add_input","error",result.extend.va_msg);
						$("#admin_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		$("#adminPassWord_add_input").change(function(){
			var adminPassWord = this.value;
			if(adminPassWord == null || adminPassWord == ""){
				show_validate_msg("#adminPassWord_add_input","error","管理员密码不能为空");
				$("#admin_save_btn").attr("ajax-va","error");
			}else{
				show_validate_msg("#adminPassWord_add_input","success","");
				$("#admin_save_btn").attr("ajax-va","success");
			}
		});
		$("#adminEmail_add_input").change(function(){
			var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			var adminEmail = this.value;
			if(adminEmail == null || adminEmail == ""){
				show_validate_msg("#adminEmail_add_input","error","邮箱不能为空");
				$("#admin_save_btn").attr("ajax-va","error");
			}else if(!re.test(adminEmail)){
				show_validate_msg("#adminEmail_add_input","error","邮箱格式不正确");
				$("#admin_save_btn").attr("ajax-va","error");
			}else{
				show_validate_msg("#adminEmail_add_input","success","");
				$("#admin_save_btn").attr("ajax-va","success");
			}
		});
		//添加时非空验证
		function SaveJudgmentisnotempty(){
			var adminAccount = $("#adminAccount_add_input").val();
			if(adminAccount == null || adminAccount == ""){
				show_validate_msg("#adminAccount_add_input","error","管理员账号不能为空");
				$("#admin_save_btn").attr("ajax-va","error");
			}
			var adminPassWord = $("#adminPassWord_add_input").val();
			if(adminPassWord == null || adminPassWord == ""){
				show_validate_msg("#adminPassWord_add_input","error","管理员密码不能为空");
				$("#admin_save_btn").attr("ajax-va","error");
			}
			var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			var adminEmail = $("#adminEmail_add_input").val();
			if(adminEmail == null || adminEmail == ""){
				show_validate_msg("#adminEmail_add_input","error","邮箱不能为空");
				$("#admin_save_btn").attr("ajax-va","error");
			}else if(!re.test(adminEmail)){
				show_validate_msg("#adminEmail_add_input","error","邮箱格式不正确");
				$("#admin_save_btn").attr("ajax-va","error");
			}
		}
			
		
		//点击保存，保存管理员。
		$("#admin_save_btn").click(function(){
			//1、非空判断
			SaveJudgmentisnotempty();
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//2、发送ajax请求保存管理员
			$.ajax({
				url:"${APP_PATH}/saveAdmin",
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
						//管理员保存成功；
						//1、关闭模态框
						$("#adminAddModal").modal('hide');
						//2、来到最后一页，显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可
						to_page(1);//totalRecord
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
		
		//1、我们是按钮创建之前就绑定了click，所以绑定不上。
		//1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
		//jquery新版没有live，使用on进行替代
		$(document).on("click",".edit_btn",function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#adminUpdateModal form");
			//2、查出数据库表信息，显示数据库表信息
			getadmin($(this).attr("edit-id"));
			//3、把角色的id传递给模态框的更新按钮
			$("#admin_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#adminUpdateModal").modal({
				backdrop:"static"
			});
		});
		function getadmin(id){
			$.ajax({
				url:"${APP_PATH}/getAdminById/"+id,
				type:"GET",
				success:function(result){
					var admin = result.extend.admin;
					$("#adminId_update_input").val(admin.adminId);
					//$("#adminAccount_update_input").val(admin.adminAccount);
					$("#adminPassWord_update_input").val(admin.adminPassWord);
					$("#adminRealname_update_input").val(admin.adminRealname);
					$("#adminEmail_update_input").val(admin.adminEmail);
					$("#adminCreationTime_update_input").val(admin.adminCreationTime);
				}
			});
		}
		
		//校验中文名称是否可用
		$("#adminAccount_update_input").change(function(){
			//发送ajax请求校验用户名是否可用
			var adminAccount = this.value;
			$.ajax({
				url:"${APP_PATH}/checkAdminAccount",
				data:"adminAccount="+adminAccount,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#adminAccount_update_input","success","管理员账号可用");
						if($("#admin_update_btn").attr("ajax-va")!="error"){
							$("#admin_update_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#adminAccount_update_input","error",result.extend.va_msg);
						if(result.extend.va_msg == "管理员账号已存在,不能重复"){
							$.ajax({
								url:"${APP_PATH}/getAdminById/"+$("#adminId_update_input").val(),
								type:"GET",
								success:function(result){
									var admin = result.extend.admin;
									if(admin.adminAccount != $("#adminAccount_update_input").val()){
										$("#admin_update_btn").attr("ajax-va","error");
									}else{
										show_validate_msg("#adminAccount_update_input","success","管理员账号可用");
										if($("#admin_update_btn").attr("ajax-va")!="error"){
											$("#admin_update_btn").attr("ajax-va","success");
										}
									}
								}
							});
						}else{
							$("#admin_update_btn").attr("ajax-va","error");
						}
					}
				}
			});
		});
		//修改时非空验证
		function UpdateJudgmentisnotempty(){
			var adminAccount = $("#adminAccount_update_input").val();
			if(adminAccount == null || adminAccount == ""){
				show_validate_msg("#adminAccount_update_input","error","管理员账号不能为空");
				$("#admin_update_btn").attr("ajax-va","error");
			}else{
				$("#admin_update_btn").attr("ajax-va","success");
			}
			var adminPassWord = $("#adminPassWord_update_input").val();
			if(adminPassWord == null || adminPassWord == ""){
				show_validate_msg("#adminPassWord_update_input","error","管理员密码不能为空");
				$("#admin_update_btn").attr("ajax-va","error");
			}else{
				$("#admin_update_btn").attr("ajax-va","success");
			}
			var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			var adminEmail = $("#adminEmail_update_input").val();
			if(adminEmail == null || adminEmail == ""){
				show_validate_msg("#adminEmail_update_input","error","邮箱不能为空");
				$("#admin_update_btn").attr("ajax-va","error");
			}else if(!re.test(adminEmail)){
				show_validate_msg("#adminEmail_update_input","error","邮箱格式不正确");
				$("#admin_update_btn").attr("ajax-va","error");
			}
		}
		 
		//点击更新，更新角色信息
		$("#admin_update_btn").click(function(){
			//非空验证
			UpdateJudgmentisnotempty();
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//2、发送ajax请求保存更新的角色数据
			$.ajax({
				url:"${APP_PATH}/updateAdmin/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#adminUpdateModal form").serialize(),
				success:function(result){
					bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
					//1、关闭对话框
					$("#adminUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});
		
		//1、我们是按钮创建之前就绑定了click，所以绑定不上。
		//1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
		//jquery新版没有live，使用on进行替代disBtn
		$(document).on("click",".dis_btn",function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#adminUpdataRoleModal form");
			//2、查出数据库表信息，显示数据库表信息
			getadminUpdataRole($(this).attr("dis-id"));
			getadminRole($(this).attr("dis-id"));
			//3、把角色的id传递给模态框的更新按钮
			$("#admin_updataRole_btn").attr("dis-id",$(this).attr("dis-id"));
			$("#adminUpdataRoleModal").modal({
				backdrop:"static"
			});
		});
		function getadminUpdataRole(id){
			$.ajax({
				url:"${APP_PATH}/getAdminById/"+id,
				type:"GET",
				success:function(result){
					var admin = result.extend.admin;
					$("#adminId_updataRole_input").val(admin.adminId);
					$("#adminAccount_updataRole_input").val(admin.adminAccount);
					$("#adminPassWord_updataRole_input").val(admin.adminPassWord);
				}
			});
		}
		function getadminRole(id){
			$('#adminRole_updataRole_div').html("");
			$.ajax({
				url:"${APP_PATH}/getRole/"+id,
				type:"GET",
				success:function(result){
					$.each(result.extend.RoleList,function(){
						var html = "";
						if(this.yn == 1){
							html += "<input type='radio' checked='checked' name='roleId' value='"+this.roleId+"'>"+this.roleName;
						}else{
							html += "<input type='radio'  name='roleId' value='"+this.roleId+"'>"+this.roleName;
						}
						$("#adminRole_updataRole_div").append(html);
					});
				}
			}); 
		}
		//点击保存，更新角色菜单信息
		$("#admin_updataRole_btn").click(function(){
			//2、发送ajax请求保存更新的角色数据
			$.ajax({
				url:"${APP_PATH}/updateAdminRole",
				type:"POST",
				data:$("#adminUpdataRoleModal form").serialize(),
				success:function(result){
					bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
					//1、关闭对话框
					$("#adminUpdataRoleModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});
		//1、我们是按钮创建之前就绑定了click，所以绑定不上。
		//1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
		//jquery新版没有live，使用on进行替代disBtn
		$(document).on("click",".grouping_btn",function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#adminUpdataGroupingModal form");
			//2、查出数据库表信息，显示数据库表信息
			getadminUpdataGrouping($(this).attr("grouping-id"));
			getadminGrouping($(this).attr("grouping-id"));
			//3、把角色的id传递给模态框的更新按钮
			$("#admin_updataGrouping_btn").attr("grouping-id",$(this).attr("grouping-id"));
			$("#adminUpdataGroupingModal").modal({
				backdrop:"static"
			});
		});
		function getadminUpdataGrouping(id){
			$.ajax({
				url:"${APP_PATH}/getAdminById/"+id,
				type:"GET",
				success:function(result){
					var admin = result.extend.admin;
					$("#adminId_updataGrouping_input").val(admin.adminId);
					$("#adminAccount_updataGrouping_input").val(admin.adminAccount);
					$("#adminPassWord_updataGrouping_input").val(admin.adminPassWord);
				}
			});
		}
		function getadminGrouping(id){
			$('#adminGrouping_updataGrouping_div').html("");
			$.ajax({
				url:"${APP_PATH}/getGrouping/"+id,
				type:"GET",
				success:function(result){
					$.each(result.extend.groupingList,function(){
						var html = "";
						if(this.yn == 1){
							html += "<input type='radio' checked='checked' name='groupingId' value='"+this.groupingId+"'>"+this.groupingName;
						}else{
							html += "<input type='radio'  name='groupingId' value='"+this.groupingId+"'>"+this.groupingName;
						}
						$("#adminGrouping_updataGrouping_div").append(html);
					});
				}
			}); 
		}
		//点击保存，更新角色菜单信息
		$("#admin_updataGrouping_btn").click(function(){
			//2、发送ajax请求保存更新的角色数据
			$.ajax({
				url:"${APP_PATH}/updateAdminGrouping",
				type:"POST",
				data:$("#adminUpdataGroupingModal form").serialize(),
				success:function(result){
					bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
					//1、关闭对话框
					$("#adminUpdataGroupingModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});
		//单个删除
		$(document).on("click",".delete_btn",function(){
			//1、弹出是否确认删除对话框
			var adminAccount = $(this).parents("tr").find("td:eq(3)").text();
			var adminId = $(this).attr("del-id");
			//alert($(this).parents("tr").find("td:eq(1)").text());
			bootbox.confirm("确定要删除["+adminAccount+"]吗?", function(result) {
				if(result){
					//确认，发送ajax请求删除即可
					$.ajax({
						url:"${APP_PATH}/deleteAdmin/"+adminId,
						type:"DELETE",
						success:function(result){
							bootbox.dialog({
								message: "<span class='bigger-110'>"+result.extend.va_vag+"!</span>",
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
		$("#admin_delete_all_btn").click(function(){
			var adminAccounts = "";
			var del_idstr = "";
			$.each($(".check_item:checked"),function(){
				//this
				adminAccounts += $(this).parents("tr").find("td:eq(2)").text()+",";
				//组装角色id字符串
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			//去除roleNames多余的,
			adminAccounts = adminAccounts.substring(0, adminAccounts.length-1);
			//去除删除的id多余的-
			del_idstr = del_idstr.substring(0, del_idstr.length-1);
			if(adminAccounts == null || adminAccounts == ""){
				bootbox.dialog({
					message: "<span class='bigger-110'>请选择需要删除的记录!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-erro"}}
				});
				return;
			}
			bootbox.confirm("确定要删除["+adminAccounts+"]吗?", function(result) {
				if(result){
					//发送ajax请求删除
					$.ajax({
						url:"${APP_PATH}/deleteAdmin/"+del_idstr,
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
	</script>
</body>
</html>