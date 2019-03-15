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

<title>总收入报表</title>
</head>
<style>
td{
width:150px;
}
th.td002{
	width:20px;
}
</style>

<body>	
		<div class="IncomeTop">
				<div style="float:right;">
					<button class="btn btn-primary" id="importExcel" onclick="download()">导出</button>
				</div>
				<div style="float:right;margin-right: 50px;">
					<select id="select" name="SaveMenuSuperior" class="form-control" style="height:32px; width:200px;float:left;"></select>
					<button type= "button" id="inquire" class="btn btn-primary" onclick="invoiceStatement()">查询</button>
				</div>
				
		</div>
	<table id="user_table">
		<thead>
			
			<tr>
				<th colspan="6" class="th001">
					发票报表
					<p style="font-size: 12px; line-height: 0px; letter-spacing:0px; font-weight: normal;">
						(默认显示前三个月)
					</p>
				</th>
			</tr>
			<tr>
				<td>路段名称</td>
				<td class="td002">发票类型</td>
				<td class="td002">发票数量</td>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
	<script type="text/javascript">

	$(function(){
		/* $.ajax({
			url:"${APP_PATH}/getRoute",
			type:"GET",
			success:function(result){
				var sele = $("#select");
				var optionEle = $("<option></option>").append("全部").attr("value","1");
				optionEle.appendTo(sele);
				$.each(result.object.list,function(){
					var optionEle = $("<option></option>").append(this.routeLocationName).attr("value",this.routeId);
					optionEle.appendTo(sele);
				});
			}
		}); */
		invoiceStatement();
	});
	
	/* $.get("${APP_PATH}/invoiceStatement",function(result,status){
		var record = result.object;
		$.each(record,function(index,item){
			var RouteLocationName = $("<td></td>").append(item.routeName);
			var InvoiceStatus = $("<td></td>").append(item.invoiceType);
			var Total = $("<td></td>").append(item.count);
		
			$("<tr></tr>").append(RouteLocationName)
			.append(InvoiceStatus)
			.append(Total)
			.appendTo("#user_table tbody");
		}); 
	}) */

	 function download(){
		var c = $("#select").val();
       	var url="${APP_PATH}/ExportInvoice?content="+c;
       	window.open(url);
  	} 
	
	function invoiceStatement(){
		$("#user_table tbody").html("");
		var routeId = $("#select").val();
		$.ajax({
			url:"${APP_PATH}/invoiceStatement",
			type:"POST",
			data:{"routeId":routeId},
			success:function(result){
				var record = result.object;
 				$.each(record,function(index,item){
						var RouteLocationName = $("<td></td>").append(item.routeName);
						var InvoiceStatus = $("<td></td>").append(item.invoiceType);
						var Total = $("<td></td>").append(item.count);
					
						$("<tr></tr>").append(RouteLocationName)
						.append(InvoiceStatus)
						.append(Total)
						.appendTo("#user_table tbody");
				});
 				getRoute();
			}
		})
	}
	
	function getRoute(){
		$("#select").html("");
		$.ajax({
			url:"${APP_PATH}/getRoute",
			type:"GET",
			success:function(result){
				var sele = $("#select");
				var optionEle = $("<option></option>").append("全部").attr("value","1");
				optionEle.appendTo(sele);
				$.each(result.object.list,function(){
					var optionEle = $("<option></option>").append(this.routeLocationName).attr("value",this.routeId);
					optionEle.appendTo(sele);
				});
			}
		});
	}
	
	</script>
	
</body>
</html>