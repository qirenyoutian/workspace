<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/page/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/skin/default/skin.css" id="skin" />

<title>数据分析</title>
</head>
<style>

.aaa{
	width:100px;
	height:32px;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
}
.tt{
	width:75%;
	height: 90px;
	margin: auto;
}
</style>
<body>
<nav class="breadcrumb">
	<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 数据分析 <span class="c-gray en">&gt;</span> 数据查询
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
		<i class="Hui-iconfont">&#xe68f;</i>
	</a>
</nav>
<div class="text-c">
	<form method="post" action="#" id="merchandise_form">
		<table class="tt">
			<tr>
				<td>按年查看：</td>
				<td>
					<select id="year" name="year" style="width:150px;" class="aaa">
					</select>
				</td>
				<td>按月查看：</td>
				<td>
					<select id="month" name="month" style="width:150px;" class="aaa">
					</select>
				</td>
			</tr>
		</table>
	</form>
	</div>

    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width:1000px;height:550px; margin: auto;"></div>
    <div id="main2" style="width:1000px;height:550px; margin: auto;"></div>



<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/page/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/login/js/H-ui.admin.js"></script> 
<!--/_footer 作为公共模版分离出去-->

<script type="text/javascript" src="${APP_PATH }/static/page/js/echarts.min.js"></script> 
<script type="text/javascript">

$(function(){
	
	 to_page(1);

		//获取年份 
	 var date = new Date().getFullYear();
	 var a = date-1;
	 var b = a-1;
	
	 var c = new Array();
	 c.push(date);
	 c.push(a);
	 c.push(b);
	//年份下拉框
	 var htmlStr = '<option style="text-align:center;"  value="">'+"---请选择---"+'</option>';
	 $("#year").html(htmlStr);
	  	//var htmlStr = '';
	  	for(var i = 0;i < c.length ; i++){
	  		htmlStr += '<option style="text-align:center;" value="'+c[i]+'">'+c[i]+'</option>';
	      	$("#year").html(htmlStr);
	  	}
	  	
	//获取月份
	 var htmlStr = '<option style="text-align:center;"  value="">'+"---请选择---"+'</option>';
	 $("#month").html(htmlStr);
	  	//var htmlStr = '';
	  	for(var i = 1;i < 13 ; i++){
	  		htmlStr += '<option style="text-align:center;" value="'+i+'">'+i+'</option>';
	      	$("#month").html(htmlStr);
	  	}
	
	
})

		 function to_page(pn){
			
		 	var myChart = echarts.init(document.getElementById('main'));
		    var myChart2 = echarts.init(document.getElementById('main2'));
			
		    var piontName = new Array();
			var price = new Array();
			var count = new Array();
		    var year = $("#year").val();
			var month = $("#month").val();
		    $.ajax({
				url:"${APP_PATH}/getMerchandiseReport",
				data:{
					"year":year,
					"month":month
					}, 
				type:"POST",
				async:false,
				success:function(result){
					var value = result.object;
					$.each(value,function(index,it){
						piontName.push(it.merchandiseName);
						price.push(it.sum);
						count.push(it.count);
						//count = it.count;
					})
					return piontName+price+count;
				}
			});
		  
		    
		    var option = {
		            title: {
		                text: '点位销售量报表'
		            },
		            tooltip: {},
		            legend: {
		                data:['销售量(个)']
		            },
		            xAxis: {
		            	show:false,
		            	//data:['化学', '数学', '地理', '物理', '英语', '音乐', '语文', '历史', '美术', '生物', '信息技术', '政治', '体育']
		            	data:piontName
		            },
		            yAxis: {},
		            color:{},
		            toolbox: {
		                show: true,
		                feature: {
		                    saveAsImage: {show: true},
		                    mark : {show: true},
		                    dataView : {show: true, readOnly: false},
		                    magicType : {show: true, type: ['line', 'bar']},
		                    restore : {show: true},
		                }
		            },
		            series: [{
		                name: '销售量(个)',
		                type: 'bar',
		                //data: [22, 88, 22, 33, 44, 66, 55, 44, 33, 22, 22, 23, 12]
		                data:count,
		                itemStyle:{
	                      normal:{
	                          color:'#DC143C'
	                      }
	                  }
		            }]
		        };
		    myChart.setOption(option);
		    
		    
		    var option2 = {
		            title: {
		                text: '点位销售额报表'
		            },
		            tooltip: {},
		            legend: {
		                data:['销售额(元)']
		            },
		            xAxis: {
		            	show:false,
		                data: piontName
		            },
		            yAxis: {},
		            toolbox: {
		                show: true,
		                feature: {
		                    saveAsImage: {show: true},
		                    mark : {show: true},
		                    dataView : {show: true, readOnly: false},
		                    magicType : {show: true, type: ['line', 'bar']},
		                    restore : {show: true},
		                }
		            },
		            series: [{
		                name: '销售额(元)',
		                type: 'bar',
		                data: price,
		                itemStyle:{
	                      normal:{
	                          color:'#31BDF2'
	                      }
	                  }
		            }]
		        };
		    myChart2.setOption(option2);
		}
		
		  
		    
		    
		    
		    //按年查找
		    $("#year").change(function(){
		    	to_page(1);
		    })
		    
		    //按月查找
		    $("#month").change(function(){
		    	to_page(1);
		    })
		    
		    
		    
		    
		    
		    
</script>
</body>
</html>