package com.py.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.py.service.UserService;
import com.py.util.CommonUtil;
import com.py.util.Msg;
import com.py.util.SMSBean;

public class RoadTourLoginInterceptor implements HandlerInterceptor {
	@Autowired
	UserService userService;

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception)
			throws Exception {
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView view)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		String account = request.getParameter("account");
		String token = request.getParameter("token");
		Msg msg = new Msg();
		if(account != null && token != null) {
			SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(account);
			if(smsBean == null) {
				msg.setMsg("请先登录");
				msg.add("login", false);
			}else {
				if(token.equals(smsBean.getValue())) {
					return true;
				}else {
					msg.setMsg("系统检测到您的账号在另外一台手机登录,如非本人操作请修改密码");
				}
			}
		}else {
			msg.setMsg("账号或token为空");
		}
		msg.setCode(200);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = null ;  
		try{
		    JSONObject res = new JSONObject(msg);
		    out = response.getWriter();  
		    out.append(res.toString());  
		    return false;  
		}  
		catch (Exception e){  
		    e.printStackTrace();  
		    response.sendError(500);  
		    return false;  
		} 
	}

}
