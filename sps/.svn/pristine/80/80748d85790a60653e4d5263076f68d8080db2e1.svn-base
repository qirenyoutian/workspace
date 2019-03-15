package com.py.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.py.bean.IncomeCount;
import com.py.bean.RouteInvoice;
import com.py.bean.SingleCarRecord;
import com.py.bean.TradingRecord;

public class IncomeCountUtils {
	
	public static Map<String, Object> getMap(String startTime){
		Map<String, Object> map = new HashMap<>();
		map.put("routeId", null);
		map.put("startTime", startTime);
		map.put("endTime", null);
		return map;
	}
	
	public static List<IncomeCount> AntProdpaasProductCommonQueryModel(List<RouteInvoice> routeInvoice) {
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
		return routeCounts;
	}
}
