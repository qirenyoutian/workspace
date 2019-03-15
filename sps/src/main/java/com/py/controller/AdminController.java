package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import com.py.bean.Admin;
import com.py.bean.AdminGrouping;
import com.py.bean.AdminRole;
import com.py.bean.Grouping;
import com.py.bean.Role;
import com.py.service.AdminGroupingService;
import com.py.service.AdminRoleService;
import com.py.service.AdminService;
import com.py.service.GroupingService;
import com.py.service.RoleService;
import com.py.util.Msg;
import com.py.util.OfTime;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	AdminRoleService adminRoleService;
	@Autowired
	RoleService roleService;
	@Autowired
	GroupingService groupingService;
	@Autowired
	AdminGroupingService adminGroupingService;
	/**
	 * 跳转到管理员页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpAdmin")
	public String jumpAdmin(Model model){
		return "admin/admin";//跳转页面
	}
	/**
	 * 管理员登录
	 * @param model
	 * @return
	 * @throws ParseException 
	 */
	@ResponseBody
	@RequestMapping(value="/loginAdmin",method=RequestMethod.POST)
	public Msg loginAdmin(@RequestParam("account")String account,@RequestParam("password")String password,HttpServletRequest request){
		AdminRole adminRole = new AdminRole();
		Admin admin = new Admin();
		//如果传进来的参数不是空值
		if (account != null) {
			//存进bean
			admin.setAdminAccount(account);
		}else{
			//否则输出不能为空
			return Msg.fail().add("va_msg", "账号不能为空");
		}//如果传入密码不为空
		if (password != null) {
			admin.setAdminPassWord(password);
		}else{
			return Msg.fail().add("va_msg", "密码不能为空");
		}
		adminRole.setAdminRoleAdmin(admin);
		AdminRole ar = adminRoleService.selectByPrimary(adminRole);
		if(ar != null && ar.getAdminRoleAdmin() != null){
			if(!ar.getAdminRoleRole().getRoleName().equals("路巡人员")){
				HttpSession session = request.getSession();
	            session.setAttribute("Admin", ar.getAdminRoleAdmin());
	            session.setAttribute("roleName", ar.getAdminRoleRole().getRoleName());
	            session.setAttribute("roleId", ar.getAdminRoleRole().getRoleId());
	            return Msg.success();
			}else{
				return Msg.fail().add("va_msg", "没有对应权限。");
			}
			/*AdminRole adminRole = new AdminRole();
			adminRole.setAdminRoleAdminId(a.getAdminId());
			AdminRole ar = adminRoleService.selectByPrimary(adminRole);
			if(!ar.getAdminRoleRole().getRoleName().equals("路巡工作人员")){
				HttpSession session = request.getSession();
	            session.setAttribute("Admin", a);
	            session.setAttribute("roleName", ar.getAdminRoleRole().getRoleName());
	            session.setAttribute("roleId", ar.getAdminRoleRole().getRoleId());
	            return Msg.success();
			}else{
				return Msg.fail().add("va_msg", "没有对应权限。");
			}*/
		}else{
			return Msg.fail().add("va_msg", "账号或密码错误");
		}
	}
	/**
	 * 查询全部系统用户
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getAdminAll")
	@ResponseBody
	public Msg getAdminAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String roleType,String adminAccount,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		byte[] b = adminAccount.getBytes("ISO-8859-1");//用tomcat的格式（iso-8859-1）方式去读。
		String string = new String(b,"utf-8");//采用utf-8去接string
		response.setContentType("text/html;charset=utf-8");//设置页面的字符编码
		PageHelper.startPage(pn, 10);
		Admin admin = new Admin();
		Role role = new Role();
		AdminRole adminRole = new AdminRole();
		if(!string.equals(null) && !string.equals("") && !string.equals(" ")){
			admin.setAdminAccount(string);
		}
		if(Integer.parseInt(roleType) != 0){
			role.setRoleId(Integer.parseInt(roleType));
		}
		adminRole.setAdminRoleAdmin(admin);
		adminRole.setAdminRoleRole(role);
		List<AdminRole> adminRoleList = adminRoleService.selectByExample(adminRole);
		PageInfo<AdminRole> page = new PageInfo<AdminRole>(adminRoleList, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * 添加
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 */
	@RequestMapping(value="/saveAdmin",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveAdmin(@Valid Admin admin,BindingResult result,HttpServletRequest request){
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
			Admin record = new Admin();
			record.setAdminAccount(admin.getAdminAccount());
			Admin findAdmin = adminService.selectByPrimary(record);
			if(findAdmin != null) {
				return Msg.fail().add("msg", "该账号已存在");
			}
			admin.setAdminCreationTime(OfTime.getLongTime());
			int result1 = adminService.insertSelective(admin);
			Admin a = adminService.selectByPrimary(admin);
			if(result1 != 0){
				//添加默认角色
				AdminRole adminRole = new AdminRole();
				adminRole.setAdminRoleAdminId(a.getAdminId());
				Role role = new Role();
				role.setRoleName("默认角色");
				adminRole.setAdminRoleRoleId(roleService.selectByPrimary(role).getRoleId());
				int result2 = adminRoleService.insertSelective(adminRole);
				if(result2 != 0){
					Grouping grouping = new Grouping();
					grouping.setGroupingName("默认分组");
					Grouping g = groupingService.selectByPrimary(grouping);
					AdminGrouping adminGrouping = new AdminGrouping();
					adminGrouping.setAdminGroupingAdminId(a.getAdminId());
					adminGrouping.setAdminGroupingGroupingId(g.getGroupingId());
					adminGrouping.setAdminGroupingJoinTime(OfTime.getLongTime());
					try {
						int result3 = adminGroupingService.insertSelective(adminGrouping);
						if(result3 != 0){
							return Msg.success();
						}else{
							return Msg.fail();
						}
					} catch (Exception e) {
						return Msg.fail();
					}
				}else{
					return Msg.fail();
				}
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
	@RequestMapping(value="/getAdminById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getAdminById(@PathVariable("id")Integer id){
		Admin admin = new Admin();
		admin.setAdminId(id);
		Admin a = adminService.selectByPrimary(admin);
		if(a != null){
			return Msg.success().add("admin", a);
		}else{
			return Msg.fail().add("va_msg", "未找到该管理员信息");
		}
	}
	
	
	/**
	 * 检查管理员账号是否可用
	 */
	@ResponseBody
	@RequestMapping(value="/checkAdminAccount",method=RequestMethod.POST)
	public Msg checkAdminAccount(@RequestParam("adminAccount")String adminAccount){
 		Admin admin = new Admin();
 		admin.setAdminAccount(adminAccount);
 		Admin a = adminService.selectByPrimary(admin);
		if(a == null){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "管理员账号已存在,不能重复");
		}
	}
	
	/**
	 * 更新
	 */
	@ResponseBody
	@RequestMapping(value="/updateAdmin/{id}",method=RequestMethod.PUT)
	public Msg updateAdmin(@Valid Admin admin){
		int result = adminService.updateByPrimaryKeySelective(admin);
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
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteAdmin/{ids}",method=RequestMethod.DELETE)
	public Msg deleteAdmin(@PathVariable("ids")String ids,HttpSession session){
		Admin admin = (Admin) session.getAttribute("Admin");
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (int i = 0; i < str_ids.length; i++) {
				if(admin.getAdminId() != i) {
					Integer id = Integer.parseInt(str_ids[i]);
					String reString = this.delete(id);
					if(!reString.equals("成功")){
						return Msg.fail();
					}else{
						int re = adminService.deleteByPrimaryKey(id);
						if(re == 0){
							return Msg.fail();
						}
					}
				}
			}
		}else{
			Integer id = Integer.parseInt(ids);
			if(admin.getAdminId() != id) {
				String reString = this.delete(id);
				if(!reString.equals("成功")){
					return Msg.fail().add("va_vag", "删除失败！");
				}else{
					int re = adminService.deleteByPrimaryKey(id);
					if(re != 0){
						return Msg.success().add("va_vag", "删除成功！");
					}else{
						return Msg.fail().add("va_vag", "删除失败！");
					}
				}
			}else {
				return Msg.fail().add("va_vag", "请勿删除登录账号！");
			}
		}
		return Msg.success().add("va_vag", "删除成功！");
	}
	public String delete(int id){
		//删除用户角色表
		AdminRole adminRole = new AdminRole();
		adminRole.setAdminRoleAdminId(id);
		AdminRole ar = adminRoleService.selectByPrimary(adminRole);
		if(ar != null){
			int result = adminRoleService.deleteByPrimaryKey(ar.getAdminRoleId());
			if(result != 0){
				return "成功";
			}else{
				return "删除用户角色数据失败";
			}
		}
		return "成功";
	}
}
