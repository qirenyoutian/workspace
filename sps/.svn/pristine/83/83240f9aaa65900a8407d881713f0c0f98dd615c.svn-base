package com.py.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.py.bean.Admin;
import com.py.bean.AdminRole;
import com.py.service.AdminRoleService;
import com.py.util.Msg;

@Controller
public class AdminRoleController {
	@Autowired
	AdminRoleService adminRoleService;
	/**
	 * 分配用户角色
	 */
	@RequestMapping(value="/updateAdminRole",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateAdminRole(@Valid Admin admin,HttpServletRequest reqest){
		AdminRole adminrole = new AdminRole();
		adminrole.setAdminRoleAdminId(admin.getAdminId());
		AdminRole ar = adminRoleService.selectByPrimary(adminrole);
		String roleId = reqest.getParameter("roleId");
		ar.setAdminRoleRoleId(Integer.parseInt(roleId));
		int result = adminRoleService.updateByPrimaryKeySelective(ar);
		if(result != 0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
}
