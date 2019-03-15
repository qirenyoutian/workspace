<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
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
				<h1>收入查询</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
			 <div class="col-md-8">
				<select id="select" class="form-control" style="height:32px; width:130px;float:left;">
					<option value="1">按停车路段</option>
					<option value="2">按时间</option>
				</select>
				<div class="" style="width:550px; display:none;width:600px;" id="date_Div">
						<div class="input-group"style="float:left;">
							<div class="demo2">
								<input type="text" id="startTime" class="jeinput" style="height:32px;" placeholder="请输入日期">
								<input type="text" id="endTime" class="jeinput" style="height:32px;" placeholder="请输入日期">							</div>
						</div>
						<div style="float:left;">
							<button type="button" id="timeInquire" class="btn btn-primary"style="margin-left:10px;" >查询</button>
						</div>
				</div>
				<div id="routeInput">
					 <div class="col-md-4">
						<select class="form-control" id="routeSelect" style="height:32px;" name="SaveMenuSuperior"></select>
					</div>
					 <div class="col-md-3">
					</div>
				</div>
				
			</div>
			<div class="col-md-4">
				<button class="btn btn-primary"style="margin-left:100px;" id="importExcel" onclick="download()">导出</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="user_table">
					<thead>
						<tr>
							<th style="display: none;">主键</th>
							<th>停车用户</th>
							<th>使用路段</th>
							<th>使用车位</th>
							<th>停车金额</th>
							<th>停车状态</th>
							<th>支付类型</th>
							<th>支付状态</th>
							<th>支付时间</th>
							
						</tr>
					</thead>
					<tbody id="importExcel_tbody">
					
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
			
			$.ajax({
				url:"${APP_PATH}/getRoute",
				type:"GET",
				success:function(result){
					var sele = $("#routeSelect");
					var optionEle = $("<option></option>").append("全部").attr("value","1");
					optionEle.appendTo(sele);
						$.each(result.object.list,function(){
							var optionEle = $("<option></option>").append(this.routeLocationName).attr("value",this.routeLocationName);
							optionEle.appendTo(sele);
						});
				}
			});
			//去首页
			to_page(1);		
		});
			
			$("#timeInquire").click(function(){
				goto_page(1);
		});
			$("#routeSelect").change(function(){
				to_pageByName(1);
		});

		$("#select").change(function(){
			  var a = $("#select").val();				
			 if(a == 1){
				$("#date_Div").css('display','none');
				$("#routeInput").css('display','block');
				
			}
			else if(a == 2){
				$("#date_Div").css('display','block');
				$("#routeInput").css('display','none');
			}
			else{
				alert("error");
			} 
			 
		});
		
		//通过时间段查询记录
		function goto_page(pn){

			var s = $("#startTime").val();
			var e = $("#endTime").val();
			
			if (e == "" || s == "") {
				to_page(pn);
			}else{
				$.ajax({
					url:"${APP_PATH}/GetIncomeByTime",
					data:{"pn":pn,"startTime":s,"endTime":e},
					type:"GET",
					success:function(result){
						build_roles_table(result);
																//2、解析并显示分页信息
						build_page_info(result);
																//3、解析显示分页条数据
						build_page_nav(result);
						
						
					}
				});
				
			}
			
			
		}
		function to_pageByName(pn){
			var route = $("#routeSelect").val();
			if (route == 1) {
				to_page(pn)
			}else{
				$.ajax({
					url:"${APP_PATH}/getSingleCarByRoute",
					data:{"pn":pn,"content":route},
					type:"POST",
					success:function(result){
						build_roles_table(result);   //1、解析并显示角色数据
						build_page_info(result);	 //2、解析并显示分页信息
						build_page_nav(result);		 //3、解析显示分页条数据
	
					}
				});
			}
		}
		
		//查询所有
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/getAllIncome",
				data:{"pn":pn},
				type:"POST",
				success:function(result){
					build_roles_table(result);   //1、解析并显示角色数据
					build_page_info(result);	 //2、解析并显示分页信息
					build_page_nav(result);		 //3、解析显示分页条数据

				}
			});
		}
		function timestampToTime(timestamp) {
	        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
	        Y = date.getFullYear() + '-';
	        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
	        D = (date.getDate()< 10 ? '0'+ date.getDate(): date.getDate()) + ' ';
	        h = (date.getHours()< 10 ? '0'+ date.getHours(): date.getHours()) + ':';
	        m = (date.getMinutes()< 10 ? '0'+ date.getMinutes(): date.getMinutes()) + ':';
	        s = (date.getSeconds()< 10 ? '0'+ date.getSeconds(): date.getSeconds());
	        return Y+M+D+h+m+s;
	    }
		
		function build_roles_table(result){
			//清空table表格
			$("#user_table tbody").empty();
			var user = result.extend.pageInfo.list;
			$.each(user,function(index,item){
				$.each(item.tratingRecord,function(index,i){
					$.each(i.singleCarList,function(index,s){
								var tradingRecordId = $("<td style='display: none;'></td>").append(i.tradingRecordId);
								var tradingRecordUser = $("<td></td>").append(item.userFullName);
								var routeLocationName = $("<td></td>").append(s.singleCarRouteName);
								var truckSpaceName = $("<td></td>").append(s.singleCarTruckSpace);
								var singleCarPrice = $("<td></td>").append(s.singleCarPrice);
								var CarType = s.singleCarType;
								
								if (CarType == 0) {
									var singleCarType = $("<td></td>").append("未完成停车");
								}else if(CarType == 1){
									var singleCarType = $("<td></td>").append("待付款");
								}else{
									var singleCarType = $("<td></td>").append("已完成");
								}
								var type = i.tradingRecordType;
								if (type == 0) {
									var tradingRecordType = $("<td></td>").append("微信");
								}else if(type == 1){
									var tradingRecordType = $("<td></td>").append("支付宝");
								}else{
									var tradingRecordType = $("<td></td>").append("余额");
								}
								var status = i.tradingRecordStatus;
								if (status == 0) {
									var tradingRecordStatus = $("<td></td>").append("未完成");
								}else{
									var tradingRecordStatus = $("<td></td>").append("已完成");
								}
								var tradingRecordTime = $("<td></td>").append(timestampToTime(i.tradingRecordTime));
								
								$("<tr></tr>").append(tradingRecordId)
									.append(tradingRecordUser)
									.append(routeLocationName)
									.append(truckSpaceName)
									.append(singleCarPrice)
									.append(singleCarType)
									.append(tradingRecordType)
									.append(tradingRecordStatus)
									.append(tradingRecordTime)
									.appendTo("#user_table tbody");
									
					})
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
	
		//导出表格
		  function download(){
			var c = $("#routeSelect").val();
			var s = $("#startTime").val();
			var e = $("#endTime").val();
        	var url="${APP_PATH}/ExportIncome?content="+c+"&startTime="+s+"&endTime="+e;
        	window.open(url);
   		 } 
		
		
		
		
	</script>
</body>
</html>