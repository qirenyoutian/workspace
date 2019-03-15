package com.py.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.py.bean.Admin;
import com.py.bean.AdminGrouping;
import com.py.service.AdminGroupingService;
import com.py.util.Msg;

@Controller
public class AdminGroupingController {
	@Autowired
	AdminGroupingService adminGroupingService;
	/**
	 * 分配用户分组
	 */
	@RequestMapping(value="/updateAdminGrouping",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateAdminGrouping(@Valid Admin admin,HttpServletRequest reqest){
		AdminGrouping adminGrouping = new AdminGrouping();
		adminGrouping.setAdminGroupingAdminId(admin.getAdminId());
		AdminGrouping ag = adminGroupingService.selectByPrimary(adminGrouping);
		String groupingId = reqest.getParameter("groupingId");
		ag.setAdminGroupingGroupingId(Integer.parseInt(groupingId));
		int result = adminGroupingService.updateByPrimaryKeySelective(ag);
		if(result != 0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
}
