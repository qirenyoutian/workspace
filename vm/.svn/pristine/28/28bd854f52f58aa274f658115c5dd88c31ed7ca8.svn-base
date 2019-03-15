package com.py.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.jdom.JDOMException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alipay.api.AlipayApiException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.Aisle;
import com.py.bean.AisleInventory;
import com.py.bean.Equipment;
import com.py.bean.Merchandise;
import com.py.bean.MerchandiseClassify;
import com.py.bean.MerchandiseExtend;
import com.py.bean.Order;
import com.py.bean.Payment;
import com.py.bean.Sideboard;
import com.py.dao.AisleInventoryMapper;
import com.py.dao.AisleMapper;
import com.py.dao.ChannelMapper;
import com.py.dao.ChannelMerchandiseMapper;
import com.py.dao.EquipmentMapper;
import com.py.dao.MerchandiseMapper;
import com.py.dao.OrderMapper;
import com.py.dao.OrderMessageMapper;
import com.py.dao.PaymentMapper;
import com.py.dao.SideboardMapper;
import com.py.socket.HairUtil;
import com.py.util.Msg;
import com.py.util.OfTime;
import com.py.util.OrderNumUtils;
import com.py.util.pay.PayUtils;

@Service
public class AndroidService {

	@Autowired
	AisleMapper aisleMapper;
	@Autowired
	ChannelMapper channelMapper;
	@Autowired
	ChannelMerchandiseMapper channelMerchandiseMapper;
	@Autowired
	PaymentMapper paymentMapper;
	@Autowired
	OrderMapper orderMapper;
	@Autowired
	EquipmentMapper equipmentMapper;
	@Autowired
	AisleInventoryMapper aisleInventoryMapper;
	@Autowired
	SideboardMapper sideboardMapper;
	@Autowired
	MerchandiseMapper merchandiseMapper;
	@Autowired
	OrderMessageMapper orderMessageMapper;
	
	
	/**
	 * 获取设备的商品
	 * @param equipment_number
	 */
	public Msg MerchandiseByEquipmentNumber(Integer pn,Integer equipment_id,Integer classify_id) {
		if(classify_id == 0) {
			classify_id = null;
		}
		
		Equipment equipment = new Equipment();
		equipment = equipmentMapper.selectByPrimaryKey(equipment_id);
		
		if(equipment == null) {
			return Msg.fail().add("msg", "该机器不存在");
		}
		
		if(equipment.getEquipmentStatus() == 0 ) {//离线
			equipment.setEquipmentStatus(1);
			equipment.setEquipmentId(equipment_id);
			int i = equipmentMapper.updateByPrimaryKeySelective(equipment);
			if (i != 1) {
				return Msg.fail().add("msg", "当前设备暂停销售");
			}
		}
		
		List<MerchandiseExtend> list = new ArrayList<MerchandiseExtend>();
		Map<Integer,MerchandiseClassify> classifieMap = new HashMap<Integer,MerchandiseClassify>();
		List<MerchandiseClassify> classifie = new ArrayList<MerchandiseClassify>();
		//获取该设备的所有货道及关联的商品
		List<Aisle> aisles = aisleMapper.getMerchandiseByEquipmentNumber(equipment.getEquipmentId(),classify_id);
		//遍历封装商品参数
		for (Aisle aisle : aisles) {
			AisleInventory aisleInventorie = aisle.getAisleInventorie();
			if(aisleInventorie != null) {
				Merchandise merchandise = aisleInventorie.getMerchandise();
				if(merchandise != null) {
					//封装的商品
					MerchandiseExtend merchandiseExtend = new MerchandiseExtend();
					merchandiseExtend.setMerchandiseId(merchandise.getMerchandiseId());
					merchandiseExtend.setMerchandiseName(merchandise.getMerchandiseName());
					merchandiseExtend.setMerchandiseNumber(merchandise.getMerchandiseNumber());
					merchandiseExtend.setMerchandisePrice(merchandise.getMerchandisePrice());
					merchandiseExtend.setMerchandiseImageUrl(merchandise.getMerchandiseImageUrl());
					merchandiseExtend.setMerchandiseStatus(merchandise.getMerchandiseStatus());
					merchandiseExtend.setClassifyId(merchandise.getMerchandiseClassify());
					MerchandiseClassify merchandiseClassify = merchandise.getClassify();
					if(merchandiseClassify != null) {
						merchandiseExtend.setClassifyName(merchandiseClassify.getMerchandiseClassifyName());
						//把该设备的所有商品的分类装起来
						if(classifieMap.get(merchandiseClassify.getMerchandiseClassifyId()) == null) {
							classifieMap.put(merchandiseClassify.getMerchandiseClassifyId(), merchandiseClassify);
						}
					}
					merchandiseExtend.setAisleId(aisle.getAisleId());
					list.add(merchandiseExtend);
				}
			}
		}
		Set<Integer> keySet = classifieMap.keySet();
		for (Integer key : keySet) {
			classifie.add(classifieMap.get(key));
		}
		
		if(pn == null || pn == 0) {
			PageHelper.startPage(pn, list.size());
		}else {
			PageHelper.startPage(pn, 6);
		}
		PageInfo<MerchandiseExtend> page = new PageInfo<MerchandiseExtend>(list);
		Msg msg = Msg.success();
		msg.add("pageInfo", page);
		msg.add("classifie", classifie);
		return msg;
	}
	
	/**
	 * 获取该货道的商品支持的支付方式
	 */
	public Msg getPaymentByAisleId (Integer aisle_id){
		
		Aisle aisle = aisleMapper.selectByPrimaryKey(aisle_id);
		
		if(aisle == null) {
			return Msg.fail().add("msg", "该货道不存在");
		}
		
		if(aisle.getAisleStatus() == 0) {//锁
			return Msg.fail().add("msg", "该机器已被锁定");
		}
		
		Equipment equipment = equipmentMapper.selectByPrimaryKey(aisle.getAisleEquipmentId());
		
		if(equipment == null) {
			return Msg.fail().add("msg", "该机器不存在");
		}
		
		if(equipment.getEquipmentStatus() == 0 ) {//离线
			return Msg.fail().add("msg", "当前设备暂停销售");
		}
		
		List<Payment> list = paymentMapper.getPaymentByAisleId(aisle_id);
		
		return Msg.success(list);
	}

	/**
	 * 获取二维码
	 * @param payment_id
	 * @param aisle_id
	 * @param merchandise_id
	 * @param response 
	 * @return
	 */
	public void QRCodeByUrl(Integer payment_id, Integer aisle_id, Integer merchandise_id, HttpServletResponse response) {
		//获取货道
		Aisle aisle = aisleMapper.selectByPrimaryKey(aisle_id);
		if(aisle == null) {return;}//return Msg.fail().add("msg", "该货道不存在");
		if(aisle.getAisleStatus() == 0) {return;}//return Msg.fail().add("msg", "该机器已被锁定");
		//根据货道获取设备
		Equipment equipment = equipmentMapper.selectByPrimaryKey(aisle.getAisleEquipmentId());
		if(equipment == null) {return;}//return Msg.fail().add("msg", "该机器不存在");
		if(equipment.getEquipmentStatus() == 0 ) {return;}//return Msg.fail().add("msg", "当前设备暂停销售");
		//获取商品
		Merchandise merchandise = merchandiseMapper.selectByPrimaryKey(merchandise_id);
		if(merchandise == null) {return;}//return Msg.fail().add("msg", "当前商品不存在");
		if(merchandise.getMerchandiseStatus() == 0) {return;}//return Msg.fail().add("msg", "当前商品暂停销售");
		
		if(payment_id == 1) {//融e购
			
			PayUtils.e(aisle_id, aisleInventoryMapper, channelMerchandiseMapper, response);
			
		}else if(payment_id == 2) {//东航（未接入）
			
		}else if(payment_id > 2){
			Order order = new Order();
			order.setOrderNumber(OrderNumUtils.getOrderNum());
			order.setOrderChannelNumber(order.getOrderNumber());
			order.setOrderAisleId(aisle_id);
			order.setOrderEquipmentId(equipment.getEquipmentId());
			order.setOrderPointId(equipment.getEquipmentPointId());
			order.setOrderMerchandiseId(merchandise_id);
			order.setOrderMerchandiseAmount(1);
			order.setOrderPaymentId(payment_id);
			order.setOrderPrice(merchandise.getMerchandisePrice());
			order.setOrderStatus(1);
			order.setOrderVersions(1);
			order.setOrderCreateTime(OfTime.getLongTime());
			order.setOrderUpdateTime(OfTime.getLongTime());
			
			int i = orderMapper.insertSelective(order);
			if(payment_id == 3) {//微信
				if(i == 1) {//插入成功
					try {
						PayUtils.weixinpay(response, order.getOrderId(),Integer.parseInt(merchandise.getMerchandiseCommercialTenantNumber()),merchandise.getMerchandiseName());
					} catch (NumberFormatException e) {
						e.printStackTrace();
					} catch (JDOMException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			if(payment_id == 4) {//支付宝
				if(i == 1) {//插入成功
					try {
						PayUtils.alipay(response, order,Integer.parseInt(merchandise.getMerchandiseCommercialTenantNumber()),merchandise.getMerchandiseName());
					} catch (AlipayApiException e) {
						e.printStackTrace();
					}
				}
			}
		}
			
	}

	/**
	 * 出货成功,减掉库存;出货失败,二次出货
	 * @param order_id
	 * @param status
	 * @return
	 * @throws IOException
	 */
	public String successfulDelivery(Integer order_id, Integer status) throws IOException {
		Order order = orderMapper.selectByPrimaryKey(order_id);
		if(order != null && order.getOrderStatus() == 3) {//待确认取货状态
			order.setOrderStatus(4);//取货成功,订单已完成
			orderMapper.updateByPrimaryKeySelective(order);
			
			Equipment equipment = new Equipment();//产生该订单的设备
			equipment.setEquipmentId(order.getOrderEquipmentId());
			equipment = equipmentMapper.selectByPrimary(equipment);
			
			
			List<Aisle> aisles = equipment.getAisles();
			Aisle aisle = null;//产生该订单的货道
			AisleInventory aisleInventory = null;//产生该订单的货道库存
			for (Aisle a : aisles) {
				if(aisle.getAisleId().equals(order.getOrderAisleId())) {
					aisle = a;
					aisleInventory = aisle.getAisleInventorie();
				}
			}
			
			List<Sideboard> sideboards = equipment.getSideboards();//该设备的所有边柜库存
			Sideboard sideboard = null;//该订单的商品所属该设备的边柜库存
			for (Sideboard side : sideboards) {
				if(sideboard.getSideboardMerchandiseId().equals(order.getOrderMerchandiseId())) {
					sideboard = side;
				}
			}
			if(status == 1) {//出货成功
				//减掉货道库存
				aisleInventory.setAisleInventoryCount(aisleInventory.getAisleInventoryCount() - order.getOrderMerchandiseAmount());
				aisleInventoryMapper.updateByPrimaryKeySelective(aisleInventory);
				//减掉边柜库存
				sideboard.setSideboardCount(sideboard.getSideboardCount() - order.getOrderMerchandiseAmount());
				sideboardMapper.updateByPrimaryKeySelective(sideboard);
			}else {//出货失败，再次出货
				if(order.getOrderReturnNumber() == 1) {
					order.setOrderReturnNumber(order.getOrderReturnNumber() + 1);
					orderMapper.updateByPrimaryKeySelective(order);
					
					String str = "BB "+aisle.getAisleNumber()+" "+order.getOrderId()+" CC";
					if(!HairUtil.put(str, equipment.getEquipmentSocketKey())) {//发送指令不成功
						order.setOrderStatus(8);//交易关闭（）
						orderMapper.updateByPrimaryKeySelective(order);
					}
				}else {//二次出货后再失败，终止订单,业务待确认
					order.setOrderStatus(6);//交易关闭（）
					orderMapper.updateByPrimaryKeySelective(order);
				}
			}
			
		}else {
			return "该订单的状态已非待确认收货状态";
		}
		return null;
	}

	/**
	 * 用取货码获取
	 * @param order
	 * @return
	 */
	public Msg fetchByPickupCode(Order order) {
		Msg msg = Msg.success();
		
		List<Order> orders = orderMapper.selectByExample(order);
		if(orders.isEmpty()) {
			return Msg.fail().add("msg", "取货码无效");
		}
		order = orders.get(0);
		
		if(order.getOrderStatus() == 2 || order.getOrderStatus() == 3) {
			Aisle aisle = aisleMapper.selectByPrimaryKey(order.getOrderAisleId());
			msg.add("aisleNumber", aisle.getAisleNumber());
			msg.add("orderId", order.getOrderId());
			
			order.setOrderPickupCode(null);
			orderMapper.updateByPrimaryKey(order);
			
		}else {
			return Msg.fail().add("msg", "取货失败");
		}
			
		return msg;
	}
	
}
