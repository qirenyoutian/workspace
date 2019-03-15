package com.py.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.py.jdpush.Jdpush;

import cn.jpush.api.push.model.audience.Audience;

@Controller
public class JdpushController {
	
	//这是我的添加文章的接口方法
	//现在我要添加一篇文章后,进行推送
	@RequestMapping(value="/addArticle",method=RequestMethod.GET)
	public Map<String, Object> addArticle(@RequestParam("registration_id")String registration_id) throws Exception {
	Map<String, Object> result = new HashMap<String, Object>();
       //设置推送参数
       //这里同学们就可以自定义推送参数了
        //这是我的文章id
	   Map<String, String> parm =new HashMap<String, String>();
	   Audience audience = null;
	   if(registration_id != null && !"".equals(registration_id.trim())) {
		   audience = Audience.registrationId(registration_id);
	   }else {
		   audience = Audience.all();
	   }
        parm.put("title","推送");
        parm.put("body","aaaaaaaaaaaaaaaaaaaaaa");
        //调用ios的
        Jdpush.roadTourjpushIOS(parm, audience);
        //然后调用安卓的
        //Jdpush.jpushAndroid(parm, audience);
        return result;
	}
	
}
