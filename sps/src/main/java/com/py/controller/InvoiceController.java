package com.py.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.py.bean.RouteInvoice;
import com.py.service.InvoiceService;
import com.py.service.RouteService;
import com.py.service.UserService;
import com.py.util.Msg;

@Controller
public class InvoiceController {

	@Autowired
	InvoiceService invoiceService;
	@Autowired
	UserService userService;
	@Autowired
	RouteService routeService;
	
	/**
	 * 发票申请
	 * @param pn
	 * @param routeId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/invoiceStatement")
	public Msg invoiceStatement(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam("routeId")Integer routeId) {
		PageHelper.startPage(pn, 30);
		List<RouteInvoice> routeInvoices = routeService.routeInvoice(routeId);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (RouteInvoice routeInvoice : routeInvoices) {
			Map<String, Object> hashedMap = new HashMap<String,Object>();
			hashedMap.put("routeName", routeInvoice.getRouteLocationName());
			hashedMap.put("invoiceType", "纸质");
			hashedMap.put("count", routeInvoice.getSingleCarRecords().size());
			list.add(hashedMap);
		}
		return Msg.success(list);
	}
	
}
