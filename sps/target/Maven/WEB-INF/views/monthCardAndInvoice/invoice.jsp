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
</style>
</head>
<body>

	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>发票列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
			<div class="col-md-8">
				<select id="select" class="form-control" style="height:32px; width:130px;float:left;">
					<option value="1">按用户</option>
					<option value="2">按时间</option>
					<option value="3">发票类型</option>
					
				</select>
				<div class="" style="width:550px; display:none;width:600px;" id="date_Div">
						<div class="input-group"style="float:left;">
							<div class="demo2">
								<input type="text" id="startTime" class="jeinput" style="height:32px;" placeholder="请输入日期">
								<input type="text" id="endTime" class="jeinput" style="height:32px;" placeholder="请输入日期">
							</div>
						</div>
						<div style="float:left;">
							<button type="button" id="timeInquire" class="btn btn-primary"style="margin-left:10px;" >查询</button>
						</div>
				</div>
				<div id="name_input">
					 <div class="col-md-4">
						<input type="text" id="content" class="form-control" style="float:left;" placeholder="请输入用户名">
					</div>
					 <div class="col-md-3">
						<button type="button" id="inquire" class="btn btn-primary">查询</button>
					</div>
				</div>
				<div id="Invoice_input" style="display:none;">
					 <div class="col-md-4">
						<select id="invoice" class="col-md-2" style="width:120px;height:30px; border-radius:5px;">
							<option value="0">未出票</option>
							<option value="1">已出票</option>
						</select>
					</div>
				</div>
			</div>
			
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="user_table">
					<thead>
						<tr>
							<th style="display: none;">主键</th>
							<th>申请用户</th>
							<th>发票类型</th>
							<th>抬头类型</th>
							<th>发票抬头</th>
							<th>发票税号</th>
							<th>发票金额</th>
							<th>接收方式</th>
							<th>出票情况</th>
							<th>出票时间</th>
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
		$(document).ready(function(){
			$("#timeInquire").click(function(){
				to_pageByTime(1);
			});
		});
		//根据发票类型
		$("#invoice").change(function(){
			to_pageByType(1);
		})
		function to_page(pn){
			var c = $("#content").val();
			$.ajax({
				url:"${APP_PATH}/getAllInvoice",
				data:{"pn":pn,"content":c},
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
		function to_pageByType(pn){
			var i = $("#invoice").val();
			
			$.ajax({
				url:"${APP_PATH}/getAllInvoiceByType",
				data:{"pn":pn,"invoiceType":i},
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
		function to_pageByTime(pn){
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();
			
			$.ajax({
				url:"${APP_PATH}/getAllInvoiceByTime",
				data:{"pn":pn,"startTime":startTime,"endTime":endTime},
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
			$("#user_table tbody").empty();
			var invioce = result.extend.pageInfo.list;
			$.each(invioce,function(index,item){
				$.each(item.userInvoice,function(index,t){
					var invoiceId = $("<td style='display: none;'></td>").append(t.invoiceId);
					var invoiceUserId = $("<td></td>").append(item.userFullName);
					var type1 = t.invoiceType;
					if (type1 == 0) {
						var invoiceType = $("<td></td>").append("电子");
					}else{
						var invoiceType = $("<td></td>").append("纸质");
					}
					var type2 = t.invoiceRiseType;
					if (type2 == 0) {
						var invoiceRiseType = $("<td></td>").append("公司");
					}else{
						var invoiceRiseType = $("<td></td>").append("个人");
					}
					var invoiceRiseName = $("<td></td>").append(t.invoiceRiseName);
					var invoiceDutyParagraph = $("<td></td>").append(t.invoiceDutyParagraph);
					var invoiceSum = $("<td></td>").append(t.invoiceSum);
					var type3 = t.invoiceReceiveMode;
					if (type3 == 0) {
						var invoiceReceiveMode = $("<td></td>").append("邮箱");
					}else{
						var invoiceReceiveMode = $("<td></td>").append("快递");
					}
					var type4 = t.invoiceStatus;
					if (type4 == 0) {
						var invoiceStatus = $("<td></td>").append("未出票");
						//如果未出票则有出票
						var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("出票");
								 editBtn.attr("edit-id",t.invoiceId).attr("status-id",t.invoiceStatus);
						var btnTd = $("<td></td>").append(editBtn);
						
					}else{
						var invoiceStatus = $("<td></td>").append("已出票");
						var editBtn = "";
						var btnTd = $("<td></td>").append(editBtn);
					}
					var invoiceTime = $("<td></td>").append(t.invoiceTime);
					
					
					$("<tr></tr>").append(invoiceId)
						.append(invoiceUserId)
						.append(invoiceType)
						.append(invoiceRiseType)
						.append(invoiceRiseName)
						.append(invoiceDutyParagraph)
						.append(invoiceSum)
						.append(invoiceReceiveMode)
						.append(invoiceStatus)
						.append(invoiceTime)
						.append(btnTd)
						.appendTo("#user_table tbody");
				})
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
		
		$("#select").change(function(){
			  var a = $("#select").val();				
			 if(a == 1){
				$("#date_Div").css('display','none');
				$("#name_input").css('display','block');
				$("#Invoice_input").css('display','none');
				
			}
			else if(a == 2){
				$("#date_Div").css('display','block');
				$("#name_input").css('display','none');
				$("#Invoice_input").css('display','none');
			}else if(a == 3){
				$("#date_Div").css('display','none');
				$("#name_input").css('display','none');
				$("#Invoice_input").css('display','block');
			}
			else{
				alert("error");
			} 
		});

		$(document).on("click",".edit_btn",function(){
			var invoiceId = $(this).attr("edit-id");
			var status = $(this).attr("status-id");
			 bootbox.confirm("确定要出票吗?", function(result) {
				if(result){
					$.ajax({
						url:"${APP_PATH}/updateInvoiceStatusById",
						data:{"invoiceId":invoiceId,"status":status},
						type:"GET",
						success:function(result){
							bootbox.dialog({
								message: "<span class='bigger-110'>"+result.msg+"!</span>",
								buttons: 			
								{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
							});
							//回到本页
							to_page(currentPage);
						}
				
				})
			}
		})
			 
		})
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>