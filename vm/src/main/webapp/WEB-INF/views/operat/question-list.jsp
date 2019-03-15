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

<title>管理员列表</title>
</head>
<style>

</style>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 运营管理 <span class="c-gray en">&gt;</span> 铺货计划 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
		<a href="javascript:;" onclick="admin_add('添加问题','/web/QuestionAdd','500','400')" class="btn btn-primary radius">
			<i class="Hui-iconfont">&#xe600;</i> 添加问题
		</a></span>
	</div>
	<table id="admin_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">问题列表</th>
			</tr>
			<tr class="text-c">
				<th style="display: none;width: 100px;">主键</th>
				<th style="width: 400px;">问题描述</th>
				<th>运营人员</th>
				<th>所属点位</th>
				<th>维护状态</th>
				<th>图片详情</th>
				<th>问题状态</th>
				<th>操作</th>
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

<!-- 分页相关 -->
<script src="${APP_PATH }/static/HDpaging/jquery-1.11.1.min.js"></script>
<script src="${APP_PATH }/static/HDpaging/paging.js"></script>


<script type="text/javascript">

	$(function(){
	  	//去首页
		to_page(1);
	});
	/**
	* 首页
	*/
	function to_page(pn){
		
		$.ajax({
			url:"${APP_PATH}/getProblem",
			data:{"pn":pn},
			type:"GET",
			success:function(result){
				//1、解析并显示角色数据
				build_roles_table(result);
				build_page_info(result);
				build_page_nav(result);
			}
		});
	}
	
	//时间格式转换
	function timestampToDateTime(timestamp) {
	        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
	        Y = date.getFullYear() + '-';
	        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
	        D = (date.getDate()< 10 ? '0'+ date.getDate(): date.getDate()) + ' ';
	        h = (date.getHours()< 10 ? '0'+ date.getHours(): date.getHours()) + ':';
	        m = (date.getMinutes()< 10 ? '0'+ date.getMinutes(): date.getMinutes()) + ':';
	        s = (date.getSeconds()< 10 ? '0'+ date.getSeconds(): date.getSeconds());
	        return Y+M+D+h+m+s;
	    }
	
	/*
	显示数据
	*/
	function build_roles_table(result){
		//清空table表格
		var a =$("#admin_table tbody").empty();
		var pglist = result.extend.pageInfo.list;
		$.each(pglist,function(index,item){
			var admin = item.admin;
			var point = item.point;
				var feedbackId = $("<td style='display: none;'></td>").append(item.feedbackId);
				var problem = $("<td></td>").append(item.feedbackProblemDescription).css("text-align","center");
				
				if (admin == null) {
					admin = $("<td></td>").append("-").css("text-align","center");
				}else{
					admin = $("<td></td>").append(admin.adminRealname).css("text-align","center");
				}
				if (point == null) {
					point = $("<td></td>").append("-").css("text-align","center");
				}else{
					point = $("<td></td>").append(point.pointName).css("text-align","center");
				}
				//维护状态（1：待处理 2：处理中 3：已完成 4：已验证 5：堵塞）
				var status = item.feedbackMaintenanceState;
				if (status == 1) {
					status = $("<td></td>").append("待处理").css("text-align","center");
				}else if(status == 2){
					status = $("<td></td>").append("处理中").css("text-align","center");
				}else if(status == 3){
					status = $("<td></td>").append("已完成").css("text-align","center");
				}else if(status == 4){
					status = $("<td></td>").append("已验证").css("text-align","center");
				}else if(status == 5){
					status = $("<td></td>").append("堵塞").css("text-align","center");
				}else{
					status = $("<td></td>").append("未知").css("text-align","center");
				}
				var feedbackImage = $("<td></td>").append("<img src='"+item.feedbackImage+"' width='100px'/>").css("text-align","center");
				var feedbackRead = item.feedbackRead;
				if (feedbackRead == 0) {
					feedbackRead = $("<td></td>").append("未读").css("text-align","center");
				}else{
					feedbackRead = $("<td></td>").append("已读").css("text-align","center");
				}
				
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon")).append("删除");
				delBtn.attr("del-id",item.feedbackId);
				var btnTd = $("<td></td>").append(delBtn).append(" ").css("width","50px");
				
				$("<tr></tr>").append(feedbackId)
					.append(problem)
					.append(admin)
					.append(point)
					.append(status)
					.append(feedbackImage)
					.append(feedbackRead)
					.append(btnTd)
					.appendTo("#admin_table tbody");
			
		});
	}
	
	

/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-删除*/
$(document).on("click",".delete_btn",function(){
	var id = $(this).attr("del-id");
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '${APP_PATH}/deleteProblem',
			data:{"feedbackId":id},
			success: function(data){
				if(data.code==100){
					layer.msg('已删除!',{icon:6,time:1000},function(){
						to_page(1);
					});
				}else{
					layer.msg('删除失败！',{icon:5,time:1000});
				}
			},
		});		
	});
});

/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
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



</script>
</body>
</html>