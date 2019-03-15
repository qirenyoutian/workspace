<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min2.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<style type="text/css">
	table tr td,th{text-align: center;}
	.col-sm-2{width: 150px;}
	.col-sm-10{width:400px;}
</style>
</head>
<body>
	<!-- 车牌修改的模态框 -->
	<div class="modal fade" id="adminPhotoAuditUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">修改车牌</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
	         <div class="form-group" style="display: none;">
			    <label class="col-sm-2 control-label">停车id</label>
			    <div class="col-sm-10">
			      <input type="text" name="singleCarId" class="form-control" id="singleCarId_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">车牌号</label>
			    <div class="col-sm-10">
			      <input type="text" name="singleCarLicensePlate" readonly="readonly" class="form-control" id="singleCarLicensePlate_update_input">
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
	
	<!-- 搭建显示页面 -->
	<div id="picture">
		<div class="picture_left" style="text-align:center">
			<input type="image" src="" width="95%" height="490px" id = "photograph">
		</div>
		<div class="picture_right">
			<table class="table_pict" id="picture_table">
				<tbody>
				<tr>
					<td>
						<input type="image" src="" width="95%" height="120px" style="padding: 5px 0;" id = "photograph1" onclick="lookPicture('photograph1')">
					</td>
				</tr>
				<tr>
					<td>
						<input type="image" src="" width="95%" height="120px" style="padding: 5px 0;" id = "photograph2" onclick="lookPicture('photograph2')">
					</td>
				</tr>
				<tr>
					<td>
						<input type="image" src="" width="95%" height="90px" style="padding: 5px 0;" id = "licensePlateImage" onclick="lookPicture('licensePlateImage')">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" style="text-align:center;" width="120px" height="60px" id = "truckSpace">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" style="text-align:center;" width="120px" height="60px" id = "licensePlate">
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id = "singleCarDetailsId">
						<button type="button" style="width: 199px;height: 40px;" onclick="updateSingleCarDetailsById()">修改结果</button>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container">
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="adminPhotoAudit_table">
					<thead>
						<tr>
							<th style="display: none;">主键</th>
							<th>序号</th>
							<th>时间</th>
							<th>路段名</th>
							<th>车位名</th>
							<th>泊入/泊出</th>
							<th>车牌</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
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
		setInterval("to_page(1)",10000);
			$("#inquire").click(function(){
				to_page(1);
			});
			$("#timeInquire").click(function(){
				to_page(1);
			});
			
		function to_page(pn){
			
			$.ajax({
				url:"${APP_PATH}/getParkingRecordNewFive",
				data:{"pn":pn,"type":0,"value":null},
				type:"GET",
				success:function(result){
					build_roles_table(result);
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
			var adminPhotoAudit = result.extend.pageInfo;
			var i = 1;
			var  a = 0;
			var singleCarDetailsId0;
			$.each(adminPhotoAudit,function(index,item){
				var singleCarDetails = item.singleCarDetails;
				$.each(singleCarDetails,function(index,scd){
					singleCarDetailsId0 = scd.singleCarDetailsId;
					var singleCarId = $("<td style='display: none;vertical-align: middle !important;text-align: center;'></td>").append(item.singleCarId);
					var singleI = $("<td style='vertical-align: middle !important;text-align: center;'></td>").append(i);
					var singleCarTime = $("<td style='vertical-align: middle !important;text-align: center;'></td>").append(timestampToTime(item.singleCarTime));
					var rr = $("<a></a>").append(scd.singleCarDetailsRouteName).attr('href','javascript:void(0)').attr("onClick","tr_picture("+singleCarId+")").css("color","black").css('text-decoration','none').css("cursor","pointer");
					var singleCarRouteName = $("<td style='vertical-align: middle !important;text-align: center;'></td>").append(rr);
					var singleCarTruckSpace = $("<td style='vertical-align: middle !important;text-align: center;'></td>").append(scd.singleCarDetailsTruckSpace);
					var singleCarDetailsType;
					if(scd.singleCarDetailsType == 0){
						singleCarDetailsType = $("<td style='vertical-align: middle !important;text-align: center;'></td>").append("泊入");
					}else if(scd.singleCarDetailsType == 1){
						singleCarDetailsType = $("<td style='vertical-align: middle !important;text-align: center;'></td>").append("泊出");
					}
					var singleCarLicensePlate = $("<td style='vertical-align: middle !important;text-align: center;'></td>").append(scd.singleCarDetailsLicensePlate);
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
					.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
					var btnTd = $("<td style='vertical-align: middle !important;text-align: center;'></td>").append(editBtn)
					i ++;
					$("<tr onclick='getPicture("+scd.singleCarDetailsId+")'></tr>").append(singleCarId)
							  .append(singleI)
							  .append(singleCarTime)
							  .append(singleCarRouteName)
							  .append(singleCarTruckSpace)
							  .append(singleCarDetailsType)
							  .append(singleCarLicensePlate)
							  .appendTo("#adminPhotoAudit_table tbody");
				$("tr").attr("id",singleCarId);
				});
			});
			if($("#licensePlate").val() == null || $("#licensePlate").val() == ""){
				getPicture(singleCarDetailsId0)
			}
		}
		function getPicture(id){
			$.ajax({
				url:"${APP_PATH}/getPictureBySingleCarDetailsId",
				data:{"id":id},
				type:"GET",
				success:function(result){
					var scd = result.object;
					if(scd.singleCarDetailsPhotograph1 != null){
						$("#photograph").attr("src","http://39.108.239.193:8080"+scd.singleCarDetailsPhotograph1);
					}
					if(scd.singleCarDetailsPhotograph1 != null){
						$("#photograph1").attr("src","http://39.108.239.193:8080"+scd.singleCarDetailsPhotograph1);
					}
					if(scd.singleCarDetailsPhotograph2 != null){
						$("#photograph2").attr("src","http://39.108.239.193:8080"+scd.singleCarDetailsPhotograph2);
					}
					if(scd.singleCarDetailsLicensePlateImage != null){
						$("#licensePlateImage").attr("src","http://39.108.239.193:8080"+scd.singleCarDetailsLicensePlateImage);
					}
					$("#truckSpace").val(scd.singleCarDetailsTruckSpace);
					$("#licensePlate").val(scd.singleCarDetailsLicensePlate);
					$("#singleCarDetailsId").val(scd.singleCarDetailsId);
				}
			});
		}
		function lookPicture(id){
			var url = $("#"+id).attr("src");
			$("#photograph").attr("src",url);
		}
		function updateSingleCarDetailsById(){
			var id = $("#singleCarDetailsId").val();
			var truckSpace = $("#truckSpace").val();
			var licensePlate = $("#licensePlate").val();
			$.ajax({
				url:"${APP_PATH}/updateSingleCarDetailsById",
				data:{"id":id,"truckSpace":truckSpace,"licensePlate":licensePlate},
				type:"GET",
				success:function(result){
					if(result.code == 100){
						bootbox.dialog({
							message: "<span class='bigger-110'>"+result.msg+"!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
							});
						to_page(1);
					}else{
						bootbox.dialog({
							message: "<span class='bigger-110'>"+result.extend.msg+"!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
							});
					}
				}
			});
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
			if(a == 0){
				$("#date_Div").css('display','none');
				$("#name_input").css('display','none');
				to_page(1);
			}else if(a == 1){
				$("#date_Div").css('display','none');
				$("#name_input").css('display','block');
			}
			else if(a == 2){
				$("#date_Div").css('display','block');
				$("#name_input").css('display','none');
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
		
		//显示图片

		function tr_picture(singleCarId){
			alert("123");
		}
		
	</script>
</body>
</html>