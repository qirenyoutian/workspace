package com.py.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.py.bean.Admin;
import com.py.bean.AdminRole;
import com.py.bean.BillingMethod;
import com.py.bean.BillingMethodRecord;
import com.py.bean.Route;
import com.py.bean.ServiceTel;
import com.py.bean.SingleCar;
import com.py.bean.User;
import com.py.jdpush.Jdpush;
import com.py.service.AdminRoleService;
import com.py.service.AdminService;
import com.py.service.BillingMethodService;
import com.py.service.RouteService;
import com.py.service.ServiceTelService;
import com.py.service.SingleCarService;
import com.py.service.UserService;
import com.py.util.BillingMethodUtils;
import com.py.util.CommonUtil;
import com.py.util.Msg;
import com.py.util.SMSBean;
import com.py.util.UUIDUtils;

import cn.jpush.api.push.model.audience.Audience;

@Controller
public class WebUserLoginController {
	
	@Autowired
	UserService userService;
	@Autowired
	AdminRoleService adminRoleService;
	@Autowired
	AdminService adminService;
	@Autowired
	SingleCarService singleCarService;
	@Autowired
	RouteService routeService;
	@Autowired
	BillingMethodService billingMethodService;
	@Autowired
	ServiceTelService serviceTelService;
	
	/**
	 * 注册
	 * @param phonenum
	 * @param password
	 * @param code
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public Msg register(@RequestParam("phonenum")String phonenum,@RequestParam("password")String password,
			@RequestParam("code")String code){
		User user = new User();
		if (phonenum != null) {
			user.setUserAccount(phonenum);
		}else{
			return Msg.fail().add("mag", "电话号码不能为空");
		}
		if (password != null) {
			user.setUserPassWord(password);
		}else{
			return Msg.fail().add("mag", "密码不能为空");
		}
		if(code == null) {
			return Msg.fail().add("mag", "请输入验证码");
		}
		Msg msg = CommonUtil.verifyMobileCode(phonenum, code );
		if(msg.getCode() != 100) {
			return msg;
		}
		User u = userService.selectByPrimary(user);
		if(u != null) {
			return Msg.fail().add("mag", "该号码已注册过");
		}
		user.setUserNumber(UUIDUtils.getUUID());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		user.setUserCreationTime(format.format(new Date()));
		try {
			userService.insertSelective(user);
		} catch (Exception e) {
			return Msg.fail().add("mag", "注册失败");
		}
		
		return Msg.success();
	}
	
	/**
	 * 登录
	 * @param phonenum
	 * @param password
	 * @param registration_id
	 * @param type
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public Msg login(@RequestParam("phonenum")String phonenum,
			@RequestParam("password")String password,
			@RequestParam("registration_id")String registration_id,
			@RequestParam("type")Integer type){
		
		User user = new User();
		if (phonenum != null) {
			user.setUserAccount(phonenum);
		}else{
			return Msg.fail().add("msg", "电话号码不能为空");
		}
		if (password != null) {
			user.setUserPassWord(password);
		}else{
			return Msg.fail().add("msg", "密码不能为空");
		}
		User u = userService.selectByPrimary(user);
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		if(smsBean != null) {
			if(u != null) {
				//推送信息
				try {
					Map<String, String> parm =new HashMap<String, String>();
					parm.put("msg","系统检测到您的账号在另外一台手机登录,如非本人操作请修改密码");
					if(u.getUserPushType() == 0) { //调用ios的
						Jdpush.jpushIOS(parm, Audience.registrationId(u.getUserPushRegistrationId()));
					}else {//然后调用安卓的
						Jdpush.jpushAndroid(parm, Audience.registrationId(u.getUserPushRegistrationId()));
					}
				} catch (Exception e) {}
			}
			CommonUtil.MSG_MAP.remove(phonenum);
		}
		if(u == null) {
			return Msg.fail().add("msg", "账号或密码错误");
		}
		SMSBean bean = new SMSBean(u.getUserId() ,u.getUserAccount(),UUIDUtils.getUUID(),null);
		CommonUtil.MSG_MAP.put(u.getUserAccount(), bean);
		System.out.println(CommonUtil.MSG_MAP);
		if(registration_id != null) {
			u.setUserPushRegistrationId(registration_id);
		}
		if(type != null) {
			u.setUserPushType(type);
		}
		try {
			userService.updateByPrimaryKeySelective(u);
		} catch (Exception e) {}
		
		Msg msg = Msg.success();
		msg.add("token", bean.getValue());
		msg.add("phonenum", u.getUserAccount());
		
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
		User user = new User();
		if (phonenum != null) {
			user.setUserAccount(phonenum);
		}else{
			return Msg.fail().add("msg", "电话号码不能为空");
		}
		if (password == null) {
			return Msg.fail().add("msg", "密码不能为空");
		}
		if(code == null) {
			return Msg.fail().add("msg", "请输入验证码");
		}
		Msg msg = CommonUtil.verifyMobileCode(phonenum, code);
		if(msg.getCode() != 100) {
			return msg;
		}
		User u = userService.selectByPrimary(user);
		if(u == null) {
			return Msg.fail().add("msg", "该号码未注册");
		}else {
			u.setUserPassWord(password);
		}
		try {
			userService.updateByPrimaryKeySelective(u);
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
			User u = userService.selectByPrimaryKey(smsBean.getId());
			u.setUserPushRegistrationId("");
			try {
				userService.updateByPrimaryKeySelective(u);
			} catch (Exception e) {
			}
		}
		CommonUtil.MSG_MAP.remove(phonenum);
		return Msg.success();
	}
	
	/**
	 * 路巡登录
	 * @param account
	 * @param password
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/roadTourLogin",method=RequestMethod.POST)
	public Msg roadTourLogin(@RequestParam("account")String account,
			@RequestParam("password")String password,
			@RequestParam("registration_id")String registration_id,
			@RequestParam("type")Integer type){
		
		AdminRole adminRole = new AdminRole();
		Admin admin = new Admin();
		if (account != null) {
			admin.setAdminAccount(account);
		}else{
			return Msg.fail().add("msg", "账号不能为空");
		}
		if (password != null) {
			admin.setAdminPassWord(password);
		}else{
			return Msg.fail().add("msg", "密码不能为空");
		}
		adminRole.setAdminRoleAdmin(admin);
		AdminRole ar = adminRoleService.selectByPrimary(adminRole);
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(account);
		if(smsBean != null) {
			if(ar != null && ar.getAdminRoleAdmin() != null) {
				//推送信息
				try {
					Map<String, String> parm =new HashMap<String, String>();
					parm.put("msg","系统检测到您的账号在另外一台手机登录,如非本人操作请修改密码");
					if(ar.getAdminRoleAdmin().getAdminRegistrationType() == 0) { //调用ios的
						Jdpush.jpushIOS(parm, Audience.registrationId(ar.getAdminRoleAdmin().getAdminRegistrationId()));
					}else {//然后调用安卓的
						Jdpush.jpushAndroid(parm, Audience.registrationId(ar.getAdminRoleAdmin().getAdminRegistrationId()));
					}
				} catch (Exception e) {}
			}
			CommonUtil.MSG_MAP.remove(account);
		}
		if(ar != null) {
			if( ar.getAdminRoleAdmin() != null){
				if(!ar.getAdminRoleRole().getRoleName().equals("路巡人员")){
					return Msg.fail().add("msg", "没有对应权限");
				}
			}
			Admin admin2 = ar.getAdminRoleAdmin();
			if(admin2 != null) {
				admin2.setAdminRegistrationId(registration_id);
				admin2.setAdminRegistrationType(type);
				try {
					adminService.updateByPrimaryKeySelective(admin2);
				} catch (Exception e) {}
			}
			
			SMSBean bean = new SMSBean(ar.getAdminRoleAdmin().getAdminId() ,ar.getAdminRoleAdmin().getAdminAccount(),UUIDUtils.getUUID(),null);
			CommonUtil.MSG_MAP.put(ar.getAdminRoleAdmin().getAdminAccount(), bean);
			
			Msg msg = Msg.success();
			msg.add("token", bean.getValue());
			msg.add("account", ar.getAdminRoleAdmin().getAdminAccount());
			return msg;
		}
		
        return Msg.fail().add("msg", "账号或密码 错误");
	}
	
	/**
	 * 退出登录
	 * @param account
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/roadTourDropOut",method=RequestMethod.POST)
	public Msg roadTourDropOut(@RequestParam("account")String account) {
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(account);
		if(smsBean != null) {
			Admin admin = adminService.selectByPrimaryKey(smsBean.getId());
			admin.setAdminRegistrationId("");
			try {
				adminService.updateByPrimaryKeySelective(admin);
			} catch (Exception e) {
			}
		}
		CommonUtil.MSG_MAP.remove(account);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="/charging",method=RequestMethod.GET)
	public Double charging() {
		SingleCar singleCar = singleCarService.selectByPrimaryKey(1);
		Route record = new Route();
		record.setRouteLocationName(singleCar.getSingleCarRouteName());
		record = routeService.selectByPrimary(record);
		Double charging = 0d;
		if (record != null) {
			// 计费规则
			BillingMethod billingMethod = new BillingMethod();
			billingMethod.setBillingMethodId(record.getRouteBillingMethodId());
			BillingMethodRecord billingMethodRecord = billingMethodService.selectByPrimaryRecord(billingMethod);
			if (billingMethodRecord != null) {
				try {
					charging = BillingMethodUtils.charging(billingMethodRecord, singleCar);// 计费工具类
				} catch (ParseException e) {
				}
				// 计算停车费
			}
		}
		return charging;
	}
	
	@ResponseBody
	@RequestMapping(value="/serviceTel",method=RequestMethod.POST)
	public Msg serviceTel() {
		ServiceTel serviceTel = serviceTelService.selectByPrimaryKey(1);
		return Msg.success(serviceTel);
	}
	
	
	/**
	 * 跳转协议页面
	 */
	@RequestMapping("/jumpAgreement")
	public String jumpAgreement(Model model){
		return "agreement/AgreementFile";
	}
	
	
}
