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

<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>数据字典</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	系统管理
	<span class="c-gray en">&gt;</span>
	数据字典
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<div class="text-c"> 
		表名:
		<span style="padding-left: 10px;">
			<select style="width:120px;height:32px;border-radius:5px;" id="selectDictionary" name="dictionary">
				<option value="0">----请选择----</option>
				<option value="1">渠道样式</option>
				<option value="2">支付方式</option>
				<option value="3">商品分类</option>
			</select>
		</span>
		字典名称:
		<input type="text" class="input-text" id="DictionaryName" name="DictionaryName" style="width:150px">
		<button type="submit" class="btn btn-primary radius" id="addDictionary" name=""><i class="Hui-iconfont">&#xe600;</i> 添加字典值</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20">
	</div>
	<table id="admin_table" class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="9">字典列表</th>
			</tr>
			<tr class="text-c">
				<th>属性名称</th>
				<th>字段名称</th>
				<th>所属表</th>
				<th>创建时间</th>
				<th>修改时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
		
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
	$(function(){
	  	//去首页
		to_page();
	});
	
	
	/**
	* 首页
	*/
	function to_page(){
		var id = $("#selectDictionary").val();
		//alert(id);
		$.ajax({
			url:"${APP_PATH}/getAllDictionary",
			data:{"style":id},
			type:"GET",
			success:function(result){
				build_roles_table(result);
			}
		}); 
	}
	
	
	//时间格式转换
	function timestampToDateTime(timestamp) {
	        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
	        Y = date.getFullYear() + '-';
	        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
	        D = (date.getDate()< 10 ? '0'+ date.getDate(): date.getDate()) + ' ';
	        h = (date.getHours()< 10 ? '0'+ date.getHours(): date.getHours()) + ':';
	        m = (date.getMinutes()< 10 ? '0'+ date.getMinutes(): date.getMinutes()) + ':';
	        s = (date.getSeconds()< 10 ? '0'+ date.getSeconds(): date.getSeconds());
	        return Y+M+D+h+m+s;
	    }
	
	
	//显示数据
	function build_roles_table(result){
		//清空table表格
		$("#admin_table tbody").empty();
			var menu = result.extend.list;
			
			var dictionaries = menu.dictionaries;
			var merchandiseClassifies = menu.merchandiseClassifies;
			var payMents = menu.payMents;
			if (dictionaries != null) {
				$.each(dictionaries,function(index,item){
					
					var ddId = $("<td style='display: none;'></td>").append(item.dictionaryId);
					var name = $("<td></td>").append(item.dictionaryValue).css("text-align","center");
					var createTime = $("<td></td>").append(timestampToDateTime(item.dictionaryTime)).css("text-align","center");
					var updateTime = $("<td></td>").append("-").css("text-align","center");
					var field = $("<td></td>").append("merchandise_name").css("text-align","center");
					var tableName = $("<td></td>").append("merchandise").css("text-align","center");
					
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon")).append("编辑");
					editBtn.attr("onclick","point_edit('"+item.dictionaryId+"')");
					
					var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon")).append("删除");
					delBtn.attr("onclick","del('"+item.dictionaryId+"','"+item.dictionaryValue+"')");
					
					var btnTd = $("<td></td>").append(delBtn).append(" ").css("width","50px");
					
					
					$("<tr></tr>").append(ddId)
					.append(name)
					.append(field)
					.append(tableName)
					.append(createTime)
					.append(updateTime)
					.append(btnTd)
					.appendTo("#admin_table tbody");
					
				})
				
			}
			if (merchandiseClassifies != null) {
				$.each(merchandiseClassifies,function(index,item){
					
					var ddId = $("<td style='display: none;'></td>").append(item.merchandiseClassifyId);
					var name = $("<td></td>").append(item.merchandiseClassifyName).css("text-align","center");
					var createTime = $("<td></td>").append(timestampToDateTime(item.merchandiseClassifyTime)).css("text-align","center");
					var updateTime = $("<td></td>").append(timestampToDateTime(item.merchandiseClassifyUpdateTime)).css("text-align","center");
					var field = $("<td></td>").append("dictionary_classify_name").css("text-align","center");
					var tableName = $("<td></td>").append("dictionary_classify").css("text-align","center");
					
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon")).append("编辑");
					editBtn.attr("onclick","point_edit('"+item.dictionaryClassifyId+"')");
					
					var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon")).append("删除");
					delBtn.attr("onclick","del('"+item.merchandiseClassifyId+"','"+item.merchandiseClassifyName+"')");
					
					var btnTd = $("<td></td>").append(delBtn).append(" ").css("width","50px");
					
					
					$("<tr></tr>").append(ddId)
					.append(name)
					.append(field)
					.append(tableName)
					.append(createTime)
					.append(updateTime)
					.append(btnTd)
					.appendTo("#admin_table tbody");
					
				})
			}
			if (payMents != null) {
				$.each(payMents,function(index,item){
					
					var ddId = $("<td style='display: none;'></td>").append(item.paymentId);
					var name = $("<td></td>").append(item.paymentName).css("text-align","center");
					var createTime = $("<td></td>").append(timestampToDateTime(item.paymentCreateTime)).css("text-align","center");
					var updateTime = $("<td></td>").append(timestampToDateTime(item.paymentUpdateTime)).css("text-align","center");
					var field = $("<td></td>").append("payment_name").css("text-align","center");
					var tableName = $("<td></td>").append("payment").css("text-align","center");
					
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon")).append("编辑");
					editBtn.attr("onclick","point_edit('"+item.dictionaryClassifyId+"')");
					
					var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon")).append("删除");
					delBtn.attr("onclick","del('"+item.paymentId+"','"+item.paymentName+"')");
					
					var btnTd = $("<td></td>").append(delBtn).append(" ").css("width","50px");
					
					
					$("<tr></tr>").append(ddId)
					.append(name)
					.append(field)
					.append(tableName)
					.append(createTime)
					.append(updateTime)
					.append(btnTd)
					.appendTo("#admin_table tbody");
					
				})
			}
	}
	
	//分类查找
	$("#selectDictionary").change(function(){
		var a = $(this).val();
		to_page();
	})
	
	//添加字典信息
	$("#addDictionary").click(function(){
		var style = $("#selectDictionary").val();
		var dictionaryName = $("#DictionaryName").val();
		
		$.ajax({
			url:"${APP_PATH}/addDictionary",
			data:{"style":style,"dictionaryName":dictionaryName},
			type:"POST",
			success:function(result){
				var status = result.code;
				if(status == 100){
					layer.msg(result.extend.msg,{icon:6,time:1000},function(){
						$("#DictionaryName").val("");
						to_page();
					});
				}else{
					layer.msg(result.extend.msg,{icon:5,time:1000});
				}
			}
		}); 
		
		
	})
	
	function del(id,name){
		
		//alert(name);
		layer.confirm('确认要删除吗？',function(index){
			
			$.ajax({
				url:"${APP_PATH}/delDictionary",
				data:{"id":id,"name":name},
				type:"POST",
				success:function(result){
					var status = result.code;
					if(status == 100){
						layer.msg(result.extend.msg,{icon:6,time:1000},function(){
							to_page();
						});
					}else{
						layer.msg(result.extend.msg,{icon:5,time:1000});
					}
				}
			}); 
		})
	}
	
	
	
	
</script>
</body>
</html>