package com.py.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.py.bean.Banner;
import com.py.bean.Equipment;
import com.py.bean.EquipmentMessage;
import com.py.bean.Order;
import com.py.service.AndroidService;
import com.py.service.EquipmentMessageService;
import com.py.service.EquipmentService;
import com.py.socket.HairUtil;
import com.py.util.Msg;

@Controller
public class AndroidController {
	
	@Autowired
	AndroidService androidService;
	@Autowired
	EquipmentMessageService equipmentMessageService;
	@Autowired
	EquipmentService equipmentService;
	
	/**
	 * 获取设备的商品
	 * @param equipment_number  设备编号
	 * @param classify_id  		分类id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getMerchandiseByEquipmentNumber")
	public  Msg getMerchandiseByEquipmentNumber(@RequestParam("pn") Integer pn,
			@RequestParam("equipment_id") Integer equipment_id,
			@RequestParam("classify_id") Integer classify_id) {
		if(equipment_id == null) {
			return Msg.fail().add("msg", "请提供设备id");
		}
		Msg msg = androidService.MerchandiseByEquipmentNumber(pn,equipment_id,classify_id);
		return msg;
	}
	
	/**
	 * 获取该货道的商品支持的支付方式
	 * @param aisle_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getPayment")
	public Msg getPayment(@RequestParam("aisle_id")Integer aisle_id){
		return androidService.getPaymentByAisleId(aisle_id);
	}
	
	/**
	 * 获取商品渠道的url
	 * @param payment_id 		支付方式id
	 * @param aisle_id			货道id
	 * @param merchandise_id	商品id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getQRCodeByUrl")
	public void getQRCodeByUrl(@RequestParam("payment_id")Integer payment_id,
			@RequestParam("aisle_id")Integer aisle_id,
			@RequestParam("merchandise_id")Integer merchandise_id,
			HttpServletResponse response) {
		
		androidService.QRCodeByUrl(payment_id,aisle_id,merchandise_id,response);
		
	}
	
	/**
	 * 出货成功,减掉库存;出货失败,二次出货
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/successfulDelivery")
	public Msg successfulDelivery(@RequestParam("order_id")Integer order_id,
			@RequestParam("status")Integer status) {
		String msg = null;
		try {
			msg = androidService.successfulDelivery(order_id,status);
			if(msg != null) {
				return Msg.fail().add("msg", msg);
			}
		} catch (Exception e) {
			return Msg.fail().add("msg", "处理失败");
		}
		
		return Msg.success();
	}
	
	/**
	 * 用取货码获取
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/fetchByPickupCode")
	public Msg fetchByPickupCode(@RequestParam("equipment_id")Integer equipment_id,
			@RequestParam("code")String code) {
		
		Order order = new Order();
		order.setOrderEquipmentId(equipment_id);
		order.setOrderPickupCode(code);
		return androidService.fetchByPickupCode(order);
	}
	
	/**
	 * 设备信息
	 * @param equipment_id
	 * @param signal_strength
	 * @param cpu_occupy
	 * @param memory_occupy
	 * @param memory_size
	 * @param serial_number
	 * @param versions
	 * @param GPS
	 * @return
	 */
	@ResponseBody
	//@RequestMapping("/equipmentMessage")
	@RequestMapping(value="/equipmentMessage", method=RequestMethod.POST)
	public Msg equipmentMessage(
			@RequestParam("equipment_id")String equipment_id,
			@RequestParam("cpu_occupy")Double cpu_occupy,
			@RequestParam("memory_occupy")String memory_occupy,
			@RequestParam("memory_size")String memory_size,
			@RequestParam("serial_number")String serial_number,
			@RequestParam("GPS")String GPS) {
		
		Equipment equipment = equipmentService.selectByPrimaryKey(Integer.parseInt(equipment_id));
		
		Double longitude = null;
		Double latitude = null;
		
		if(GPS != null && "".equals(GPS.trim())) {
			String[] gps = GPS.split(",");
			longitude = Double.parseDouble(gps[0]);
			latitude = Double.parseDouble(gps[1]);
			
			if(equipment != null) {
				equipment.setEquipmentLongitude(longitude);
				equipment.setEquipmentLatitude(latitude);
				try {
					equipmentService.updateByPrimaryKeySelective(equipment);
				} catch (Exception e) {}
			}
		}
		
		EquipmentMessage equipmentMessage = new EquipmentMessage();
		equipmentMessage.setEquipmentMessageEquipmentId(Integer.parseInt(equipment_id));
		EquipmentMessage findEquipmentMessage = equipmentMessageService.selectByPrimary(equipmentMessage);
		if(findEquipmentMessage != null) {
			findEquipmentMessage.setEquipmentMessageCpuOccupy(cpu_occupy);
			String value = "%";
			String replace = memory_occupy.replace(value, "");
			findEquipmentMessage.setEquipmentMessageMemoryOccupy(Integer.parseInt(replace));
			findEquipmentMessage.setEquipmentMessageMemorySize(memory_size);
			if(equipment != null) {
				findEquipmentMessage.setEquipmentMessageIpAddress(equipment.getEquipmentIp());
			}
			findEquipmentMessage.setEquipmentMessageSerialNumber(serial_number);
			findEquipmentMessage.setEquipmentMessageChangeTime(new Date());
			
			try {
				equipmentMessageService.updateByPrimaryKeySelective(findEquipmentMessage);
			} catch (Exception e) {}
		}else {
			equipmentMessage.setEquipmentMessageCpuOccupy(cpu_occupy);
			String value = "%";
			String replace = memory_occupy.replace(value, "");
			equipmentMessage.setEquipmentMessageMemoryOccupy(Integer.parseInt(replace));
			equipmentMessage.setEquipmentMessageMemorySize(memory_size);
			if(equipment != null) {
				equipmentMessage.setEquipmentMessageIpAddress(equipment.getEquipmentIp());
			}
			equipmentMessage.setEquipmentMessageSerialNumber(serial_number);
			equipmentMessage.setEquipmentMessageChangeTime(new Date());
			equipmentMessage.setEquipmentMessageChangeTime(new Date());
			
			try {
				equipmentMessageService.insertSelective(equipmentMessage);
			} catch (Exception e) {}
		}
		
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("/aa")
	public Msg aa(@RequestParam("iccid")String iccid,@RequestParam("str")String str) {
		try {
			HairUtil.put(str,iccid);
		} catch (Exception e) {}
		return Msg.success();
	}
	
	/**
	 * 广告图片
	 * @return
	 */
	//@RequestMapping(value="/bannerPic", method=RequestMethod.POST)
	@RequestMapping("/bannerPic")
	@ResponseBody
	public Msg bannerPic(@RequestParam("equipmentId")Integer equipmentId){
		
		Equipment equipment = new Equipment();
		if (equipmentId != null) {
			equipment.setEquipmentId(equipmentId);
		}else{
			return Msg.fail().add("list", "设备ID不能为空！");
		}
		
		List<Banner> banner = equipmentService.selectBanner(equipment);
		return Msg.success().add("list", banner);
	}
	
	
}
