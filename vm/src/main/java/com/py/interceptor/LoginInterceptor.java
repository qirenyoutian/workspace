package com.py.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {
	 //private static final String LOGIN_URL = "/jumpLogin";  
	  
	 @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //这里可以根据session的用户来判断角色的权限，根据权限来转发不同的页面
        //System.out.println("3");
        if(request.getSession().getAttribute("adminId") == null) {
            //request.getRequestDispatcher("/jumpLogin").forward(request,response);
        	response.sendRedirect("/jumpLogin");
        	return false;
        }
        return true;
    }
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    
    }

}
