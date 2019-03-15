package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.Admin;
import com.py.bean.AdminAndRole;
import com.py.bean.Menu;
import com.py.bean.Role;
import com.py.bean.RoleMenu;
import com.py.service.AdminService;
import com.py.service.MenuService;
import com.py.service.RoleService;
import com.py.util.Msg;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	RoleService roleService;
	@Autowired
	MenuService menuService;
	
	
	
	
	/**
	 * 获取管理员信息
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @param content 搜索引擎
	 * @param request request
	 * @param response response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/getAdmin")
	@ResponseBody
	public Msg getAdmin(@RequestParam(value="pn",defaultValue="1")Integer pn,
						@RequestParam("content")String content,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		
		PageHelper.startPage(pn, 5);
		List<Admin> adminlist = adminService.selectByTimeAndContent(content,response);
		PageInfo<Admin> page = new PageInfo<>(adminlist,5);
		
		return Msg.success().add("pageInfo", page);
	}
	
	//检查用户是否存在
	@RequestMapping("/checkAdmin")
	@ResponseBody
	public Msg checkAdmin(@RequestParam("adminname")String adminname){
		
		Admin admin = new Admin();
		admin.setAdminAccount(adminname);
		Admin a = adminService.checkAdmin(admin);
		if (a != null) {
			return Msg.fail();
		}else{
			return Msg.success();
		}
	}
	
	
	/**
	 * 保存admin
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveAdmin")
	@ResponseBody
	public Msg saveAdmin(HttpServletRequest request){
		int a= adminService.saveAdmin(request);
		return Msg.success().add("msg", a);
	}
	
	/**
	 * 修改admin
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateAdmin")
	@ResponseBody
	public Msg updateAdmin(HttpServletRequest request){
		String pwd = request.getParameter("password");
		if (pwd.equals("") || pwd.equals(null)) {
			return Msg.fail().add("msg", "密码不能为空！");
		}
		
		int a = adminService.updateAdmin(request);
		if (a == 1) {
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	
	/**
	 * 保存管理员角色关联关系
	 * @param adminId
	 * @param roleId
	 * @return
	 */
	@RequestMapping("/saveAdminRole")//adminId
	@ResponseBody
	public Msg saveAdminRole(@RequestParam("adminId")Integer adminId,@RequestParam("roleId")Integer roleId){
		adminService.saveAdminRole(adminId,roleId);
		return Msg.success();
	}
	
	
	//删除管理员
		@RequestMapping("/deleteAdmin")
		@ResponseBody
		public Msg deleteAdmin(@RequestParam("AdminId")Integer AdminId, @RequestParam("AdminIds")String[] AdminIds ){
			return adminService.deleteAdmin(AdminId,AdminIds);
		}
		
	/***
	 * 根据Id获取管理员信息
	 * @param adminId
	 * @return
	 */
	@RequestMapping("/getAdminByAdminId")
	@ResponseBody
	public Msg  getAdminByAdminId(@RequestParam("adminId")Integer adminId){
		Admin admin = adminService.selectByPrimaryKey(adminId);
		return Msg.success().add("admin", admin);
	}
			
	/***
	 * 根据Id获取管理员角色关联信息
	 * @param adminId
	 * @return
	 */
	@RequestMapping("/getAdminRoleByAdminId")
	@ResponseBody
	public Msg  getAdminRoleByAdminId(@RequestParam("adminId")Integer adminId){
		
		Admin admin = new Admin();
		admin.setAdminId(adminId);
		List<Admin> list = adminService.selectAdminAndRole(admin);
		
		return Msg.success().add("list", list);
	}
			
		
		
	
	
	
	/*******************************************************   角色管理    ************************************************************/

	/**
	 * 获取角色
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/getRole")
	@ResponseBody
	public Msg getRole(Model model, HttpServletRequest request){
		Role role = new Role();
		//List<AdminAndRole> aa = roleService.selectAdminAndRole();
		Msg msg = roleService.selectByExample(role);
		
		return msg;
	}
	//检查角色名称
	@RequestMapping("/checkRoleName")
	@ResponseBody
	public Msg checkRoleName(@RequestParam("roleName")String roleName, HttpServletRequest request){
		Role role = new Role();
		if (!roleName.equals("") && !roleName.equals(null) && !roleName.equals(" ")) {
			role.setRoleName(roleName);
		}
		Msg msg = roleService.checkAdmin(role);
		
		return msg;
	}
	
	//保存角色
	@RequestMapping("/saveRole")
	@ResponseBody
	public Msg saveRole(HttpServletRequest request){
		Msg msg = roleService.saveRole(request);
		return msg;
	}
	
	//根据Id查找角色
	@RequestMapping("/getRoleById")
	@ResponseBody
	public Msg getRoleById(@RequestParam("roleId")Integer roleId,HttpServletRequest request){
		
		Msg msg = roleService.getRoleById(roleId);
		List<RoleMenu> rm = roleService.selectRoleAndMenu(roleId);
		
		return msg.add("menu", rm);
	}
	
	//修改角色
	@RequestMapping("/updateRole")
	@ResponseBody
	public Msg updateRole(HttpServletRequest request){
		
		Msg msg = roleService.updateRole(request);
		
		return msg;
	}
	
	//删除角色
	@RequestMapping("/deleteRole")
	@ResponseBody
	public Msg delectRole(@RequestParam("roleId")Integer roleId,HttpServletRequest request){
		
		int a = roleService.deleteByPrimaryKey(roleId,request);
		
		
		return Msg.success().add("status", a);
	}
	
	
	
	
	
	
	
	
	/*******************************************************   菜单管理    ************************************************************/

	@RequestMapping("/getMenu")
	@ResponseBody
	public Msg getMenu(Model model){
		Menu menu = new Menu();
		Msg msg = menuService.selectByExample(menu);
		
		return msg;
	}
	
	
	
	
	/*******************************************************   用户角色关联    ************************************************************/
	

	@RequestMapping("/getRoleAdmin")
	@ResponseBody
	public Msg getRoleAdmin(@RequestParam("roleId")Integer roleId,@RequestParam("adminId")Integer adminId,Model model, HttpServletRequest request){
		
		Role role = new Role();
		Admin admin = new Admin();
		List<AdminAndRole> aa = null;
		if (roleId != null) {
			role.setRoleId(roleId);
			aa = roleService.selectAdminByRoleId(role);
		}else if(adminId != null){
			admin.setAdminId(adminId);
			aa = roleService.selectAdminByAdminId(admin);
		}
		
		return Msg.success().add("admin", aa);
	}
	/**
	 * 获取所有运营人员
	 * @return
	 */
	@RequestMapping("/getOperaAdmin")
	@ResponseBody
	public Msg getOperaAdmin(){
		
		Admin admin = new Admin();
		List<Admin> alist = adminService.selectOperaByExample(admin);
		
		return Msg.success().add("list", alist);
	}
	

}
