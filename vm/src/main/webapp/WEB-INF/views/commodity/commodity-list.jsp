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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 商品列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
<div class="text-c">
	<form method="post" action="#" id="merchandise_form">
		<table class="tt">
			<tr>
				<td>商户名称：</td>
				<td>
					<select id="CommerName" name="commerName" style="width:150px;" class="aaa">
					    <option value="">---请选择---</option>
					</select>
				</td>
				<td>商品名称：</td>
				<td>
					<select id="MerchandiseName" name="MerchandiseName" style="width:150px;" class="aaa">
						<option value="">---请选择---</option>
					</select>
				</td>
				<td>商品类型：</td>
				<td>
					<select id="MerchandiseClassfiy" name="Classfiy" style="width:150px;" class="aaa">
					    <option value="">---请选择---</option>
					</select>
				</td>
				<td>上架状态：</td>
				<td>
					<select id="Status" style="width:150px;" class="aaa" name="status">
						<option value="">---请选择---</option>
						<option value="0">未上架</option>
						<option value="1">已上架</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>商品来源：</td>
				<td>
					<select id="Channel" name="from" style="width:150px;" class="aaa">
					    <option value="">---请选择---</option>
					</select>
				</td>
				<td>创建时间：</td>
				<td colspan="2">
					<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" name="startTime" class="input-text Wdate aaa" style="width:120px;">
					-
					<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" name="endTime" class="input-text Wdate aaa" style="width:120px;">
				</td>
			</tr>
		</table>
	</form>
	</div>

	<div class="cl pd-5 bg-1 bk-gray mt-20" style=""> 
		<span class="l">
			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
			</a> 
			<a href="javascript:;" onclick="commodity_add('添加商品','/web/addCommodity','800','550')" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe600;</i> 添加商品
			</a>
			<a href="javascript:;" onclick="" class="btn btn-primary radius">
				渠道信息导入
			</a>
		</span>
		<span style="float: right; margin-right: 170px;">
			<button id="btn" class="btn btn-success radius" style="">导入商品</button>
			<input type="file" id="file" name="file" style="display: none;" class="btn btn-success radius" /> 
			<img id="images" style="display: none;" alt="" src="">
			<!-- <a href="javascript:;" onclick="_Inport()" class="btn btn-success radius">导入商品</a> -->
		</span>
		<span style="float: right; margin-right:10px; ">
			<a href="javascript:;" onclick="Merchandise_Export()" class="btn btn-success radius">导出商品信息</a>
		</span>
	</div>

	<table id="admin_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="13">商品列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th>商品名称</th>
				<th>商品编号</th>
				<th>商户名称</th>
				<th>商品分类</th>
				<th>商品价格</th>
				<th>商品图片</th>
				<th>商品来源</th>
				<th>创建时间</th>
				<th>上架时间</th>
				<th>最后更新时间</th>
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
		  	
		  	getclassfiy();//加载商品类型
		  	getCommerName();//加载商户名称
		  	getChannelName();//加载渠道名称
		  	
		  	
			//根据商户Id查找对应的商品名称
			 $("#CommerName").change(function(){
				 //getAlsieByEquipmentId
				 var commerId = $(this).val();
				 $("#MerchandiseName").find("option").remove();
				 $.ajax({
						url:"${APP_PATH}/getMerchandiseByCommercialId",
						data:{"commercialTenantId":commerId},
						type:"GET",
						success:function(result){
							var payment = result.extend.list;
							//添加请选择
							var htmlStr = '<option style="text-align:center;"  value="0">'+"---请选择---"+'</option>';
							$("#MerchandiseName").html(htmlStr);
				        	//var htmlStr = '';
				        	
				        	$.each(payment,function(index,item){
				        		htmlStr += '<option style="text-align:center;" value="'+item.merchandiseId+'">'+item.merchandiseName+'</option>';
				        	});
				        	$("#MerchandiseName").html(htmlStr);
						}
					});
				 
			 })
		});
		
		/**
		* 首页
		*/
		function to_page(pn){
		
			var commerName = $("#CommerName").val();
			var MerchandiseName = $("#MerchandiseName").val();
			var Classfiy = $("#MerchandiseClassfiy").val();
			var status = $("#Status").val();
			var from = $("#Channel").val();
			var startTime = $("#datemin").val();
			var endTime = $("#datemax").val();
			
			
			$.ajax({
				url:"${APP_PATH}/getCommodityAll",
				data:{
					"pn":pn,
					"commerName":commerName,
					"MerchandiseName":MerchandiseName,
					"Classfiy":Classfiy,
					"status":status,
					"from":from,
					"startTime":startTime,
					"endTime":endTime
					}, 
				type:"POST",
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
		
	
		function build_roles_table(result){
			//清空table表格
			$("#admin_table tbody").empty();
			var menu = result.extend.pageInfo.list;
			var commercialTenant;
			var classify;
			var comeForm;
			$.each(menu,function(index,item){
				commercialTenant = item.commercialTenant;
				classify = item.classify;
				comeForm = item.channel;
				var checkBoxTd = $("<td><input type='checkbox' name='merchandiseId' value='"+item.merchandiseId+"' class='check_item'/></td>").css("padding-left","14px");
				var merchandiseId = $("<td style='display: none;'></td>").append(item.merchandiseId);
				var merchandiseName = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.merchandiseName).css("text-align","center");
				var merchandiseNumber = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.merchandiseNumber).css("text-align","center");
				var commercialTenantName;
				if(commercialTenant != null){
					commercialTenantName = $("<td style='text-align:center;vertical-align:middle;'></td>").append(commercialTenant.commercialTenantName).css("text-align","center");
				}else{
					commercialTenantName = $("<td style='text-align:center;vertical-align:middle;'></td>").append("-").css("text-align","center");
				}
				var merchandiseClassify;
				if(classify != null){
					merchandiseClassify = $("<td style='text-align:center;vertical-align:middle;'></td>").append(classify.merchandiseClassifyName).css("text-align","center");
				}else{
					merchandiseClassify = $("<td style='text-align:center;vertical-align:middle;'></td>").append("-").css("text-align","center");
				}
				//商品价格
				var merchandisePrice = $("<td style='text-align:center;vertical-align:middle;'></td>").append("￥"+item.merchandisePrice).css("text-align","center");
				//商品图片
				var merchandiseImage = $("<td style='text-align:center;vertical-align:middle;'></td>").append("<img src='"+item.merchandiseImageUrl+"' width='100px'/>").css("text-align","center");
				//商品来源
				var merchandiseInformationComefrom = item.merchandiseInformationComefrom;
				if (merchandiseInformationComefrom != null) {
					if (merchandiseInformationComefrom == 0) {
						merchandiseInformationComefrom = $("<td style='text-align:center;vertical-align:middle;'></td>").append("自上架").css("text-align","center");
					}else if(comeForm != null){
						merchandiseInformationComefrom = $("<td style='text-align:center;vertical-align:middle;'></td>").append(comeForm.channelName).css("text-align","center");
					}else{
						merchandiseInformationComefrom = $("<td style='text-align:center;vertical-align:middle;'></td>").append("-").css("text-align","center");
					}
				}else{
					merchandiseInformationComefrom = $("<td style='text-align:center;vertical-align:middle;'></td>").append("-").css("text-align","center");
				}
				//创建时间
				var merchandiseTime = $("<td style='text-align:center;vertical-align:middle;'></td>").append(timestampToDateTime(item.merchandiseTime)).css("text-align","center");
				if (item.merchandiseUploadTime == null) {
					var merchandiseUploadTime = $("<td style='text-align:center;vertical-align:middle;'></td>").append("-").css("text-align","center");
				}else{
					var merchandiseUploadTime = $("<td style='text-align:center;vertical-align:middle;'></td>").append(timestampToDateTime(item.merchandiseUploadTime)).css("text-align","center");
				}
				if (item.merchandiseUpdateTime == null) {
					var merchandiseUpdateTime = $("<td style='text-align:center;vertical-align:middle;'></td>").append("-").css("text-align","center");
				}else{
					var merchandiseUpdateTime = $("<td style='text-align:center;vertical-align:middle;'></td>").append(timestampToDateTime(item.merchandiseUpdateTime)).css("text-align","center");
				}
				
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前角色id
				editBtn.attr("edit-id",item.merchandiseId).attr("onclick","commodity_edit('商品编辑','/web/EditCommodity?id="+item.merchandiseId+"',"+item.merchandiseId+",'800','500')");
				
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的角色id
				delBtn.attr("del-id",item.merchandiseId).attr("status",item.merchandiseStatus);

				//判断是否上架
				var status = item.merchandiseStatus
				if(status == 1){
					var statusBtn =  $("<button></button>").addClass("btn btn-warning btn-sm status_btn").append($("<span></span>").addClass("glyphicon")).append("下架");
					statusBtn.attr("status-id",item.merchandiseId).attr("onclick","upload('"+item.merchandiseId+"','"+item.merchandiseStatus+"')");
				}else{
					var statusBtn =  $("<button></button>").addClass("btn btn-info btn-sm status_btn").append($("<span></span>").addClass("glyphicon")).append("上架");
					statusBtn.attr("status-id",item.merchandiseId).attr("onclick","upload('"+item.merchandiseId+"','"+item.merchandiseStatus+"')");
				}
				var btnTd = $("<td style='text-align:center;vertical-align:middle;'></td>").append(statusBtn).append(" ").append(editBtn).append(" ").append(delBtn).append(" ").css("width","160px");
				//var delBtn = 
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd)
					.append(merchandiseId)
					.append(merchandiseName)
					.append(merchandiseNumber)
					.append(commercialTenantName)
					.append(merchandiseClassify)
					.append(merchandisePrice)
					.append(merchandiseImage)
					.append(merchandiseInformationComefrom)
					.append(merchandiseTime)
					.append(merchandiseUploadTime)
					.append(merchandiseUpdateTime)
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

		
		
		//单个删除
		$(document).on("click",".delete_btn",function(){
			//1、弹出是否确认删除对话框
			
			var CommodityName = $(this).parents("tr").find("td:eq(2)").text();
			
			var id = $(this).attr("del-id");
			var status = $(this).attr("status");
			if (status == 1) {
				layer.msg('禁止删除已上架商品！',{icon:5,time:1000});
			}else{
				layer.confirm('确认要删除"'+CommodityName+'"吗？',function(index){
						//确认，发送ajax请求删除即可
						$.ajax({
							url:"${APP_PATH}/deleteMerchandise",
							type:"POST",
							data:{"merchandiseId":id,"merchandiseIds":null},
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
			}
		});
				

function datadel(){
	layer.confirm('确认要删除吗？',function(index){
		var checkBoxAll = $("input[name='merchandiseId']:checked");
		var ids = [];
		$.each(checkBoxAll,function(index,cc){
			var a = $(cc).val();
			ids.push(a);
		})
		//alert(ids);
			$.ajax({
				url:"${APP_PATH}/deleteMerchandise",
				type:"POST",
				data:{"merchandiseId":0,"merchandiseIds":ids},
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
	
}		

/*商品-增加*/
function commodity_add(title,url,w,h){
	layer_show(title,url,w,h);
}

/*商品-编辑*/
function commodity_edit(title,url,id,w,h){
	layer_show(title,url,w,h,id);
}
/* 上架  */
function upload(id,status){
		var s = 0;
		var ss;
		if(status == 0){
			s = 1;
			ss = "上架";
		}else{
			ss = "下架";
		}
	layer.confirm('确认要'+ss+'吗？',function(index){
		 $.ajax({
			type: 'POST',
			url: '${APP_PATH}/updateStatus',
			data:{"merchandiseId":id,"status":s},
			success: function(result){
				//var status = result.code;
				layer.msg(result.extend.msg,{icon:6,time:1000},function(){
					to_page(1);
				});
				
			},
		});	
	})
}


/* 时间格式 */
function timestampToDateTime(timestamp) {
	if(timestamp != null){
	    var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
	    Y = date.getFullYear() + '-';
	    M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
	    D = (date.getDate()< 10 ? '0'+ date.getDate(): date.getDate()) + ' ';
	    h = (date.getHours()< 10 ? '0'+ date.getHours(): date.getHours()) + ':';
	    m = (date.getMinutes()< 10 ? '0'+ date.getMinutes(): date.getMinutes());
	    s = (date.getSeconds()< 10 ? '0'+ date.getSeconds(): date.getSeconds());
	    return Y+M+D+h+m;
	}else{
		return "-";
	}
}
		//加载商品类型
		function getclassfiy(){
			$.ajax({
				url:"${APP_PATH}/getClassify",
				type:"POST",
				success:function(result){
					var list = result.object;
					//添加请选择
					var htmlStr = '<option style="text-align:center;"  value="">'+"---请选择---"+'</option>';
					$("#MerchandiseClassfiy").html(htmlStr);
		        	//var htmlStr = '';
		        	$.each(list,function(index,item){
		        		htmlStr += '<option style="text-align:center;" value="'+item.merchandiseClassifyId+'">'+item.merchandiseClassifyName+'</option>';
		        	});
		        	$("#MerchandiseClassfiy").html(htmlStr);
				}
			});
		}
	//加载商户名称
	function getCommerName(){
		//加载商户名称
		 $.ajax({
				url:"${APP_PATH}/getCommercialTenantName",
				type:"GET",
				success:function(result){
					var payment = result.extend.pageInfo;
		        	var htmlStr = '<option value="">---请选择---</option>';
		        	
		        	$.each(payment,function(index,item){
		        		htmlStr += '<option style="text-align:center;" value="'+item.commercialTenantId+'">'+item.commercialTenantName+'</option>';
		        	});
		        	$("#CommerName").html(htmlStr);
				}
			});
	}	
		function getChannelName(){
		 	//加载渠道
			 $.ajax({
					url:"${APP_PATH}/getAllChannel",
					type:"GET",
					success:function(result){
						var payment = result.extend.list;
			        	var htmlStr = '<option value="">---请选择---</option>';
			        	
			        	$.each(payment,function(index,item){
			        		htmlStr += '<option style="text-align:center;" value="'+item.channelId+'">'+item.channelName+'</option>';
			        	});
			        	$("#Channel").html(htmlStr);
					}
				});
		  	
		}	
			
			
		//按商品名称查找
		$("#MerchandiseName").change(function(){
			to_page(1);
		})
		//按商户名称查找
		$("#CommerName").change(function(){
			to_page(1);
		})
		//按最早时间查找
		$("#datemin").blur(function(){
			to_page(1);
		});
		//按最迟时间查找
		$("#datemax").blur(function(){
			to_page(1);
		});
		//按商品类型查找
		$("#MerchandiseClassfiy").change(function(){
			to_page(1);
		})
		//按上架状态
		$("#Status").change(function(){
			to_page(1);
		})
		//按商品来源
		$("#Channel").change(function(){
			to_page(1);
		})

		//导入商品
		$("#btn").click(function(){
			 $('#file').click();
		})
		
		 $(document).on('change', '#file', function () { 
			var file = $('#file').val(); 
			var obj = document.getElementById('file') ; 
			obj.outerHTML=obj.outerHTML; 
			 
			
			$.ajax({
				url:"${APP_PATH}/InportExcel",
				data:{"file":file},
				type:"POST",
				success:function(result){
					
				}
			}); 
			
		
			
		}) 

		
		
		//导出商品信息
		//导出信息

		function Merchandise_Export(){
			
			
			var serializeUrl = $("#merchandise_form").serialize();
           
			var url="${APP_PATH}/ExportMerchandiseMessage?"+serializeUrl+"";
			
			window.open(url);
			
		}

		

</script>
</body>
</html>