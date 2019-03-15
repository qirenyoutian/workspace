package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.User;
import com.py.bean.UserInformationAudit;
import com.py.service.UserInformationAuditService;
import com.py.service.UserService;
import com.py.util.Msg;
import com.py.util.OfTime;

@Controller
public class UserInformationAuditController {
	@Autowired
	UserInformationAuditService userInformationAuditService;
	@Autowired
	UserService userService;
	/**
	 * 跳转到用户审核界面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpUserInformationAudit")
	public String jumpUserInformationAudit(Model model){
		return "userInformationAudit/userInformationAudit";
	}
	/**
	 * 查询全部用户审核请求
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getUserInformationAuditAll")
	@ResponseBody
	public Msg getUserInformationAuditAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String state,String type){
		PageHelper.startPage(pn, 10);
		UserInformationAudit userInformationAudit = new UserInformationAudit();
		if(Integer.parseInt(state) != 2){
			userInformationAudit.setUserInformationAuditState(Integer.parseInt(state));
		}
		if(Integer.parseInt(type) != 0){
			userInformationAudit.setUserInformationAuditType(Integer.parseInt(type));
		}
		List<UserInformationAudit> userInformationAuditList = userInformationAuditService.selectByExample(userInformationAudit);
		PageInfo<UserInformationAudit> page = new PageInfo<UserInformationAudit>(userInformationAuditList, 5);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 根据id查询单列
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getUserInformationAuditById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getUserInformationAuditById(@PathVariable("id")Integer id){
		UserInformationAudit userInformationAudit = new UserInformationAudit();
		userInformationAudit.setUserInformationAuditId(id);
		UserInformationAudit uia = userInformationAuditService.selectByPrimary(userInformationAudit);
		if(uia != null){
			return Msg.success().add("userInformationAudit", uia);
		}else{
			return Msg.fail().add("va_msg", "未找到该审核信息");
		}
	}
	/**
	 * 更新
	 * @throws UnsupportedEncodingException 
	 */
	@ResponseBody
	@RequestMapping("/updateUserInformationAudit")
	public Msg updateUserInformationAudit(int userInformationAuditId,int userInformationAuditResult,String userInformationAuditResultRemarks,HttpServletResponse response) throws UnsupportedEncodingException{
		byte[] b = userInformationAuditResultRemarks.getBytes("ISO-8859-1");//用tomcat的格式（iso-8859-1）方式去读。
		String string = new String(b,"utf-8");//采用utf-8去接string
		response.setContentType("text/html;charset=utf-8");//设置页面的字符编码
		UserInformationAudit userInformationAudit = new UserInformationAudit();
		userInformationAudit.setUserInformationAuditId(userInformationAuditId);
		UserInformationAudit uia = userInformationAuditService.selectByPrimary(userInformationAudit);
		if (userInformationAuditResult == 1) {
			uia.setUserInformationAuditResult(0);
			uia.setUserInformationAuditState(1);
		}else if(userInformationAuditResult == 2){
			uia.setUserInformationAuditResult(1);
			uia.setUserInformationAuditState(1);
		}
		uia.setUserInformationAuditResultTime(OfTime.getLongTime());
		if(!string.equals("") && string != null){
			uia.setUserInformationAuditResultRemarks(string);
		}
		int result = userInformationAuditService.updateByPrimaryKeySelective(uia);
		if(result != 0){
			UserInformationAudit userInformationAudit2 = new UserInformationAudit();
			userInformationAudit2.setUserInformationAuditUserNumber(uia.getUserInformationAuditUserNumber());
			List<UserInformationAudit> userInformationAuditList = userInformationAuditService.selectByExample(userInformationAudit2);
			int num = 0;
			if(userInformationAuditList.size() == 4){
				for (int i = 0; i < userInformationAuditList.size(); i++) {
					if(userInformationAuditList.get(i).getUserInformationAuditResult() == 1){
						num = num + 1;
					}else{
						continue;
					}
				}
			}
			if(num == 4){
				User user = new User();
				user.setUserNumber(uia.getUserInformationAuditUserNumber());
				User u = userService.selectByPrimary(user);
				u.setUserStatus(1);
				int re = userService.updateByPrimaryKeySelective(u);
				if(re != 1){
					return Msg.fail();
				}
			}
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
}
