package com.py.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.Order;
import com.py.bean.OrderSelectBy;
import com.py.service.OrderService;
import com.py.util.Msg;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	
	/**
	 * 根据不同维度查找订单
	 * @param pn 页码
	 * @param orderNumber 订单编号
	 * @param orderUserName 下单人
	 * @param orderPaymentId 支付方式
	 * @param orderStatus 订单状态
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @return
	 */
	@RequestMapping("/getOrderAll")
	@ResponseBody
	public Msg getOrderAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
						   @RequestParam("area")Integer area,
						   @RequestParam("province")Integer province,
						   @RequestParam("city")Integer city,
						   @RequestParam("orderChannel")Integer orderChannel,
						   @RequestParam("orderPointName")Integer orderPointName,
						   @RequestParam("orderStatus")Integer orderStatus,
						   @RequestParam("orderEquipmentName")Integer orderEquipmentName,
						   @RequestParam("orderAisleNum")Integer orderAisleNum,
						   @RequestParam("orderMerchandiseName")Integer orderMerchandiseName){
		
		
		PageHelper.startPage(pn, 5);
		
		OrderSelectBy orderSelectBy = new OrderSelectBy();
		orderSelectBy.setPointCity(city);						//城市
		orderSelectBy.setPointDistrict(area);					//区域
		orderSelectBy.setPointProvince(province);				//省份
		orderSelectBy.setChannelId(orderChannel);				//渠道
		orderSelectBy.setPointId(orderPointName);				//点位
		orderSelectBy.setStatus(orderStatus);					//状态
		orderSelectBy.setEquipmentId(orderEquipmentName);		//设备
		orderSelectBy.setAisleId(orderAisleNum);				//货道
		orderSelectBy.setMerchandiseId(orderMerchandiseName);	//商品
		
		
		
		
		
		
		List<Order> orderList = orderService.selectOrderByExample(orderSelectBy);
			
		PageInfo<Order> page = new PageInfo<Order>(orderList, 10);
		return Msg.success().add("pageInfo", page);
		
	}
	
	
	
	
	/*
	 * 导出商品信息
	 */
	@RequestMapping("/ExportOrderMessage") 
	 @ResponseBody
	public void  ExportOrderMessage(@RequestParam("area")Integer area,
								    @RequestParam("province")Integer province,
								    @RequestParam("city")Integer city,
								    @RequestParam("orderChannel")Integer orderChannel,
								    @RequestParam("orderPointName")Integer orderPointName,
								    @RequestParam("orderStatus")Integer orderStatus,
								    @RequestParam("orderEquipmentName")Integer orderEquipmentName,
								    @RequestParam("orderAisleNum")Integer orderAisleNum,
								    @RequestParam("orderMerchandiseName")Integer orderMerchandiseName,
									HttpServletResponse response) throws Exception {
		 
		orderService.ExportExcel(area,province,city,orderChannel,orderPointName,orderStatus,orderEquipmentName,orderAisleNum,orderMerchandiseName,response);
		
	 }
	
	
	
	
	

}
