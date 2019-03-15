<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>显示屏功能设计</title>
    <link href="${APP_PATH}/static/display/css/reset.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/display/css/svg.css" rel="stylesheet">
    <link href="${APP_PATH}/static/display/css/index.css" rel="stylesheet">
    <link href="${APP_PATH}/static/camera/js/5.20.1/video-js.css" rel="stylesheet">
    <script src="${APP_PATH}/static/camera/js/5.20.1/videojs-ie8.min.js"></script>
    <script src="${APP_PATH}/static/camera/js/5.20.1/video.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Fa2OpOakBtaOQMORjQUo2tMvKptoVDkv"></script>
</head>
<body>
    <div class="container">
        <div class="top">
            <div class="map" id="map"> </div>
            	<div class="sitemakers">
<div class="wrap"><svg class="bulb" version="1.1" x="0px" y="0px" width="88px" height="88px" viewBox="0 0 128 128">
<g id="s-bulb">
	<g>
		<path fill-rule="evenodd" clip-rule="evenodd" d="M104.145,42.922c-0.258-9.541-3.436-19.458-10.576-27.913
			C88.695,9.245,82.706,5.05,75.47,2.746c-3.798-1.209-7.682-1.965-11.683-1.916c-3.553,0.043-7.022,0.693-10.406,1.747
			c-9.279,2.88-16.414,8.597-21.776,16.625C28.182,24.328,26.107,29.98,24.958,36c-0.742,3.904-1.014,7.844-0.657,11.804
			c0.858,9.513,4,18.144,10.17,25.542c2.009,2.413,4.117,4.748,5.545,7.566c1.062,2.094,1.989,4.256,2.942,6.4
			c1.076,2.427,2.774,4.205,5.371,4.859c1.925,0.485,3.702,1.281,5.499,2.063c2.902,1.265,5.809,2.526,8.709,3.795
			c2.195,0.955,4.388,1.918,6.581,2.884c2.589,1.138,5.17,2.287,7.762,3.413c1.31,0.57,2.841,0.235,3.577-0.708
			c1.095-1.397,0.673-3.48-1.087-4.271c-1.669-0.753-3.345-1.488-5.019-2.222c-2.038-0.891-4.08-1.776-6.12-2.666
			c-2.604-1.136-5.216-2.268-7.821-3.411c-2.003-0.878-4-1.771-6.005-2.644c-1.102-0.479-2.207-0.95-3.326-1.39
			c-0.417-0.161-0.891-0.179-1.308-0.344c-0.764-0.298-1.278-0.869-1.553-1.646c-1.768-4.971-4.392-9.464-7.759-13.508
			c-1.509-1.809-3.09-3.554-4.336-5.57c-3.335-5.383-5.46-11.171-6.052-17.516c-0.915-9.789,1.291-18.79,6.863-26.889
			c4.957-7.208,11.708-12.015,20.204-14.157c6.392-1.611,12.689-1.011,18.773,1.573c9.279,3.942,15.587,10.785,19.488,19.984
			c2.296,5.405,3.22,11.05,3.011,16.889c-0.317,8.925-3.272,16.896-8.946,23.792c-2.068,2.513-4.124,5.015-5.803,7.807
			c-1.402,2.332-2.552,4.787-3.472,7.349c-0.474,1.314-1.366,2.028-2.757,2.188c-0.928,0.106-1.761,0.435-2.275,1.309
			c-0.89,1.508-0.273,3.811,1.588,4.196c1.883,0.39,3.575-0.188,5.144-1.113c1.738-1.026,2.893-2.557,3.605-4.471
			c1.734-4.653,4.226-8.836,7.528-12.581c4.964-5.618,8.227-12.141,9.869-19.48C103.665,51.369,104.143,47.883,104.145,42.922z"/>
		<path fill-rule="evenodd" clip-rule="evenodd" d="M77.257,116.188c0.884,0.346,1.702,0.202,2.46-0.188
			c0.947-0.494,1.366-1.401,1.348-2.405c-0.02-1.136-0.615-2.013-1.687-2.491c-1.944-0.869-3.899-1.721-5.848-2.575
			c-1.709-0.747-3.419-1.491-5.13-2.234c-2.676-1.171-5.354-2.338-8.028-3.509c-2.347-1.031-4.684-2.087-7.038-3.102
			c-0.792-0.343-1.614-0.626-2.435-0.891c-0.897-0.287-2.432,0.154-2.961,1.172c-0.715,1.37-0.362,3.355,1.264,4.016
			c2.498,1.021,4.943,2.155,7.415,3.23c2.935,1.281,5.875,2.56,8.81,3.84c2.003,0.878,3.997,1.774,6.002,2.646
			c0.324,0.139,0.452,0.309,0.4,0.68c-0.46,3.388-2.759,5.917-6.027,6.749c-3.471,0.886-7.294-1.126-8.787-4.443
			c-0.481-1.063-0.592-2.182-0.792-3.296c-0.254-1.407-1.227-2.001-2.529-2.222c-0.908-0.151-2.159,0.46-2.663,1.422
			c-0.438,0.83-0.415,1.74-0.272,2.663c0.696,4.489,2.935,7.963,6.953,10.109c3.115,1.666,6.446,2.109,9.915,1.108
			c5.003-1.449,8.154-4.682,9.476-9.707C77.146,116.592,77.19,116.428,77.257,116.188z"/>
	</g>
</g>
<g id="www-filament">
	<path fill-rule="evenodd" clip-rule="evenodd" d="M82.985,29.716c0.897-0.62,1.849-0.822,2.957-0.547
		c1.471,0.363,2.109,1.95,1.953,3.176c-0.134,1.05-0.666,1.823-1.564,2.383c-0.25,0.155-0.498,0.438-0.585,0.712
		c-0.553,1.734-1.059,3.483-1.584,5.222c-1.027,3.403-2.059,6.806-3.089,10.205c-0.604,1.997-1.211,3.989-1.814,5.985
		c-1.007,3.331-2.012,6.67-3.021,10.001c-0.741,2.449-1.484,4.895-2.227,7.345c-1.016,3.353-2.025,6.708-3.051,10.062
		c-0.217,0.716-0.948,1.105-1.604,0.909c-0.719-0.215-1.057-0.821-0.822-1.608c1.04-3.506,2.104-7.005,3.151-10.508
		c0.364-1.205,0.724-2.423,1.126-3.771c-0.78,0.522-1.44,0.955-2.093,1.4c-0.971,0.659-2.496,0.685-3.463-0.059
		c-1.034-0.789-2.072-1.576-3.105-2.36c-1.011,0.771-2.009,1.495-2.968,2.274c-1.044,0.847-2.709,0.815-3.751,0.048
		c-0.78-0.574-1.604-1.091-2.516-1.7c0.321,1.07,0.595,2.012,0.879,2.952c1.155,3.807,2.311,7.614,3.46,11.425
		c0.084,0.283,0.161,0.6,0.131,0.887c-0.055,0.601-0.562,1.034-1.146,1.081c-0.543,0.045-1.157-0.374-1.344-0.949
		c-0.223-0.688-0.418-1.38-0.628-2.069c-1.357-4.498-2.712-8.995-4.074-13.494c-2.142-7.073-4.292-14.143-6.432-21.218
		c-0.945-3.118-1.818-6.26-2.834-9.356c-0.494-1.505-0.604-3.163-1.934-4.375c-0.766-0.701-0.747-1.802-0.425-2.832
		c0.275-0.885,0.818-1.444,1.703-1.732c1.167-0.381,2.189-0.102,3.155,0.579c0.963,0.675,1.942,1.331,2.909,2.001
		c1.774,1.23,3.548,2.467,5.34,3.713c0.854-0.667,1.69-1.326,2.526-1.98c2.092-1.639,4.174-3.288,6.276-4.914
		c0.789-0.609,2.453-0.664,3.224-0.089c1.265,0.942,2.491,1.93,3.729,2.9c1.731,1.358,3.462,2.715,5.197,4.082
		C77.429,33.558,80.204,31.632,82.985,29.716z M76.578,46.931c0.969-0.69,1.972-1.112,3.223-0.72
		c0.871-2.883,1.733-5.738,2.598-8.592c-0.037-0.027-0.071-0.052-0.107-0.082c-0.538,0.37-1.078,0.729-1.615,1.101
		c-1.452,1.002-2.898,2.017-4.356,3.011c-1.11,0.759-2.634,0.747-3.716-0.083c-1.969-1.515-3.91-3.071-5.864-4.604
		c-0.852-0.669-1.703-1.334-2.583-2.02c-1.043,0.813-2.09,1.621-3.129,2.439c-1.82,1.425-3.612,2.896-5.469,4.276
		c-0.99,0.738-2.432,0.763-3.523,0.02c-1.913-1.306-3.813-2.632-5.719-3.947c-0.295-0.206-0.593-0.406-1.044-0.714
		c0.96,3.179,1.871,6.201,2.794,9.26c0.205-0.032,0.395-0.032,0.566-0.086c1.027-0.336,1.94-0.049,2.781,0.529
		c1.647,1.127,3.29,2.26,4.912,3.415c0.35,0.255,0.56,0.217,0.875-0.037c1.671-1.344,3.368-2.654,5.042-3.993
		c1.141-0.916,2.937-0.785,4.069,0.181c1.643,1.404,3.388,2.689,5.091,4.024c0.042,0.033,0.102,0.047,0.187,0.083
		C73.242,49.245,74.926,48.105,76.578,46.931z M58.842,56.22c-1.109,0.887-2.681,0.887-3.8,0.103
		c-1.462-1.027-2.936-2.034-4.404-3.048c-0.141-0.099-0.283-0.189-0.567-0.375c0.981,3.251,1.921,6.36,2.869,9.502
		c0.791-0.181,1.538-0.45,2.304-0.103c0.256,0.118,0.54,0.186,0.773,0.334c0.95,0.628,1.891,1.271,2.826,1.924
		c0.253,0.175,0.43,0.189,0.693-0.025c0.866-0.709,1.776-1.363,2.642-2.074c1.126-0.928,2.846-0.918,3.977,0.019
		c0.864,0.716,1.772,1.371,2.641,2.077c0.246,0.201,0.415,0.177,0.647,0.017c0.734-0.512,1.478-1,2.207-1.517
		c0.595-0.423,1.191-0.828,1.945-0.873c0.422-0.024,0.845-0.004,1.382-0.004c0.854-2.827,1.741-5.768,2.629-8.712
		c-0.035-0.022-0.074-0.045-0.11-0.066c-1.198,0.829-2.402,1.652-3.601,2.488c-0.624,0.432-1.232,0.851-2.021,0.982
		c-0.781,0.128-1.497-0.009-2.094-0.452c-1.885-1.412-3.73-2.875-5.633-4.353C62.366,53.453,60.59,54.814,58.842,56.22z
		 M49.028,49.956c2.344,1.648,4.709,3.274,7.077,4.887c0.628,0.428,1.043,0.387,1.659-0.094c1.708-1.326,3.414-2.657,5.121-3.987
		c0.839-0.653,1.699-0.653,2.537,0c1.704,1.331,3.409,2.661,5.121,3.987c0.615,0.481,1.028,0.522,1.658,0.094
		c2.369-1.613,4.725-3.247,7.086-4.874c0.473-0.325,0.651-0.772,0.525-1.338c-0.091-0.433-0.369-0.79-0.793-0.757
		c-0.429,0.026-0.88,0.21-1.245,0.443c-0.899,0.564-1.756,1.198-2.628,1.804c-0.794,0.555-1.589,1.109-2.388,1.659
		c-0.772,0.534-1.678,0.551-2.419-0.02c-1.791-1.381-3.56-2.781-5.33-4.185c-0.543-0.429-1.167-0.429-1.71,0
		c-1.771,1.404-3.541,2.804-5.328,4.181c-0.742,0.575-1.648,0.562-2.425,0.024c-1.653-1.146-3.304-2.295-4.958-3.439
		c-0.204-0.143-0.413-0.278-0.636-0.376c-0.814-0.355-1.507,0.114-1.61,1.089C48.567,49.361,48.733,49.747,49.028,49.956z
		 M69.706,69.17c1.593-1.068,3.174-2.148,4.762-3.23c0.433-0.293,0.533-0.718,0.451-1.198c-0.075-0.439-0.348-0.77-0.781-0.783
		c-0.331-0.012-0.712,0.114-0.997,0.293c-0.946,0.599-1.859,1.252-2.787,1.878c-0.884,0.597-1.77,0.554-2.615-0.106
		c-0.926-0.729-1.854-1.457-2.781-2.18c-0.52-0.405-1.094-0.403-1.619,0.008c-0.927,0.722-1.851,1.449-2.779,2.176
		c-0.841,0.661-1.728,0.694-2.615,0.096c-0.913-0.617-1.818-1.245-2.732-1.857c-0.725-0.484-1.3-0.452-1.658,0.066
		c-0.386,0.562-0.22,1.265,0.432,1.712c1.502,1.037,3.008,2.06,4.521,3.081c0.596,0.396,1.035,0.381,1.624-0.062
		c0.955-0.717,1.889-1.463,2.849-2.173c0.768-0.572,1.585-0.569,2.355,0.003c0.96,0.716,1.895,1.462,2.854,2.174
		c0.232,0.173,0.526,0.271,0.787,0.399C69.262,69.355,69.511,69.304,69.706,69.17z"/>
</g>
</svg>
      <div class="light"><span class="glow"></span><span class="flare"></span><div>
</div>
</div>
</div>
</div>
          <div class="video-box" id="video-box-gzby" style="display:none;">
              <!-- <video id="my-video01" class="video-js aa vjs-big-play-centered" controls preload="auto" data-setup="{}" loop="loop" autoplay="autoplay">  
			       <source src="rtmp://222.52.51.133/oflaDemo/195" type="rtmp/flv" id = "videoSrc01">  
		     </video>
              <span id = "aaaa" class="close" style="color: #fff;">关闭</span> -->
          </div>
          <div class="video-box02" id="video-box-gzsq" style="display:none;">
              <video id="my-video" class="video-js vjs-big-play-centered" controls preload="auto" data-setup="{}" loop="loop" autoplay="autoplay">  
				<source src="" type="rtmp/flv" id = "videoSrc02">  
			  </video>
              <span class="close" style="color: #fff;">关闭</span>
          </div>
          <div class="video-box03" id="video-box-shlh" style="display:none;">
              <video id="my-video" class="video-js vjs-big-play-centered" controls preload="auto" data-setup="{}" loop="loop" autoplay="autoplay">  
			       <source src="" type="rtmp/flv" id = "videoSrc03">  
		      </video>
              <span class="close" style="color: #fff;">关闭</span>
          </div>
          <div class="real-time" id="real-time">
          	<div id="logo" style="width: 340px;height: 60px;">
          		<div style="width: 190px;height: 45px;float:left;">
          			<div style="width: 170px;height: 50px;margin:auto;background-color: #000;padding-top: 10px;">
          				<span style="padding-left:10px;margin-top:10px; color:#6cd029;font-size: 38px;" id="time_now">
          					
          				</span>
          			</div>
          		</div>
          		<div style="width: 130px;height: 60px;float: left;">
          			<img src="${APP_PATH}/static/display/X41202.png" width="150px" height="60px">
          		</div>
          	</div>
              <!-- <h1 class="title">实时停车情况</h1> -->
              <table class="table" id = "getuserEzStopTop20">
              </table>
              
              <div class="info" id="info-list">
                  <span class="close">关闭</span>
                  <h1>实时停车情况</h1>
                  <table id="info-list-table">
                  
                  </table>
              </div>
              <div class="mask" id="mask"></div>
          </div>
      </div>
        <div class="bottom">
            <div class="usage" id="usage"></div>
            <div class="park-count" id="park-count">
                <div class="park-info">
                    <div class="left">
                        <h1 class="title">停车路段车辆次数</h1>
                        <div class="content-wrapper">
                            <div class="content-left" style="width: 30px;">
                                <span class="count" id="number">0</span>
                            </div>
                            <div class="content-right">
                                <div class="day" onclick="day_parkNum()">日
                                    <!-- <span class="percent">↑0%</span> -->
                                </div>
                                <div class="week" onclick="week_parkNum()">周
                                    <!-- <span class="percent" >↑0%</span> -->
                                </div>
                                <div class="month" onclick="month_parkNum()">月
                                    <!-- <span class="percent">↑0%</span> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="right">
                        <h1 class="title">停车路段收入(元)</h1>
                        <div class="content-wrapper">
                            <div class="content-left" style="width: 30px;">
                                <span class="count" id="income">0</span>
                            </div>
                            <div class="content-right">
                                <div class="day" onclick="day_parkIncome()">日
                                    <!-- <span class="percent">↑0%</span> -->
                                </div>
                                <div class="week"  onclick="week_parkIncome()">周
                                    <!-- <span class="percent">↑0%</span>↓ -->
                                </div>
                                <div class="month"  onclick="month_parkIncome()">月
                                    <!-- <span class="percent">↑0%</span> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="park-road" id="park-road"></div>
            </div>
            <div class="pressure" id="pressure"></div>
            <div class="user-info" id="user-info">
                <h1 class="title">注册用户信息</h1>
                <div class="count">
                    <h2>用户总数：</h2>
                    <span class="num" id="count"></span>
                </div>
                <table id = "getUserToDay">
                </table>
            </div>
        </div>
    </div>
</body>
<script src="${APP_PATH }/static/display/js/jquery.js"></script>
<script src="${APP_PATH }/static/display/js/echarts.js"></script>
<%-- <script src="${APP_PATH }/static/display/js/china.js"></script> --%>
<script src="${APP_PATH }/static/display/js/guangdong.js"></script>
<script src="${APP_PATH }/static/display/js/map.js"></script>
<script type="text/javascript">
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
							videoHtml	+= '<div style="display: none;" id = "videoDiv'+item.cameraId+'">';
							videoHtml	+= '<video id="my-video'+item.cameraId+'" class="video-js vjs-big-play-centered" controls preload="auto" data-setup="{}" loop="loop"autoplay="autoplay" width="740px" height="400px">'; 
							videoHtml	+= '<source src="'+item.cameraRTMP+'" type="rtmp/flv">';
							videoHtml	+= '</video>';
							videoHtml	+= '</div>';
						}
					})
					videoHtml += '<span id = "aaaa" class="close" style="color: #fff;" data-id="">关闭</span>"';
					$("#video-box-gzby").html(videoHtml);
				}
			}
		})
	}

	$(function(){
		time_now();
		interval0();
		interva30();
		getRouteCountsDay();
		getCameras();
		lightUp();
		findCamearAll();
	})
	
	function interval0(){
		getuserEzStopTop20();
		getUserToDay();
	}
	function interva30(){
		getThreeMonthIncomeAndRoutCount();
		pressure();
	}
	setInterval(interval0,10000);
	setInterval(interva30,30000);
	setInterval(getCameras,600000);
	setInterval(getRouteCountsDay,600000*60);
	
	function lightUp(){
		$.ajax({
			url:"http://39.108.239.193:8081/lightup",
			data:{},
			type:"POST",
			success:function(result){
				var light = result.object;
				if(light.lightStatus == 1){
					lightup();
				}
			}
		})
	}
	setInterval(lightUp,5000);
	
	$(".wrap").dblclick(function(){
		$.ajax({
			url:"http://39.108.239.193:8081/lights",
			data:{},
			type:"POST",
			success:function(result){
				if(result.code == 100){
					lights();
				}
			}
		})
	});
	
	function getCameras(){
		$.ajax({
			url:"${APP_PATH}/display/getCameras",
			data:{},
			type:"POST",
			success:function(result){
				if(result.code == 100){
					points = [];
					var maps = result.object;
					$.each(maps,function(index,item){
						points.push(item)
					})
					initMap();
				}
			}
		})
	}
	//
	function pressure(){
		$.ajax({
			url:"${APP_PATH}/display/getRouteRecord",
			data:{},
			type:"POST",
			success:function(result){
				if(result.code == 100){
					dataPressure = [];
					var routeRecordas = result.object;
					$.each(routeRecordas,function(index,item){
						var cameraRecords = item.cameraRecords;
						
						var haveNum = 0;//停车数
						var fullNum = 0;//全部车位数
						$.each(cameraRecords,function(index,cameraRecord){
							var truckSpaces = cameraRecord.truckSpaces;
							
							$.each(truckSpaces,function(index,ts){
								if(ts.truckSpaceStatus == 1){//停车
									haveNum ++;
								}
								fullNum ++;
							})
						})
						var arrPressure = new Array();
						arrPressure[0] = item.routeLocationName;
						arrPressure[1] = Math.ceil((haveNum/fullNum)*100);
						if(!isNaN(arrPressure[1])){
							dataPressure.push(arrPressure);
						}
					})
					optionPressure();
				}
			}
		})
	}
	
	
	function getRouteCountsDay(){
		$.ajax({
			url:"${APP_PATH}/display/getRouteCountsDay",
			data:{},
			type:"POST",
			success:function(result){
				if(result.code == 100){
					routeArr = [];
					seriesArr = [];
					var map = result.object;
					$.each(map,function(index,item){
						routeArr.push(item.name)
						seriesArr.push(item)
					})
					optionUsageFunction();
				}
			}
		})
	}
	
	var countDay = 0;
	var countWeek = 0;
	var countMonth = 0;
	var sumDay = 0;
	var sumWeek = 0;
	var sumMonth = 0;
	
	function getThreeMonthIncomeAndRoutCount(){
		$.ajax({
			url:"${APP_PATH}/display/getThreeMonthIncomeAndRoutCount",
			data:{},
			type:"POST",
			success:function(result){
				if(result.code == 100){
					roadName = [];
					parkNum = [];
					parkNum= [];
					countDay = 0;
					countWeek = 0;
					countMonth = 0;
					sumDay = 0;
					sumWeek = 0;
					sumMonth = 0;
					
					var routeCountsDay = result.extend.routeCountsDay;
					var routeCountsWeek = result.extend.routeCountsWeek;
					var routeCountsMonth = result.extend.routeCountsMonth;
					
					var arrNumDay = new Array();
					var arrNumWeek = new Array();
					var arrNumMonth = new Array();
					
					var arrIncomeDay = new Array();
					var arrIncomeWeek = new Array();
					var arrIncomeMonth = new Array();
					
					$.each(routeCountsMonth,function(index,item){
						roadName.push(item.routeName);
						arrNumMonth[index] = item.count;
						arrIncomeMonth[index] = item.sum;
						countMonth += item.count;
						sumMonth += item.sum;
					})
					$.each(routeCountsWeek,function(index,item){
			        	arrNumWeek[index] = item.count;
						arrIncomeWeek[index] = item.sum;
				        countWeek += item.count;
						sumWeek += item.sum;
					})
					$.each(routeCountsDay,function(index,item){
						arrNumDay[index] = item.count;
						arrIncomeDay[index] = item.sum;
						countDay += item.count;
						sumDay += item.sum;
					})
					
					parkNum.push(arrNumDay);
					parkNum.push(arrNumWeek);
					parkNum.push(arrNumMonth);
					
					parkIncome.push(arrIncomeDay);
					parkIncome.push(arrIncomeWeek);
					parkIncome.push(arrIncomeMonth);
					
					$("#number").html(countDay);
					$("#income").html(sumDay);
					
					optionpark_road();
				}
			}
		});
	}
	
	//地图
	function getRouteRecord(){
		$.ajax({
			url:"${APP_PATH}/display/getRouteRecord",
			data:{},
			type:"POST",
			success:function(result){
				if(result.code == 100){
					
					parkings = [];
					emptyParkings = [];
					dataPressure = [];
					roadOffline = [];
					roadHasCar = [];
					roadFull = [];
					
					var routeRecordas = result.object;
					$.each(routeRecordas,function(index,item){
						var cameraRecords = item.cameraRecords;
						var haveNum = 0;//停车数
						var fullNum = 0;//全部车位数
						
						var i = 0;
						$.each(cameraRecords,function(index,camera){
							var truckSpaces = camera.truckSpaces;
							
							$.each(truckSpaces,function(index,ts){
								var arr1 = new Array();
								arr1[0] = (item.routeLongitude + 0.001*i).toFixed(6);
								arr1[1] = (item.routeLatitude + 0.001*i).toFixed(6);
								arr1[2] = item.routeLocationName;
								arr1[3] = ts.truckSpaceName;
								
								if(ts.truckSpaceStatus == 1){//停车
									haveNum ++;
									parkings.push(arr1);
								}else{
									emptyParkings.push(arr1);
								}
								fullNum ++;
								i++;
							})
							
							var arr = new Array();
							arr[0] = item.routeLongitude;
							arr[1] = item.routeLatitude;
							arr[2] = item.routeLocationName;
							arr[3] = haveNum;
							arr[4] = fullNum;
							
							var arrPressure = new Array();
							arrPressure[0] = item.routeLocationName;
							arrPressure[1] = Math.ceil((haveNum/fullNum)*100);
							if(!isNaN(arrPressure[1])){
								dataPressure.push(arrPressure);
							}
							
							if(camera != null){
								//离线 
								if(camera.cameraApp == 0){
									roadOffline.push(arr);
								}
							}
							if(haveNum > 0){
								//有车 
								if(haveNum < fullNum){
									roadHasCar.push(arr);
								}
								//已满
								if(haveNum == fullNum){
									roadFull.push(arr);
								}
							}
						})
					})
					map.setOption(optionMap);
					optionPressure();
				}
			}
		})
	}
	
	//停车记录前20条
	function getuserEzStopTop20(){
		//$("#getuserEzStopTop20").html("");
		$.ajax({
			url:"${APP_PATH}/display/getuserEzStopTop20",
			data:{},
			type:"POST",
			success:function(result){
				if(result.code == 100){
					var singleCarDetailsRecords = result.object;
					var htmlStr = "<tr><th >时间</th><th >车牌号</th><th >车位号</th><th >泊入/泊出</th><th >金额</th></tr>";
					$.each(singleCarDetailsRecords,function(index,item){
						var singleCarDetails = item.singleCarDetails;
						$.each(singleCarDetails,function(index,scd){
							htmlStr += '<tr class="'+item.singleCarId+'" id="'+scd.singleCarDetailsId+'">';
							if(scd.singleCarDetailsType == 0){
								htmlStr += '<td>'+timestampToTime(item.singleCarStartTime)+'</td>';
							}else if(scd.singleCarDetailsType == 1){
								htmlStr += '<td>'+timestampToTime(item.singleCarEndTime)+'</td>';
							}
							htmlStr += '<td>'+item.singleCarLicensePlate+'</td>';
							htmlStr += '<td>'+item.singleCarTruckSpace+'</td>';
							if(scd.singleCarDetailsType == 0){
								htmlStr += '<td>泊入</td>';
							}else if(scd.singleCarDetailsType == 1){
								htmlStr += '<td>泊出</td>';
							}
							if(scd.singleCarDetailsType == 0){
								htmlStr += '<td></td>';
							}else if(scd.singleCarDetailsType == 1){
								htmlStr += '<td>'+item.singleCarPrice+'</td>';
							}else{
								htmlStr += '<td></td>';
							}
							htmlStr += '</tr>';
						})
					})
					$("#getuserEzStopTop20").html(htmlStr);
				}
			}
		});
	}
	//注册用户信息前10条
	function getUserToDay(){
		//$("#getUserToDay").html("");
		$.ajax({
			url:"${APP_PATH}/display/getUserToDay",
			data:{},
			type:"POST",
			success:function(result){
				if(result.code == 100){
					$("#count").html(result.extend.count);
					var list = result.object;
					var htmlStr = "<tr><th>用户名称</th><th>手机号</th><th>注册时间</th></tr>";
					$.each(list,function(index,item){
						htmlStr += '<tr>';
						if(item.userFullName != null && item.userFullName != ""){
							htmlStr += '<td>'+item.userFullName+'</td>';
						}else{
							htmlStr += '<td>未编辑</td>';
						}
						htmlStr += '<td>'+item.userAccount.substring(0,3)+'****'+item.userAccount.substring(7,11)+'</td>';
						htmlStr += '<td>'+timestampToTime(item.userCreationTime)+'</td>';
						htmlStr += '</tr>';
					})
					$("#getUserToDay").html(htmlStr);
				}
			}
		});
	}
	//实时停车情况 双击事件
	$('#real-time').on('dblclick', '.table tr', function () {
		var id = $(this).attr("class");
		var singleCarDetailsId = $(this).attr("id");
		$("#info-list-table").html("");
		$.ajax({
			url:"${APP_PATH}/display/getuserEzStop",
			data:{"id":id},
			type:"POST",
			success:function(result){
				if(result.code == 100){
					var singleCarDetailsRecords = result.object;
					var htmlStr = "<tr><th>用户名称</th><th>手机号</th><th>注册时间</th></tr>";
					$.each(singleCarDetailsRecords,function(index,item){
						var singleCarDetails = item.singleCarDetails;
						$.each(singleCarDetails,function(index,scd){
							if(scd.singleCarDetailsId == singleCarDetailsId){
								htmlStr += '<tr>';
								htmlStr += '<tr>';
								htmlStr += '<td class="title">泊入/泊出：</td>';
								if(scd.singleCarDetailsType == 0){
									htmlStr += '<td class="text">泊入</td>';
								}else if(scd.singleCarDetailsType == 1){
									htmlStr += '<td class="text">泊出</td>';
								}
								htmlStr += '</tr>';
								htmlStr += '<td class="title">时间：</td>';
								if(scd.singleCarDetailsType == 0){
									htmlStr += '<td class="text">'+timestampToTime(item.singleCarStartTime)+'</td>';
								}else if(scd.singleCarDetailsType == 1){
									htmlStr += '<td class="text">'+timestampToTime(item.singleCarEndTime)+'</td>';
								}
								htmlStr += '</tr>';
								htmlStr += '<tr>';
								htmlStr += '<td class="title">路段名：</td>';
								htmlStr += '<td class="text">'+item.singleCarRouteName+'</td>';
								htmlStr += '</tr>';
								htmlStr += '<tr>';
								htmlStr += '<td class="title">车位号：</td>';
								htmlStr += '<td class="text">'+item.singleCarTruckSpace+'</td>';
								htmlStr += '</tr>';
								htmlStr += '<tr>';
								htmlStr += '<td class="title">车牌号：</td>';
								htmlStr += '<td class="text">'+item.singleCarLicensePlate+'</td>';
								htmlStr += '</tr>';
								htmlStr += '<tr>';
								htmlStr += '<td class="title">车牌图：</td>';
								htmlStr += '<td class="text">'
											+'<a href="http://39.108.239.193:8080'+scd.singleCarDetailsLicensePlateImage+'" target="_blank">'
											+'<input type="image" src="http://39.108.239.193:8080'+scd.singleCarDetailsLicensePlateImage+'">'
											+'</a>'
											+'</td>';
								htmlStr += '</tr>';
								htmlStr += '<td class="title">抓拍图：</td>';
								htmlStr += '<td class="text">'
											+'<a href="http://39.108.239.193:8080'+scd.singleCarDetailsPhotograph1+'" target="_blank">'
											+'<input type="image" src="http://39.108.239.193:8080'+scd.singleCarDetailsPhotograph1+'" width="160px" height="120px">'
											+'</a>'
											+'</td>';
								htmlStr += '</tr>';
								htmlStr += '<td class="title">抓拍图：</td>';
								htmlStr += '<td class="text">'
											+'<a href="http://39.108.239.193:8080'+scd.singleCarDetailsPhotograph2+'" target="_blank">'
											+'<input type="image" src="http://39.108.239.193:8080'+scd.singleCarDetailsPhotograph2+'" width="160px" height="120px">'
											+'</a>'
											+'</td>';
								htmlStr += '</tr>';
							}
						})
					})
					$("#info-list-table").html(htmlStr);
				}
			}
		});
		showInfoList()
	})
	//关闭停车详情
	$('#real-time').on('click', '.info .close', function () {
		hideInfoList()
	})
	//时间转换
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
	//显示当前时间
	function time_now(){
		var date = new Date();
		Y = date.getFullYear() + '-';
        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        D = (date.getDate()< 10 ? '0'+ date.getDate(): date.getDate()) + ' ';
        h = (date.getHours()< 10 ? '0'+ date.getHours(): date.getHours()) + ':';
        m = (date.getMinutes()< 10 ? '0'+ date.getMinutes(): date.getMinutes()) + ':';
        s = (date.getSeconds()< 10 ? '0'+ date.getSeconds(): date.getSeconds());
        $("#time_now").html(h+m+s);
	}
	setInterval(time_now,1000);
</script>
</html>
<script type="text/javascript">
   window.onerror = function(msg,url,line,col,error){
    //没有URL不上报！上报也不知道错误
    if (msg != "Script error." && !url){
        return true;
    }
    setTimeout(function(){
        var data = {};
        //不一定所有浏览器都支持col参数
        col = col || (window.event && window.event.errorCharacter) || 0;

        data.url = url;
        data.line = line;
        data.col = col;
        if (!!error && !!error.stack){
            //如果浏览器有堆栈信息
            //直接使用
            data.msg = error.stack.toString();
        }else if (!!arguments.callee){
            //尝试通过callee拿堆栈信息
            var ext = [];
            var f = arguments.callee.caller, c = 3;
            //这里只拿三层堆栈信息
            while (f && (--c>0)) {
               ext.push(f.toString());
               if (f  === f.caller) {
                    break;//如果有环
               }
               f = f.caller;
            }
            ext = ext.join(",");
            data.msg = error.stack.toString();
        }
        //把data上报到后台！
    },0);

    return true;
	};
</script>