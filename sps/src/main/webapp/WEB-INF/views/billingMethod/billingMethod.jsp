<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消费类型列表</title>
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
	<!-- 消费类型修改的模态框 -->
	<div class="modal fade" id="billingMethodUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">消息类型修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	         <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">消息类型id</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodId" class="form-control" id="billingMethodId_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">计费方式名称</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodName" class="form-control" id="billingMethodName_update_input" placeholder="请输入名称">
				  <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">起步费用（元）</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodStartPrice" class="form-control" id="billingMethodStartPrice_update_input" placeholder="请输入要修改的起步费用（元）">
				  <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">起步分钟（分钟）</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodStartMinutes" class="form-control" id="billingMethodStartMinutes_update_input" placeholder="请输入要修改的起步分钟（分钟）">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">免费分钟（分钟）</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodFreeMinutes" class="form-control" id="billingMethodFreeMinutes_update_input" placeholder="请输入要修改的免费分钟（分钟）">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">最低消费（元）</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodMinimumConsumption" class="form-control" id="billingMethodMinimumConsumption_update_input" placeholder="请输入要修改的最低消费（元）">
			      <span class="help-block"></span>
			    </div>
			  </div>
			   <div class="form-group">
			    <label class="col-sm-2 control-label">最高消费（元）</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodMaximumConsumption" class="form-control" id="billingMethodMaximumConsumption_update_input" placeholder="请输入要修改的最高消费（元）">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">超时门限（分钟）</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodTimeoutThreshold" class="form-control" id="billingMethodTimeoutThreshold_update_input" placeholder="请输入要修改的超时门限（分钟）">
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="billingMethod_update_btn">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="billingMethodAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">计算方式添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">起步费用（元）</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodStartPrice" class="form-control" id="billingMethodStartPrice_add_input" placeholder="请输入要添加的起步费用（元）">
				  <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">起步分钟（分钟）</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodStartMinutes" class="form-control" id="billingMethodStartMinutes_add_input" placeholder="请输入要添加的起步分钟（元）">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">免费分钟（分钟）</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodFreeMinutes" class="form-control" id="billingMethodFreeMinutes_add_input" placeholder="请输入要添加的免费分钟（分钟）">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">最低消费（元）</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodMinimumConsumption" class="form-control" id="billingMethodMinimumConsumption_add_input" placeholder="请输入要添加的最低消费（元）">
			      <span class="help-block"></span>
			    </div>
			  </div>
			   <div class="form-group">
			    <label class="col-sm-2 control-label">最高消费（元）</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodMaximumConsumption" class="form-control" id="billingMethodMaximumConsumption_add_input" placeholder="请输入要添加的最高消费（元）">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">超时门限（分钟）</label>
			    <div class="col-sm-10">
			      <input type="text" name="billingMethodTimeoutThreshold" class="form-control" id="billingMethodTimeoutThreshold_add_input" placeholder="请输入要添加的超时门限（分钟）">
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="billingMethod_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="modal fade" id="timeQuantumAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="mytimeQuantum">时间段添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">开始时间</label>
			    <div class="col-sm-10">
			    	<input type="hidden" name="timeQuantumBillingMethodId" id="timeQuantumBillingMethodId">
			      <select name="timeQuantumStartTime" style="width: 120px;">
			    		<option value="0">00:00:00</option>
			    		<option value="1">01:00:00</option>
			    		<option value="2">02:00:00</option>
			    		<option value="3">03:00:00</option>
			    		<option value="4">04:00:00</option>
			    		<option value="5">05:00:00</option>
			    		<option value="6">06:00:00</option>
			    		<option value="7">07:00:00</option>
			    		<option value="8">08:00:00</option>
			    		<option value="9">09:00:00</option>
			    		<option value="10">10:00:00</option>
			    		<option value="11">11:00:00</option>
			    		<option value="12">12:00:00</option>
			    		<option value="13">13:00:00</option>
			    		<option value="14">14:00:00</option>
			    		<option value="15">15:00:00</option>
			    		<option value="16">16:00:00</option>
			    		<option value="17">17:00:00</option>
			    		<option value="18">18:00:00</option>
			    		<option value="19">19:00:00</option>
			    		<option value="20">20:00:00</option>
			    		<option value="21">21:00:00</option>
			    		<option value="22">22:00:00</option>
			    		<option value="23">23:00:00</option>
			    		<option value="24">24:00:00</option>
			    	</select>
				  <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">结束时间</label>
			    <div class="col-sm-10">
			    	<select name="timeQuantumEndTime" style="width: 120px;">
			    		<option value="0">00:00:00</option>
			    		<option value="1">01:00:00</option>
			    		<option value="2">02:00:00</option>
			    		<option value="3">03:00:00</option>
			    		<option value="4">04:00:00</option>
			    		<option value="5">05:00:00</option>
			    		<option value="6">06:00:00</option>
			    		<option value="7">07:00:00</option>
			    		<option value="8">08:00:00</option>
			    		<option value="9">09:00:00</option>
			    		<option value="10">10:00:00</option>
			    		<option value="11">11:00:00</option>
			    		<option value="12">12:00:00</option>
			    		<option value="13">13:00:00</option>
			    		<option value="14">14:00:00</option>
			    		<option value="15">15:00:00</option>
			    		<option value="16">16:00:00</option>
			    		<option value="17">17:00:00</option>
			    		<option value="18">18:00:00</option>
			    		<option value="19">19:00:00</option>
			    		<option value="20">20:00:00</option>
			    		<option value="21">21:00:00</option>
			    		<option value="22">22:00:00</option>
			    		<option value="23">23:00:00</option>
			    		<option value="24">24:00:00</option>
			    	</select>
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">费率</label>
			    <div class="col-sm-10">
			      <input type="text" name="timeQuantumRate" class="form-control" placeholder="元/时">
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="timeQuantum_save_btn">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>计费方式列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<!-- <br>
			<div class="col-md-8">
				<div class="col-md-4">
					<input type="text" id="content" class="form-control" placeholder="请输入分组名称">
				</div>
				<div class="col-md-3">
					<button type="button" id="inquire" class="btn btn-primary">查询</button>
				</div>
			</div> -->
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="billingMethod_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="billingMethod_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="billingMethod_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th style="display: none;">主键</th>
							<th>计费方式名称</th>
							<th>起步费用<br>(元)</th>
							<th>起步分钟<br>(分钟)</th>
							<th>免费分钟<br>(分钟)</th>
							<th>最低消费<br>(元)</th>
							<th>最高消费<br>(元)</th>
							<th>超时门限<br>(分钟)</th>
							<th>时间段/费率<br>(元/小时)</th>
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
		function toDate(timestamp) {
	        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
	        Y = date.getFullYear() + '-';
	        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
	        D = (date.getDate()< 10 ? '0'+ date.getDate(): date.getDate()) + ' ';
	        h = (date.getHours()< 10 ? '0'+ date.getHours(): date.getHours()) + ':';
	        m = (date.getMinutes()< 10 ? '0'+ date.getMinutes(): date.getMinutes()) + ':';
	        s = (date.getSeconds()< 10 ? '0'+ date.getSeconds(): date.getSeconds());
	        return h+m+s;
	    }
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
				url:"${APP_PATH}/getBillingMethodAll",
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
			$("#billingMethod_table tbody").empty();
			var billingMethod = result.extend.pageInfo.list;
			$.each(billingMethod,function(index,item){
				var checkBoxTd = $("<td  style='text-align:center;vertical-align:middle;'><input type='checkbox' class='check_item'/></td>");
				var billingMethodId = $("<td style='display: none;text-align:center;vertical-align:middle;'></td>").append(item.billingMethodId);
				var billingMethodName = "";
				if(item.billingMethodName != null){
					billingMethodName = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.billingMethodName);
				}else{
					billingMethodName = $("<td style='text-align:center;vertical-align:middle;'></td>").append("");
				}
				var billingMethodStartPrice = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.billingMethodStartPrice);
				var billingMethodStartMinutes = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.billingMethodStartMinutes);
				var billingMethodFreeMinutes = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.billingMethodFreeMinutes);
				var billingMethodMinimumConsumption = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.billingMethodMinimumConsumption);
				var billingMethodMaximumConsumption = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.billingMethodMaximumConsumption);
				var billingMethodTimeoutThreshold = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.billingMethodTimeoutThreshold);
				var timeQuantumHtml = "";
				$.each(item.timeQuantums,function(i,tq){
						timeQuantumHtml += "<p><span>["+tq.timeQuantumStartTime+","+tq.timeQuantumEndTime+")&nbsp;("+tq.timeQuantumRate+"元/小时)</span>";
						timeQuantumHtml += '&nbsp;<span class="btn btn-sm btn-danger ml5" onclick="deleteTimeQuantum('+tq.timeQuantumId+')"><i class="glyphicon glyphicon-remove"></i></span></p>';
				})
				var timeQuantum = $("<td style='text-align:center;vertical-align:middle;'></td>").append(timeQuantumHtml);
			
				var saveBtn = $("<button></button>").addClass("btn aaa save_btn")
				.append($("<span></span>").addClass("")).append("添加时间段");
				//为编辑按钮添加一个自定义的属性，来表示当前角色id
				saveBtn.attr("edit-id",item.billingMethodId);
			
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前角色id
				editBtn.attr("edit-id",item.billingMethodId);
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的角色id
				delBtn.attr("del-id",item.billingMethodId);
				var btnTd = $("<td style='text-align:center;vertical-align:middle;'></td>").append(editBtn).append(" ").append(delBtn).append(" ").append(saveBtn);
				//var delBtn = 
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd)
					.append(billingMethodId)
					.append(billingMethodName)
					.append(billingMethodStartPrice)
					.append(billingMethodStartMinutes)
					.append(billingMethodFreeMinutes)
					.append(billingMethodMinimumConsumption)
					.append(billingMethodMaximumConsumption)
					.append(billingMethodTimeoutThreshold)
					.append(timeQuantum)
					.append(btnTd)
					.appendTo("#billingMethod_table tbody");
			});
		}
		function deleteTimeQuantum(id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result){
					//确认，发送ajax请求删除即可
					$.ajax({
						url:"${APP_PATH}/deleteTimeQuantum/"+id,
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
		$("#billingMethod_add_modal_btn").click(function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#billingMethodAddModal form");
			//弹出模态框
			$("#billingMethodAddModal").modal({
				backdrop:"static"
			});
		});
		
		//校验起步费用（元）是否可用
		$("#billingMethodStartPrice_add_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodStartPrice = this.value;
			$.ajax({
				url:"${APP_PATH}/checkMoney",
				data:"money="+billingMethodStartPrice,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodStartPrice_add_input","success","起步费用（元）可用");
						if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
							$("#billingMethod_save_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodStartPrice_add_input","error",result.extend.va_msg);
						$("#billingMethod_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验起步分钟（分钟）是否可用
		$("#billingMethodStartMinutes_add_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodStartMinutes = this.value;
			$.ajax({
				url:"${APP_PATH}/checkNumber",
				data:"number="+billingMethodStartMinutes,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodStartMinutes_add_input","success","起步分钟（分钟）可用");
						if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
							$("#billingMethod_save_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodStartMinutes_add_input","error",result.extend.va_msg);
						$("#billingMethod_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验免费分钟（分钟）是否可用
		$("#billingMethodFreeMinutes_add_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodFreeMinutes = this.value;
			$.ajax({
				url:"${APP_PATH}/checkNumber",
				data:"number="+billingMethodFreeMinutes,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodFreeMinutes_add_input","success","免费分钟（分钟）可用");
						if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
							$("#billingMethod_save_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodFreeMinutes_add_input","error",result.extend.va_msg);
						$("#billingMethod_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验费率（元/小时）是否可用
		$("#billingMethodRate_add_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodRate = this.value;
			$.ajax({
				url:"${APP_PATH}/checkMoney",
				data:"money="+billingMethodRate,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodRate_add_input","success","费率（元/小时）可用");
						if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
							$("#billingMethod_save_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodRate_add_input","error",result.extend.va_msg);
						$("#billingMethod_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验最低消费（元）是否可用
		$("#billingMethodMinimumConsumption_add_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodMinimumConsumption = this.value;
			$.ajax({
				url:"${APP_PATH}/checkMoney",
				data:"money="+billingMethodMinimumConsumption,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodMinimumConsumption_add_input","success","最低消费（元）可用");
						if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
							$("#billingMethod_save_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodMinimumConsumption_add_input","error",result.extend.va_msg);
						$("#billingMethod_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验最高消费（元）是否可用
		$("#billingMethodMaximumConsumption_add_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodMaximumConsumption = this.value;
			$.ajax({
				url:"${APP_PATH}/checkMoney",
				data:"money="+billingMethodMaximumConsumption,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodMaximumConsumption_add_input","success","最高消费（元）可用");
						if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
							$("#billingMethod_save_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodMaximumConsumption_add_input","error",result.extend.va_msg);
						$("#billingMethod_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验超时门限（分钟）是否可用
		$("#billingMethodTimeoutThreshold_add_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodTimeoutThreshold = this.value;
			$.ajax({
				url:"${APP_PATH}/checkNumber",
				data:"number="+billingMethodTimeoutThreshold,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodTimeoutThreshold_add_input","success","超时门限（分钟）可用");
						if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
							$("#billingMethod_save_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodTimeoutThreshold_add_input","error",result.extend.va_msg);
						$("#billingMethod_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//添加时非空验证
		function SaveJudgmentisnotempty(){
			var billingMethodStartPrice = $("#billingMethodStartPrice_add_input").val();
			if(billingMethodStartPrice == null || billingMethodStartPrice == ""){
				show_validate_msg("#billingMethodStartPrice_add_input","error","起步费用（元）不能为空");
				$("#billingMethod_save_btn").attr("ajax-va","error");
			}else{
				if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
					$("#billingMethod_save_btn").attr("ajax-va","success");
				}
			}
			var billingMethodStartMinutes = $("#billingMethodStartMinutes_add_input").val();
			if(billingMethodStartMinutes == null || billingMethodStartMinutes == ""){
				show_validate_msg("#billingMethodStartMinutes_add_input","error","起步分钟（分钟）不能为空");
				$("#billingMethod_save_btn").attr("ajax-va","error");
			}else{
				if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
					$("#billingMethod_save_btn").attr("ajax-va","success");
				}
			}
			var billingMethodFreeMinutes = $("#billingMethodFreeMinutes_add_input").val();
			if(billingMethodFreeMinutes == null || billingMethodFreeMinutes == ""){
				show_validate_msg("#billingMethodFreeMinutes_add_input","error","免费分钟（分钟）不能为空");
				$("#billingMethod_save_btn").attr("ajax-va","error");
			}else{
				if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
					$("#billingMethod_save_btn").attr("ajax-va","success");
				}
			}
			var billingMethodMinimumConsumption = $("#billingMethodMinimumConsumption_add_input").val();
			if(billingMethodMinimumConsumption == null || billingMethodMinimumConsumption == ""){
				show_validate_msg("#billingMethodMinimumConsumption_add_input","error","最低消费（元）不能为空");
				$("#billingMethod_save_btn").attr("ajax-va","error");
			}else{
				if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
					$("#billingMethod_save_btn").attr("ajax-va","success");
				}
			}
			var billingMethodMaximumConsumption = $("#billingMethodMaximumConsumption_add_input").val();
			if(billingMethodMaximumConsumption == null || billingMethodMaximumConsumption == ""){
				show_validate_msg("#billingMethodMaximumConsumption_add_input","error","最高消费（元）不能为空");
				$("#billingMethod_save_btn").attr("ajax-va","error");
			}else{
				if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
					$("#billingMethod_save_btn").attr("ajax-va","success");
				}
			}
			var billingMethodTimeoutThreshold = $("#billingMethodTimeoutThreshold_add_input").val();
			if(billingMethodTimeoutThreshold == null || billingMethodTimeoutThreshold == ""){
				show_validate_msg("#billingMethodTimeoutThreshold_add_input","error","超时门限（分钟）不能为空");
				$("#billingMethod_save_btn").attr("ajax-va","error");
			}else{
				if($("#billingMethod_save_btn").attr("ajax-va")!="error"){
					$("#billingMethod_save_btn").attr("ajax-va","success");
				}
			}
		}
		
		//点击保存，保存分组。
		$("#billingMethod_save_btn").click(function(){
			//1、非空判断
			SaveJudgmentisnotempty();
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//2、发送ajax请求保存分组
			$.ajax({
				url:"${APP_PATH}/saveBillingMethod",
				type:"POST",
				data:$("#billingMethodAddModal form").serialize(),
				success:function(result){
					if(result.code == 100){
						//分组保存成功；
						bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
						//分组保存成功；
						//1、关闭模态框
						$("#billingMethodAddModal").modal('hide');
						//2、来到最后一页，显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可
						to_page(totalRecord);
					}else{
						//显示失败信息
						//console.log(result);
						//有哪个字段的错误信息就显示哪个字段的；
						if(undefined != result.extend.errorFields.billingMethodStartTime){
							show_validate_msg("#billingMethodStartTime_add_input", "error", result.extend.errorFields.billingMethodStartTime);
						}
						if(undefined != result.extend.errorFields.billingMethodEndTime){
							show_validate_msg("#billingMethodEndTime_add_input", "error", result.extend.errorFields.billingMethodEndTime);
						}
						if(undefined != result.extend.errorFields.billingMethodStartPrice){
							show_validate_msg("#billingMethodStartPrice_add_input", "error", result.extend.errorFields.billingMethodStartPrice);
						}
						if(undefined != result.extend.errorFields.billingMethodStartMinutes){
							show_validate_msg("#billingMethodStartMinutes_add_input", "error", result.extend.errorFields.billingMethodStartMinutes);
						}
						if(undefined != result.extend.errorFields.billingMethodFreeMinutes){
							show_validate_msg("#billingMethodFreeMinutes_add_input", "error", result.extend.errorFields.billingMethodFreeMinutes);
						}
						if(undefined != result.extend.errorFields.billingMethodRate){
							show_validate_msg("#billingMethodRate_add_input", "error", result.extend.errorFields.billingMethodRate);
						}
						if(undefined != result.extend.errorFields.billingMethodMinimumConsumption){
							show_validate_msg("#billingMethodMinimumConsumption_add_input", "error", result.extend.errorFields.billingMethodMinimumConsumption);
						}
						if(undefined != result.extend.errorFields.billingMethodMaximumConsumption){
							show_validate_msg("#billingMethodMaximumConsumption_add_input", "error", result.extend.errorFields.billingMethodMaximumConsumption);
						}
						if(undefined != result.extend.errorFields.billingMethodTimeoutThreshold){
							show_validate_msg("#billingMethodTimeoutThreshold_add_input", "error", result.extend.errorFields.billingMethodTimeoutThreshold);
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
			reset_form("#billingMethodUpdateModal form");
			//2、查出数据库表信息，显示数据库表信息
			getBillingMethod($(this).attr("edit-id"));
			//3、把角色的id传递给模态框的更新按钮
			$("#billingMethod_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#billingMethodUpdateModal").modal({
				backdrop:"static"
			});
		});
		//添加时间段弹出框
		$(document).on("click",".save_btn",function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#timeQuantumAddModal form");
			$("#timeQuantumBillingMethodId").val($(this).attr("edit-id"))
			//弹出模态框
			$("#timeQuantumAddModal").modal({
				backdrop:"static"
			});
		});
		//添加时间段
		$(document).on("click","#timeQuantum_save_btn",function(){
			$.ajax({
				url:"${APP_PATH}/savetimeQuantum",
				type:"POST",
				data:$("#timeQuantumAddModal form").serialize(),
				success:function(result){
					if(result.code == 100){
						//分组保存成功；
						bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#timeQuantumAddModal").modal('hide');
						to_page(totalRecord);
					}else{
						bootbox.dialog({
						message: "<span class='bigger-110'>"+result.extend.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
					}
				}
			})
		})
		function getBillingMethod(id){
			$.ajax({
				url:"${APP_PATH}/getBillingMethodById/"+id,
				type:"GET",
				cache:false,
				success:function(result){
					var billingMethod = result.extend.billingMethod;
					$("#billingMethodId_update_input").val(billingMethod.billingMethodId);
					$("#billingMethodName_update_input").val(billingMethod.billingMethodName);
					$("#billingMethodStartTime_update_input").val(billingMethod.billingMethodStartTime);
					$("#billingMethodEndTime_update_input").val(billingMethod.billingMethodEndTime);
					$("#billingMethodStartPrice_update_input").val(billingMethod.billingMethodStartPrice);
					$("#billingMethodStartMinutes_update_input").val(billingMethod.billingMethodStartMinutes);
					$("#billingMethodFreeMinutes_update_input").val(billingMethod.billingMethodFreeMinutes);
					$("#billingMethodRate_update_input").val(billingMethod.billingMethodRate);
					$("#billingMethodMinimumConsumption_update_input").val(billingMethod.billingMethodMinimumConsumption);
					$("#billingMethodMaximumConsumption_update_input").val(billingMethod.billingMethodMaximumConsumption);
					$("#billingMethodTimeoutThreshold_update_input").val(billingMethod.billingMethodTimeoutThreshold);
				}
			});
		}
		//校验起步费用（元）是否可用
		$("#billingMethodStartPrice_update_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodStartPrice = this.value;
			$.ajax({
				url:"${APP_PATH}/checkMoney",
				data:"money="+billingMethodStartPrice,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodStartPrice_update_input","success","起步费用（元）可用");
						if($("#billingMethod_update_btn").attr("ajax-va")!="error"){
							$("#billingMethod_update_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodStartPrice_update_input","error",result.extend.va_msg);
						$("#billingMethod_update_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验起步分钟（分钟）是否可用
		$("#billingMethodStartMinutes_update_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodStartMinutes = this.value;
			$.ajax({
				url:"${APP_PATH}/checkNumber",
				data:"number="+billingMethodStartMinutes,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodStartMinutes_update_input","success","起步分钟（分钟）可用");
						if($("#billingMethod_update_btn").attr("ajax-va")!="error"){
							$("#billingMethod_update_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodStartMinutes_update_input","error",result.extend.va_msg);
						$("#billingMethod_update_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验免费分钟（分钟）是否可用
		$("#billingMethodFreeMinutes_update_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodFreeMinutes = this.value;
			$.ajax({
				url:"${APP_PATH}/checkNumber",
				data:"number="+billingMethodFreeMinutes,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodFreeMinutes_update_input","success","免费分钟（分钟）可用");
						if($("#billingMethod_update_btn").attr("ajax-va")!="error"){
							$("#billingMethod_update_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodFreeMinutes_update_input","error",result.extend.va_msg);
						$("#billingMethod_update_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验费率（元/小时）是否可用
		$("#billingMethodRate_update_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodRate = this.value;
			$.ajax({
				url:"${APP_PATH}/checkMoney",
				data:"money="+billingMethodRate,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodRate_update_input","success","费率（元/小时）可用");
						if($("#billingMethod_update_btn").attr("ajax-va")!="error"){
							$("#billingMethod_update_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodRate_update_input","error",result.extend.va_msg);
						$("#billingMethod_update_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验最低消费（元）是否可用
		$("#billingMethodMinimumConsumption_update_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodMinimumConsumption = this.value;
			$.ajax({
				url:"${APP_PATH}/checkMoney",
				data:"money="+billingMethodMinimumConsumption,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodMinimumConsumption_update_input","success","最低消费（元）可用");
						if($("#billingMethod_update_btn").attr("ajax-va")!="error"){
							$("#billingMethod_update_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodMinimumConsumption_update_input","error",result.extend.va_msg);
						$("#billingMethod_update_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验最高消费（元）是否可用
		$("#billingMethodMaximumConsumption_update_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodMaximumConsumption = this.value;
			$.ajax({
				url:"${APP_PATH}/checkMoney",
				data:"money="+billingMethodMaximumConsumption,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodMaximumConsumption_update_input","success","最高消费（元）可用");
						if($("#billingMethod_update_btn").attr("ajax-va")!="error"){
							$("#billingMethod_update_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodMaximumConsumption_update_input","error",result.extend.va_msg);
						$("#billingMethod_update_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//校验超时门限（分钟）是否可用
		$("#billingMethodTimeoutThreshold_update_input").change(function(){
			//发送ajax请求校验分组名称是否可用
			var billingMethodTimeoutThreshold = this.value;
			$.ajax({
				url:"${APP_PATH}/checkNumber",
				data:"number="+billingMethodTimeoutThreshold,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#billingMethodTimeoutThreshold_update_input","success","超时门限（分钟）可用");
						if($("#billingMethod_update_btn").attr("ajax-va")!="error"){
							$("#billingMethod_update_btn").attr("ajax-va","success");
						}
					}else{
						show_validate_msg("#billingMethodTimeoutThreshold_update_input","error",result.extend.va_msg);
						$("#billingMethod_update_btn").attr("ajax-va","error");
					}
				}
			});
		});
		//修改时非空验证
		function UpdateJudgmentisnotempty(){
			var billingMethodStartPrice = $("#billingMethodStartPrice_update_input").val();
			if(billingMethodStartPrice == null || billingMethodStartPrice == ""){
				show_validate_msg("#billingMethodStartPrice_update_input","error","起步费用（元）不能为空");
				$("#billingMethod_update_btn").attr("ajax-va","error");
			}else{
				$("#billingMethod_update_btn").attr("ajax-va","success");
			}
			var billingMethodStartMinutes = $("#billingMethodStartMinutes_update_input").val();
			if(billingMethodStartMinutes == null || billingMethodStartMinutes == ""){
				show_validate_msg("#billingMethodStartMinutes_update_input","error","起步分钟（分钟）不能为空");
				$("#billingMethod_update_btn").attr("ajax-va","error");
			}else{
				$("#billingMethod_update_btn").attr("ajax-va","success");
			}
			var billingMethodFreeMinutes = $("#billingMethodFreeMinutes_update_input").val();
			if(billingMethodFreeMinutes == null || billingMethodFreeMinutes == ""){
				show_validate_msg("#billingMethodFreeMinutes_update_input","error","免费分钟（分钟）不能为空");
				$("#billingMethod_update_btn").attr("ajax-va","error");
			}else{
				$("#billingMethod_update_btn").attr("ajax-va","success");
			}
			var billingMethodMinimumConsumption = $("#billingMethodMinimumConsumption_update_input").val();
			if(billingMethodMinimumConsumption == null || billingMethodMinimumConsumption == ""){
				show_validate_msg("#billingMethodMinimumConsumption_update_input","error","最低消费（元）不能为空");
				$("#billingMethod_update_btn").attr("ajax-va","error");
			}else{
				//if($("#billingMethod_update_btn").attr("ajax-va")!="error"){
				$("#billingMethod_update_btn").attr("ajax-va","success");
				//}
			}
			var billingMethodMaximumConsumption = $("#billingMethodMaximumConsumption_update_input").val();
			if(billingMethodMaximumConsumption == null || billingMethodMaximumConsumption == ""){
				show_validate_msg("#billingMethodMaximumConsumption_update_input","error","最高消费（元）不能为空");
				$("#billingMethod_update_btn").attr("ajax-va","error");
			}else{
				if($("#billingMethod_update_btn").attr("ajax-va")!="error"){
					$("#billingMethod_update_btn").attr("ajax-va","success");
				}
			}
			var billingMethodTimeoutThreshold = $("#billingMethodTimeoutThreshold_update_input").val();
			if(billingMethodTimeoutThreshold == null || billingMethodTimeoutThreshold == ""){
				show_validate_msg("#billingMethodTimeoutThreshold_update_input","error","超时门限（分钟）不能为空");
				$("#billingMethod_update_btn").attr("ajax-va","error");
			}else{
				if($("#billingMethod_update_btn").attr("ajax-va")!="error"){
					$("#billingMethod_update_btn").attr("ajax-va","success");
				}
			}
		}
		 
		//点击更新，更新角色信息
		$("#billingMethod_update_btn").click(function(){
			//非空验证
			UpdateJudgmentisnotempty();
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//2、发送ajax请求保存更新的角色数据
			$.ajax({
				url:"${APP_PATH}/updateBillingMethod/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#billingMethodUpdateModal form").serialize(),
				success:function(result){
					if(result.code == 100){
						bootbox.dialog({
							message: "<span class='bigger-110'>"+result.msg+"!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						//1、关闭对话框
						$("#billingMethodUpdateModal").modal("hide");
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
		
		//单个删除
		$(document).on("click",".delete_btn",function(){
			//1、弹出是否确认删除对话框
			var billingMethodName = $(this).parents("tr").find("td:eq(2)").text();
			var billingMethodId = $(this).attr("del-id");
			//alert($(this).parents("tr").find("td:eq(1)").text());
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result){
					//确认，发送ajax请求删除即可
					$.ajax({
						url:"${APP_PATH}/deleteBillingMethod/"+billingMethodId,
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
		$("#billingMethod_delete_all_btn").click(function(){
			//
			var billingMethodNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"),function(){
				//this
				billingMethodNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				//组装角色id字符串
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			//去除roleNames多余的,
			billingMethodNames = billingMethodNames.substring(0, billingMethodNames.length-1);
			//去除删除的id多余的-
			del_idstr = del_idstr.substring(0, del_idstr.length-1);
			if(billingMethodNames == null || billingMethodNames == ""){
				bootbox.dialog({
					message: "<span class='bigger-110'>请选择需要删除的记录!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-erro"}}
				});
				return;
			}
			bootbox.confirm("确定要删除["+billingMethodNames+"]吗?", function(result) {
				if(result){
					//发送ajax请求删除
					$.ajax({
						url:"${APP_PATH}/deleteBillingMethod/"+del_idstr,
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