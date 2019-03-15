<%@ page language="java" contentType="text/html; charset=UTF-8"
	   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>  
	  <title>视频直播</title>  
	  <meta charset="utf-8">  
	  <script type="text/javascript" src="${APP_PATH }/static/camera/js/1.8.3/jquery.min.js"></script>
	  <script src="${APP_PATH}/static/camera/js/5.20.1/video.js"></script>
	  
	  
	  <link href="${APP_PATH}/static/camera/js/5.20.1/video-js.css" rel="stylesheet">  
	  <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min2.css" rel="stylesheet">  
	  <!-- If you'd like to support IE8 -->  
	  <link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	  <script src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
	  <script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	  <script src="${APP_PATH}/static/camera/js/5.20.1/videojs-ie8.min.js"></script>
	 <%--  <script src="${APP_PATH}/static/camera/js/jquery-1.11.1.min.js"></script> --%>
	  <%-- <script src="${APP_PATH}/static/camera/js/unslider.min.js"></script> --%>
	  
	 
	  
	  
<style>
body {
	background-color: #191919
}
.video {
	width: 740px;
	height: 400px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
}
</style>
</head>  
<style>
	.aa{
		width:600px;
		height:400px;
		object-fit:fill;
	}
</style>
<body>
<!-- 抓拍的模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					抓拍
				</h4>
			</div>
			<div class="modal-body">
					<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;车牌：</label>
					<input type="text" class="jeinput" style="width:120px;height: 30px;" id="license_plate">
			</div>
			<div class="modal-body">
					<label>&nbsp; &nbsp; &nbsp; &nbsp; 车位号：</label>
					<input type="text" class="jeinput" style="width:120px;height: 30px;" id="truck_space">
			</div>
			<div class="modal-body">
					<label>泊入、泊出：</label>
					<select id="type" style="width: 120px;height: 30px;">
						<option value="0">泊入</option>
						<option value="1">泊出</option>
					</select>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">关闭
				</button>
				<button type="button" id="manualEnterOrAppear" class="btn btn-primary">
					提交
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>
	<div class="video" id = "video">

	</div>
	<div style="margin-left: 950px;">
		<button type="button" style="width: 35px;height: 25px;" id="snapshotsBtn">抓拍</button>
		<input type="hidden" name="camera_ip" id="camera_ip" value = "">
	</div>
	<div style="margin-left: 1000px;margin-top: -25px;" id="pauseDiv">
		<button type="button" style="width: 70px;height: 25px;" id="pauseBtn">暂停轮播</button>
	</div>
	<div style="margin-left: 1000px;;margin-top: -25px;display: none;" id="startDiv">
		<button type="button" style="width: 70px;height: 25px;" id="startBtn">开始轮播</button>
	</div>
	<script src="static/js/bootbox.js"></script>
	<script type="text/javascript" src="${APP_PATH }/static/datetime/js/test/demo.js"></script>	
	<script type="text/javascript">
		var i = 1;
		var size = 0;
		function findCamearAll(){
			$.ajax({
				url:"${APP_PATH}/findCamearAll",
				data:{},
				type:"POST",
				async:false,
				success:function(result){
					if(result.code == 100){
						var cameraList = result.object;
						var videoHtml = "";
						$.each(cameraList,function(index,item){
							if(item.cameraRTMP != null){
								if(size == 0){
									videoHtml	+= '<div style="display: block;" id = "videoDiv'+size+'">';
									videoHtml	+= '<video id="my-video'+size+'" class="video-js vjs-big-play-centered" controls preload="auto" data-setup="{}" loop="loop"autoplay="autoplay" width="740px" height="400px">'; 
									videoHtml	+= '<source src="'+item.cameraRTMP+'" type="rtmp/flv">';
									videoHtml	+= '</video>';
									videoHtml	+= '</div>';
									$("#camera_ip").val(item.cameraIp);
								}else{
									videoHtml	+= '<div style="display: none;" id = "videoDiv'+size+'">';
									videoHtml	+= '<video id="my-video'+size+'" class="video-js vjs-big-play-centered" controls preload="auto" data-setup="{}" loop="loop"autoplay="autoplay" width="740px" height="400px">'; 
									videoHtml	+= '<source src="'+item.cameraRTMP+'" type="rtmp/flv">';
									videoHtml	+= '</video>';
									videoHtml	+= '</div>';
								}
								size++;
							}
						})
						$("#video").html(videoHtml);
					}
				}
			})
		}
		findCamearAll();
		function switchVideo(){
			if(flag){
				if(i > size){
					location.reload();
				}
				for (var j = 0; j < size; j++) {
					$("#videoDiv"+j).css("display","none");
				}
				$("#videoDiv"+i%size).css("display","block");
				$("#camera_ip").val($("#videoDiv"+i).data("ip"));
				i ++;
			}
		}
		setInterval(switchVideo,30000);
		
		$(document).on("click",".edit_btn",function(){
			$("#userUpdateModal").modal({
				backdrop:"static"
			});
		});
		//抓拍
		$("#snapshotsBtn").click(function(){
			var truck_space = $("#truck_space").val('');
			var license_plate = $("#license_plate").val('');
			$('#myModal').modal('show');
		})
		
		//暂停开始轮播
		var flag = true;
		$("#pauseBtn").click(function(){
			$("#pauseDiv").css("display","none");
			$("#startDiv").css("display","block");
			flag = false;
		})
		$("#startBtn").click(function(){
			$("#pauseDiv").css("display","block");
			$("#startDiv").css("display","none");
			flag = true;
		})
		
		$("#manualEnterOrAppear").click(function(){
			var camera_ip = $("#camera_ip").val();
			var truck_space = $("#truck_space").val();
			var license_plate = $("#license_plate").val();
			var type = $("#type").val();
			$.ajax({
				url:"${APP_PATH}/manualEnterOrAppear",
				data:{
					"camera_ip":camera_ip,
					"truck_space":truck_space,
					"license_plate":license_plate,
					"type":type},
				type:"POST",
				success:function(result){
					if(result.code == 100){
						alert(result.msg)
						$('#myModal').modal('hide');
					}
				}
			})
		})
		
		function snap(){
			/* var camera_ip = $("#camera_ip").val();
			$.ajax({
				url:"http://39.108.239.193:8081/sendSocket",
				data:{"ip":camera_ip},
				type:"POST",
				success:function(result){
					if(result.code == 100){
						alert(result.msg)
					}
				}
			}) */
		}
	</script>
	<%-- <script type="text/javascript" src="${APP_PATH }/static/camera/js/1.8.3/jquery.min.js"></script>
	<script src="${APP_PATH}/static/camera/js/5.20.1/video.js"></script> --%>
	</body>
</html>