<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分组列表</title>
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
		<!-- 车位添加的模态框 -->
	<div class="modal fade" id="adminAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">车位添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">车位名称</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminAccount" class="form-control" id="adminAccount_add_input" placeholder="请输入车位名称">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">所属路段</label>
			    <div class="col-sm-10">
			      <select id="ByTruckSpace"></select>
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
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>车位列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
			<div id="routeInput">
			</div>
			<div class="col-md-4">
				<button class="btn btn-primary" id="admin_add_modal_btn">新增</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="route_table">
					<thead>
						<tr>
							<th style="display: none;">主键</th>
							<th>所属路段</th>
							<th>车位名称</th>
							<th>使用状态</th>
							<th>可用状态</th>
							<th>添加时间</th>
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
			//加载全部路段
			$.ajax({
				url:"${APP_PATH}/getRoute",
				type:"GET",
				success:function(result){
					var sele = $("#ByTruckSpace");
					$.each(result.extend.routeList,function(){
						var optionEle = $("<option></option>").append(this.routeLocationName).attr("value",this.routeId);
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
		function to_page(pn){
			var a = request.getParameter(locationName);
			alert(a);
			$.ajax({
				url:"${APP_PATH}/getSingleCarRoute",
				data:{"pn":pn,"content":request.getParameter(locationName)},
				type:"GET",
				success:function(result){
					//console.log(result);
					//1、解析并显示角色数据
					build_routes_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		//时间格式
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
		function build_routes_table(result){
			//清空table表格
			$("#route_table tbody").empty();
			var route = result.extend.pageInfo.list;
			$.each(route,function(index,item){

				var routeId = $("<td style='display: none;'></td>").append(item.routeId);
				var routeCameraIp = $("<td></td>").append(item.routeCameraIp);
				var routeCount = $("<td></td>").append("");
				var routeTime = $("<td></td>").append(timestampToDateTime(item.routeTime));
				var routeStutas = item.routeDelfalg;
					if (routeStutas == 0) {
						var rr = $("<a></a>").append(item.routeLocationName).attr('href','/jumpAdmin').css('text-decoration','none').css('color','black');
						var routeLocationName = $("<td></td>").append(rr);
						var routeDelfalg = $("<td></td>").append("可用");
						//如果删除可用的情况下删除键出现
						var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
						delBtn.attr("del-id",item.routeId);
						var btnTd = $("<td></td>").append(delBtn).append(" ");
					}else{
						var routeLocationName = $("<td></td>").append(item.routeLocationName);
						var routeDelfalg = $("<td></td>").append("已删除");
					}

				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(routeId)
					.append(routeLocationName)
					.append(routeCameraIp)
					.append(routeCount)
					.append(routeTime)
					.append(routeDelfalg)
					.append(btnTd)
					.appendTo("#route_table tbody");
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
		
		//添加时非空验证
		function SaveJudgmentisnotempty(){
			var adminAccount = $("#adminAccount_add_input").val();
			if(adminAccount == null || adminAccount == ""){
				show_validate_msg("#adminAccount_add_input","error","管理员账号不能为空");
				$("#admin_save_btn").attr("ajax-va","error");
			}else{
				if($("#admin_save_btn").attr("ajax-va")!="error"){
					$("#admin_save_btn").attr("ajax-va","success");
				}
			}
			var adminPassWord = $("#adminPassWord_add_input").val();
			if(adminPassWord == null || adminPassWord == ""){
				show_validate_msg("#adminPassWord_add_input","error","管理员密码不能为空");
				$("#admin_save_btn").attr("ajax-va","error");
			}else{
				if($("#admin_save_btn").attr("ajax-va")!="error"){
					$("#admin_save_btn").attr("ajax-va","success");
				}
			}
			var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			var adminEmail = $("#adminEmail_add_input").val();
			if(adminEmail == null || adminEmail == ""){
				show_validate_msg("#adminEmail_add_input","error","邮箱不能为空");
				$("#admin_save_btn").attr("ajax-va","error");
			}else if(!re.test(adminEmail)){
				show_validate_msg("#adminEmail_add_input","error","邮箱格式不正确");
				$("#admin_save_btn").attr("ajax-va","error");
			}else{
				if($("#admin_save_btn").attr("ajax-va")!="error"){
					$("#admin_save_btn").attr("ajax-va","success");
				}
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
						to_page(totalRecord);
					}else{
						//显示失败信息
						//console.log(result);
						//有哪个字段的错误信息就显示哪个字段的；
						if(undefined != result.extend.errorFields.adminAccount){
							show_validate_msg("#adminAccount_add_input", "error", result.extend.errorFields.adminAccount);
						}
						if(undefined != result.extend.errorFields.adminPassWord){
							show_validate_msg("#adminPassWord_add_input", "error", result.extend.errorFields.adminPassWord);
						}
					}
				}
			});
		});
	</script>
</body>
</html>