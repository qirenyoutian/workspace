package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.Aisle;
import com.py.service.AisleService;
import com.py.util.Msg;

@Controller
public class AisleInventoryController {
	
	@Autowired
	private AisleService aisleService;
	
	
	
	//查询所有
	@RequestMapping("/getAisleAll")
	@ResponseBody
	public Msg getCommodityAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam("startTime")String startTime,
			@RequestParam("endTime")String endTime,
			@RequestParam("content")String content,
			HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 10);
		
		List<Aisle> menuList = null;
		Aisle aisle = new Aisle();
		if (!content.equals("") && !content.equals(" ") && !content.equals(null)) {
			byte[] b = content.getBytes("ISO-8859-1");//用tomcat的格式（iso-8859-1）方式去读。
			String string = new String(b,"utf-8");//采用utf-8去接string
			response.setContentType("text/html;charset=utf-8");//设置页面的字符编码
			//Merchandise.setMerchandiseName(string);
			menuList = aisleService.selectAisleByAisleInventory(aisle);
		}else if(!startTime.equals("") && !startTime.equals(" ") && !startTime.equals(null) && !endTime.equals("") && !endTime.equals(" ") && !endTime.equals(null)){
			//menuList = aisleService.selectByTime(startTime, endTime);
		}else{
			menuList = aisleService.selectAisleByAisleInventory(aisle);
		}	
			
		PageInfo<Aisle> page = new PageInfo<Aisle>(menuList, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	//根据设备ID查找货道
	@RequestMapping("/getAlsieByEquipmentId")
	@ResponseBody
	public Msg getAlsieByEquipmentId(@RequestParam("equipmentId")Integer equipmentId){
		
		Aisle aisle = new Aisle();
		//PageHelper.startPage(pn, 8);
		if (equipmentId != null) {
			
			aisle.setAisleEquipmentId(equipmentId);
			List<Aisle> aislelist = aisleService.selectAisleAndMerchandiseByExample(aisle);

			//PageInfo<Aisle> page = new PageInfo<Aisle>(aislelist,5);
			return Msg.success().add("pageInfo", aislelist);
		}else{
			
			return Msg.fail().add("pageInfo", null);
		}
		
	}
	
	//根据货道ID查找货道库存，商品信息
	@RequestMapping("/getAisleInventoryByAisleId")
	@ResponseBody
	public Msg getAisleInventoryByAisleId(@RequestParam("aisleId")Integer aisleId){
		
		Aisle aisle = new Aisle();
		if (aisleId != null) {
			aisle.setAisleId(aisleId);
			List<Aisle> aislelist = aisleService.selectAisleAndMerchandiseByExample(aisle);
			return Msg.success().add("pageInfo", aislelist);
		}else{
			
			return Msg.fail().add("pageInfo", null);
		}
		
	}
	//保存货道
	@RequestMapping("/saveAisle")
	@ResponseBody
	public Msg saveAisle(@RequestParam("aisleId")Integer aisleId,
						 @RequestParam("merchandiseNum")Integer merchandiseNum,
						 @RequestParam("aisleNumber")String aisleNumber,
						 @RequestParam("aisleInventory")Integer aisleInventory,
						 @RequestParam("channelMerchandiseId")Integer channelMerchandiseId){
		
			
			
			int aa = aisleService.updateAisle(aisleId,aisleNumber,merchandiseNum,aisleInventory,channelMerchandiseId);
			if (aa == 1) {
				return Msg.success();
			} else {
				return Msg.fail();
			}
	}
	
	
	//锁定货道
	@RequestMapping("/lockAisle")
	@ResponseBody
	public Msg lockAisle(@RequestParam("aisleId")String aisleId,@RequestParam("status")Integer status){
		
		
		int aa = aisleService.lockAisle(aisleId,status);
		if (aa == 1) {
			return Msg.success();
		} else {
			return Msg.fail();
		}
	}
	
	
	

}
