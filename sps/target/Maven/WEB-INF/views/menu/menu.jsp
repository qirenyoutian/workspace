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
</style>
</head>
<body>
	<!-- 菜单修改的模态框 -->
	<div class="modal fade" id="menuUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">菜单修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	         <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">id</label>
			    <div class="col-sm-10">
			      <input type="text" name="menuId" class="form-control" id="menuId_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			 <div class="form-group">
			    <label class="col-sm-2 control-label">菜单名称</label>
			    <div class="col-sm-10">
			      <input type="text" name="menuName" class="form-control" id="menuName_update_input" placeholder="菜单名称">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">描述菜单信息</label>
			    <div class="col-sm-10">
			      <input type="text" name="menuDetail" class="form-control" id="menuDetail_update_input" placeholder="描述菜单信息">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">菜单路径</label>
			    <div class="col-sm-10">
			      <input type="text" name="menuUrl" class="form-control" id="menuUrl_update_input" placeholder="菜单路径">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">上级菜单</label>
			    <div class="col-sm-10">
			    	<select class="form-control" name="UpdateMenuSuperior"></select>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="menu_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	<!-- 菜单添加的模态框 -->
	<div class="modal fade" id="menuAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">菜单添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">菜单名称</label>
			    <div class="col-sm-10">
			      <input type="text" name="menuName" class="form-control" id="menuName_add_input" placeholder="菜单名称">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">描述菜单信息</label>
			    <div class="col-sm-10">
			      <input type="text" name="menuDetail" class="form-control" id="menuDetail_add_input" placeholder="描述菜单信息">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">菜单路径</label>
			    <div class="col-sm-10">
			      <input type="text" name="menuUrl" class="form-control" id="menuUrl_add_input" placeholder="菜单路径">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">上级菜单</label>
			    <div class="col-sm-10">
					 <select class="form-control" name="SaveMenuSuperior"></select>			    
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="menu_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>菜单列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
			<div class="col-md-8">
				<div class="col-md-4">
					<input type="text" id="content" class="form-control" placeholder="请输入上级菜单名称">
				</div>
				<div class="col-md-3">
					<button type="button" id="inquire" class="btn btn-primary">查询</button>
				</div>
			</div>
			<div class="col-md-4">
				<button class="btn btn-primary" id="menu_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="menu_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="menu_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th style="display: none;">主键</th>
							<th>菜单名称</th>
							<th>描述菜单信息</th>
							<th>菜单路径</th>
							<th>上级菜单</th>
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
				url:"${APP_PATH}/getMenuAll",
				data:{"pn":pn,"content":$("#content").val()},
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
			$("#menu_table tbody").empty();
			var menu = result.extend.pageInfo.list;
			$.each(menu,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var menuId = $("<td style='display: none;'></td>").append(item.menuId);
				var menuName = $("<td></td>").append(item.menuName);
				var menuDetail = $("<td></td>").append(item.menuDetail);
				var menuUrl = $("<td></td>").append(item.menuUrl);
				var menuSuperior = $("<td></td>").append(item.menuSuperior);
				
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前角色id
				editBtn.attr("edit-id",item.menuId);
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的角色id
				delBtn.attr("del-id",item.menuId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				//var delBtn = 
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd)
					.append(menuId)
					.append(menuName)
					.append(menuDetail)
					.append(menuUrl)
					.append(menuSuperior)
					.append(btnTd)
					.appendTo("#menu_table tbody");
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
		$("#menu_add_modal_btn").click(function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#menuAddModal form");
			//发送ajax请求，查出上级菜单信息，显示在下拉列表中
			getMenuSuperior("#menuAddModal select");
			//弹出模态框
			$("#menuAddModal").modal({
				backdrop:"static"
			});
		});
		function getMenuSuperior(ele) {
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/getMenu",
				type:"GET",
				success:function(result){
					var optionEle = $("<option></option>").append('主菜单').attr("value",'主菜单');
					optionEle.appendTo(ele);
					$.each(result.extend.menuList,function(){
						var optionEle = $("<option></option>").append(this.menuName).attr("value",this.menuName);
						optionEle.appendTo(ele);
					});
				}
			});
		}
		//校验菜单名称是否可用
		$("#menuName_add_input").change(function(){
			//发送ajax请求校验菜单名称是否可用
			var menuName = this.value;
			$.ajax({
				url:"${APP_PATH}/checkMenuName",
				data:"menuName="+menuName,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#menuName_add_input","success","菜单名称可用");
						if($("#menu_save_btn").attr("ajax-va")=="error"){
							$("#menu_save_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#menuName_add_input","error",result.extend.va_msg);
						$("#menu_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验菜单路径是否可用 SavemenuSuperiorDiv
		$("#menuUrl_add_input").change(function(){
			//发送ajax请求校验用户名是否可用
			var menuUrl = this.value;
			$.ajax({
				url:"${APP_PATH}/checkMenuUrl",
				data:"menuUrl="+menuUrl,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#menuUrl_add_input","success","菜单路径可用");
						if($("#menu_save_btn").attr("ajax-va")!="error"){
							$("#menu_save_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#menuUrl_add_input","error",result.extend.va_msg);
						$("#menu_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//添加时非空验证
		function SaveJudgmentisnotempty(){
			var menuName = $("#menuName_add_input").val();
			if(menuName == null || menuName == ""){
				show_validate_msg("#menuName_add_input","error","菜单名称不能为空");
				$("#menu_save_btn").attr("ajax-va","error");
			}else{
				if($("#menu_save_btn").attr("ajax-va")!="error"){
					$("#menu_save_btn").attr("ajax-va","success");
				}
			}
			var menuDetail = $("#menuDetail_add_input").val();
			if(menuDetail == null || menuDetail == ""){
				show_validate_msg("#menuDetail_add_input","error","描述菜单信息不能为空");
				$("#menu_save_btn").attr("ajax-va","error");
			}else{
				if($("#menu_save_btn").attr("ajax-va")!="error"){
					$("#menu_save_btn").attr("ajax-va","success");
				}
			}
		}
		
		//点击保存，保存角色。
		$("#menu_save_btn").click(function(){
			//1、判断之前的ajax用户名校验是否成功。如果成功。
			SaveJudgmentisnotempty();
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//2、发送ajax请求保存角色
			$.ajax({
				url:"${APP_PATH}/saveMenu",
				type:"POST",
				data:$("#menuAddModal form").serialize(),
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
						$("#menuAddModal").modal('hide');
						
						//2、来到最后一页，显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可
						to_page(totalRecord);
					}else{
						//显示失败信息
						//console.log(result);
						//有哪个字段的错误信息就显示哪个字段的；
						if(undefined != result.extend.errorFields.menuName){
							show_validate_msg("#menuName_add_input", "error", result.extend.errorFields.menuName);
						}
						if(undefined != result.extend.errorFields.menuDetail){
							show_validate_msg("#menuDetail_add_input", "error", result.extend.errorFields.menuDetail);
						}
						if(undefined != result.extend.errorFields.menuUrl){
							show_validate_msg("#menuUrl_add_input", "error", result.extend.errorFields.menuUrl);
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
			reset_form("#menuUpdateModal form");
			getMenuSuperior("#menuUpdateModal select");
			//2、查出数据库表信息，显示数据库表信息
			getMenu($(this).attr("edit-id"));
			//3、把角色的id传递给模态框的更新按钮
			$("#menu_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#menuUpdateModal").modal({
				backdrop:"static"
			});
		});
		function getMenu(id){
			$.ajax({
				url:"${APP_PATH}/getMenuById/"+id,
				type:"GET",
				success:function(result){
					var menu = result.extend.menu;
					$("#menuId_update_input").val(menu.menuId);
					$("#menuName_update_input").val(menu.menuName);
					$("#menuDetail_update_input").val(menu.menuDetail);
					$("#menuUrl_update_input").val(menu.menuUrl);
					$("#menuUpdateModal select").val([menu.menuSuperior]);
				}
			});
		}
		//校验菜单名称是否可用
		$("#menuName_update_input").change(function(){
			//发送ajax请求校验用户名是否可用
			var menuName = this.value;
			$.ajax({
				url:"${APP_PATH}/checkMenuName",
				data:"menuName="+menuName,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#menuName_update_input","success","菜单名称可用");
						if($("#menu_update_btn").attr("ajax-va")!="error"){
							$("#menu_update_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#menuName_update_input","error",result.extend.va_msg);
						if(result.extend.va_msg == "菜单名称已存在,不能重复"){
							$.ajax({
								url:"${APP_PATH}/getmenuById/"+$("#menuId_update_input").val(),
								type:"GET",
								success:function(result){
									var menu = result.extend.menu;
									if(menu.menuName != $("#menuName_update_input").val()){
										$("#menu_update_btn").attr("ajax-va","error");
									}else{
										show_validate_msg("#menuName_update_input","success","菜单名称可用");
										if($("#menu_update_btn").attr("ajax-va")!="error"){
											$("#menu_update_btn").attr("ajax-va","success");
										}
									}
								}
							});
						}else{
							$("#menu_update_btn").attr("ajax-va","error");
						}
					}
				}
			});
		});
		//校验菜单路径是否可用
		$("#menuUrl_update_input").change(function(){
			//发送ajax请求校验菜单路径是否可用
			var menuUrl = this.value;
			$.ajax({
				url:"${APP_PATH}/checkMenuUrl",
				data:"menuUrl="+menuUrl,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#menuUrl_update_input","success","菜单路径可用");
						$("#menu_update_btn").attr("ajax-va","success");
					}else{
						show_validate_msg("#menuUrl_update_input","error",result.extend.va_msg);
						if(result.extend.va_msg == "菜单路径已存在,不能重复"){
							$.ajax({
								url:"${APP_PATH}/getMenuById/"+$("#menuId_update_input").val(),
								type:"GET",
								success:function(result){
									var menu = result.extend.menu;
									if(menu.menuUrl != $("#menuUrl_update_input").val()){
										$("#menu_update_btn").attr("ajax-va","error");
									}else{
										show_validate_msg("#menuUrl_update_input","success","菜单路径可用");
										if($("#menu_update_btn").attr("ajax-va")!="error"){
											$("#menu_update_btn").attr("ajax-va","success");
										}
									}
								}
							});
						}else{
							$("#menu_update_btn").attr("ajax-va","error");
						}
					}
				}
			});
		});
		//修改时非空验证
		function UpdateJudgmentisnotempty(){
			var menuName = $("#menuName_update_input").val();
			if(menuName == null || menuName == ""){
				show_validate_msg("#menuName_update_input","error","菜单名称不能为空");
				$("#menu_update_btn").attr("ajax-va","error");
			}else{
				//if($("#menu_update_btn").attr("ajax-va")!="error"){
					$("#menu_update_btn").attr("ajax-va","success");
				//}
			}
			var menuDetail = $("#menuDetail_update_input").val();
			if(menuDetail == null || menuDetail == ""){
				show_validate_msg("#menuDetail_update_input","error","描述菜单信息不能为空");
				$("#menu_update_btn").attr("ajax-va","error");
			}else{
				//if($("#menu_update_btn").attr("ajax-va")!="error"){
					$("#menu_update_btn").attr("ajax-va","success");
				//}
			}
		}
		 
		//点击更新，更新角色信息
		$("#menu_update_btn").click(function(){
			//非空验证
			UpdateJudgmentisnotempty();
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//2、发送ajax请求保存更新的角色数据
			$.ajax({
				url:"${APP_PATH}/updateMenu/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#menuUpdateModal form").serialize(),
				success:function(result){
					bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
					//1、关闭对话框
					$("#menuUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});
		
		//单个删除
		$(document).on("click",".delete_btn",function(){
			//1、弹出是否确认删除对话框
			var menuName = $(this).parents("tr").find("td:eq(2)").text();
			var menuId = $(this).attr("del-id");
			bootbox.confirm("确定要删除["+menuName+"]吗?", function(result) {
				if(result){
					//确认，发送ajax请求删除即可
					$.ajax({
						url:"${APP_PATH}/deleteMenu/"+menuId,
						type:"DELETE",
						success:function(result){
							bootbox.dialog({
								message: "<span class='bigger-110'>"+result.extend.va_msg+"!</span>",
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
		$("#menu_delete_all_btn").click(function(){
			//
			var menuNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"),function(){
				//this
				menuNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				//组装角色id字符串
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			//去除roleNames多余的,
			menuNames = menuNames.substring(0, menuNames.length-1);
			//去除删除的id多余的-
			del_idstr = del_idstr.substring(0, del_idstr.length-1);
			if(menuNames == null || menuNames == ""){
				bootbox.dialog({
					message: "<span class='bigger-110'>请选择需要删除的记录!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-erro"}}
				});
				return;
			}
			bootbox.confirm("确定要删除["+menuNames+"]吗?", function(result) {
				if(result){
					//发送ajax请求删除
					$.ajax({
						url:"${APP_PATH}/deleteMenu/"+del_idstr,
						type:"DELETE",
						success:function(result){
							bootbox.dialog({
								message: "<span class='bigger-110'>"+result.extend.va_msg+"!</span>",
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