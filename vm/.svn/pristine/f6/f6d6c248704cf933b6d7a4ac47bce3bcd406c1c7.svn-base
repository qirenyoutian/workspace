package com.py.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aliyuncs.exceptions.ClientException;
import com.py.bean.User;
import com.py.service.UserService;
import com.py.util.Msg;
import com.py.util.SMSBean;
import com.py.util.SendMSMUtil;

@Controller
@RequestMapping("/common")
public class CommonController {
	@Autowired
	UserService userService;

	/**
	 * 获取验证码
	 * @param phonenum
	 * @param type
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getCode",method=RequestMethod.POST)
	public Msg getCode(@RequestParam("phonenum")String phonenum,@RequestParam("type")String type,HttpServletRequest request) {
		if(phonenum == null || "".equals(phonenum)) {
			return Msg.fail().add("msg", "电话号码不能为空");
		}
		User user = new User();
		user.setUserAccount(phonenum);
		 String smsTpl = null;
		if("register".equals(type)) {
			smsTpl = SendMSMUtil.COMMON_TEMPLATE;
			User u = userService.selectByPrimary(user);
			if(u != null) {
				return Msg.fail().add("msg", "该手机已注册");
			}
		}else {
			User u = userService.selectByPrimary(user);
			if(u == null) {
				return Msg.fail().add("msg", "该手机未注册");
			}
			smsTpl = SendMSMUtil.COMMON_TEMPLATE_UPDATE;
		}try{
	        SMSBean smsBean = SendMSMUtil.sendMSM(phonenum, smsTpl, true, null);
	        if (smsBean == null) {
	        	return Msg.fail().add("msg", "短信发送失败");
	        } else {
	        	return Msg.success();
	        }
	      }catch (ClientException e){
	        e.printStackTrace();
	        return Msg.fail().add("msg", "短信发送失败");
	      }
	}
	
}
