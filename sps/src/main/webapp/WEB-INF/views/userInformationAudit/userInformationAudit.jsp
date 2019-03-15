<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
	<!-- 用户信息审核的模态框 -->
	<div class="modal fade" id="userInformationAuditUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">用户信息审核</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	         <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">申请审核id</label>
			    <div class="col-sm-10">
			      <input type="text" name="userInformationAuditId" class="form-control" id="userInformationAuditId_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">申请审核用户姓名</label>
			    <div class="col-sm-10">
			      <input type="text" name="userFullName" readonly="readonly" class="form-control" id="userFullName_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">申请审核图片</label>
			    <div class="col-sm-10">
			      <img alt="审核图片" class="img-rounded" width="80%" height="80%" src="" name="userInformationAuditPhoto" id="userInformationAuditPhoto">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">申请审核时间</label>
			    <div class="col-sm-10">
			      <input type="text" name="userInformationAuditApplyTime" readonly="readonly" class="form-control" id="userInformationAuditApplyTime_update_input" placeholder="请输入要修改的分组创建时间">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">申请审核备注</label>
			    <div class="col-sm-10">
			      <textarea rows="3" cols="10" id="userInformationAuditApplyRemarks" name="userInformationAuditApplyRemarks" readonly="readonly"></textarea>
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">申请审核类型</label>
			    <div class="col-sm-10">
			      <input type="text" name="userInformationAuditType" readonly="readonly" class="form-control" id="userInformationAuditType_update_input" placeholder="请输入要修改的分组创建时间">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">申请审核状态</label>
			    <div class="col-sm-10">
			      <input type="text" name="userInformationAuditState" readonly="readonly" class="form-control" id="userInformationAuditState_update_input" placeholder="请输入要修改的分组创建时间">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">审核结果</label>
			    <div class="col-sm-10">
			      <input type="radio" name="userInformationAuditResult" id="userInformationAuditResult1" value="1">未通过
			      <input type="radio" name="userInformationAuditResult" id="userInformationAuditResult2" value="2">已通过
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">审核时间</label>
			    <div class="col-sm-10">
			      <input type="text" name="userInformationAuditResultTime" readonly="readonly" class="form-control" id="userInformationAuditResultTime_update_input" placeholder="请输入要修改的分组创建时间">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">审核备注</label>
			    <div class="col-sm-10">
			      <textarea rows="3" cols="10" id="userInformationAuditResultRemarks" name="userInformationAuditResultRemarks"></textarea>
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="userInformationAudit_update_btn">审核</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>用户信息认证审核</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
			<div class="col-md-12">
				<div class="col-md-2">
					<select class="form-control" name="userInformationAuditType" id="userInformationAuditType">
						<option value="0">全部图片类型</option>
						<option value="1">身份证正面</option>
						<option value="2">身份证背面</option>
						<option value="3">驾驶证正面</option>
						<option value="4">驾驶证背面</option>
					</select>
				</div>
				<div class="col-md-2">
					<select class="form-control" name="userInformationAuditState" id="userInformationAuditState">
						<option value="2">全部类型</option>
						<option value="1">已审核</option>
						<option value="0">待审核</option>
					</select>
				</div>
				<div class="col-md-3">
					<button type="button" id="inquire" class="btn btn-primary">查询</button>
				</div>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="userInformationAudit_table">
					<thead>
						<tr>
							<th style="display: none;">主键</th>
							<th>用户姓名</th>
							<th>图片</th>
							<th>上传时间</th>
							<th>审核类型</th>
							<th>审核状态</th>
							<th>审核结果</th>
							<th>审核时间</th>
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
			var state;
			if($("#userInformationAuditState").val() == null){
				state = 0;
			}else{
				state = $("#userInformationAuditState").val();
			}
			var type;
			if($("#userInformationAuditType").val() == null){
				type = 0;
			}else{
				type = $("#userInformationAuditType").val();
			}
			$.ajax({
				url:"${APP_PATH}/getUserInformationAuditAll",
				data:{"pn":pn,"state":state,"type":type},
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
			$("#userInformationAudit_table tbody").empty();
			var userInformationAudit = result.extend.pageInfo.list;
			$.each(userInformationAudit,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var userInformationAuditId = $("<td style='display: none;'></td>").append(item.userInformationAuditId);
				var userFullName;
				if(item.userInformationAuditUser != null){
					userFullName = $("<td></td>").append(item.userInformationAuditUser.userFullName);
				}else{
					userFullName = $("<td></td>").append("")
				}
				var userInformationAuditPhoto = $("<td></td>").append("<img width='100px;' src='"+item.userInformationAuditPhoto+"' class='img-rounded'/>");
				var userInformationAuditNumber;
				switch (item.userInformationAuditType) {
				case 1:
					userInformationAuditNumber= $("<td></td>").append(item.userInformationAuditApplyTime);
					break;
				case 1:
					userInformationAuditNumber= $("<td></td>").append(item.userInformationAuditApplyTime);
					break;
				case 1:
					userInformationAuditNumber= $("<td></td>").append(item.userInformationAuditApplyTime);
					break;
				case 1:
					userInformationAuditNumber= $("<td></td>").append(item.userInformationAuditApplyTime);
					break;
				}
				var userInformationAuditApplyTime = $("<td></td>").append(item.userInformationAuditApplyTime);
				var userInformationAuditType;
				var userInformationAuditState;
				var userInformationAuditResult;
				var userInformationAuditResultTime;
				if(item.userInformationAuditState == 0){
					userInformationAuditState = $("<td></td>").append("待审核");
					userInformationAuditResult = $("<td></td>").append("待审核");
					userInformationAuditResultTime = $("<td></td>").append("待审核");
				}
				if(item.userInformationAuditState == 1){
					userInformationAuditState = $("<td></td>").append("已审核");
					if(item.userInformationAuditResult == 0){
						userInformationAuditResult = $("<td></td>").append("退回");
					}
					if(item.userInformationAuditResult == 1){
						userInformationAuditResult = $("<td></td>").append("通过");
					}
					userInformationAuditResultTime = $("<td></td>").append(item.userInformationAuditResultTime);
				}
				if(item.userInformationAuditType == 1){
					userInformationAuditType = $("<td></td>").append("身份证正面审核");
				}
				if(item.userInformationAuditType == 2){
					userInformationAuditType = $("<td></td>").append("身份证背面审核");	
				}
				if(item.userInformationAuditType == 3){
					userInformationAuditType = $("<td></td>").append("驾驶证正面审核");
				}
				if(item.userInformationAuditType == 4){
					userInformationAuditType = $("<td></td>").append("驾驶证背面审核");
				}
				
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("审核");
				//为编辑按钮添加一个自定义的属性，来表示当前角色id
				editBtn.attr("edit-id",item.userInformationAuditId);
				var btnTd = $("<td></td>").append(editBtn);
				//var delBtn = 
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>")
					//.append(checkBoxTd)
					.append(userInformationAuditId)
					.append(userFullName)
					.append(userInformationAuditPhoto)
					.append(userInformationAuditApplyTime)
					.append(userInformationAuditType)
					.append(userInformationAuditState)
					.append(userInformationAuditResult)
					.append(userInformationAuditResultTime)
					.append(btnTd)
					.appendTo("#userInformationAudit_table tbody");
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
		//1、我们是按钮创建之前就绑定了click，所以绑定不上。
		//1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
		//jquery新版没有live，使用on进行替代
		$(document).on("click",".edit_btn",function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#userInformationAuditUpdateModal form");
			//2、查出数据库表信息，显示数据库表信息
			getUserInformationAudit($(this).attr("edit-id"));
			//3、把角色的id传递给模态框的更新按钮
			$("#userInformationAudit_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#userInformationAuditUpdateModal").modal({
				backdrop:"static"
			});
		});
		//日期时间处理
		function conver(s) {
			return s < 10 ? '0' + s : s;
		}
		function getUserInformationAudit(id){
			 var myDate = new Date();
			 //获取当前年
			 var year = myDate.getFullYear();
			 //获取当前月
			 var month = myDate.getMonth() + 1;
		     //获取当前日
		     var date = myDate.getDate();
		     var h = myDate.getHours(); //获取当前小时数(0-23)
		     var m = myDate.getMinutes(); //获取当前分钟数(0-59)
		     var s = myDate.getSeconds();
			 //获取当前时间
			 var now = year + '-' + conver(month) + "-" + conver(date) + " " + conver(h) + ':' + conver(m) + ":" + conver(s);
			$.ajax({
				url:"${APP_PATH}/getUserInformationAuditById/"+id,
				type:"GET",
				success:function(result){
					var userInformationAudit = result.extend.userInformationAudit;
					$("#userInformationAuditId_update_input").val(userInformationAudit.userInformationAuditId);
					$("#userFullName_update_input").val(userInformationAudit.userInformationAuditUser.userFullName);
					$("#userInformationAuditPhoto").attr('src',userInformationAudit.userInformationAuditPhoto); 
					$("#userInformationAuditApplyTime_update_input").val(userInformationAudit.userInformationAuditApplyTime);
					$("#userInformationAuditApplyRemarks").val(userInformationAudit.userInformationAuditApplyRemarks);
					if(userInformationAudit.userInformationAuditType == 1){
						$("#userInformationAuditType_update_input").val("身份证正面审核");
					}
					if(userInformationAudit.userInformationAuditType == 2){
						$("#userInformationAuditType_update_input").val("身份证背面审核");
					}
					if(userInformationAudit.userInformationAuditType == 3){
						$("#userInformationAuditType_update_input").val("驾驶证正面审核");
					}
					if(userInformationAudit.userInformationAuditType == 4){
						$("#userInformationAuditType_update_input").val("驾驶证背面审核");
					}
					if(userInformationAudit.userInformationAuditState == 0){
						$("#userInformationAuditState_update_input").val("待审核");
						$("#userInformationAuditResult1").attr('checked',true); 
						$("#userInformationAuditResultTime_update_input").val(now);
					}
					if(userInformationAudit.userInformationAuditState == 1){
						$("#userInformationAuditState_update_input").val("已审核");
						if(userInformationAudit.userInformationAuditResult == 0){
							$("#userInformationAuditResult1").attr('checked',true); 
						}
						if(userInformationAudit.userInformationAuditResult == 1){
							$("#userInformationAuditResult2").attr('checked',true); 
						}
						$("#userInformationAuditResultTime_update_input").val(userInformationAudit.userInformationAuditResultTime);
						$("#userInformationAuditResultRemarks").val(userInformationAudit.userInformationAuditResultRemarks);
					}
				}
			});
		}
		//点击更新，更新角色信息
		$("#userInformationAudit_update_btn").click(function(){
			//2、发送ajax请求保存更新的角色数据
			$.ajax({
				url:"${APP_PATH}/updateUserInformationAudit",
				data:{
						"userInformationAuditId":$("#userInformationAuditId_update_input").val(),
						"userInformationAuditResult":$("input[name='userInformationAuditResult']:checked").val(),
						"userInformationAuditResultRemarks":$("#userInformationAuditResultRemarks").val()
					},
				type:"GET",
				success:function(result){
					bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
					//1、关闭对话框
					$("#userInformationAuditUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});
	</script>
</body>
</html>