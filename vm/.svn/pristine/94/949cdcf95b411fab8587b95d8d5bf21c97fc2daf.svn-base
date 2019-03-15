package com.py.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.py.bean.User;
import com.py.service.AdminService;
import com.py.service.AppletService;
import com.py.service.UserService;
import com.py.util.CommonUtil;
import com.py.util.Msg;
import com.py.util.SMSBean;

@Controller
public class AppletLoginController {

	@Autowired
	UserService userService;
	@Autowired
	AppletService appletService;
	@Autowired
	AdminService adminService;
	
	/**
	 * 注册
	 * @param phonenum
	 * @param password
	 * @param code
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/register")
	public Msg register(@RequestParam("phonenum")String phonenum,@RequestParam("password")String password,
			@RequestParam("code")String code){
		if(phonenum == null) {
			return Msg.fail().add("mag", "电话号码不能为空");
		}
		if (password == null) {
			return Msg.fail().add("mag", "密码不能为空");
		}
		if(code == null) {
			return Msg.fail().add("mag", "请输入验证码");
		}
		String msg = CommonUtil.verifyMobileCode(phonenum, code );
		if(msg != null) {
			return Msg.fail().add("msg", msg);
		}
		User user = new User();
		user.setUserAccount(phonenum);
		user.setUserPassWord(password);
		
		try {
			String string = appletService.register(user);
			if(string != null) {
				return Msg.fail().add("msg", string);
			}
		} catch (Exception e) {
			return Msg.fail().add("msg", "注册失败");
		}
		
		return Msg.success();
	}
	
	/**
	 * 登录
	 * @param phonenum
	 * @param password
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/appletLogin")
	public Msg login(@RequestParam("phonenum")String phonenum,
			@RequestParam("password")String password){
		if (phonenum == null) {
			return Msg.fail().add("msg", "电话号码不能为空");
		}
		if (password == null) {
			return Msg.fail().add("msg", "密码不能为空");
		}
		
		Msg msg = appletService.login(phonenum,password);
		
        return msg;
	}
	
	/**
	 * 找回密码
	 * @param phonenum
	 * @param password
	 * @param code
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/retrievePassword",method=RequestMethod.POST)
	public Msg retrievePassword(@RequestParam("phonenum")String phonenum,@RequestParam("password")String password,
			@RequestParam("code")String code) {
		if (phonenum == null) {
			return Msg.fail().add("msg", "电话号码不能为空");
		}
		if (password == null) {
			return Msg.fail().add("msg", "密码不能为空");
		}
		if(code == null) {
			return Msg.fail().add("msg", "请输入验证码");
		}
		/*String msg = CommonUtil.verifyMobileCode(phonenum, code);
		if(msg != null) {
			return Msg.fail().add("msg", msg);
		}
		*/
		try {
			String string = appletService.retrievePassword(phonenum,password);
			if(string != null) {
				return Msg.fail().add("msg", string);
			}
		} catch (Exception e) {
			return Msg.fail().add("msg", "修改失败");
		}
		
		return Msg.success();
	}
	
	/**
	 * 退出登录
	 * @param phonenum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/dropOut",method=RequestMethod.POST)
	public Msg dropOut(@RequestParam("phonenum")String phonenum) {
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		if(smsBean != null) {
			User findUser = userService.selectByPrimaryKey(smsBean.getId());
			try {
				userService.updateByPrimaryKeySelective(findUser);
			} catch (Exception e) {
			}
		}
		CommonUtil.MSG_MAP.remove(phonenum);
		return Msg.success();
	}
	
}
