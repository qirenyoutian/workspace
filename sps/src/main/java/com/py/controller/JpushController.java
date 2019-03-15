package com.py.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JpushController {
	/**
	 * 跳转到消息推广页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpJpush")
	public String jumpJpush(Model model){
		return "Jpush/Jpush";
	}
}
