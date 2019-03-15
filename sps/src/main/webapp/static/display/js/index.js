//各路段使用率
var usage = echarts.init(document.getElementById('usage'));
var routeArr = []
var seriesArr = []
var optionUsage = {
	title: {
		text: '各路段使用率',
		textStyle: {
			color: '#e4e4e4'
		}
	},
	legend: {
		data: routeArr,
		textStyle: {
			color: '#e4e4e4'
		}
	},
	tooltip: {
		trigger: 'axis',
		formatter: '{b}<br>{a0}:{c0}%<br>{a1}:{c1}%'
	},
	xAxis: {
		boundaryGap: false,
		data: ['0:00', '2:00', '4:00', '6:00', '8:00', '10:00', '12:00', '14:00', '16:00', '18:00', '20:00',
			'22:00', '24:00'
		],
		axisLine:{
			lineStyle: {
				color: '#9eaccc',
				width: 1
			}
		}
	},
	yAxis: {
		axisLine: {
			onZeroAxisIndex: 0
		},
		axisLine:{
			lineStyle: {
				color: '#9eaccc',
				width: 1
			}
		},
		type: 'value',
		max: 100
	},
	series: seriesArr
};
function optionUsageFunction(){
	optionUsage = {
			title: {
				text: '各路段使用率',
				textStyle: {
					color: '#e4e4e4'
				}
			},
			legend: {
				data: routeArr,
				textStyle: {
					color: '#e4e4e4'
				}
			},
			tooltip: {
				trigger: 'axis',
				formatter: '{b}<br>{a0}:{c0}%'/*<br>{a1}:{c1}%*/
			},
			xAxis: {
				boundaryGap: false,
				data: ['0:00', '2:00', '4:00', '6:00', '8:00', '10:00', '12:00', '14:00', '16:00', '18:00', '20:00',
					'22:00', '24:00'
				],
				axisLine:{
					lineStyle: {
						color: '#9eaccc',
						width: 1
					}
				}
			},
			yAxis: {
				axisLine: {
					onZeroAxisIndex: 0
				},
				axisLine:{
					lineStyle: {
						color: '#9eaccc',
						width: 1
					}
				},
				type: 'value',
				max: 100
			},
			series: seriesArr
		};
	usage.setOption(optionUsage);
}


//各路段停车数量 & 收入
var roadName =  []
var parkNum = []
var parkIncome = []
var parkRoad = echarts.init(document.getElementById('park-road'));
var optionparkRoad = {
		title: {
			text: '路段的停车次数(日)',
			textStyle: {
				color: '#e4e4e4'
			}
		},
		tooltip: {
			trigger: 'axis'
		},
		xAxis: [{
			type: 'category',
			data: roadName,
			axisLine:{
				lineStyle: {
					color: '#9eaccc',
					width: 1
				}
			}
		}],
		yAxis: [{
			type: 'value',
			max: function (value) {
				return value.max
			},
			axisLine:{
				lineStyle: {
					color: '#9eaccc',
					width: 1
				}
			}
		}],
		series: {
			name: '停车次数',
			type: 'line',
			data: parkNum[0]
		}
	};
function optionpark_road(){
	parkRoad = echarts.init(document.getElementById('park-road'));
	optionparkRoad = {
			title: {
				text: '路段的停车次数(日)',
				textStyle: {
					color: '#e4e4e4'
				}
			},
			tooltip: {
				trigger: 'axis'
			},
			xAxis: [{
				type: 'category',
				data: roadName,
				axisLine:{
					lineStyle: {
						color: '#9eaccc',
						width: 1
					}
				}
			}],
			yAxis: [{
				type: 'value',
				max: function (value) {
					return value.max
				},
				axisLine:{
					lineStyle: {
						color: '#9eaccc',
						width: 1
					}
				}
			}],
			series: {
				name: '停车次数',
				type: 'line',
				data: parkNum[0]
			}
		};
	parkRoad.setOption(optionparkRoad);
}

//停车次数
function day_parkNum() {
	optionparkRoad.title.text = '路段的停车次数(日)';
	optionparkRoad.series.data = parkNum[0];
	optionparkRoad.series.name = '停车次数';
	$("#number").html(countDay);
	parkRoad.setOption(optionparkRoad);
}
function week_parkNum() {
	optionparkRoad.title.text = '路段的停车次数(周)';
	optionparkRoad.series.data = parkNum[1];
	optionparkRoad.series.name = '停车次数';
	$("#number").html(countWeek);
	parkRoad.setOption(optionparkRoad);
}
function month_parkNum() {
	optionparkRoad.title.text = '路段的停车次数(月)';
	optionparkRoad.series.data = parkNum[2];
	optionparkRoad.series.name = '停车次数';
	$("#number").html(countMonth);
	parkRoad.setOption(optionparkRoad);
}
//停车收入
function day_parkIncome() {
	optionparkRoad.title.text = '停车路段收入(日)'
	optionparkRoad.series.data = parkIncome[0];
	optionparkRoad.series.name = '停车收入';
	$("#income").html(sumDay);
	parkRoad.setOption(optionparkRoad);
}
function week_parkIncome() {
	optionparkRoad.title.text = '停车路段收入(周)';
	optionparkRoad.series.data = parkIncome[1];
	optionparkRoad.series.name = '停车收入';
	$("#income").html(sumWeek);
	parkRoad.setOption(optionparkRoad);
}
function month_parkIncome() {
	optionparkRoad.title.text = '停车路段收入(月)';
	optionparkRoad.series.data = parkIncome[2];
	optionparkRoad.series.name = '停车收入';
	$("#income").html(sumMonth);
	parkRoad.setOption(optionparkRoad);
}

var dataPressure = []
var pressure = echarts.init(document.getElementById('pressure'));
var getDataName = function (params) {
	var name = []
	for (var i in params) {
		name.push(params[i][0])
	}
	return name
}
var getData = function (params) {
	var data = []
	for (var i in params) {
		data.push(params[i][1])
	}
	return data
}
//各路段停车压力
function optionPressure(arrPressure){
	pressure = echarts.init(document.getElementById('pressure'));
	var optionPressure = {
		title: {
			text: '各路段停车压力',
			textStyle: {
				color: '#e4e4e4'
			}
		},
		tooltip: {
			formatter: '{b}:{c}%'
		},
		xAxis: {
			data: getDataName(dataPressure),
			axisLine:{
				lineStyle: {
					color: '#9eaccc',
					width: 1
				}
			}
		},
		yAxis: {
			name: '单位：%',
			type: 'value',
			max: '100',
			axisLine:{
				lineStyle: {
					color: '#9eaccc',
					width: 1
				}
			}
		},
		dataZoom: {
			type: 'inside'
		},
		series: [{
			type: 'bar',
			data: getData(dataPressure)
		}]
	};
	pressure.setOption(optionPressure);
}

// 地图  
var map = echarts.init(document.getElementById('map'));

//离线 
var roadOffline = []
//有车 
var roadHasCar = []
//已满
var roadFull = []

//车位 已停车
var parkings = []

//车位 空停车
var emptyParkings = []
//车位 僵尸车
var jsCar = []
var optionMap = {
	title: {
		text: '地图',
		textStyle: {
			color: '#e4e4e4'
		}
	},
	tooltip: {
		trigger: 'item',
		formatter: function (obj) {
			var value = obj.value;
			if (value[4] == undefined) {
				return value[2] + '<br>' + value[3]
			} else {
				return value[2] + '<br>' + value[3] + ' / ' + value[4]
			}
		}
	},
	geo: {
		map: 'china',
		roam: true,
		label: {
			emphasis: {
				show: false
			}
		},
		itemStyle: {
			normal: {
				areaColor: '#05518a',
				borderColor: '#111'
			},
			emphasis: {
				areaColor: '#2a333d'
			}
		},
		scaleLimit: {
			min: 1,
			max: 100
		},
		silent: true
	},
	color: [
		'#d02935', '#6cd029', '#ffc73f'
	],
	legend: {
		show: true,
		orient: 'vertical',
		left: 'left',
		top: 40,
		textStyle: {
			color: '#e4e4e4'
		}
	},
	series: [
		{
			name: '离线',
			type: 'scatter',
			coordinateSystem: 'geo',
			data: roadOffline,
			symbolSize: 8
		},
		{
			name: '有车位',
			type: 'scatter',
			coordinateSystem: 'geo',
			data: roadHasCar,
			symbolSize: 8
		},
		{
			name: '车位已满',
			type: 'scatter',
			coordinateSystem: 'geo',
			data: roadFull,
			symbolSize: 8
		}
	]
}
map.setOption(optionMap);

//监听地图缩放
var level = 1;
map.on('georoam', function (params) {
	var zoom = params.zoom
	if (zoom > 1) {
		level++
	} else if(zoom < 1) {
		level--
		if (level == 0) {
			level = 1
		}
	} else {
		level = level
	}

	if (level >= 25) {
		optionMap.series[0].data = parkings
		optionMap.series[0].name = '已停车'
		optionMap.series[1].data = emptyParkings
		optionMap.series[1].name = '空车位'
		optionMap.series[2].data = jsCar
		optionMap.series[2].name = '僵尸车'	
		optionMap.color[2] = '#777'
		map.setOption(optionMap);
	} 
	else {
		optionMap.series[0].data = roadOffline
		optionMap.series[0].name = '离线'
		optionMap.series[1].data = roadHasCar
		optionMap.series[1].name = '有车位'
		optionMap.series[2].data = roadFull
		optionMap.series[2].name = '车位已满'
		optionMap.color[2] = '#ffc73f'
		map.setOption(optionMap);
	}
});	

function showInfoList() {
	$('#info-list').fadeIn()
	$('#mask').fadeIn()
}
function hideInfoList() {
	$('#info-list').fadeOut()
	$('#mask').fadeOut()
}
$("#videoSrc").attr("src","rtmp://live.hkstv.hk.lxdns.com/live/hks");
$("#videoSrc01").attr("src","rtmp://222.52.51.133/oflaDemo/194");
$("#videoSrc02").attr("src","rtmp://222.52.51.133/oflaDemo/192");
$("#videoSrc03").attr("src","rtmp://222.52.51.133/oflaDemo/193");

//地图 双击事件 弹出视频

map.on('dblclick', function () {
	
	/*var html = '<video id="my-video" class="video-js vjs-big-play-centered" controls preload="auto" data-setup="{}" loop="loop" autoplay="autoplay">'  
					+'<source src="rtmp://live.hkstv.hk.lxdns.com/live/hks" type="rtmp/flv" id = "videoSrc">'
				+'</video>'
				+'<span class="close" style="color: #fff;">关闭</span>';
	$('#video-box').html(html);*/
	

	$('#video-box-gzby').css("display","block");
	
	
	//$('#video-box video')[0].src = 'http://www.w3school.com.cn/i/movie.ogg';
	// console.log(params)  //点的信息  rtmp://222.52.51.133/oflaDemo/194
})

function showInfoList() {
	$('#info-list').fadeIn()
	$('#mask').fadeIn()
}
function hideInfoList() {
	$('#info-list').fadeOut()
	$('#mask').fadeOut()
	
}
//实时停车情况 双击事件
$('#real-time').on('dblclick', '.table tr', function () {
	showInfoList()
})
//关闭
$('#real-time').on('click', '.info .close', function () {
	hideInfoList()
})

//关闭
$('#video-box-gzby').on('click', '.close', function(){
	$("#video-box-gzby").css("display","none");
	window.location.reload();
	
	//$('#video-box').fadeOut()
	//$('#video-box video')[0].src = '';
})
/*
	 $(document).on("click", function(){
	        $("#video-box").css("display","none");
	    });

*/

$("body [name*='x']")


/*map.on('click',function(){
	alert("123");
})*/


//地图 添加点击事件

// map.on('click', function (params) {
// 	alert('展示视频和图片')
// 	console.log(params)
// })

window.onresize = function () {
	usage.resize();
	pressure.resize();
	parkRoad.resize();
	map.resize();
};