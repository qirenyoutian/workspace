<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/page/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/style.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/page/css/bootstrap.css" />

<title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 点位管理 <span class="c-gray en">&gt;</span> 点位列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<select id="province" class="input-text" name="pointProvince" style="width:80px">
            <option value="">请选择</option><option value="110000">北京市</option><option value="120000">天津市</option><option value="130000">河北省</option><option value="140000">山西省</option><option value="150000">内蒙古</option><option value="210000">辽宁省</option><option value="220000">吉林省</option><option value="230000">黑龙江省</option><option value="310000">上海市</option><option value="320000">江苏省</option><option value="330000">浙江省</option><option value="340000">安徽省</option><option value="350000">福建省</option><option value="360000">江西省</option><option value="370000">山东省</option><option value="410000">河南省</option><option value="420000">湖北省</option><option value="430000">湖南省</option><option value="440000">广东省</option><option value="450000">广西省</option><option value="460000">海南省</option><option value="500000">重庆市</option><option value="510000">四川省</option><option value="520000">贵州省</option><option value="530000">云南省</option><option value="540000">西藏自治区</option><option value="610000">陕西省</option><option value="620000">甘肃省</option><option value="630000">青海省</option><option value="640000">宁夏省</option><option value="650000">新疆自治区</option><option value="710000">台湾省</option><option value="810000">香港</option><option value="820000">澳门</option><option value="90000">外国</option>
        </select>
        <select id="city" class="input-text" name="pointCity" style="width:100px"><option value="">请选择</option></select>
        <select id="area" class="input-text" name="pointDistrict"style="width:80px"><option value="">请选择</option></select>
		<input type="text" class="input-text" style="width:250px" placeholder="输入点位名称" id="content" name="">
		<button type="button" class="btn btn-success" id="select_admin" name=""><i class="Hui-iconfont">&#xe665;</i> 搜点位</button>
	</div>
			

	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
		<a href="javascript:;" onclick="point_dels()" class="btn btn-danger radius">
			<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
		</a> 
		<a href="javascript:;" onclick="point_add('添加点位','/web/addPoint','800','500')" class="btn btn-primary radius">
			<i class="Hui-iconfont">&#xe600;</i> 添加点位
		</a></span>
	</div>
	<table id="admin_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">点位列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" value=""></th>
				<th>点位名称</th>
				<th>省</th>
				<th>市</th>
				<th>区</th>
				<th>详细位置（街道）</th>
				<th>所属渠道</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
			<!-- 显示分页信息 -->
		<div class="row" style="position:absolute;bottom:10px; width:80%;">
			<!--分页文字信息  -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${APP_PATH }/static/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${APP_PATH }/static/page/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/login/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->



<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${APP_PATH }/static/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${APP_PATH }/static/lib/laypage/1.2/laypage.js"></script>
<!-- 删除时确认窗口 -->

<!-- 分页相关 -->
<script src="${APP_PATH }/static/HDpaging/jquery-1.11.1.min.js"></script>
<script src="${APP_PATH }/static/HDpaging/paging.js"></script>
<script src="${APP_PATH }/static/page/js/map.js"></script> 

<script type="text/javascript">
var totalRecord,currentPage;
		$(function(){
		  	//去首页
			to_page(1);
		  	
		  	
			$("#province").change(function(){
				var t = $(this).val();
				$.grep(cities,function(value){
					if(value.parent==t){
						var list = value.list;
						var html = "";
						var str = "";
						html += "<option value=''>请选择</option>";
						for(var i = 0; i<list.length ; i++){
							str ="<option value='"+list[i].id+"'>"+list[i].name+"</option>";
							html += str;
						}
						$("#city").html(html);
					}
				});
			});
			$("#city").change(function(){
				var t = $(this).val();
				$.grep(counties,function(value){
					if(value.parent==t){
						var list = value.list;
						var html = "";
						var str = "";
						html += "<option value=''>请选择</option>";
						for(var i = 0; i<list.length ; i++){
							str ="<option value='"+list[i].id+"'>"+list[i].name+"</option>";
							html += str;
						}
						$("#area").html(html);
					}
				});
			});
		  	
		});
		/**
		* 首页
		*/
		function to_page(pn){
			var province = $("#province").val();
			var city = $("#city").val();
			var area = $("#area").val();
			var content = $("#content").val();
			$.ajax({
				url:"${APP_PATH}/getPointAll",
				data:{"pn":1,
					"province":province,
					"city":city,
					"area":area,
					"content":content
					},
				type:"GET",
				success:function(result){
					//1、解析并显示角色数据
					build_roles_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		
		//显示数据
		function build_roles_table(result){
			//清空table表格
			$("#admin_table tbody").empty();
			var menu = result.extend.pageInfo.list;
			$.each(menu,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' class='check_item' name='pointId' value='"+item.pointId+"'/></td>").css("padding-left","14px");
				var pointId = $("<td style='display: none;'></td>").append(item.pointId);
				var pointName = $("<td></td>").append(item.pointName).css("text-align","center");
				var areas = item.areas;
				var pointProvince = $("<td></td>");
				var pointCity = $("<td></td>");
				var pointDistrict = $("<td></td>");
				$.each(areas,function(i,area){
					if(area.type == 1){
						pointProvince = pointProvince.append(area.name).css("text-align","center");
					}
					if(area.type == 2){
						pointCity = pointCity.append(area.name).css("text-align","center");
					}
					if(area.type == 3){
						pointDistrict = pointDistrict.append(area.name).css("text-align","center");
					}
				})
				var channel = item.channel;
				if (channel != null) {
					var channelName = $("<td></td>").append(item.channel.channelName).css("text-align","center");
				}else{
					var channelName = $("<td></td>").append("").css("text-align","center");
				}
				
				
				var pointAddress = $("<td></td>").append(item.pointAddress).css("text-align","center");
				/* var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前角色id
				editBtn.attr("edit-id",item.pointId).attr("onclick","point_edit('点位编辑','/web/EditPoint?id="+item.pointId+"',"+item.pointId+",'800','500')"); */
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的角色id
				delBtn.attr("onclick","point_del('"+item.pointId+"')");
				var btnTd = $("<td></td>")/* .append(editBtn).append(" ") */.append(delBtn).append(" ").css("width","60px");
				//var delBtn = 
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd)
					.append(pointId)
					.append(pointName)
					.append(pointProvince)
					.append(pointCity)
					.append(pointDistrict)
					.append(pointAddress)
					.append(channelName)
					.append(btnTd)
					.appendTo("#admin_table tbody");
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
		
		//查询
		$("#select_admin").click(function(){
			var province = $("#province").val();
			var city = $("#city").val();
			var area = $("#area").val();
			var content = $("#content").val();
			
			$.ajax({
				url:"${APP_PATH}/getPointAll",
				data:{"pn":1,
					"province":province,
					"city":city,
					"area":area,
					"content":content
					},
				type:"GET",
				success:function(result){
					debugger;
					//1、解析并显示角色数据
					build_roles_table(result);
					build_admin_page(result);
				}
			});
					
		})
	
		/*点位-增加*/
		function point_add(title,url,w,h){
			layer_show(title,url,w,h);
		}	
				
		/*点位-编辑*/
		function point_edit(title,url,id,w,h){
			layer_show(title,url,w,h,id);

		}		
		
		/* 点位-删除*/
		function point_del(id){
			layer.confirm('确认要删除吗？',function(index){
				var ids = [];
				ids.push(id);
				pointDelete(ids);
			})
		}
		
		/*点位-批量删除*/
		function point_dels(){
			layer.confirm('确认要删除吗？',function(index){
				var checkBoxAll = $("input[name='pointId']:checked");
				var ids = [];
				$.each(checkBoxAll,function(index,cc){
					var a = $(cc).val();
					ids.push(a);
				})
				pointDelete(ids);
			})
		}
		
		function pointDelete(ids){
			$.ajax({
				type: 'POST',
				url: '${APP_PATH}/deletePoint',
				data:{"pointIds":ids},
				success: function(result){
					var status = result.code;
					if(status == 100){
						layer.msg('已删除!',{icon:6,time:1000},function(){
							to_page(1);
						});
					}else{
						layer.msg('删除失败！',{icon:5,time:1000});
					}
				},
			});
		}
		
</script>
</body>
</html>