package com.py.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.py.bean.IncomeCount;
import com.py.bean.RouteAndRecord;
import com.py.bean.RouteInvoice;
import com.py.bean.SingleCar;
import com.py.bean.SingleCarRecord;
import com.py.bean.TradingRecord;
import com.py.bean.TradingRecordSingerCar;
import com.py.bean.UserRecord;
import com.py.service.RouteService;
import com.py.service.TradingRecordService;
import com.py.service.UserService;
import com.py.util.ExcelUtils;
import com.py.util.Msg;

@Controller
public class FinanceController {
	
	@Autowired
	TradingRecordService trService;
	@Autowired
	UserService userService;
	@Autowired
	RouteService routeService;
	
	
	
	@RequestMapping("/jumpIncome")
	public String jumpIncome(Model model){
		return "adminFinance/Income_query";
	}
	
	/**
	 * 查询全部注册用户
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getAllIncome")
	@ResponseBody
	public Msg getAllIncome(@RequestParam(value = "pn", defaultValue = "1") Integer pn,HttpServletRequest request) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 10);
		List<UserRecord> trList = userService.queryAllTradingRecordAndUser();

		PageInfo<UserRecord> page = new PageInfo<UserRecord>(trList, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	
	/**
	 * 跳转总收入页面
	 * 
	 */

	@RequestMapping("/jumpTotalIncome")
	public String jumpTotalIncome(Model model){
		return "adminFinance/Total_income";
	}
	

	/**
	 * 查询全部的收入
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getAllIncomeAndRoute")
	@ResponseBody
	public Msg getAllIncomeAndRoute(@RequestParam(value = "pn", defaultValue = "1") Integer pn,HttpServletRequest request) throws UnsupportedEncodingException {
		List<RouteAndRecord> rarList = routeService.queryAllTradingRecordAndRoute();
		PageInfo<RouteAndRecord> page = new PageInfo<RouteAndRecord>(rarList, 5);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 查询最近三个月的收入的路段
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getThreeMonthIncomeAndRoute")
	@ResponseBody
	public Msg getThreeMonthIncomeAndRoute(@RequestParam(value = "pn", defaultValue = "1") Integer pn,HttpServletRequest request) throws UnsupportedEncodingException {
		List<RouteAndRecord> rarList = routeService.queryThreeMonthTradingRecordAndRoute();
		PageInfo<RouteAndRecord> page = new PageInfo<RouteAndRecord>(rarList, 5);
		return Msg.success().add("pageInfo", page);
	}

	
	
	/**
	 * 查询最近三个月的收入的路段次数
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getThreeMonthIncomeAndRoutCount")
	@ResponseBody
	public Msg getThreeMonthIncomeAndRoutCount (@RequestParam("type")Integer type,
			@RequestParam("routeId")Integer routeId,
			@RequestParam("startTime")String startTime,
			@RequestParam("endTime")String endTime){
		
		Map<String, Object> map = new HashMap<>();
		if(type == 0) {
			map.put("routeId", null);
			map.put("startTime", null);
			map.put("endTime", null);
		}else if(type == 1) {
			if(routeId != 0) {
				map.put("routeId", routeId);
			}else {
				map.put("routeId", null);
			}
		}else if(type == 2){
			if(startTime != null && !"".equals(startTime.trim())) {
				map.put("startTime", startTime);
			}else {
				map.put("startTime", null);
			}
			if(endTime != null && !"".equals(endTime.trim())) {
				map.put("endTime", endTime);
			}else {
				map.put("endTime", null);
			}
		}
		
		List<RouteInvoice> routeInvoice = routeService.routeSingleCar(map);
		List<IncomeCount> routeCounts = new ArrayList<IncomeCount>();
		List<SingleCarRecord> singleCars = null;
		int sum = 0;
		for (RouteInvoice ri : routeInvoice) {
			IncomeCount incomeCount = new IncomeCount();
			incomeCount.setRouteName(ri.getRouteLocationName());
			singleCars = ri.getSingleCarRecords();
			if(singleCars != null) {
				incomeCount.setCount(ri.getSingleCarRecords().size());
				sum = 0;
				TradingRecord tratingRecord = null;
				for (SingleCarRecord singleCarRecord : singleCars) {
					tratingRecord = singleCarRecord.getTratingRecord();
					if(tratingRecord != null) {
						sum += tratingRecord.getTradingRecordPrice();
					}
				}
				incomeCount.setSum(sum);
			}else {
				incomeCount.setCount(0);
				incomeCount.setSum(0);
			}
			routeCounts.add(incomeCount);
		}
		//List<IncomeCount> routeCounts = routeService.selectFrequencyForRoute(string);
		return Msg.success().add("count", routeCounts);
	}
	
	
	
	
	
	
	/**
	 * 根据路段名字选择
	 */
	
	@RequestMapping("/getSingleCarByRoute")
	@ResponseBody
	public Msg getAllIncomeByRoute(@RequestParam(value = "pn",defaultValue = "1")Integer pn,String content,HttpServletRequest request)throws UnsupportedEncodingException{
		
		SingleCar singleCar = new SingleCar();
		
		if (!content.equals("") && !content.equals(null) && !content.equals(" ")) {
			singleCar.setSingleCarRouteName(content);
		}
		List<UserRecord> rarList = userService.SelectAllSingleCarByRoute(singleCar);
		PageInfo<UserRecord> page = new PageInfo<UserRecord>(rarList, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * 根据时间段查询收入数据
	 */
	@RequestMapping("/GetIncomeByTime")
	@ResponseBody
	public Msg GetIncomeByTime(@RequestParam(value = "pn", defaultValue = "1")Integer pn,@RequestParam("startTime")String startTime,@RequestParam("endTime")String endTime,HttpServletRequest request){
		PageHelper.startPage(pn,10);
		if(startTime == null){
			Msg.fail().add("msg", "error");
		}
		if(endTime == null){
			Msg.fail().add("msg", "error");
		}
		List<UserRecord> userRecord = userService.selectAllIncomeByTime(startTime, endTime);
		PageInfo<UserRecord> page = new PageInfo<UserRecord>(userRecord, 5);
		return Msg.success().add("pageInfo", page);
		
	}
	
	
	
	/*
	 * 导出收入信息
	 */
	@RequestMapping("/ExportIncome") 
	 @ResponseBody
	public void  ExportIncome(HttpServletRequest request,HttpServletResponse response,@RequestParam("startTime")String startTime,@RequestParam("endTime")String endTime,@RequestParam("content")String content) throws Exception {
		 
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 SingleCar singleCar = new SingleCar();
		 List<UserRecord> userRecordList = null;
		 if (!content.equals("") && !content.equals(null) && !content.equals(" ") && !content.equals(1) && !content.equals("1")) {
			 String routeName = new String(content.getBytes("ISO-8859-1"),"UTF-8");
				singleCar.setSingleCarRouteName(routeName);
				userRecordList = userService.SelectAllSingleCarByRoute(singleCar);
			}else if (!startTime.equals(null) && !startTime.equals("") && !startTime.equals(" ")&&!endTime.equals(null) && !endTime.equals("") && !endTime.equals(" ")) {
				userRecordList = userService.selectAllIncomeByTime(startTime, endTime);
		 }else{
			 	userRecordList = userService.queryAllTradingRecordAndUser();
		 }
		 
		 String[] headers = {"停车用户","停车路段","使用车位","停车金额","停车状态","支付状态","支付类型","交易时间" };  
		 String fileName = "收入信息表";  
		 List<Object[]> dataList = new ArrayList<Object[]>();
		 int a = 0,b = 0,c = 0;
		 for (int i = 0; i < userRecordList.size(); i++) {
			UserRecord ad = userRecordList.get(i);
			List<TradingRecordSingerCar> trsc = ad.getTratingRecord();
			for (TradingRecordSingerCar tt : trsc) {
				Object[] objs = new Object[headers.length]; 
				objs[0] = ad.getUserFullName();
				List<SingleCar> singleCarlist = tt.getSingleCarList();
					for (SingleCar ss : singleCarlist) {
						objs[1] = ss.getSingleCarRouteName();
						objs[2] = ss.getSingleCarTruckSpace();
						objs[3] = ss.getSingleCarPrice();
						a = ss.getSingleCarType();
						if (a == 0) {
							objs[4] = "未完成停车";
						}else if(a == 1){
							objs[4] = "待付款";
						}else{
							objs[4] = "已完成";
						}
					}
					b = tt.getTradingRecordStatus();
					if (b == 0) {
						objs[5] = "未完成支付";
					}else{
						objs[5] = "已完成支付";
					}
					c = tt.getTradingRecordType();
					if (c == 0) {
						objs[6] = "微信";
					}else if(c == 1){
						objs[6] = "支付宝";
					}else{
						objs[6] = "余额";
					}
					objs[7] = format.format(tt.getTradingRecordTime());
					dataList.add(objs);
				}
		}
		 
		for (int i = 0; i < dataList.size() - 1; i++) {
			for (int j = 0; j < dataList.size() - 1 - i; j++) {
				if(format.parse((String)dataList.get(j)[7]).getTime() < format.parse((String)dataList.get(j+1)[7]).getTime()){  
					Object[] objects = dataList.get(j);
					dataList.set(j, dataList.get(j + 1));
					dataList.set(j + 1, objects);
                } 
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
	
	
	/**
	 * 导出总收入信息
	 */
	@RequestMapping("/ExportTotalIncome") 
	 @ResponseBody
	public void  ExportTotalIncome(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("type")Integer type,
			@RequestParam("routeId")Integer routeId,
			@RequestParam("startTime")String startTime,
			@RequestParam("endTime")String endTime) throws Exception {
		 
		Map<String, Object> map = new HashMap<>();
		if(type == 0) {
			map.put("routeId", null);
			map.put("startTime", null);
			map.put("endTime", null);
		}else if(type == 1) {
			if(routeId != 0) {
				map.put("routeId", routeId);
			}else {
				map.put("routeId", null);
			}
		}else if(type == 2){
			if(startTime != null && !"".equals(startTime.trim())) {
				map.put("startTime", startTime);
			}else {
				map.put("startTime", null);
			}
			if(endTime != null && !"".equals(endTime.trim())) {
				map.put("endTime", endTime);
			}else {
				map.put("endTime", null);
			}
		}
		
		List<RouteInvoice> routeInvoice = routeService.routeSingleCar(map);
		List<IncomeCount> routeCounts = new ArrayList<IncomeCount>();
		List<SingleCarRecord> singleCars = null;
		int sum = 0;
		for (RouteInvoice ri : routeInvoice) {
			IncomeCount incomeCount = new IncomeCount();
			incomeCount.setRouteName(ri.getRouteLocationName());
			singleCars = ri.getSingleCarRecords();
			if(singleCars != null) {
				incomeCount.setCount(ri.getSingleCarRecords().size());
				sum = 0;
				TradingRecord tratingRecord = null;
				for (SingleCarRecord singleCarRecord : singleCars) {
					tratingRecord = singleCarRecord.getTratingRecord();
					if(tratingRecord != null) {
						sum += tratingRecord.getTradingRecordPrice();
					}
				}
				incomeCount.setSum(sum);
			}else {
				incomeCount.setCount(0);
				incomeCount.setSum(0);
			}
			routeCounts.add(incomeCount);
		}
		 
		 String[] headers = {"停车路段","停车次数","收入" };  
		 String fileName = "总收入信息表";  
		 List<Object[]> dataList = new ArrayList<Object[]>();
		 Object[] objs = null;
		 for (int i = 0; i < routeCounts.size(); i++) {
			 
			IncomeCount ad = routeCounts.get(i);
			objs = new Object[headers.length]; 
			objs[0] = ad.getRouteName();
			objs[1] = ad.getCount();
			objs[2] = ad.getSum();
			
			dataList.add(objs);
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
	
	
	/**
	 * 跳转发票总收入页面
	 * 
	 */

	@RequestMapping("/jumpInvoiceReport")
	public String jumpInvoiceReport(Model model){
		return "adminFinance/invoice_query";
	}
	
	/**
	 * 导出发票报表
	 */
	
	/**
	 * 导出总收入信息
	 */
	@RequestMapping("/ExportInvoice") 
	 @ResponseBody
	public void  ExportInvoice(HttpServletRequest request,HttpServletResponse response) throws Exception {
		 
		List<RouteInvoice> routeInvoices = routeService.routeInvoice(null);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (RouteInvoice routeInvoice : routeInvoices) {
			Map<String, Object> hashedMap = new HashMap<String,Object>();
			hashedMap.put("routeName", routeInvoice.getRouteLocationName());
			hashedMap.put("invoiceType", "纸质");
			hashedMap.put("count", routeInvoice.getSingleCarRecords().size());
			list.add(hashedMap);
		}
		 
		 String[] headers = {"停车路段","发票类型","发票数量" };  
		 String fileName = "发票申请信息表";  
		 List<Object[]> dataList = new ArrayList<Object[]>();
		 Object[] objs = null;
		 for (int i = 0; i < list.size(); i++) {
			 
			Map<String, Object> ad = list.get(i);
			objs = new Object[headers.length]; 
			objs[0] = ad.get("routeName");
			objs[1] = ad.get("invoiceType");
			objs[2] = ad.get("count");
			
			dataList.add(objs);
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
	
	
	
	
}
