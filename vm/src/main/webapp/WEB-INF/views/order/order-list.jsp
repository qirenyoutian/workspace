<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/page/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/style.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/page/css/bootstrap.css" />
<!-- 区域相关 -->
<script src="${APP_PATH }/static/page/js/map.js"></script> 

<title>管理员列表</title>
</head>
<style>

.aaa{
	width:100px;
	height:32px;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
}
.tt{
	height: 100px;
}
</style>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span> 订单列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c" style="height:100px;margin-top: -30px;">
		<form method="post" action="#" id="order_form">
			<table class="tt">
				<tr>
					<td>区域选择：</td>
					<td>
						<select id="province" class="input-text" name="province" style="width:110px">
				            <option value="">----请选择----</option><option value="110000">北京市</option><option value="120000">天津市</option><option value="130000">河北省</option><option value="140000">山西省</option><option value="150000">内蒙古</option><option value="210000">辽宁省</option><option value="220000">吉林省</option><option value="230000">黑龙江省</option><option value="310000">上海市</option><option value="320000">江苏省</option><option value="330000">浙江省</option><option value="340000">安徽省</option><option value="350000">福建省</option><option value="360000">江西省</option><option value="370000">山东省</option><option value="410000">河南省</option><option value="420000">湖北省</option><option value="430000">湖南省</option><option value="440000">广东省</option><option value="450000">广西省</option><option value="460000">海南省</option><option value="500000">重庆市</option><option value="510000">四川省</option><option value="520000">贵州省</option><option value="530000">云南省</option><option value="540000">西藏自治区</option><option value="610000">陕西省</option><option value="620000">甘肃省</option><option value="630000">青海省</option><option value="640000">宁夏省</option><option value="650000">新疆自治区</option><option value="710000">台湾省</option><option value="810000">香港</option><option value="820000">澳门</option><option value="90000">外国</option>
				        </select>
				        <select id="city" class="input-text" name="city" style="width:110px">
				        	<option value=''>----请选择----</option>
				        </select>
				        <select id="area" class="input-text" name="area"style="width:110px">
				        	<option value=''>----请选择----</option>
				        </select>
					</td>
					<td>点位名称：</td>
					<td>
						<select id="orderPointName" name="orderPointName" style="width:150px;" class="aaa">
						    <option value="">----请选择----</option>
						</select>
					</td>
					<tr>
					<td>渠道选择：</td>
					<td>
						<select id="orderChannel" name="orderChannel" style="width:337px;" class="aaa">
						</select>
					</td>
					<td>设备名称：</td>
					<td>
						<select id="orderEquipmentName" name="orderEquipmentName" style="width:150px;" class="aaa">
						    <option value="">----请选择----</option>
						</select>
					</td>
					<td>货道编号：</td>
					<td>
						<select id="orderAisleNum" name="orderAisleNum" style="width:150px;" class="aaa">
							<option value="">---请选择---</option>
						</select>
					</td>
					</tr>
					<tr>
					<td>商户名称：</td>
					<td>
						<select id="orderCommerName" name="orderCommerName" style="width:337px;" class="aaa">
						    <option value="">----请选择----</option>
						</select>
					</td>
					<td>商品名称：</td>
					<td>
						<select id="orderMerchandiseName" name="orderMerchandiseName" style="width:150px;" class="aaa">
							<option value="">---请选择---</option>
						</select>
					</td>
					<td>订单状态：</td>
					<td>
						<select id="orderStatus" style="width:150px;" class="aaa" name="orderStatus">
							<option value="">---请选择---</option>
							<option value="1">未付款</option>
							<option value="2">待出货</option>
							<option value="3">待确认收货</option>
							<option value="4">交易完成</option>
							<option value="5">取消交易</option>
							<option value="6">交易关闭</option>
							<option value="7">货道故障</option>
							<option value="8">出货超时</option>
						</select>
					</td>
				</tr>
			</table>
		</form>
	</div>
			

	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span style=" margin-right:10px; ">
			<a href="javascript:;" onclick="order_Export()" class="btn btn-success radius">导出订单信息</a>
		</span>
	</div>
	<table id="admin_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="12">订单列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>订单编号</th>
				<th>渠道订单编号</th>
				<th>下单人</th>
				<th>商品</th>
				<th>数量</th>
				<th>支付方式</th>
				<th>订单状态</th>
				<th>订单创建时间</th>
				<th>支付时间</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
			<!-- 显示分页信息 -->
		<div class="row" style="width:80%;">
			<!--分页文字信息  -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/page/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/login/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->



<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${APP_PATH }/static/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/laypage/1.2/laypage.js"></script>
<!-- 删除时确认窗口 -->

<!-- 分页相关 -->
<script src="${APP_PATH }/static/HDpaging/jquery-1.11.1.min.js"></script>
<script src="${APP_PATH }/static/HDpaging/paging.js"></script>


<script type="text/javascript">
	var totalRecord,currentPage;
	$(function(){
	  	//去首页
		to_page(1);
	  	//加载区域
		$("#province").change(function(){
			var t = $(this).val();
			$.grep(cities,function(value){
				if(value.parent==t){
					var list = value.list;
					var html = "";
					var str = "";
					html += "<option value=''>请选择</option>";
					for(var i = 0; i<list.length ; i++){
						str ="<option value='"+list[i].id+"'>"+list[i].name+"</option>";
						html += str;
					}
					$("#city").html(html);
				}
			});
		});
	  	//加载街道
		$("#city").change(function(){
			var t = $(this).val();
			$.grep(counties,function(value){
				if(value.parent==t){
					var list = value.list;
					var html = "";
					var str = "";
					for(var i = 0; i<list.length ; i++){
						str ="<option value='"+list[i].id+"'>"+list[i].name+"</option>";
						html += str;
					}
					$("#area").html(html);
				}
			});
		});
	  	
	  	
	  	//加载渠道
		 $.ajax({
				url:"${APP_PATH}/getAllChannel",
				type:"GET",
				success:function(result){
					var payment = result.extend.list;
		        	var htmlStr = '<option value="">----请选择----</option>';
		        	
		        	$.each(payment,function(index,item){
		        		htmlStr += '<option style="text-align:center;" value="'+item.channelId+'">'+item.channelName+'</option>';
		        	});
		        	$("#orderChannel").html(htmlStr);
				}
			});
	  	
	  	
	  	//加载点位名称
		 $.ajax({
				url:"${APP_PATH}/getPointForSelect",
				type:"GET",
				success:function(result){
					var payment = result.extend.list;
		        	var htmlStr = '<option value="">---请选择---</option>';
		        	
		        	$.each(payment,function(index,item){
		        		htmlStr += '<option style="text-align:center;" value="'+item.pointId+'">'+item.pointName+'</option>';
		        	});
		        	$("#orderPointName").html(htmlStr);
				}
			});
	  	
	  	//加载设备名称
		 $.ajax({
				url:"${APP_PATH}/getEquipmentName",
				type:"GET",
				success:function(result){
					var payment = result.extend.list;
		        	var htmlStr = '<option value="">---请选择---</option>';
		        	
		        	$.each(payment,function(index,item){
		        		htmlStr += '<option style="text-align:center;" value="'+item.equipmentId+'">'+item.equipmentName+'</option>';
		        	});
		        	$("#orderEquipmentName").html(htmlStr);
				}
			});
	  	
	  	//根据设备Id查找对应的货道编号
		 $("#orderEquipmentName").change(function(){
			 //getAlsieByEquipmentId
			 var equipmentId = $(this).val();
			 $("#orderAisleNum").find("option").remove();
			 $.ajax({
					url:"${APP_PATH}/getAlsieByEquipmentId",
					data:{"equipmentId":equipmentId},
					type:"GET",
					success:function(result){
						var payment = result.extend.pageInfo;
			        	var htmlStr = '';
			        	
			        	$.each(payment,function(index,item){
			        		htmlStr += '<option style="text-align:center;" value="'+item.aisleId+'">'+item.aisleNumber+'</option>';
			        	});
			        	$("#orderAisleNum").html(htmlStr);
					}
				});
			 
		 })
	  	//加载商户名称
		 $.ajax({
				url:"${APP_PATH}/getCommercialTenantName",
				type:"GET",
				success:function(result){
					var payment = result.extend.pageInfo;
		        	var htmlStr = '<option value="">----请选择----</option>';
		        	
		        	$.each(payment,function(index,item){
		        		htmlStr += '<option style="text-align:center;" value="'+item.commercialTenantId+'">'+item.commercialTenantName+'</option>';
		        	});
		        	$("#orderCommerName").html(htmlStr);
				}
			});
	  	
	  	//根据商户Id查找对应的商品名称
		 $("#orderCommerName").change(function(){
			 //getAlsieByEquipmentId
			 var commerId = $(this).val();
			 $("#orderMerchandiseName").find("option").remove();
			 $.ajax({
					url:"${APP_PATH}/getMerchandiseByCommercialId",
					data:{"commercialTenantId":commerId},
					type:"GET",
					success:function(result){
						var payment = result.extend.list;
			        	var htmlStr = '';
			        	
			        	$.each(payment,function(index,item){
			        		htmlStr += '<option style="text-align:center;" value="'+item.merchandiseId+'">'+item.merchandiseName+'</option>';
			        	});
			        	$("#orderMerchandiseName").html(htmlStr);
					}
				});
			 
		 })
	  	
	  	
	  	
	  	
});
	
	/**
	* 首页
	*/
	function to_page(pn){
	/* 	var orderNumber = $("#orderNumber").val();
		var orderPaymentId = $("#orderPaymentId").val();
		var orderStatus = $("#orderStatus").val();
		var createStartTime = $("#createStartTime").val();
		var createEndTime = $("#createEndTime").val();
		var updateStartTime = $("#updateStartTime").val();
		var updateEndTime = $("#updateEndTime").val(); */
		
		var area = $("#area").val();
		var province = $("#province").val();
		var city = $("#city").val();
		var orderChannel = $("#orderChannel").val();
		var orderPointName = $("#orderPointName").val();
		var orderStatus = $("#orderStatus").val();
		var orderEquipmentName = $("#orderEquipmentName").val();
		var orderAisleNum = $("#orderAisleNum").val();
		var orderMerchandiseName = $("#orderMerchandiseName").val();
		
		$.ajax({
			url:"${APP_PATH}/getOrderAll",
			data:{"pn":pn,
				"area":area,
				"province":province,
				"city":city,
				"orderChannel":orderChannel,
				"orderPointName":orderPointName,
				"orderStatus":orderStatus,
				"orderEquipmentName":orderEquipmentName,
				"orderAisleNum":orderAisleNum,
				"orderMerchandiseName":orderMerchandiseName
				},
			type:"GET",
			success:function(result){
				//1、解析并显示角色数据
				build_roles_table(result);
				//2、解析并显示分页信息
				build_page_info(result);
				//3、解析显示分页条数据
				build_page_nav(result);
			}
		});
	}
	
	//显示数据
	function build_roles_table(result){
		//清空table表格
		$("#admin_table tbody").empty();
		var order = result.extend.pageInfo.list;
		$.each(order,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' value='"+item.orderId+"' name='orderName' class='check_item'/></td>").css("padding-left","14px");
				var orderId = $("<td style='display: none;'></td>").append(item.orderId);
				var orderNumber = $("<td></td>").append(item.orderNumber).css("text-align","center");
				var orderChannelNumber = $("<td></td>").append(item.orderChannelNumber).css("text-align","center");
				var orderUserName = $("<td></td>").append(item.orderUserName).css("text-align","center");
				var orderMerchandise = $("<td></td>");
				if(item.merchandise != null){
					orderMerchandise.append(item.merchandise.merchandiseName).css("text-align","center");
				}else{
					orderMerchandise.append("-").css("text-align","center");
				}
				var orderMerchandiseAmount = $("<td></td>").append(item.orderMerchandiseAmount).css("text-align","center");
				var orderPayment = $("<td></td>");
				if(item.payment != null){
					orderPayment.append(item.payment.paymentName).css("text-align","center");
				}else{
					orderPayment.append("-").css("text-align","center");
				}
				var orderStatus = item.orderStatus;
				if (orderStatus == 1) {
					orderStatus = $("<td></td>").append("未付款").css("text-align","center");
				}else if(orderStatus == 2){
					orderStatus = $("<td></td>").append("待出货").css("text-align","center");
				}else if(orderStatus == 3){
					orderStatus = $("<td></td>").append("待确认收货").css("text-align","center");
				}else if(orderStatus == 4){
					orderStatus = $("<td></td>").append("交易完成").css("text-align","center");
				}else if(orderStatus == 5){
					orderStatus = $("<td></td>").append("取消交易").css("text-align","center");
				}else if(orderStatus == 6){
					orderStatus = $("<td></td>").append("交易关闭").css("text-align","center");
				}else if(orderStatus == 7){
					orderStatus = $("<td></td>").append("货道故障").css("text-align","center");
				}else if(orderStatus == 8){
					orderStatus = $("<td></td>").append("出货超时").css("text-align","center");
				}
				
				
				var orderCreateTime = $("<td></td>").append(item.orderCreateTime).css("text-align","center");
				var orderPaymentTime = $("<td></td>").append(item.orderPaymentTime).css("text-align","center");
				
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd)
					.append(orderId)
					.append(orderNumber)
					.append(orderChannelNumber)
					.append(orderUserName)
					.append(orderMerchandise)
					.append(orderMerchandiseAmount)
					.append(orderPayment)
					.append(orderStatus)
					.append(orderCreateTime)
					.append(orderPaymentTime)
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
	
	/* $("#search").click(function(){
		to_page(1);
	}) */
	
	$("#province").change(function(){
		to_page(1);
	})
	$("#city").change(function(){
		to_page(1);
	})
	$("#area").change(function(){
		to_page(1);
	})
	$("#orderChannel").change(function(){
		to_page(1);
	})
	$("#orderPointName").change(function(){
		to_page(1);
	})
	$("#orderStatus").change(function(){
		to_page(1);
	})
	$("#orderEquipmentName").change(function(){
		to_page(1);
	})
	$("#orderAisleNum").change(function(){
		to_page(1);
	})
	$("#orderMerchandiseName").change(function(){
		to_page(1);
	})
	
	
	
	//订单信息导出、
	
	function order_Export(){
			
			
			var serializeUrl = $("#order_form").serialize();
           
			var url="${APP_PATH}/ExportOrderMessage?"+serializeUrl+"";
			
			window.open(url);
			//alert(serializeUrl);
		}

	
	
	
</script>
</body>
</html>