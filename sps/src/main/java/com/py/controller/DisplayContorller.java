package com.py.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.py.bean.Camera;
import com.py.bean.IncomeCount;
import com.py.bean.Route;
import com.py.bean.RouteInvoice;
import com.py.bean.RouteRecord;
import com.py.bean.SingleCar;
import com.py.bean.SingleCarDetailsRecord;
import com.py.bean.SingleCarRecord;
import com.py.bean.TradingRecord;
import com.py.bean.User;
import com.py.service.CameraService;
import com.py.service.RouteService;
import com.py.service.SingleCarService;
import com.py.service.UserService;
import com.py.util.Msg;

@Controller
@RequestMapping("/display")
public class DisplayContorller {

	@Autowired
	SingleCarService singleCarService;
	@Autowired
	UserService userService;
	@Autowired
	RouteService routeService;
	@Autowired
	CameraService cameraService;
	
	/**
	 * 跳转显示屏页面
	 * @return
	 */
	@RequestMapping("")
	public String display() {
		return "display/display";
	}
	
	/**
	 * 获取摄像头信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getCameras",method=RequestMethod.POST)
	public Msg getCameras() {
		List<Camera> list = cameraService.selectByExample(new Camera());
		List<Map<String,Object>> maps = new ArrayList<Map<String,Object>>();
		for (Camera camera : list) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", camera.getCameraId());
			map.put("lng", camera.getCameraLng());
			map.put("lat", camera.getCameraLat());
			map.put("name", camera.getCameraName());
			maps.add(map);
		}
		return Msg.success(maps);
	}
	
	@ResponseBody
	@RequestMapping("/getRouteCountsDay")
	public Msg getRouteCountsDay () throws ParseException {
		
		Date date = new Date();
		SimpleDateFormat format =new SimpleDateFormat("yyyy-MM-dd");
		
		String dateStr = format.format(date);
		
		Map<String, Object> map = new HashMap<>();
		map.put("routeId", null);
		map.put("startTime", dateStr);
		map.put("endTime", null);
		
		Date singleCarTime = null;
		List<SingleCarRecord> singleCars = null;
		//List<IncomeCount> routeCounts = new ArrayList<IncomeCount>();
		
		
		List<Map<String, Object>> routeCounts = new ArrayList<Map<String, Object>>();
		
		List<RouteInvoice> routeSingleCar = routeService.routeSingleCar(map);
		for (RouteInvoice routeInvoice : routeSingleCar) {
			Map<String, Object> hashMap = new HashMap<String,Object>();
			hashMap.put("name", routeInvoice.getRouteLocationName());
			int[] arr = new int[12];
			singleCars = routeInvoice.getSingleCarRecords();
			for (SingleCarRecord singleCarRecord : singleCars) {
				singleCarTime = singleCarRecord.getSingleCarTime();
				
				int hours = singleCarTime.getHours();
				
				if(hours >= 0 && hours < 2) {
					arr[0] ++;
				}else if(hours >= 2 && hours < 4) {
					arr[1] ++;
				}else if(hours >= 4 && hours < 6) {
					arr[2] ++;
				}else if(hours >= 6 && hours < 8) {
					arr[3] ++;
				}else if(hours >= 8 && hours < 10) {
					arr[4] ++;
				}else if(hours >= 10 && hours < 12) {
					arr[5] ++;
				}else if(hours >= 12 && hours < 14) {
					arr[6] ++;
				}else if(hours >= 14 && hours < 16) {
					arr[7] ++;
				}else if(hours >= 16 && hours < 18) {
					arr[8] ++;
				}else if(hours >= 18 && hours < 20) {
					arr[9] ++;
				}else if(hours >= 20 && hours < 22) {
					arr[10] ++;
				}else if(hours >= 22 && hours < 24) {
					arr[11] ++;
				}
			}
			hashMap.put("type", "line");
			hashMap.put("data", arr);
			routeCounts.add(hashMap);
		}
		
		return Msg.success(routeCounts);
	}
	
	/**
	 * 获取最近三个月的收入以及路段的总数
	 * @return
	 * @throws ParseException
	 */
	@ResponseBody
	@RequestMapping("/getThreeMonthIncomeAndRoutCount")
	public Msg getThreeMonthIncomeAndRoutCount () throws ParseException {
		
		Date date = new Date();
		SimpleDateFormat format =new SimpleDateFormat("yyyy-MM-dd");
		
		String dateStr = format.format(date);
		Date startTimeDay = format.parse(dateStr);//日
		Date startTimeWeek = null;//周
		Date startTimeMonth = null;//月
		
		Calendar cal = Calendar.getInstance();  
        cal.setTime(date);  
        // 获得当前日期是一个星期的第几天  
        int dayWeek = cal.get(Calendar.DAY_OF_WEEK);  
        if (1 == dayWeek) {
            cal.add(Calendar.DAY_OF_MONTH, -1);
        }  
        // 设置一个星期的第一天，按中国的习惯一个星期的第一天是星期一  
        cal.setFirstDayOfWeek(Calendar.MONDAY);  
        // 获得当前日期是一个星期的第几天  
        int day = cal.get(Calendar.DAY_OF_WEEK);  
        // 根据日历的规则，给当前日期减去星期几与一个星期第一天的差值  
        cal.add(Calendar.DATE, cal.getFirstDayOfWeek() - day);
        startTimeWeek = format.parse(format.format(cal.getTime()));
		
        dateStr = dateStr.substring(0, 8) + "01";
        startTimeMonth = format.parse(dateStr);
        
        Map<String, Object> map = new HashMap<>();
		map.put("routeId", null);
		map.put("startTime", null);
		map.put("endTime", null);
		
		List<IncomeCount> routeCountsDay = new ArrayList<IncomeCount>();
		List<IncomeCount> routeCountsWeek = new ArrayList<IncomeCount>();
		List<IncomeCount> routeCountsMonth = new ArrayList<IncomeCount>();
		
		List<SingleCarRecord> singleCars = null;
		
        List<RouteInvoice> routeSingleCar = routeService.routeSingleCar(map);
        for (RouteInvoice ri : routeSingleCar) {
        	
        	IncomeCount incomeCountDay = new IncomeCount();
        	IncomeCount incomeCountWeek = new IncomeCount();
        	IncomeCount incomeCountMonth = new IncomeCount();
        	
        	incomeCountDay.setRouteName(ri.getRouteLocationName());
        	incomeCountWeek.setRouteName(ri.getRouteLocationName());
        	incomeCountMonth.setRouteName(ri.getRouteLocationName());
        	
        	int countDay = 0;
        	int sumDay = 0;
        	int countWeek = 0;
        	int sumWeek = 0;
        	int countMonth = 0;
        	int sumMonth = 0;
        	
        	singleCars = ri.getSingleCarRecords();
        	
        	if(singleCars != null) {
        		for (SingleCarRecord singleCarRecord : singleCars) {
        			
        			TradingRecord tratingRecord = singleCarRecord.getTratingRecord();
        			
					if(singleCarRecord.getSingleCarTime().getTime() >= startTimeDay.getTime()) {
						if(tratingRecord != null) {
							sumDay += tratingRecord.getTradingRecordPrice();
						}
						countDay ++;
					}
					if(singleCarRecord.getSingleCarTime().getTime() >= startTimeWeek.getTime()) {
						if(tratingRecord != null) {
							sumWeek += tratingRecord.getTradingRecordPrice();
						}
						countWeek ++;
					}
					if(singleCarRecord.getSingleCarTime().getTime() >= startTimeMonth.getTime()) {
						if(tratingRecord != null) {
							sumMonth += tratingRecord.getTradingRecordPrice();
						}
						countMonth ++;
					}
				}
        		incomeCountDay.setCount(countDay);
        		incomeCountWeek.setCount(countWeek);
        		incomeCountMonth.setCount(countMonth);
        		
        		incomeCountDay.setSum(sumDay);
        		incomeCountWeek.setSum(sumWeek);
        		incomeCountMonth.setSum(sumMonth);
        		
        		routeCountsDay.add(incomeCountDay);
        		routeCountsWeek.add(incomeCountWeek);
        		routeCountsMonth.add(incomeCountMonth);
        	}
		}
        
		Msg msg = Msg.success();
		msg.add("routeCountsDay", routeCountsDay);
		msg.add("routeCountsWeek", routeCountsWeek);
		msg.add("routeCountsMonth", routeCountsMonth);
		
		return msg;
	}
	/**
	 * 获取路段的收入
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getRouteRecord",method=RequestMethod.POST)
	public Msg getRouteRecord() {
		Route route = new Route();
		List<RouteRecord> routeRecordas = routeService.queryAllRouteRecord(route);
		return Msg.success(routeRecordas);
	}
	
	//停车记录前20条
	@ResponseBody
	@RequestMapping(value="/getuserEzStopTop20",method=RequestMethod.POST)
	public Msg getuserEzStopTop20() {
		SingleCar singlecar = new SingleCar();
		List<SingleCarDetailsRecord> singleCars = singleCarService.selectByExampleRecordTop20(singlecar);
		return Msg.success(singleCars);
	}
	//停车详情
	@ResponseBody
	@RequestMapping(value="/getuserEzStop",method=RequestMethod.POST)
	public Msg getuserEzStop(@RequestParam("id")Integer id) {
		SingleCar singlecar = new SingleCar();
		singlecar.setSingleCarId(id);
		List<SingleCarDetailsRecord> singleCars = singleCarService.selectByExampleRecordTop20(singlecar);
		return Msg.success(singleCars);
	}
	//注册用户信息前10条
	@ResponseBody
	@RequestMapping(value="/getUserToDay",method=RequestMethod.POST)
	public Msg getUserToDay() {
		User user = new User();
		List<User> list = userService.selectByExampleTop10(user);
		int count = userService.countUser();
		Msg msg = Msg.success();
		msg.setObject(list);
		msg.add("count", count);
		return msg;
	}
	
}
