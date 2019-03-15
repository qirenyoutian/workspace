	function lightup(){
		$("#s-bulb").css("stroke","#c4d8d9");
		$("#s-bulb").css("stroke-width","2");
		$("#s-bulb").css("fill","#c4d8d9");
		$("#s-bulb").css("transition","100ms");
		
		$("#www-filament").css("stroke","#ffdf43");
		$("#www-filament").css("stroke-width","3");
		$("#www-filament").css("fill","#ffdf43");
		$("#www-filament").css("transition","all 600ms cubic-bezier(0.68, -0.55, 0.265, 1.55)");
		
		$(".light .glow ").css("width","120px");
		$(".light .glow ").css("height","120px");
		$(".light .glow ").css("opacity","0.2");
		$(".light .glow ").css("background","-webkit-radial-gradient(rgba(255,223,67,1), rgba(255,223,67,0) 70%)");
		$(".light .glow ").css("transition","all 800ms cubic-bezier(0.68, -0.55, 0.265, 1.55)");
	}
	function lights(){
		$("#s-bulb").css("stroke","#262832");
		$("#s-bulb").css("stroke-width","0");
		$("#s-bulb").css("fill","#262832");
		$("#s-bulb").css("transition","300ms");
		
		$("#www-filament").css("stroke","#333542");
		$("#www-filament").css("stroke-width","0");
		$("#www-filament").css("fill","#333542");
		$("#www-filament").css("transition","1500ms");
		
		$(".light .glow ").css("width","0px");
		$(".light .glow ").css("height","0px");
		$(".light .glow ").css("opacity","0");
		$(".light .glow ").css("background","-webkit-radial-gradient(rgba(255,223,67,1), rgba(255,223,67,0) 70%)");
		$(".light .glow ").css("transition","all 1000ms cubic-bezier(2.68, -0.55, 0.265, 1.55)");
	}
	
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
function optionPressure(){
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

$("body [name*='x']")

window.onresize = function () {
	usage.resize();
	pressure.resize();
	parkRoad.resize();
	map.resize();
};
var points = [];
//创建标注点并添加到地图中
  function addMarker(points) {
      //循环建立标注点
  for(var i=0, pointsLen = points.length; i<pointsLen; i++) {
      var point = new BMap.Point(points[i].lng, points[i].lat); //将标注点转化成地图上的点
      var marker = new BMap.Marker(point); //将点转化成标注点
      map.addOverlay(marker);  //将标注点添加到地图上
      //添加监听事件
      (function() {
          var thePoint = points[i];
          marker.addEventListener("dblclick",
          //显示信息的方法
          function() {
        	  //$('#video-box-gzby').css("display","block");
        	  //$("#videoDiv"+points[i].id).css("display","block");
        	  showVideo(this,thePoint);
          });
           })();  
      }
  }
  function showVideo(thisMarker,point) {
	$('#video-box-gzby').css("display","block");
	$("#videoDiv"+point.id).css("display","block");
	$("#aaaa").data("id",point.id);
  }
  
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
	  //$("#my-video"+$("#aaaa").data("id")).css("display","none");
  	  window.location.reload();
  })
  
  function showInfo(thisMarker,point) {
	    //获取点的信息
    var sContent =
    '<ul style="margin:0 0 5px 0;padding:0.2em 0">'  
    +'<li style="line-height: 26px;font-size: 15px;">'  
    +'<span style="width: 50px;display: inline-block;">名称：</span>' + point.name + '</li>'  
   /* +'<li style="line-height: 26px;font-size: 15px;">'  
    +'<span style="width: 50px;display: inline-block;">名称：</span>' + point.name + '</li>'  */
    +'</ul>';
    var infoWindow = new BMap.InfoWindow(sContent); //创建信息窗口对象
    thisMarker.openInfoWindow(infoWindow); //图片加载完后重绘infoWindow
}
//创建和初始化地图函数：
function initMap(){
  createMap();//创建地图
  setMapEvent();//设置地图事件
  addMapControl();//向地图添加控件
  addMapOverlay();//向地图添加覆盖物
  changeMapStyle();
  addMarker(points);
}
function createMap(){ 
  map = new BMap.Map("map"); 
  //map.centerAndZoom(new BMap.Point(110.18627,25.244007),15);
  map.centerAndZoom(new BMap.Point(110.278975,25.251007), 11);  // 初始化地图,设置中心点坐标和地图级别
  map.setCurrentCity("桂林");          // 设置地图显示的城市 此项是必须设置的
}
function setMapEvent(){
  map.enableScrollWheelZoom();
  map.enableKeyboard();
  map.enableDragging();
  map.enableDoubleClickZoom()
}
function addClickHandler(target,window){
  target.addEventListener("click",function(){
    target.openInfoWindow(window);
  });
}
function addMapOverlay(){
  var markers = [
    {imageOffset: {width:-46,height:-21},position:{lat:25.241523,lng:110.186486}}
  ];
  for(var index = 0; index < markers.length; index++ ){
    var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
    var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
      imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
    })});
    //var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
    var opts = {
      width: 200,
      title: markers[index].title,
      enableMessage: false
    };
    var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
    //marker.setLabel(label);
    addClickHandler(marker,infoWindow);
    map.addOverlay(marker);
  };
}
//向地图添加控件
function addMapControl(){
  var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
  scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
  map.addControl(scaleControl);
  var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:1});
  map.addControl(navControl);
  var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:false});
  map.addControl(overviewControl);
}
function changeMapStyle(){
	var mapStyle={  style : "midnight"}  
    map.setMapStyle(mapStyle);  
}
var map;
  initMap();
