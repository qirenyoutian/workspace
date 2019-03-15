<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>总收入报表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min2.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!-- 时间选择器 -->
<script type="text/javascript" src="${APP_PATH }/static/datetime/js/jedate.js"></script>
<link type="text/css" rel="stylesheet" href="${APP_PATH }/static/datetime/js/skins/jedate.css">

<style type="text/css">
	table tr td,th{text-align: center;}
</style>
<title>总收入报表</title>
</head>
<style>
	td.td002{
		margin:0px;
		padding: 0px;
		padding-left:20px;
		font-size: 20px;
	}
</style>
<body>	
		<div class="row" style="margin-left:300px;;margin-top: 50px;">
			<br>
			 <div class="col-md-8" style="margin-left: -50px; width:850px;">
				<select id="select" class="form-control" style="height:32px; width:130px;float:left;">
					<option value="0">全部</option>
					<option value="1">按停车路段</option>
					<option value="2">按时间</option>
				</select>
				<div class="" style="width:550px; display:none;width:600px;" id="date_Div">
						<div class="input-group"style="float:left;">
							<div class="demo2">
								<input type="text" id="startTime" class="jeinput" style="height:32px;" placeholder="请输入日期">
								<input type="text" id="endTime" class="jeinput" style="height:32px;" placeholder="请输入日期">
							</div>
						</div>
						<div style="float:left;">
							<button type="button" id="timeInquire" class="btn btn-primary"style="margin-left:10px;" onclick="to_page(1)">查询</button>
						</div>
				</div>
				<div id="routeInput" style="display:none;">
					 <div class="col-md-4">
						<select class="form-control" id="routeSelect" style="height:32px;" name="SaveMenuSuperior"></select>
					</div>
					<div style="float:left;">
						<button type="button" id="aaa" class="btn btn-primary"style="margin-left:10px;" onclick="to_page(1)" >查询</button>
					</div>
				</div>
				<button class="btn btn-primary"style="margin-left: 30px;" id="importExcel" onclick="download()">导出</button>
			</div>
			
		</div>
	<table id="user_table">
		<thead>
			<tr>
				<th colspan="4" class="th001">总收入报表
				<p style="font-size: 12px; line-height: 0px; letter-spacing:0px; font-weight: normal;" id = "condition">
						(默认显示前三个月)
					</p>
				</th>
			</tr>
			<tr>
				<td class="td001">路段</td>
				<td class="td001">停车次数</td>
				<td class="td002">收入
					<span style="font-size: 12px; margin:0px;padding:0px; line-height: 0px; letter-spacing:0px; font-weight: normal;">
						(元)
					</span>
				</td>
			</tr>
		</thead>
		<tbody id="aaaa">
			
		</tbody>
	</table>
	
	<script type="text/javascript" src="${APP_PATH }/static/datetime/js/test/demo.js"></script>	
	<script type="text/javascript">
	var totalRecord,currentPage;
	//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
	$(function(){
		//去首页
		to_page(1);
	});
	function to_page(pn){
		var type = $("#select").val();
		var routeId = 0;
		var startTime = "";
		var endTime = "";
		if(type == 1){
			routeId = $("#routeSelect").val();
			$("#condition").html("(默认显示前三个月)");
		}else if(type == 2){
			startTime = $("#startTime").val();
			endTime = $("#endTime").val();
			$("#condition").html(startTime.substring(5,10) + "~" + endTime.substring(5,10));
		}
		$.ajax({
			url:"${APP_PATH}/getThreeMonthIncomeAndRoutCount",
			data:{"type":type,"routeId":routeId,"startTime":startTime,"endTime":endTime},
			type:"GET",
			success:function(result){
				//console.log(result);
				//1、解析并显示角色数据
				build_roles_table(result);
				getRoute();
			}
		});
	}
	function build_roles_table(result){
		//清空table表格
		$("#user_table tbody").html("");
		var routeCounts = result.extend.count;
		$.each(routeCounts,function(index,item){
			var routeName = $("<td></td>").append(item.routeName);
			var count = $("<td></td>").append(item.count);
			var sum = $("<td></td>").append(item.sum);
			$("<tr></tr>")
				.append(routeName)
				.append(count)
				.append(sum)
				.appendTo("#user_table tbody");
		});
	}
	//清空表单样式及内容
	function reset_form(ele){
		$(ele)[0].reset();
		//清空表单样式
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	}
	
	
	function getRoute(){
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
/* 	function build_roles_table(result){
		var record = result.extend.pageInfo.list;
			$.each(record,function(index,item){
				var RouteLocationName = $("<td></td>").append(item.routeLocationName);
				
		}); 
	}
 */	
	//查询条件的选择
	$("#select").change(function(){
		var a = $("#select").val();
		if(a == 0){
			$("#date_Div").css('display','none');
			$("#routeInput").css('display','none');
			to_page(1);
		}else if(a == 1){
			$("#date_Div").css('display','none');
			$("#routeInput").css('display','block');
		}
		else if(a == 2){
			$("#date_Div").css('display','block');
			$("#routeInput").css('display','none');
		}
	});

	//导出表格
	  function download(){
		  	var type = $("#select").val();
			var c = $("#routeSelect").val();
			if(c == null){
				c = 0;
			}
			var s = $("#startTime").val();
			var e = $("#endTime").val();
			//alert(type+c+s+e);
			  
      	var url="${APP_PATH}/ExportTotalIncome?type="+type+"&routeId="+c+"&startTime="+s+"&endTime="+e;
      	window.open(url);
 		 } 

		
	
	</script>
	
</body>
</html>