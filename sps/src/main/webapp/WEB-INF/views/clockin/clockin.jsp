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
	<!-- 打卡设置的模态框 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					打卡设置
				</h4>
			</div>
			 <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">打卡id</label>
			    <div class="col-sm-10">
			      <input type="text" name="clockinTimeId" class="form-control" value="" id="clockTime_id">
			      <span class="help-block"></span>
			    </div>
			  </div>
			<div class="modal-body">
					<label>上班时间：</label>
					<input type="text" class="jeinput" style="width:100px;" id="officeTime" value="">
			</div>
			<div class="modal-body">
					<label>下班时间：</label>
					<input type="text" class="jeinput" style="width:100px;" id="closingTime" value="">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">关闭
				</button>
				<button type="button" id="toTime" class="btn btn-primary">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>打卡列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<br>
			 <div class="col-md-8">
				<select id="select" class="form-control" style="height:32px; width:130px;float:left;">
					<option value="1">按用户</option>
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
				
			</div>
			<div class="col-md-4">
				<button class="btn btn-primary" id="clockSetUp" style="margin-left:100px;" data-toggle="modal" data-target="#myModal">打卡设置</button>
				<button class="btn btn-primary" id="importExcel" onclick="download()">导出</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="user_table">
					<thead>
						<tr>
							<!-- <th>
								<input type="checkbox" id="check_all"/>
							</th> -->
							<th style="display: none;">主键</th>
							<th>打卡人员</th>
							<th>打卡时间</th>
							<th>打卡类型</th>
							<th>打卡状态</th>
							<th>打卡地点</th>
							
							<!-- <th>操作</th> -->
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
	<script type="text/javascript" src="${APP_PATH }/static/datetime/js/test/clockTime.js"></script>
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
				goto_page(1);
			});
		});

		$("#select").change(function(){
			  var a = $("#select").val();				
			 if(a == 1){
				$("#date_Div").css('display','none');
				$("#name_input").css('display','block');
				
			}
			else if(a == 2){
				$("#date_Div").css('display','block');
				$("#name_input").css('display','none');
			}
			else{
				alert("error");
			} 
		});
		
		function CheckDateTime(str){
			var reg = /^(\d+)-(\d{1,2})-(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
			var r = str.match(reg);
			if(r==null)return false;
			r[2]=r[2]-1;
			var d= new Date(r[1], r[2],r[3], r[4],r[5], r[6]);
			if(d.getFullYear()!=r[1])return false;
			if(d.getMonth()!=r[2])return false;
			if(d.getDate()!=r[3])return false;
			if(d.getHours()!=r[4])return false;
			if(d.getMinutes()!=r[5])return false;
			if(d.getSeconds()!=r[6])return false;
			return true;
			}
	
		//通过时间段查询记录
		function goto_page(pn){
			
			var s = $("#startTime").val();
			var e = $("#endTime").val();
			if(CheckDateTime(s) != true || CheckDateTime(e) != true){
				bootbox.dialog({
					message: "<span class='bigger-110'>时间格式不正确！</span>",
					buttons: { "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
			}else if (s > e) {
					bootbox.dialog({
						message: "<span class='bigger-110'>开始时间不能大于结束时间！</span>",
						buttons: { "button":{ "label":"确定", "className":"btn-sm btn-success"}}
					});
				}else{
					$.ajax({
						url:"${APP_PATH}/GetClockInByTime",
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

		function to_page(pn){
			var s = $("#content").val();
			$.ajax({
				url:"${APP_PATH}/getAllClockin",
				data:{"pn":pn,"content":s},
				type:"POST",
				success:function(result){
					build_roles_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
					
					
				}
			});
		}
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
		function timestampToTime(timestamp) {
	        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
	        h = (date.getHours()< 10 ? '0'+ date.getHours(): date.getHours()) + ':';
	        m = (date.getMinutes()< 10 ? '0'+ date.getMinutes(): date.getMinutes()) + ':';
	        s = (date.getSeconds()< 10 ? '0'+ date.getSeconds(): date.getSeconds());
	        
	        
	        return h+m+s;
	    }
		
		function build_roles_table(result){
			//清空table表格
			$("#user_table tbody").empty();
			var user = result.extend.pageInfo.list;
			$.each(user,function(index,item){
				$.each(item.adminClockin,function(index,i){
					$.each(item.adminClockinTime,function(index,t){
						
						var clockinId = $("<td style='display: none;'></td>").append(i.clockinId);
						var clockinStaffname = $("<td></td>").append(item.adminRealname);
						var clockinTime = $("<td></td>").append(timestampToDateTime(i.clockinTime));
						if(i.clockinType == 0){
							if(timestampToTime(i.clockinTime) < (timestampToTime(t.clockinTimeOfficetime))){
								var clockinStatus = $("<td></td>").append("正常");
							}else{
								var clockinStatus = $("<td></td>").append("迟到");
							}
							var clockinType = $("<td></td>").append("上班");
						}
						else{
							if(timestampToTime(i.clockinTime) < (timestampToTime(t.clockinTimeClosingtime))){
								var clockinStatus = $("<td></td>").append("早退");
							}else{
								var clockinStatus = $("<td></td>").append("正常");
							}
							var clockinType = $("<td></td>").append("下班");
						}
						var clockinPlace = $("<td></td>").append(i.clockinPlace);
						
					$("<tr></tr>").append(clockinId)
						.append(clockinStaffname)
						.append(clockinTime)
						.append(clockinType)
						.append(clockinStatus)
						.append(clockinPlace)
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
			var c = $("#content").val();
			var s = $("#startTime").val();
			var e = $("#endTime").val();
			  
        	var url="${APP_PATH}/ExportExcel?content="+c+"&startTime="+s+"&endTime="+e;
        	window.open(url);
   		 } 

		
		
		//打卡时间修改
		
		//获取时间放在文本框
			$("#clockSetUp").click(function(){
				
				$.ajax({
					url:"${APP_PATH}/getClockinTime",
					type:"GET",
					success:function(result){
						
						var user = result.extend.pageInfo.list;
						 $.each(user,function(index,item){
							var clockinId = $("#clockTime_id").val(item.clockinTimeId);
							var officeTime = $("#officeTime").val(timestampToTime(item.clockinTimeOfficetime));
							var closingTime = $("#closingTime").val(timestampToTime(item.clockinTimeClosingtime));
						}) 
					}
				});
			});
		
		
			function isTime(str){
				var a = str.match(/^(0\d{1}|1\d{1}|2[0-3]):[0-5]\d{1}:([0-5]\d{1})$/);
				if (a == null) {
						return false;
					}
				return true;
			}
	
		//点击更新，更新角色信息
		 $("#toTime").click(function(){
			//2、发送ajax请求保存更新的角色数据
			var officeTime = $("#officeTime").val();
			var closingTime = $("#closingTime").val();
			if(isTime(officeTime) != true || isTime(closingTime) != true){
				bootbox.dialog({
					message: "<span class='bigger-110'>时间格式不正确!</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
			}else{
				$.ajax({
					url:"${APP_PATH}/updateClockinTime",
					type:"POST",
					data:{"clockinTimeId":$("#clockTime_id").val(),"clockinTimeOfficetime":officeTime,"clockinTimeClosingtime":closingTime},
					success:function(result){
						bootbox.dialog({
							message: "<span class='bigger-110'>"+result.msg+"!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						//1、关闭对话框
						$("#myModal").modal("hide");
						//2、回到本页面
						to_page(1);
					}
				});
				
			}
		});
		 
		
	</script>
</body>
</html>