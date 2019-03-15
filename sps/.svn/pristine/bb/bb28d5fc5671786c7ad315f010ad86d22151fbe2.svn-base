package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.AdminRole;
import com.py.bean.Role;
import com.py.bean.RoleMenu;
import com.py.service.AdminRoleService;
import com.py.service.RoleMenuService;
import com.py.service.RoleService;
import com.py.util.Msg;

@Controller
public class RoleController {
	@Autowired
	RoleService roleService;
	@Autowired
	AdminRoleService adminRoleService;
	@Autowired
	RoleMenuService roleMenuService;
	/**
	 * 跳转到角色页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpRole")
	public String jumpRole(Model model){
		return "role/role";
	}
	/**
	 * 查询全部角色
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getRoleAll")
	@ResponseBody
	public Msg getRoleAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String content,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		byte[] b = content.getBytes("ISO-8859-1");//用tomcat的格式（iso-8859-1）方式去读。
		String string = new String(b,"utf-8");//采用utf-8去接string
		response.setContentType("text/html;charset=utf-8");//设置页面的字符编码
		PageHelper.startPage(pn, 10);
		Role role = new Role();
		if(!string.equals(null) && !string.equals("") && !string.equals(" ")){
			role.setRoleName(string);
		}
		List<Role> rolelist = roleService.selectByExample(role);
		PageInfo<Role> page = new PageInfo<Role>(rolelist, 5);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 查询全部角色
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/getRole/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getRole(@PathVariable("id")Integer id) throws UnsupportedEncodingException {
		AdminRole adminRole = new AdminRole();
		adminRole.setAdminRoleAdminId(id);
		AdminRole ar  = adminRoleService.selectByPrimary(adminRole);
		List<Role> RoleList = roleService.selectByExample(new Role());
		for (int i = 0; i < RoleList.size(); i++) {
			if(RoleList.get(i).getRoleId() == ar.getAdminRoleRoleId()){
				RoleList.get(i).setYn(1);
			}
		}
		return Msg.success().add("RoleList", RoleList);
	}
	/**
	 * 查询全部角色
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getRole")
	@ResponseBody
	public Msg getRole(){
		List<Role> rolelist = roleService.selectByExample(new Role());
		return Msg.success().add("rolelist", rolelist);
	}
	/**
	 * 添加
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 */
	@RequestMapping(value="/saveRole",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveRole(@Valid Role role,BindingResult result,HttpServletRequest request){
		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			if(role.getRoleName() == null || "".equals(role.getRoleName().trim())) {
				return Msg.fail().add("msg", "角色名称不能为空");
			}
			Role record = new Role();
			record.setRoleName(role.getRoleName());
			Role selectByPrimary = roleService.selectByPrimary(record);
			if(selectByPrimary != null) {
				return Msg.fail().add("msg", "已存在该角色");
			}
			int result1 = roleService.insert(role);
			if(result1 != 0){
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
	}
	/**
	 * 根据id查询单列
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getRoleById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getRoleById(@PathVariable("id")Integer id){
		Role role = new Role();
		role.setRoleId(id);
		Role r = roleService.selectByPrimary(role);
		if(r != null){
			return Msg.success().add("role", r);
		}else{
			return Msg.fail().add("va_msg", "未找到该角色信息");
		}
	}
	/**
	 * 检查角色名称是否可用
	 */
	@ResponseBody
	@RequestMapping(value="/checkRoleName",method=RequestMethod.POST)
	public Msg checkRoleName(@RequestParam("roleName")String roleName){
		if(roleName == null || "".equals(roleName.trim())) {
			return Msg.fail().add("va_msg", "角色名称不能为空");
		}
		Role role = new Role();
		role.setRoleName(roleName);
		Role r = roleService.selectByPrimary(role);
		if(r == null){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "角色名称已存在,不能重复");
		}
	}
	/**
	 * 更新
	 */
	@ResponseBody
	@RequestMapping(value="/updateRole/{id}",method=RequestMethod.PUT)
	public Msg updateByMenu(@Valid Role role,HttpServletRequest request){
		if(role.getRoleName() == null || "".equals(role.getRoleName().trim())) {
			return Msg.fail().add("msg", "角色名称不能为空");
		}
		Role record = new Role();
		record.setRoleName(role.getRoleName());
		record = roleService.selectByPrimary(record);
		if(record != null){
			return Msg.fail().add("msg", "角色名称已存在,不能重复");
		}
		
		int result = roleService.updateByPrimaryKeySelective(role);
		if(result != 0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	/**
	 * 单个批量二合一
	 * 批量删除：1-2-3
	 * 单个删除：1
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteRole/{ids}",method=RequestMethod.DELETE)
	public Msg deleteByMenu(@PathVariable("ids")String ids){
		AdminRole adminrole = new AdminRole();
		
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (int i = 0; i < str_ids.length; i++) {
				Integer id = Integer.parseInt(str_ids[i]);
				//判断是否有用户
				adminrole.setAdminRoleRoleId(id);
				AdminRole ars = adminRoleService.selectByPrimary(adminrole);
				//没有用户
				if (ars != null && !ars.equals(null)) {
					return Msg.fail().add("va_msg", "对应权限下还有用户，请先删除对应的用户");
				}else{
					String reString = this.delete(id);
					if(!reString.equals("成功")){
						return Msg.fail().add("va_msg", reString);
					}else{
						int re = roleService.deleteByPrimaryKey(id);
						if(re == 0){
							return Msg.fail().add("va_msg", reString);
						}
					}
				}
			}
		}else{
			Integer id = Integer.parseInt(ids);
			adminrole.setAdminRoleRoleId(id);
			AdminRole ars = adminRoleService.selectByPrimary(adminrole);
			if (ars == null) {
				String reString = this.delete(id);
				if(!reString.equals("成功")){
					return Msg.fail().add("va_msg", reString);
				}else{
					int re = roleService.deleteByPrimaryKey(id);
					if(re != 0){
						return Msg.success().add("va_msg", "处理成功");
					}else{
						return Msg.fail().add("va_msg", reString);
					}
				}
			}else{
				return Msg.fail().add("va_msg", "对应权限下还有用户，请先删除对应的用户");
			}
		}
		return Msg.success().add("va_msg", "处理成功");
	}
	
	public String delete(int id){
		//删除用户角色表
		AdminRole AdminRole = new AdminRole();
		AdminRole.setAdminRoleRoleId(id);
		List<AdminRole> AdminRoleList = adminRoleService.selectByExample(AdminRole);
		Role role = new Role();
		role.setRoleName("默认角色");
		Role r = roleService.selectByPrimary(role);
		if(r != null){
			if(AdminRoleList.size() > 0){
				for (int i = 0; i < AdminRoleList.size(); i++) {
					AdminRoleList.get(i).setAdminRoleRoleId(r.getRoleId());
					int result =adminRoleService.updateByPrimaryKeySelective(AdminRoleList.get(i));
					if(result == 0){
						return "修改用户角色数据失败";
					}
				}
			}
		}else{
			return "查询默认角色数据失败";
		}
		//删除角色菜单表
		RoleMenu RoleMenu = new RoleMenu();
		RoleMenu.setRoleMenuRoleId(id);
		List<RoleMenu> RoleMenuList = roleMenuService.selectByExample(RoleMenu);
		if(RoleMenuList.size() > 0){
			for (int j = 0; j < RoleMenuList.size(); j++) {
				int result = roleMenuService.deleteByPrimaryKey(RoleMenuList.get(j).getRoleMenuId());
				if(result == 0){
					return "删除角色菜单数据失败";
				}
			}
		}
		return "成功";
	}
}
