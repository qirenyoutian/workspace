<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>显示屏功能设计</title>
    <link href="${APP_PATH}/static/display/css/reset.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/display/css/index.css" rel="stylesheet">
    <link href="${APP_PATH}/static/camera/js/5.20.1/video-js.css" rel="stylesheet">
    <script src="${APP_PATH}/static/camera/js/5.20.1/videojs-ie8.min.js"></script>
    <script src="${APP_PATH}/static/camera/js/5.20.1/video.js"></script>
</head>
<body>
    <div class="container">
        <div class="top">
            <div class="map" id="map"></div>
            <div class="video-box" id="video-box-gzby" style="display:none;">
                <video id="my-video01" class="video-js aa vjs-big-play-centered" controls preload="auto" data-setup="{}" loop="loop" autoplay="autoplay">  
					<source src="" type="rtmp/flv" id = "videoSrc01">  
				</video>
                <span class="close" style="color: #fff;">关闭</span>
            </div>
            <div class="video-box02" id="video-box-gzsq" style="display:none;">
                <video id="my-video" class="video-js vjs-big-play-centered" controls preload="auto" data-setup="{}" loop="loop" autoplay="autoplay">  
					<source src="" type="rtmp/flv" id = "videoSrc02">  
				</video>
				<!-- <script language="javascript">    
                        $(document).ready(function(){  
                             video.play();    
                        });  
                          
                        var vList = ['video//01.mp4', 'video//1.mp4', 'video//02.mp4']; // 初始化播放列表    
                        var vLen = vList.length;   
                        var curr = 0;   
                        var video = document.getElementById("myvideo");    
                        video.addEventListener('ended', function(){  
                            play();  
                        });    
                           
                        function play() {    
                            video.src = vList[curr];    
                            video.load();     
                            video.play();    
                            curr++;    
                            if(curr >= vLen){    
                                curr = 0; //重新循环播放  
                            }    
                            
                        }    
                 </script> -->  
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
                                    <span class="percent">↑0%</span>
                                </div>
                                <div class="week" onclick="week_parkNum()">周
                                    <span class="percent" >↑0%</span>
                                </div>
                                <div class="month" onclick="month_parkNum()">月
                                    <span class="percent">↑0%</span>
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
                                    <span class="percent">↑0%</span>
                                </div>
                                <div class="week"  onclick="week_parkIncome()">周
                                    <span class="percent">↑0%</span><!-- ↓ -->
                                </div>
                                <div class="month"  onclick="month_parkIncome()">月
                                    <span class="percent">↑0%</span>
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
<script src="${APP_PATH }/static/display/js/china.js"></script>
<script src="${APP_PATH }/static/display/js/guangdong.js"></script>
<script src="${APP_PATH }/static/display/js/index.js"></script>
<script type="text/javascript">
	$(function(){
		time_now();
		interval5();
		getRouteRecord();
	})
	
	function interval5(){
		getuserEzStopTop20();
		getUserToDay();
		getThreeMonthIncomeAndRoutCount();
		getRouteCountsDay();
	}
	setInterval(interval5,10000);
	setInterval(getRouteRecord,600000);
	
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
						var camera = item.camera;
						var truckSpaces = item.truckSpaces;
						
						var haveNum = 0;//停车数
						var fullNum = 0;//全部车位数
						
						var i = 0;
						
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