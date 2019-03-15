<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>路巡工作人员图片审核</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!-- 时间选择器 -->
<script type="text/javascript" src="${APP_PATH }/static/datetime/js/laydate.js"></script>

<style type="text/css">
	table tr td,th{text-align: center;}
	.col-sm-2{width: 150px;}
	.col-sm-10{width:400px;}
</style>
</head>
<body>
	<!-- 用户信息审核的模态框 -->
	<div class="modal fade" id="adminPhotoAuditUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">路巡工作人员图片审核</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	         <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">申请审核id</label>
			    <div class="col-sm-10">
			      <input type="text" name="auditPicturesId" class="form-control" id="adminPhotoAuditId_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">申请审核路巡姓名</label>
			    <div class="col-sm-10">
			      <input type="text" name="adminRealname" readonly="readonly" class="form-control" id="adminRealname_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">申请审核图片</label>
			    <div class="col-sm-10">
			      <img alt="审核图片" class="img-rounded" width="80%" height="80%" src="" name="auditPicturesPictures" id="adminPhotoAuditImg">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">申请审核车牌</label>
			    <div class="col-sm-10">
			      <input type="text" name="auditPicturesLicensePlate" readonly="readonly" class="form-control" id="auditPicturesLicensePlate">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">申请审核路段</label>
			    <div class="col-sm-10">
			      <input type="text" name="auditPicturesRouteName" readonly="readonly" class="form-control" id="adminPhotoAuditUploadRoute">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">申请审核状态</label>
			    <div class="col-sm-10">
			      <input type="text" name="auditPicturesStatus" readonly="readonly" class="form-control" id="adminPhotoAuditStatus">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">审核结果</label>
			    <div class="col-sm-10">
			      <input type="radio" name="adminPhotoAuditResult" id="adminPhotoAuditResult1_update_radio" value="1">通过
			      <input type="radio" name="adminPhotoAuditResult" id="adminPhotoAuditResult2_update_radio" value="2">退回
			      <span class="help-block"></span>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="adminPhotoAudit_update_btn">审核</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 时间选择器 -->
	<script type="text/javascript" src="${APP_PATH }/static/datetime/js/jquery.min.js"></script>
	<script type="text/javascript" src="${APP_PATH }/static/datetime/js/moment.js"></script>
	<script type="text/javascript" src="${APP_PATH }/static/datetime/js/daterangepicker.js"></script>
	
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>路巡工作人员图片审核</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
					 <div class="col-md-8">
				<select id="select" class="col-md-2" style="width:120px;height:30px; border-radius:5px;">
					<option value="1">按用户</option>
					<option value="2">按时间</option>
					<!-- <option value="3">审核状态</option> -->
				</select>
				
				<div class="" style="width:550px; display:none;width:600px;" id="date_Div">
						<div class="input-group"style="float:left;">
							<div class="demo2">
								<input placeholder="请输入日期" id="startTime" style="width:180px;height:30px; border-radius:3px;margin-left:20px;" class="laydate-icon" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
								<input placeholder="请输入日期" id="endTime" style="width:180px;height:30px; border-radius:3px;margin-left:20px;" class="laydate-icon" onClick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
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
				<div id="audit_input" style="display:none;">
					 <div class="col-md-4">
						<select id="auditselect" class="col-md-2" style="width:100px;height:30px; border-radius:5px;">
							<option value="1">已审核</option>
							<option value="2">未审核</option>
							<option value="3">未通过</option>
						</select>
					</div>
				</div>
				
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="adminPhotoAudit_table">
					<thead>
						<tr>
							<th style="display: none;">主键</th>
							<th>路巡姓名</th>
							<th>上传图片</th>
							<th>上传时间</th>
							<th>路段名称</th>
							<th>车位号码</th>
							<th>车牌号码</th>
							<!-- <th>审核状态</th> -->
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
			$("#inquire").click(function(){
				to_page(1);
			});
			$("#timeInquire").click(function(){
				to_pageByTime(1);
			});
			$("#auditselect").change(function(){
				to_pageByStatus(1);
			});
			
		function to_page(pn){
			
			var c = $("#content").val();
			$.ajax({
				url:"${APP_PATH}/getAdminPhotoAuditAll",
				data:{"pn":pn,"realname":c},
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
		function to_pageByStatus(pn){
			var status = $("#auditselect").val();
			$.ajax({
				url:"${APP_PATH}/getAdminPhotoAuditByStatus",
				data:{"pn":pn,"status":status},
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
			var s = $("#startTime").val();
			var e = $("#endTime").val();
			$.ajax({
				url:"${APP_PATH}/getAdminPhotoAuditByTime",
				data:{"pn":pn,"startTime":s,"endTime":e},
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
			$("#adminPhotoAudit_table tbody").empty();
			var adminPhotoAudit = result.extend.pageInfo.list;
			$.each(adminPhotoAudit,function(index,item){
				var auditPicturesId = $("<td style='display: none;'></td>").append(item.auditPicturesId);
				var adminRealname = $("<td></td>").append(item.adminPictures.adminRealname);
				var auditPicturesPictures = $("<td></td>").append("<img width='100px;' src='"+item.auditPicturesPictures+"' class='img-rounded'/>");
				var auditPicturesTime = $("<td></td>").append(timestampToTime(item.auditPicturesTime));
				var auditPicturesLicensePlate = $("<td></td>").append(item.auditPicturesLicensePlate);
				var auditPicturesRouteName = $("<td></td>").append(item.auditPicturesRouteName);
				var auditPicturesTruckSpaceName = $("<td></td>").append(item.auditPicturesTruckSpaceName);
				var auditPicturesStatus;
				if(item.auditPicturesStatus == 0){
					auditPicturesStatus = $("<td></td>").append("待审核");
				}
				if(item.auditPicturesStatus == 1){
					auditPicturesStatus = $("<td></td>").append("已审核");
				}
				if(item.auditPicturesStatus == 2){
					auditPicturesStatus = $("<td></td>").append("未通过");
				}
				$("<tr></tr>").append(auditPicturesId)
					.append(adminRealname)
					.append(auditPicturesPictures)
					.append(auditPicturesTime)
					.append(auditPicturesRouteName)
					.append(auditPicturesTruckSpaceName)
					.append(auditPicturesLicensePlate)
					//.append(auditPicturesStatus)
					.appendTo("#adminPhotoAudit_table tbody");
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
			reset_form("#adminPhotoAuditUpdateModal form");
			//2、查出数据库表信息，显示数据库表信息
			getAdminPhotoAudit($(this).attr("edit-id"));
			//3、把角色的id传递给模态框的更新按钮
			$("#adminPhotoAudit_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#adminPhotoAuditUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		//查询的方式
		$("#select").change(function(){
			  var a = $("#select").val();				
			 if(a == 1){
				$("#date_Div").css('display','none');
				$("#name_input").css('display','block');
				$("#audit_input").css('display','none');
				
			}
			else if(a == 2){
				$("#date_Div").css('display','block');
				$("#name_input").css('display','none');
				$("#audit_input").css('display','none');
			}
			else if(a == 3){
				$("#date_Div").css('display','none');
				$("#name_input").css('display','none');
				$("#audit_input").css('display','block');
			}else{
				alert("error");
			}
		});
		
		
		
		
		
		
		
		
		
		//日期时间处理
		function conver(s) {
			return s < 10 ? '0' + s : s;
		}
		function getAdminPhotoAudit(auditId){
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
				url:"${APP_PATH}/getAdminPhotoAuditById/"+auditId,
				type:"GET",
				success:function(result){
					var adminPhotoAudit = result.extend.adminPhotoAudit;
					$.each(adminPhotoAudit,function(index,t){
						$("#adminPhotoAuditId_update_input").val(t.auditPicturesId);
						$("#adminRealname_update_input").val(t.adminPictures.adminRealname);
						$("#adminPhotoAuditImg").attr('src',t.auditPicturesPictures); 
						$("#auditPicturesLicensePlate").val(t.auditPicturesLicensePlate);
						$("#adminPhotoAuditUploadRoute").val(t.auditPicturesRouteName);
						if(t.auditPicturesStatus == "0"){
							$("#adminPhotoAuditStatus").val("待审核");
							$("#adminPhotoAuditResult1_update_radio").attr('checked',true);
							
						}else if(t.auditPicturesStatus == "1"){
							$("#adminPhotoAuditStatus").val("已审核");
						}else{
							
						}
					})
				}
			});
		}
		//点击更新，更新角色信息
		$("#adminPhotoAudit_update_btn").click(function(){
			//2、发送ajax请求保存更新的角色数据
			$.ajax({
				url:"${APP_PATH}/updateAdminPhotoAudit",
				data:{
						"adminPhotoAuditId":$("#adminPhotoAuditId_update_input").val(),
						"adminPhotoAuditResult":$("input[name='adminPhotoAuditResult']:checked").val(),
					},
				type:"GET",
				success:function(result){
					bootbox.dialog({
						message: "<span class='bigger-110'>"+result.msg+"!</span>",
						buttons: 			
						{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
					//1、关闭对话框
					$("#adminPhotoAuditUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});
		
		
		
		
		
		
		
		//绑定时间选择器的皮肤
		!function(){
				laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
				laydate({elem: '#demo'});//绑定元素
		}();
		
	</script>
</body>
</html>