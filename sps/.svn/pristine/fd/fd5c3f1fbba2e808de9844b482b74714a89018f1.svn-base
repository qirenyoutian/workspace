package com.py.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.Admin;
import com.py.bean.AdminRole;
import com.py.bean.Message;
import com.py.bean.MonthCardBuy;
import com.py.bean.PushMessage;
import com.py.bean.User;
import com.py.bean.UserMessage;
import com.py.jdpush.Jdpush;
import com.py.service.AdminRoleService;
import com.py.service.AdminService;
import com.py.service.MessageService;
import com.py.service.MonthCardBuyService;
import com.py.service.PushMessageService;
import com.py.service.UserService;
import com.py.util.Msg;
import com.py.util.OfTime;

import cn.jpush.api.push.model.audience.Audience;


@Controller
public class MessageController {
	@Autowired
	MessageService messageService;
	@Autowired
	PushMessageService pushMessageService;
	@Autowired
	UserService userService;
	@Autowired
	AdminService adminService;
	@Autowired
	AdminRoleService adminRoleService;
	@Autowired
	MonthCardBuyService monthCardBuyService;
	
	
	
	//selectByExample
	
	/**
	 * 查找所有推送和用户
	 */
	
	@RequestMapping("/getAllUserMessage")
	@ResponseBody
	public Msg getAllUserMessage(@RequestParam(value="pn",defaultValue="1")Integer pn,HttpServletRequest request)throws Exception{
		PageHelper.startPage(pn, 10);
		List <UserMessage> userMessage = messageService.selectAllMessageAndUser();
		PageInfo<UserMessage> page = new PageInfo<UserMessage>(userMessage, 5);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 查看所有的推送信息
	 */

	@RequestMapping("/getAllPushMessage")
	@ResponseBody
	public Msg getAllPushMessage(@RequestParam(value="pn",defaultValue="1")Integer pn,HttpServletRequest request)throws Exception{
		PageHelper.startPage(pn, 10);
		PushMessage pushMessage = new PushMessage();
		List <PushMessage> pushMessagelist = pushMessageService.selectByExample(pushMessage);
		PageInfo<PushMessage> page = new PageInfo<PushMessage>(pushMessagelist, 5);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 保存推送消息
	 */
	@RequestMapping(value="/savePushMessage",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveAdmin(@Valid PushMessage pushMessage,HttpServletRequest request){
		if(pushMessage.getPushMessageTitle() == null || "".equals(pushMessage.getPushMessageTitle().trim())) {
			return Msg.fail().add("msg", "请填写标题");
		}
		if(pushMessage.getPushMessageComit() == null || "".equals(pushMessage.getPushMessageComit().trim())) {
			return Msg.fail().add("msg", "请填写内容");
		}
		pushMessage.setPushMessageTime(OfTime.getLongTime());
		try {
			int result1 = pushMessageService.insertSelective(pushMessage);
			if(result1 != 0){
				return Msg.success();
			}else{
				return Msg.fail().add("msg", "参数错误");
			}
		} catch (Exception e) {
			return Msg.fail().add("msg", "参数错误");
		}
	}
	
	/**
	 * 更新
	 */
	@ResponseBody
	@RequestMapping(value="/updatePushMessage/{id}",method=RequestMethod.PUT)
	public Msg updatePushMessage(@Valid PushMessage pushMessage){
		int result = pushMessageService.updateByPrimaryKeySelective(pushMessage);
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
	@RequestMapping(value="/deletePushMessage/{ids}",method=RequestMethod.DELETE)
	public Msg deleteMonthCard(@PathVariable("ids")String ids){
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (int i = 0; i < str_ids.length; i++) {
				Integer id = Integer.parseInt(str_ids[i]);
				int re = pushMessageService.deleteByPrimaryKey(id);
				if(re == 0){
					return Msg.fail();
				}
			}
		}else{
			Integer id = Integer.parseInt(ids);
				int re = pushMessageService.deleteByPrimaryKey(id);
				if(re != 0){
					return Msg.success();
				}else{
					return Msg.fail();
			}
		}
		return Msg.success();
	}
	/**
	 * 根据ID获取推送信息内容
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getPushMessageById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getPushMessageById(@PathVariable("id")Integer id){
		PushMessage pushMessage = new PushMessage();
		pushMessage.setPushMessageId(id);
		
		PushMessage m = pushMessageService.selectByPrimary(pushMessage);
		if(m != null){
			return Msg.success().add("pushMessage", m);
		}else{
			return Msg.fail().add("va_msg", "未找到该推送信息");
		}
	}
	
	//推送信息
	@RequestMapping("/BypushMessage")
	@ResponseBody
	public Msg BypushMessage(@RequestParam("clientpushId")Integer clientpushId,@RequestParam("clientpushType")Integer clientpushType,@RequestParam("userType")Integer userType)throws Exception{
		PushMessage message = pushMessageService.selectByPrimaryKey(clientpushId);
		Map<String, String> parm =new HashMap<String, String>();
		parm.put("title",message.getPushMessageTitle());
		parm.put("body",message.getPushMessageComit());
		if(clientpushType == 1) {//用户
			List<User> list = userService.selectByExample(new User());
			SimpleDateFormat fomat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String aa = OfTime.getLongTime();
			for (User user : list) {
				//如果是全部用户
				if(userType == 1){
					Message message2 = new Message();
					message2.setMessageType(3);	
					message2.setMessageStaffType(1);
					message2.setMessageUserId(user.getUserId());
					message2.setMessageTime(OfTime.getLongTime());
					message2.setMessageContent(message.getPushMessageComit());
					try {
						messageService.insertSelective(message2);
					} catch (Exception e) {
					}
					try {
						if (user.getUserPushType() != null && user.getUserPushRegistrationId() != null) {
							if(user.getUserPushType() == 0) { //调用ios的
								Jdpush.jpushIOS(parm, Audience.registrationId(user.getUserPushRegistrationId()));
							}else {//然后调用安卓的
									Jdpush.jpushAndroid(parm, Audience.registrationId(user.getUserPushRegistrationId()));
							}
						}
					} catch (Exception e) {break;}
					//如果是月卡用户
				}else if(userType == 2){
					MonthCardBuy m = new MonthCardBuy();
					m.setMonthCardBuyUserId(user.getUserId());
					List<MonthCardBuy> monthCard = monthCardBuyService.selectByExample(m);
					long endtime = 0;
					for (MonthCardBuy monthCardBuy : monthCard) {
						endtime = monthCardBuy.getMonthCardBuyEndTime().getTime();
					}
					Date a = fomat.parse(aa);
					long nowtime = a.getTime();
					if(endtime >= nowtime){
						
						Message message2 = new Message();
						message2.setMessageType(3);	
						message2.setMessageStaffType(1);
						message2.setMessageUserId(user.getUserId());
						message2.setMessageTime(OfTime.getLongTime());
						message2.setMessageContent(message.getPushMessageComit());
						try {
							messageService.insertSelective(message2);
						} catch (Exception e) {
						}
						
						//若果过期时间比现在时间大
						try {
							if(user.getUserPushType() == 0) { //调用ios的
									Jdpush.jpushIOS(parm, Audience.registrationId(user.getUserPushRegistrationId()));
							}else {//然后调用安卓的
									Jdpush.jpushAndroid(parm, Audience.registrationId(user.getUserPushRegistrationId()));
							}
						} catch (Exception e) {break;}
					}
					//如果是认证用户	
				}else{
					Integer status = user.getUserStatus();
					if(status != 0 || status.equals("0")){
						
						Message message2 = new Message();
						message2.setMessageType(3);	
						message2.setMessageStaffType(1);
						message2.setMessageUserId(user.getUserId());
						message2.setMessageTime(OfTime.getLongTime());
						message2.setMessageContent(message.getPushMessageComit());
						try {
							messageService.insertSelective(message2);
						} catch (Exception e) {
						}
						
						try {
							if(user.getUserPushType() == 0) { //调用ios的
									if(user.getUserPushRegistrationId() != null){
										Jdpush.jpushIOS(parm, Audience.registrationId(user.getUserPushRegistrationId()));
									}
							}else {//然后调用安卓的
									if(user.getUserPushRegistrationId() != null){
										Jdpush.jpushAndroid(parm, Audience.registrationId(user.getUserPushRegistrationId()));
									}
							}
						} catch (Exception e) {
							break;
						}
					}
					
				}
			}
		}else if(clientpushType == 2) {//路巡
			
			List<Admin> list = adminService.selectByExample(new Admin());//查出路巡的
			for (Admin admin2 : list) {
				AdminRole adminRole = new AdminRole();
				adminRole.setAdminRoleAdminId(admin2.getAdminId());
				AdminRole ar = adminRoleService.selectByPrimary(adminRole);
				if(ar.getAdminRoleRole().getRoleName().equals("路巡人员")){
					Message message2 = new Message();
					message2.setMessageType(6);	
					message2.setMessageStaffType(2);
					message2.setMessageUserId(admin2.getAdminId());
					message2.setMessageTime(OfTime.getLongTime());
					message2.setMessageContent(message.getPushMessageComit());
					try {
						messageService.insertSelective(message2);
					} catch (Exception e) {
					}
					try {
						if(admin2.getAdminRegistrationType() == 0) { //调用ios的
							if(admin2.getAdminRegistrationId().equals("") || admin2.getAdminRegistrationId().equals(" ") || admin2.getAdminRegistrationId().equals(null)){
								continue;
							}else{
								Jdpush.roadTourjpushIOS(parm, Audience.registrationId(admin2.getAdminRegistrationId()));
							}
						}else {//然后调用安卓的
							if(admin2.getAdminRegistrationId().equals("") || admin2.getAdminRegistrationId().equals(" ") || admin2.getAdminRegistrationId().equals(null)){
								continue;
							}else{
								Jdpush.roadTourjpushAndroid(parm, Audience.registrationId(admin2.getAdminRegistrationId()));
							}
						}
					} catch (Exception e) {}
				}
			}
			return Msg.success();
		}
		return Msg.success();
	}
	
	
	

}
