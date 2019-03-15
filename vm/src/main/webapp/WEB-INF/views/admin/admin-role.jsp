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

<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/page/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/login/css/style.css" />

<title>角色管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 
	<span class="c-gray en">&gt;</span> 角色管理 
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" >
		<i class="Hui-iconfont">&#xe68f;</i>
	</a>
</nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray"> <span class="l"> <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
		<i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		<a class="btn btn-primary radius" href="javascript:;" onclick="admin_role_add('添加角色','/web/addRole','800','500')">
		<i class="Hui-iconfont">&#xe600;</i> 添加角色</a> </span> 
		<!-- <span class="r">共有数据：<strong>54</strong> 条</span>  -->
	</div>
	<table id="role_table" class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="6">角色管理</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" value="" name=""></th>
				<th width="200">角色名</th>
				<th>用户列表</th>
				<th>描述</th>
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
<script type="text/javascript" src="${APP_PATH }/static/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	$(function(){
	  	//去首页
		to_page();
	});
/**
 * 首页
 */
	function to_page(){
		$.ajax({
			url:"${APP_PATH}/getRole",
			type:"GET",
			success:function(result){
				//1、解析并显示角色数据
				build_roles_table(result);
			}
		});
	}
	/*
	显示数据
	*/
	function build_roles_table(result){
		//清空table表格
		var a =$("#role_table tbody").empty();
		var roleList = result.extend.list;
		var role = result.extend.role;
		$.each(role,function(index,r){
				var checkBoxTd = $("<td><input type='checkbox' name='roleId' value="+r.roleId+" class='check_item'/></td>").css("padding-left","14px");
				var roleId = $("<td style='display: none;'></td>").append(r.roleId);
				var AdminName = $("<td></td>").css("text-align","center");
				if (roleId != null) {
					$.ajax({
						url:"${APP_PATH}/getRoleAdmin",
						type:"GET",
						async:false,
						data:{"roleId":r.roleId,"adminId":null},
						success:function(result){
							var admin = result.extend.admin;
									var to = "";
							$.each(admin,function(index,a){
								$.each(a.adminlist,function(index,b){
									if(to == ""){
										to = b.adminAccount;
									}else{
										to = "&nbsp;,&nbsp;"+b.adminAccount;
									}
										AdminName.append(to);
							})
							})
						}
					});
				}	
				
				
				
				var roleName = $("<td></td>").append(r.roleName).css("text-align","center");
				var roleDetail = $("<td></td>").append(r.roleDetail).css("text-align","center");
				
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前角色id
				editBtn.attr("edit-id",r.roleId).attr("onclick","admin_role_edit('角色编辑','/web/EditRole?id="+r.roleId+"',"+r.roleId+",'800','500')");
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除的角色id
				delBtn.attr("onclick","admin_role_del('"+r.roleId+"')");
	
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn).append(" ").css("width","130px");
				//var delBtn = 
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(checkBoxTd)
					.append(roleId)
					.append(roleName)
					.append(AdminName)
					.append(roleDetail)
					.append(btnTd)
					.appendTo("#role_table tbody");
			
		});
	}







/*管理员-角色-添加*/
function admin_role_add(title,url,w,h){
	layer_show(title,url,w,h);
}



/*管理员-角色-编辑*/
function admin_role_edit(title,url,id,w,h){
	layer_show(title,url,w,h,id);

}


/*管理员-角色-删除*/
function admin_role_del(id){
	layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '${APP_PATH}/deleteRole',
			data:{"roleId":id,"roleIds":""},
			success: function(result){
				var status = result.extend.status;
					if(status == 1){
						layer.msg('已删除!',{icon:6,time:1000},function(){
							to_page(1);
						});
					}else if(status == 0){
						layer.msg('该角色还有用户，请先清除改角色下的用户！',{icon:5,time:1000});
					}else{
						layer.msg('删除失败！',{icon:5,time:1000});
					}
				
			},
		});		
	});
}

function datadel(){
	layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
		var checkBoxAll = $("input[name='roleId']:checked");
		var ids = [];
		$.each(checkBoxAll,function(index,cc){
			var a = $(cc).val();
			ids.push(a);
		})
			 	 $.ajax({
					type: 'POST',
					url: '${APP_PATH}/deleteRole',
					data:{"roleId":0,"roleIds":ids},
					traditional:true,
					success: function(result){
						var status = result.extend.status;
							if(status == 1){
								layer.msg('已删除!',{icon:6,time:1000},function(){
									to_page(1);
								});
							}else if(status == 0){
								layer.msg('该角色还有用户，请先清除改角色下的用户！',{icon:5,time:1000});
							}else{
								layer.msg('删除失败！',{icon:5,time:1000});
							}
						
					},
				});	  
		    }) 
}








</script>
</body>
</html>