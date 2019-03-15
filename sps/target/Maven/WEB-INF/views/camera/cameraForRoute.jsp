<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分组列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="${APP_PATH}/static/camera/css/video-js.css" rel="stylesheet">
<title>Insert title here</title>
<style>
body {
	background-color: #191919
}
.m {
	width: 740px;
	height: 400px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
}
</style>
</head>
<body>
	 <div class="m">
		<video id="my-video" class="video-js" controls="true" preload="auto" autoplay width="740" height="400" poster="m.png" data-setup="{}"> 
			<source src="rtmp://live.hkstv.hk.lxdns.com/live/hks" type="rtmp/flv">
		</video>
		<canvas style="display:none;"></canvas>
		<button class="screen">截图</button>
	</div>
	
	<script src="js/video.min.js"></script>
		<script src="http://vjs.zencdn.net/5.19/lang/zh-CN.js"></script>
		<script type="text/javascript">
			var myPlayer = videojs('my-video');
			videojs("my-video").ready(function() {
				var myPlayer = this;
				myPlayer.play();
			});
			
			
			
			 window.onload = function () {
		            var button = document.querySelectorAll('.screen')[0];
		            var video = document.querySelectorAll('video')[0];
		            var canvas = document.querySelectorAll('canvas')[0];
		            var ctx = canvas.getContext('2d');
		            var width = 480;
		            var height = 270;
		 
		            canvas.width = width;
		            canvas.height = height;
		            video.src = 'movie.mp4?t=' + new Date().getTime();
		            video.width = width;
		            video.height = height;
		            video.autoplay = true;
		            video.loop = true;
		            button.onclick = function () {
		                ctx.drawImage(video, 0, 0, width, height);  // 将video中的数据绘制到canvas里
		                saveImage(canvas, 'screen_' + new Date().getTime() + '.png');  // 存储图片到本地
		            };
		        };
		        function saveImage (canvas, filename) {
		            var image = canvas.toDataURL('image/png').replace('image/png', 'image/octet-stream');
		            saveFile(image, filename || 'file_' + new Date().getTime() + '.png');
		        }
		        function saveFile(data, filename) {
		            save_link.href = data;
		            save_link.download = filename;
		 
		            var event = document.createEvent('MouseEvents');
		            event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
		            save_link.dispatchEvent(event);
		        }
	</script>
</body>
</html>