package com.py.messageListener;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.py.bean.Aisle;
import com.py.bean.AisleInventory;
import com.py.bean.ChannelMerchandise;
import com.py.bean.Equipment;
import com.py.bean.Order;
import com.py.bean.OrderMessage;
import com.py.bean.Single;
import com.py.dao.AisleInventoryMapper;
import com.py.dao.AisleMapper;
import com.py.dao.ChannelMerchandiseMapper;
import com.py.dao.EquipmentMapper;
import com.py.dao.OrderMapper;
import com.py.dao.OrderMessageMapper;
import com.py.dao.SingleMapper;
import com.py.socket.HairUtil;
import com.py.util.OfTime;
import com.py.util.OrderNumUtils;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class MessageThread implements Runnable {

	private ChannelMerchandiseMapper channelMerchandiseMapper;//渠道商品
	private OrderMapper orderMapper;//订单
	private EquipmentMapper equipmentMapper;//设备
	private AisleInventoryMapper aisleInventoryMapper;//货道库存
	private AisleMapper aisleMapper;//货道
	private SingleMapper singleMapper;//
	private OrderMessageMapper orderMessageMapper;//订单操作信息
	private String json;//消息推送的订单的json数据
	
	public MessageThread(ChannelMerchandiseMapper channelMerchandiseMapper, OrderMapper orderMapper, EquipmentMapper equipmentMapper, AisleInventoryMapper aisleInventoryMapper, AisleMapper aisleMapper, SingleMapper singleMapper, OrderMessageMapper orderMessageMapper, String json) {
		this.channelMerchandiseMapper = channelMerchandiseMapper;
		this.orderMapper = orderMapper;
		this.equipmentMapper = equipmentMapper;
		this.aisleInventoryMapper = aisleInventoryMapper;
		this.aisleMapper = aisleMapper;
		this.singleMapper = singleMapper;
		this.orderMessageMapper = orderMessageMapper;
		this.json = json;
	}
	
	@Override
	public void run() {
		JSONArray jsonArray = null;
		//解析json数据
		try {
			JSONObject jsonObject = JSONObject.fromObject(json);
			String order_list = jsonObject.getString("order_list");
			jsonArray = JSONArray.fromObject(order_list);
			//循环订单,数据库无则添加,有则修改状态;当订单状态为待出货时则控制出货
		} catch (Exception e) {
			//加入json解析出错,记录下来
			this.orderMessage("解析json数据报错："+json);
			System.out.println("解析json数据报错："+json);
		}
		this.shipment(jsonArray);//
		
	}
	//循环订单,数据库无则添加,有则修改状态;当订单状态为待出货时则控制出货
	public synchronized void shipment(JSONArray jsonArray) {
		
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject object = jsonArray.getJSONObject(i);
			String order_id = (String)object.get("order_id");//渠道订单id
			String product_ids = (String)object.get("product_ids");//渠道商品id
			String consignee_mobile = (String)object.get("consignee_mobile");//电话号码
			String order_status = (String)object.get("order_status");//订单状态
			String order_create_time = (String)object.get("order_create_time");//创建时间
			String order_modify_time = (String)object.get("order_modify_time");//更新时间
			//根据渠道商品id查到本系统的商品id，设备id...
			ChannelMerchandise channelMerchandise = new ChannelMerchandise();
			channelMerchandise.setChannelMerchandiseNumber(product_ids);
			try {
				channelMerchandise = channelMerchandiseMapper.selectByProductId(channelMerchandise);
			} catch (Exception e) {
				channelMerchandise = null;
			}
			
			if(channelMerchandise != null) {
				Order order = new Order();
				//渠道订单编号
				order.setOrderChannelNumber(order_id);
				//根据渠道订单id去查找记录
				Order findOrder = orderMapper.selectByPrimary(order);
				if(findOrder == null) {//未存在该渠道订单编号的订单
					order = this.insertOrder(channelMerchandise, order, consignee_mobile, order_status, order_create_time, order_modify_time);
				}else {//已存在该渠道订单编号的订单
					order = this.updateOrder(channelMerchandise, findOrder, consignee_mobile, order_status, order_create_time, order_modify_time);
				}
				//判断订单是否为待发货,为待发货的订单发送指令给安卓控制出货
				if(order.getOrderStatus() == 2) {//待出货
					this.shippingInstruction(order,channelMerchandise);
				}
			}else {
				System.out.println("未找到渠道商品编号对应本系统的商品");
				
				this.single(order_id,product_ids,consignee_mobile,order_status,order_create_time,order_modify_time);
				
			}
		}
		
	}
	
	//非该平台的订单记录
	private void single(String order_id, String product_ids, String consignee_mobile, String order_status,
			String order_create_time, String order_modify_time) {
		
		Single record = singleMapper.selectByChannelOrderNumber(order_id);
		if(record != null) {
			record.setStatus(Integer.getInteger(order_status));
			record.setUpdateTime(order_modify_time);
			try {
				singleMapper.updateByPrimaryKeySelective(record);
			} catch (Exception e) {}
		}else {
			Single single = new Single();
			single.setOrderNumber(OrderNumUtils.getOrderNum());
			single.setChannelOrderNumber(order_id);
			single.setUserName(consignee_mobile);
			single.setChannelMerchandiseId(product_ids);
			single.setPaymentId(1);
			single.setStatus(Integer.parseInt(order_status));
			single.setCreateTime(order_create_time);
			single.setUpdateTime(order_modify_time);
			try {
				singleMapper.insertSelective(single);
			} catch (Exception e) {}
		}
		
	}

	//插入
	public Order insertOrder(ChannelMerchandise channelMerchandise,Order order,String consignee_mobile,String order_status,String order_create_time,String order_modify_time) {
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//匹配可出货的货道,然后记录货道id,设备id,点位id
		order = this.matchingAisle(order, channelMerchandise);
		
		order.setOrderNumber(OrderNumUtils.getOrderNum());//订单编号
		order.setOrderUserName(consignee_mobile);// 下单人
		order.setOrderPaymentId(channelMerchandise.getChannelMerchandisePaymentId());// 支付方式
		order.setOrderChannelMerchandiseId(channelMerchandise.getChannelMerchandiseId());//渠道商品id
		order.setOrderMerchandiseId(channelMerchandise.getChannelMerchandiseMerchandiseId());// 商品id
		order.setOrderMerchandiseAmount(1);// 购买数量
		order.setOrderPrice(channelMerchandise.getChannelMerchandisePrice());//金额
		order.setOrderVersions(1);//
		order.setOrderCreateTime(order_create_time);//订单创建时间
		order.setOrderUpdateTime(order_modify_time);//最后更新时间
		
		try {
			order.setOrderStatus(transformOrderStatus(order_status));//订单状态de业务处理
			//当订单状态为付款但未完成的状态内,需判断订单时间与当前时间差是否超过5分钟,超过标为超时出货
			if("02".equals(order_status) || "03".equals(order_status)) {
				if(date.getTime() - format.parse(order_create_time).getTime() >= 5000*60*5) {//5分钟
					order.setOrderStatus(8);//超时出货
					this.orderMessage("渠道订单编号为:"+order.getOrderChannelNumber()+"的订单已超出5分钟未出货,已标记未出货超时");
				}
				order.setOrderPaymentTime(order_modify_time);//支付时间
			}
		} catch (ParseException e1) {
			this.orderMessage("渠道订单编号为:"+order.getOrderChannelNumber()+"的订单因消息推送过来的日期格式转换出错而处理失败");
			System.out.println("日期格式转换出错");
		}
		
		try {
			orderMapper.insertSelective(order);
		} catch (Exception e) {
			this.orderMessage("渠道订单编号为:"+order.getOrderChannelNumber()+"的订单因重复数据插入失败出错而处理失败");
			System.out.println("重复数据插入失败");
		}
		return order;
	}
	
	//匹配可出货的货道
	public Order matchingAisle(Order order,ChannelMerchandise channelMerchandise) {
		Equipment equipment = null;
		//根据渠道商品id查找货道库存信息
		List<AisleInventory> ais = aisleInventoryMapper.selectByChannelMerchandiseId(channelMerchandise.getChannelMerchandiseId());
		//遍历货道库存,匹配该商品的库存还有库存的,获取货道编号供发送指令给上位机出货
		for (AisleInventory ai : ais) {
			if(ai != null && ai.getAisleInventoryMerchandiseId().equals(channelMerchandise.getChannelMerchandiseMerchandiseId()) && ai.getAisleInventoryCount() > 0) {
				Aisle aisle = ai.getAisle();
				if(aisle != null && aisle.getAisleStatus() == 1) {
					equipment = equipmentMapper.selectByPrimaryKey(aisle.getAisleEquipmentId());
					if(equipment != null && equipment.getEquipmentStatus() == 1) {
						order.setOrderAisleId(aisle.getAisleId());//货道id
						order.setOrderPointId(equipment.getEquipmentPointId());//点位id
						order.setOrderEquipmentId(equipment.getEquipmentId());//设备id
						return order;
					}
				}
			}
		}
		this.orderMessage("渠道订单编号为:"+order.getOrderChannelNumber()+"的订单未匹配到能出货的设备货道,可能原因：1.货道库存不足;2.设备锁定;3.货道锁定;");
		return order;
	}
	
	//修改
	public Order updateOrder(ChannelMerchandise channelMerchandise,Order findOrder,String consignee_mobile,String order_status,String order_create_time,String order_modify_time) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			findOrder.setOrderStatus(updateStatus(findOrder.getOrderStatus(),order_status));//订单状态
			if(transformOrderStatus(order_status) == 2) {
				if(date.getTime() - format.parse(order_create_time).getTime() >= 5000*60*5) {//判断是否超时
					findOrder.setOrderStatus(8);//超时出货
					this.orderMessage("渠道订单编号为:"+findOrder.getOrderChannelNumber()+"的订单因超过5分钟未出货而标为出货超时");
				}
			}
		} catch (ParseException e) {
			System.out.println("日期格式转换出错");
		}
		findOrder.setOrderCreateTime(order_create_time);//订单创建时间
		findOrder.setOrderUpdateTime(order_modify_time);//最后更新时间
		try {
			orderMapper.updateByPrimaryKeySelective(findOrder);
		} catch (Exception e) {
			this.orderMessage("渠道订单编号为:"+findOrder.getOrderChannelNumber()+"的订单因因未知原因导致数据库操作而修改状态失败");
			System.out.println("修改状态失败");
		}
		return orderMapper.selectByPrimaryKey(findOrder.getOrderId());
	}
	
	//待出货的订单发指令给安卓控制出货
	public void shippingInstruction(Order order,ChannelMerchandise channelMerchandise) {
		if(order.getOrderStatus() == 2) {//待出货
			//查到到匹配好的货道
			Aisle aisle = aisleMapper.selectByPrimaryKey(order.getOrderAisleId());
			//再次判断货道状态没问题
			if(aisle != null && aisle.getAisleStatus() == 1) {
				Equipment equipment = equipmentMapper.selectByPrimaryKey(aisle.getAisleEquipmentId());
				if(equipment != null && equipment.getEquipmentStatus() == 1) {
					String str = "BB "+aisle.getAisleNumber()+" "+order.getOrderId()+" CC";
					if(HairUtil.put(str, equipment.getEquipmentSocketKey())) {//发送出货指令
						order.setOrderStatus(3);//状态改为待确认收货
						order.setOrderAisleId(aisle.getAisleId());//订单记录货道信息
						try {
							int i = orderMapper.updateByPrimaryKeySelective(order);
							if(i == 0) {//预防万一,修改失败了就再修改一次,再错就不管了
								order = orderMapper.selectByPrimaryKey(order.getOrderId());
								order.setOrderStatus(3);//状态改为待确认收货
								order.setOrderAisleId(aisle.getAisleId());//订单记录货道信息
								
								try {
									orderMapper.updateByPrimaryKeySelective(order);
								} catch (Exception e1) {
									this.orderMessage("渠道订单编号为:"+order.getOrderChannelNumber()+"因发送出货指令后的数据库操作出错,修改状态失败");
								}
							}
						} catch (Exception e) {//发送出货指令后，修改状态失败
							this.orderMessage("渠道订单编号为:"+order.getOrderChannelNumber()+"因发送出货指令后的数据库操作出错,修改状态失败");
						}
					}else {
						this.orderMessage("渠道订单编号为:"+order.getOrderChannelNumber()+"因发送指令不成功,出货不成功");
					}
				}else {//当设备离线时
					order.setOrderStatus(7);//设备锁定未出货
					try {
						orderMapper.updateByPrimaryKeySelective(order);
					} catch (Exception e) {}
					this.orderMessage("渠道订单编号为:"+order.getOrderChannelNumber()+"因设备锁定未出货");
				}
			}else {//当设备离线时，逻辑待定
				order.setOrderStatus(7);//货道锁定未出货
				try {
					orderMapper.updateByPrimaryKeySelective(order);
				} catch (Exception e) {}
				this.orderMessage("渠道订单编号为:"+order.getOrderChannelNumber()+"因货道锁定未出货");
			}
		}
	}
	
	public void orderMessage(String msg){
		OrderMessage message = new OrderMessage();
		message.setContent(msg);
		message.setCreateTime(OfTime.getLongTime());
		try {
			orderMessageMapper.insertSelective(message);
		} catch (Exception e1) {}
	}
	
	//修改状态逻辑操作
	public int updateStatus(int orderStatus,String order_status) {//以本平台的状态为准
		switch (orderStatus) {
		case 1://当本平台的状态为未付款时,融e购的是什么状态就改为什么状态
			orderStatus = transformOrderStatus(order_status);
			break;
		case 2://当本平台的状态为待发货时,融e购的是什么状态不改变
			break;
		case 3://当本平台的状态为待确认收货时,融e购的是什么状态不改变
			break;
		case 4://当本平台的状态为交易完成时,融e购的是什么状态不改变
			break;
		case 5://当本平台的状态为交易取消时,融e购的是什么状态就改为什么状态
			orderStatus = transformOrderStatus(order_status);
			break;
		case 6://当本平台的状态为交易关闭时,融e购的是什么状态就改为什么状态
			orderStatus = transformOrderStatus(order_status);
			break;
		case 7://当本平台的状态为设备锁定未出货时,融e购的是什么状态不改变（一般不会发生）
			break;
		case 8://当本平台的状态为超时出货时,融e购的是什么状态不改变
			break;
		}
		return orderStatus;
	}
	
	//转换状态
	public int transformOrderStatus(String order_status) {
		int orderStatus = 0;
		switch (order_status) {
		case "01":
			orderStatus = 1;
			break;
		case "02":
			orderStatus = 2;
			break;
		case "03":
			orderStatus = 3;
			break;
		case "04":
			orderStatus = 4;
			break;
		case "05":
			orderStatus = 5;
			break;
		case "06":
			orderStatus = 6;
			break;
		}
		return orderStatus;
	}
	
}
