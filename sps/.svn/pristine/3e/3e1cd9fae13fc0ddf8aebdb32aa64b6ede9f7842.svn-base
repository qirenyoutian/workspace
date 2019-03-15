package com.py.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	/**
	 * 跳转到用户页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpLogin")
	public String jumpLogin(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		return "page/login";
	}
	/**
	 * 跳转到主页
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpIndex")
	public String jumpIndex(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
		String roleName = (String) session.getAttribute("roleName");
		if(roleName == null){
			return "page/login";
		}
		return "page/index";
	}
}
