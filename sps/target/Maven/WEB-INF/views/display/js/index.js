// 基于准备好的dom，初始化echarts实例
var myChartA = echarts.init(document.getElementById('a'));
var myChartC = echarts.init(document.getElementById('c'));
var myChartD = echarts.init(document.getElementById('d'));
var myChartG = echarts.init(document.getElementById('g'));
var myChartL = echarts.init(document.getElementById('l'));
var myChartH = echarts.init(document.getElementById('h'));

// 指定图表的配置项和数据

//各路段停车压力
var dataPressure = [
	['南山', 50],
	['福田', 66],
	['罗湖', 80],
	['宝安', 34],
	['南山', 50],
	['福田', 66],
	['罗湖', 80],
	['宝安', 34],
]
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
var optionA = {
	title: {
		text: '各路段停车压力'
	},
	tooltip: {
		formatter: '{b}:{c}%'
	},
	xAxis: {
		data: getDataName(dataPressure)
	},
	yAxis: {
		name: '单位：%',
		type: 'value',
		max: '100'
	},
	dataZoom: {
		type: 'inside'
	},
	series: [{
		type: 'bar',
		data: getData(dataPressure)
	}]
};
//各路段使用率
var optionC = {
	title: {
		text: '各路段使用率'
	},
	legend: {
		data: ['南山', '福田']
	},
	tooltip: {
		trigger: 'axis',
		formatter: '{b}<br>{a0}:{c0}%<br>{a1}:{c1}%'
	},
	xAxis: {
		boundaryGap: false,
		data: ['0:00', '2:00', '4:00', '6:00', '8:00', '10:00', '12:00', '14:00', '16:00', '18:00', '20:00',
			'22:00', '24:00'
		]
	},
	yAxis: {
		axisLine: {
			onZeroAxisIndex: 0
		},
		type: 'value',
		max: 100
	},
	series: [{
			name: '南山',
			type: 'line',
			data: [50, 50, 60, 52, 44, 58, 62, 80, 70, 70, 70, 70]
		},
		{
			name: '福田',
			type: 'line',
			data: [36, 36, 24, 30, 59, 73, 77, 75, 75, 75, 75, 75]
		}
	]
};
//用户在线分布
var optionD = {
	title: {
		text: '用户在线分布'
	},
	tooltip: {
		trigger: 'axis'
	},
	xAxis: [{
		boundaryGap: false,
		data: ['0:00', '2:00', '4:00', '6:00', '8:00', '10:00', '12:00', '14:00', '16:00', '18:00',
			'20:00', '22:00', '24:00'
		]
	}],
	yAxis: [{
		type: 'value',
		max: function (value) {
			return value.max
		}
	}],
	series: [{
		name: '在线用户',
		type: 'line',
		areaStyle: {
			normal: {}
		},
		data: [45, 60, 50, 65, 70, 65, 80, 70, 80, 50, 30, 20]
	}]
};
//停车处理能力
var optionG = {
	title: {
		text: '停车处理能力',
		subtext: '数据吞吐量表示(mb/s)'
	},
	legend: {
		data: ['南山', '福田']
	},
	tooltip: {
		trigger: 'axis',
		formatter: '{b}<br>{c0}mb/s<br>{c1}mb/s'
	},
	xAxis: {
		data: ['10:26:26', '10:26:28', '10:26:30', '10:26:32',
			'10:26:34', '10:26:36', '10:26:38', '10:26:40'
		]

	},
	yAxis: {
		type: 'value',
		max: 1500
	},
	series: [{
			name: '南山',
			type: 'line',
			data: [100, 600, 700, 800, 900, 600, 800, 750]
		},
		{
			name: '福田',
			type: 'line',
			data: [200, 300, 500, 1000, 500, 550, 700, 900]
		}
	]
};
//停车支付渠道
var optionL = {
	title: {
		text: '停车支付渠道'
	},
	tooltip: {
		trigger: 'item',
		formatter: "{a} <br/>{b} : {d}%"
	},
	legend: {
		orient: 'vertical',
		x: 'left',
		top: '40',
		data: ['支付宝', '微信']
	},
	series: [{
		name: '停车支付渠道',
		type: 'pie',
		radius: ['50%', '70%'],
		data: [{
				name: '支付宝',
				value: 35
			},
			{
				name: '微信',
				value: 65
			},
		]
	}]
}

// 地图  
//车位已满   经度，纬度，有车数量，总车位数
var dataFull = [
	[113.268556, 23.13507, 10, 10],
	[116.068494, 22.88634, 5, 5],
	[112.392772, 24.797227, 6, 6]
]
//离线 
var dataOffline = [
	[113.655762, 23.378377, 0, 4],
	[112.944879, 22.953627, 0, 5],
	[112.981099, 23.196736, 0, 6]
]
//有车 
var dataHasCar = [
	[113.389289, 22.525387, 2, 5],
	[110.423874, 21.307576, 6, 10],
	[113.877967, 22.559568, 1, 4]
]
var optionH = {
	title: {
		text: '地图'
	},
	tooltip: {
		trigger: 'item',
		formatter: function (obj) {
			var value = obj.value;
			return value[2] + '/' + value[3] + '<br>'
		}
	},
	geo: {
		map: '广东',
		roam: true,
		label: {
			emphasis: {
				show: false
			}
		},
		itemStyle: {
			normal: {
				areaColor: '#323c48',
				borderColor: '#111'
			},
			emphasis: {
				areaColor: '#2a333d'
			}
		},
		scaleLimit: {
			min: 1,
			max: 20
		},
		silent: true
	},
	color: [
		'#ffc73f', '#d02935', '#d02935'
	],
	legend: {
		show: true,
		orient: 'vertical',
		data: ['车位已满', '离线', '有车'],
		left: 'left',
		top: 40
	},
	series: [{
			name: '车位已满',
			type: 'scatter',
			coordinateSystem: 'geo',
			data: dataFull,
			symbolSize: 10,
			itemStyle: {
				color: '#ffc73f'
			}
		},
		{
			name: '离线',
			type: 'scatter',
			coordinateSystem: 'geo',
			data: dataOffline,
			symbolSize: 10,
			itemStyle: {
				color: '#d02935'
			}
		},
		{
			name: '有车',
			type: 'scatter',
			coordinateSystem: 'geo',
			data: dataHasCar,
			symbolSize: 10,
			itemStyle: {
				color: '#6cd029'
			}
		}
	]
}

// 使用刚指定的配置项和数据显示图表。
myChartA.setOption(optionA);
myChartC.setOption(optionC);
myChartD.setOption(optionD);
myChartG.setOption(optionG);
myChartL.setOption(optionL);
myChartH.setOption(optionH);

//各路段停车压力

//实时停车情况 双击事件
$('#b').on('dblclick', 'table tr', function () {
	alert('展示视频和图片')
})

//地图 添加点击事件

myChartH.on('click', function (params) {
	alert('展示视频和图片')
	console.log(params)
})

window.onresize = function () {
	myChartA.resize();
	myChartC.resize();
	myChartD.resize();
	myChartG.resize();
	myChartL.resize();
	myChartH.resize();
};