package com.py.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.py.bean.CommercialTenantReport;
import com.py.bean.MerchandiseReport;
import com.py.bean.PointReport;
import com.py.service.DataService;
import com.py.util.Msg;
import com.py.util.OfTime;

@Controller
public class DataController {
	@Autowired
	private DataService dataService;
	
	
	
	
	/**
	 * 点位报表
	 * @return
	 */
	@RequestMapping("/getPointReport")
	@ResponseBody
	public Msg pointReport(@RequestParam("year")Integer year,@RequestParam("month")Integer month) {
		
		String startTime = null;
		String endTime = null;
		if(year == null) {
			year = OfTime.getYear();
		}
		if(month != null) {
			if (month < 10) {
				startTime = year + "-0" + month;
			} else {
				startTime = year + "-" + month;
			}
			int i = month + 1;
			if(i < 10) {
				endTime = year + "-0" + i;
			}else {
				endTime = year + "-" + i;
			}
		}else {
			startTime = String.valueOf(year);
			endTime = String.valueOf(year + 1);
		}
		
		
		List<PointReport> pointReport = dataService.pointReport(startTime,endTime);
		
		return Msg.success(pointReport);
	}
	
	
	/**
	 * 商户报表
	 * @return
	 */
	@RequestMapping("/getCommercialTenantReport")
	@ResponseBody
	public Msg getCommercialTenantReport(@RequestParam("year")Integer year,@RequestParam("month")Integer month) {
		
		String startTime = null;
		String endTime = null;
		if(year == null) {
			year = OfTime.getYear();
		}
			if(month != null) {
				if (month < 10) {
					startTime = year + "-0" + month;
				} else {
					startTime = year + "-" + month;
				}
				int i = month + 1;
				if(i < 10) {
					endTime = year + "-0" + i;
				}else {
					endTime = year + "-" + i;
				}
			}else {
				startTime = String.valueOf(year);
				endTime = String.valueOf(year + 1);
			}
		
		List<CommercialTenantReport> pointReport = dataService.getCommercialTenantReport(startTime,endTime);
		
		return Msg.success(pointReport);
	}
	
	
	/**
	 * 商品报表
	 * @return
	 */
	@RequestMapping("/getMerchandiseReport")
	@ResponseBody
	public Msg getMerchandiseReport(@RequestParam("year")Integer year,@RequestParam("month")Integer month) {
		String startTime = null;
		String endTime = null;
		if(year == null) {
			year = OfTime.getYear();
		}
			if(month != null) {
				if (month < 10) {
					startTime = year + "-0" + month;
				} else {
					startTime = year + "-" + month;
				}
				int i = month + 1;
				if(i < 10) {
					endTime = year + "-0" + i;
				}else {
					endTime = year + "-" + i;
				}
			}else {
				startTime = String.valueOf(year);
				endTime = String.valueOf(year + 1);
			}
		
		List<MerchandiseReport> merchandiseReport = dataService.getMerchandiseReport(startTime,endTime);
		
		return Msg.success(merchandiseReport);
	}
	
	
	/******************************************************** 外来订单 **************************************************************/
	
	/**
	 * 点位报表
	 * @return
	 */
	@RequestMapping("/getPointReportSingle")
	@ResponseBody
	public Msg pointReportSingle(@RequestParam("year")Integer year,@RequestParam("month")Integer month) {
		
		String startTime = null;
		String endTime = null;
		if(year == null) {
			year = OfTime.getYear();
		}
		if(month != null) {
			startTime = year + "-" + month;
			int i = month + 1;
			if(i < 10) {
				endTime = year + "-0" + i;
			}else {
				endTime = year + "-" + i;
			}
		}else {
			startTime = String.valueOf(year);
			endTime = String.valueOf(year + 1);
		}
		
		
		List<PointReport> pointReport = dataService.pointReportSingle(startTime,endTime);
		
		return Msg.success(pointReport);
	}
	
	
	/**
	 * 商户报表
	 * @return
	 */
	@RequestMapping("/getCommercialTenantReportSingle")
	@ResponseBody
	public Msg getCommercialTenantReportSingle(@RequestParam("year")Integer year,@RequestParam("month")Integer month) {
		
		String startTime = null;
		String endTime = null;
		if(year == null) {
			year = OfTime.getYear();
		}
		if(month != null) {
			startTime = year + "-" + month;
			int i = month + 1;
			if(i < 10) {
				endTime = year + "-0" + i;
			}else {
				endTime = year + "-" + i;
			}
		}else {
			startTime = String.valueOf(year);
			endTime = String.valueOf(year + 1);
		}
		
		List<CommercialTenantReport> pointReport = dataService.getCommercialTenantReportSingle(startTime,endTime);
		
		return Msg.success(pointReport);
	}
	
	
	/**
	 * 商品报表
	 * @return
	 */
	@RequestMapping("/getMerchandiseReportSingle")
	@ResponseBody
	public Msg getMerchandiseReportSingle(@RequestParam("year")Integer year,@RequestParam("month")Integer month) {
		String startTime = null;
		String endTime = null;
		if(year == null) {
			year = OfTime.getYear();
		}
		if(month != null) {
			startTime = year + "-" + month;
			int i = month + 1;
			if(i < 10) {
				endTime = year + "-0" + i;
			}else {
				endTime = year + "-" + i;
			}
		}else {
			startTime = String.valueOf(year);
			endTime = String.valueOf(year + 1);
		}
		
		List<MerchandiseReport> merchandiseReport = dataService.getMerchandiseReportSingle(startTime,endTime);
		
		return Msg.success(merchandiseReport);
	}
	
	

}
