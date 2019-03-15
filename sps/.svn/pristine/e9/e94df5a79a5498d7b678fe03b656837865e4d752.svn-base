package com.py.controller;


import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.AdminClockIn;
import com.py.bean.AdminClockInAndClockinTime;
import com.py.bean.Clockin;
import com.py.bean.ClockinTime;
import com.py.service.AdminService;
import com.py.service.ClockinService;
import com.py.service.ClockinTimeService;
import com.py.util.ExcelUtils;
import com.py.util.Msg;

@Controller
public class ClockController {
	
	@Autowired
	ClockinService clockinService;
	@Autowired
	AdminService adminService;
	@Autowired
	ClockinTimeService clockinTimeService;
	
	/**
	 * 跳转打卡界面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpClockIn")
	public String jumpClockIn(Model model){
		
		
		return "clockin/clockin";
	}
	
	
	/**
	 * 查询全部打卡信息
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getAllClockin")
	@ResponseBody
	public Msg getAllClockin(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam("content")String content) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 10);
		AdminClockInAndClockinTime adminClockin = new AdminClockInAndClockinTime();
		
		if (!content.equals(null) && !content.equals("") && !content.equals(" ")) {
			adminClockin.setAdminRealname(content);
		}
		
		List<AdminClockInAndClockinTime> clockInList = adminService.selectByExampleWithTimeAndClockin(adminClockin);
		
		PageInfo<AdminClockInAndClockinTime> page = new PageInfo<AdminClockInAndClockinTime>(clockInList, 5);
		return Msg.success().add("pageInfo", page);
		
	}
	
	
	/**
	 * 根据时间段查询打卡数据
	 * 
	 * 
	 */
	@RequestMapping("/GetClockInByTime")
	@ResponseBody
	public Msg GetClockInByTime(@RequestParam(value = "pn", defaultValue = "1")Integer pn,@RequestParam("startTime")String startTime,@RequestParam("endTime")String endTime,HttpServletRequest request){
		PageHelper.startPage(pn,10);
		if(startTime == null){
			Msg.fail().add("msg", "error");
		}
		if(endTime == null){
			Msg.fail().add("msg", "error");
		}
		List<AdminClockInAndClockinTime> adminClockin = adminService.selectAdminAndClockByTime(startTime, endTime);
		PageInfo<AdminClockInAndClockinTime> page = new PageInfo<AdminClockInAndClockinTime>(adminClockin, 5);
		return Msg.success().add("pageInfo", page);
		
	}

	/**
	 * 导出文件
	 * 
	 */

	@RequestMapping("/ExportExcel") 
	 @ResponseBody
	public void  ExportExcel(HttpServletRequest request,HttpServletResponse response,@RequestParam("startTime")String startTime,@RequestParam("endTime")String endTime,@RequestParam("content")String content) throws Exception {
		 
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 SimpleDateFormat format2 = new SimpleDateFormat("HH:mm:ss");
		 AdminClockInAndClockinTime adminClockin = new AdminClockInAndClockinTime();
		 List<AdminClockInAndClockinTime> clockInList = null;
		 if (!content.equals(null) && !content.equals("") && !content.equals(" ")) {
				adminClockin.setAdminRealname(content);
				 clockInList = adminService.selectByExampleWithTimeAndClockin(adminClockin);
			}else if (!startTime.equals(null) && !startTime.equals("") && !startTime.equals(" ")&&!endTime.equals(null) && !endTime.equals("") && !endTime.equals(" ")) {
				 clockInList = adminService.selectAdminAndClockByTime(startTime, endTime);
		 }else{
			 clockInList = adminService.selectByExampleWithTimeAndClockin(adminClockin);
		 }
		 
		 String[] headers = {"打卡人员","打卡时间","打卡类型","打卡状态","打卡地址" };  
		 String fileName = "打卡信息表";  
		 List<Object[]> dataList = new ArrayList<Object[]>();
		 Date a = 	null;
		 Date b = 	null;
		 int c = 0;
		 Date qq = null;
		 for (int i = 0; i < clockInList.size(); i++) {
			AdminClockInAndClockinTime ad = clockInList.get(i);
			List<Clockin> clockin = ad.getAdminClockin();
			for (Clockin c2 : clockin) {
				Object[] objs = new Object[headers.length]; 
				objs[0] = ad.getAdminRealname();
				objs[1] = format.format(c2.getClockinTime());
				List<ClockinTime> clockinTime = ad.getAdminClockinTime();
					for (ClockinTime ct : clockinTime) {
						a = ct.getClockinTimeOfficetime();
						b = ct.getClockinTimeClosingtime();
						qq = format2.parse(format2.format(c2.getClockinTime()));
						c = c2.getClockinType();
						if (c == 0) {
							objs[2] = "上班";
							if (qq.getTime() < a.getTime()) {
								objs[3] = "正常";
							}else{
								objs[3] = "迟到";
							}
						}
						if(c == 1){
							objs[2] = "下班";
							if (qq.getTime() > b.getTime()) {
								objs[3] = "正常";
							}else{
								objs[3] = "早退";
							}
						}	
					}
				objs[4] = c2.getClockinPlace();
				dataList.add(objs);
			}
		}
		 
		 ExcelUtils ex = new ExcelUtils(fileName,headers,dataList);
		
		try{
			OutputStream output = response.getOutputStream();
            response.reset();
            response.setHeader("Content-disposition",
                    "attachment; filename=PersonList.xls");
            response.setContentType("application/msexcel");
            ex.export(output);
            output.close();
		}catch(IOException e){
			e.printStackTrace();
		}
	    }

	    
	    //获取打卡表的时间
	    
	    @RequestMapping("/getClockinTime")
	    @ResponseBody
	    public Msg getClockinTime(HttpServletRequest request){
	    	
			List<ClockinTime> clockinTime = clockinTimeService.selectAllTime();
			PageInfo<ClockinTime> page = new PageInfo<ClockinTime>(clockinTime, 5);
			return Msg.success().add("pageInfo", page);
	    	
	    }
	    /*
	     * 修改打卡时间
	     * 
	     */

	    @RequestMapping("/updateClockinTime")
		@ResponseBody
		public Msg updateClockinTime(@RequestParam("clockinTimeId")Integer id,@RequestParam("clockinTimeOfficetime")String officeTime,@RequestParam("clockinTimeClosingtime")String closingTime){
			
	    	SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
			
			ClockinTime clockinTime = new ClockinTime();
			clockinTime.setClockinTimeId(id);
			try {
				clockinTime.setClockinTimeOfficetime(format.parse(officeTime));
				clockinTime.setClockinTimeClosingtime(format.parse(closingTime));
			} catch (ParseException e) {}
			
			int result = clockinTimeService.updateByPrimaryKeySelective(clockinTime);
			if(result != 0){
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
	    
}

