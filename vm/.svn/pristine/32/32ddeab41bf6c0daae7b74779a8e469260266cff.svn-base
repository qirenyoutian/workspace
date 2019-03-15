package com.py.util;

import java.util.List;

import com.py.bean.CommercialMerchandiseReport;
import com.py.bean.Order;

public class CommercialMerchandiseReportUtils {
	
	public static List<CommercialMerchandiseReport> commercialMerchandiseReport(Order order,List<CommercialMerchandiseReport> cmrs,String name,String date) {
		for (CommercialMerchandiseReport cmr : cmrs) {
			if(name.equals(cmr.getName())) {
				cmr.setAmount(cmr.getAmount() + 1);
				cmr.setSum(cmr.getSum() + order.getOrderPrice());
				return cmrs;
			}
		}
		CommercialMerchandiseReport cmr = new CommercialMerchandiseReport();
		cmr.setName(name);
		cmr.setAmount(1);
		cmr.setSum(order.getOrderPrice());
		cmr.setDate(date);
		cmrs.add(cmr);
		return cmrs;
	}
	
}
