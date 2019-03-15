package com.py.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.py.bean.Admin;
import com.py.service.AdminService;
import com.py.util.MD5;
import com.py.util.Msg;

@Controller
public class AdminLoginController {
	@Autowired
	AdminService adminService;
	
	
	@RequestMapping("/jumpLogin")
	public String jumpLogin(Model model,HttpServletRequest request){
		
		return "page/login";
	}
	
	/**
	 * 登陆
	 * @param adminAccount
	 * @param adminPassWord
	 * @return
	 */
	@RequestMapping("/Login")
	@ResponseBody
	public Msg Login(@RequestParam("adminAccount")String adminAccount,
			@RequestParam("adminPassWord")String adminPassWord,
			HttpServletRequest request){
		Admin admin = new Admin();
		if (!adminAccount.equals("") && !adminAccount.equals(" ") && !adminAccount.equals(null)){
			admin.setAdminAccount(adminAccount);
		}else{
			return Msg.fail().add("msg", "账号不能为空！");
		}
		if (!adminPassWord.equals("") && !adminPassWord.equals(" ") && !adminPassWord.equals(null)){
			String pwd = MD5.string2MD5(adminPassWord);
			admin.setAdminPassword(pwd);
		}else{
			return Msg.fail().add("msg", "密码不能为空！");
		}
		Msg msg =  adminService.selectByPrimary(admin,request);
		
		return msg;
	}
	/**
	 * 退出
	*/
	@RequestMapping("/LoginOut")
	@ResponseBody
	public Msg LoginOut(HttpServletRequest request){
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return Msg.success().add("msg", "退出成功！");
	}
	
	
	

}
