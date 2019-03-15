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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 渠道管理 <span class="c-gray en">&gt;</span> 渠道列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> <!-- 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;"> -->
		<input type="text" class="input-text" style="width:250px" placeholder="输入渠道名称" id="content" name="">
		<button type="button" class="btn btn-success" id="select_admin" name=""><i class="Hui-iconfont">&#xe665;</i> 搜渠道</button>
	</div>
			

	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
		<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
			<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
		</a> 
		<a href="javascript:;" onclick="channel_add('添加渠道','/web/addChannel','800','500')" class="btn btn-primary radius">
			<i class="Hui-iconfont">&#xe600;</i> 添加渠道
		</a></span>
	</div>
	<table id="admin_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">渠道列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>渠道名称</th>
				<th>渠道联系人</th>
				<th>渠道联系方式</th>
				<th>渠道样式</th>
				<th>渠道支付方式</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
			<!-- 显示分页信息 -->
		<div class="row" style="width:80%;">
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


<script type="text/javascript">
var totalRecord,currentPage;
		$(function(){
		  	//去首页
			to_page(1);
		});
		/**
		* 首页
		*/
		function to_page(pn){
			var content = $("#content").val();
			$.ajax({
				url:"${APP_PATH}/getChannelAll",
				data:{"pn":pn,"content":content},
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
					var checkBoxTd = $("<td><input type='checkbox' value='"+item.channelId+"' name='channelName' class='check_item'/></td>").css("padding-left","14px");
					var channelId = $("<td style='display: none;'></td>").append(item.channelId);
					var channelName = $("<td></td>").append(item.channelName).css("text-align","center");
					var channelContact = $("<td></td>").append(item.channelContact).css("text-align","center");
					var channelContactWay = $("<td></td>").append(item.channelContactWay).css("text-align","center");
					var channelStyle = $("<td></td>").append(item.channelStyle).css("text-align","center");
					var channelPayType = $("<td></td>").css("text-align","center");
					if (channelId != null) {//根据渠道id查找对应的支付方式
						$.ajax({
							url:"${APP_PATH}/getPaymentByChannelId",
							data:{"channelId":item.channelId},
							type:"GET",
							success:function(result){
								var payment = result.extend.list;
								var to = "";
								if (payment != "") {
									$.each(payment,function(index,item){
										$.each(item.payments,function(index,p){
											if(to == ""){
												to = p.paymentName;
											}else{
												to = "&nbsp;,&nbsp;"+p.paymentName;
											}
											channelPayType.append(to);
										})
									})
								}else{
									channelPayType.append("");
								}
								
							}
						});
					}
					
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon")).append("编辑");
					//为编辑按钮添加一个自定义的属性，来表示当前角色id
					editBtn.attr("edit-id",item.channelId).attr("onclick","channel_edit('商品编辑','/web/EditChannel?id="+item.channelId+"',"+item.channelId+",'800','500')");
					var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon")).append("删除");
					//为删除按钮添加一个自定义的属性来表示当前删除的角色id
					delBtn.attr("del-id",item.channelId);
					var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn).append(" ").css("width","130px");
					//var delBtn = 
					//append方法执行完成以后还是返回原来的元素
					$("<tr></tr>").append(checkBoxTd)
						.append(channelId)
						.append(channelName)
						.append(channelContact)
						.append(channelContactWay)
						.append(channelStyle)
						.append(channelPayType)
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
			var content = $("#content").val();
				if (content != "" && content !=" ") {
					$.ajax({
						url:"${APP_PATH}/getChannelAll",
						data:{"pn":1,"content":content},
						type:"GET",
						success:function(result){
							build_roles_table(result);
							build_page_info(result);
							build_page_nav(result);
						}
					});
				}else{
					to_page(1);
				}
		})
		
		
		
/*渠道-增加*/
function channel_add(title,url,w,h){
	layer_show(title,url,w,h);
}	
		
/*渠道-编辑*/
function channel_edit(title,url,id,w,h){
	layer_show(title,url,w,h,id);

}	
		
		


//单个删除
$(document).on("click",".delete_btn",function(){
	//1、弹出是否确认删除对话框
	
	var ChannelName = $(this).parents("tr").find("td:eq(2)").text();
	
	var id = $(this).attr("del-id");
	layer.confirm('确认要删除"'+ChannelName+'"吗？',function(index){
			//确认，发送ajax请求删除即可
			$.ajax({
				url:"${APP_PATH}/deleteChannel",
				type:"POST",
				data:{"ChannelId":id,"ChannelIds":null},
				success:function(result){
					var status = result.code;
					if(status == 100){
						layer.msg('已删除!',{icon:6,time:1000},function(){
							to_page(1);
						});
					}else{
						layer.msg('删除失败！',{icon:5,time:1000});
					}
				}
			});
	});
});
		

function datadel(){
	var checkBoxAll = $("input[name='channelName']:checked");
	var ids = [];
	$.each(checkBoxAll,function(index,cc){
		var a = $(cc).val();
		ids.push(a);
	})
	if (ids != null && ids != "") {
		layer.confirm('确认要删除吗？',function(index){
		//alert(ids);
			$.ajax({
				url:"${APP_PATH}/deleteChannel",
				type:"POST",
				data:{"ChannelId":0,"ChannelIds":ids},
				traditional :true,
				success:function(result){
					var status = result.code;
					if(status == 100){
						layer.msg('已删除!',{icon:6,time:1000},function(){
							to_page(1);
						});
					}else{
						layer.msg('删除失败！',{icon:5,time:1000});
					}
				}
			});
	});
		
	}else{
		layer.msg('没有选择的对象！',{icon:5,time:1000});
	}

}		
	
		
		
		
		
		
		
</script>
</body>
</html>