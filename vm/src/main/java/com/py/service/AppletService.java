package com.py.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.py.bean.Admin;
import com.py.bean.AdminPoint;
import com.py.bean.AdminRole;
import com.py.bean.Aisle;
import com.py.bean.AisleInventory;
import com.py.bean.AisleMerchandise;
import com.py.bean.Area;
import com.py.bean.BigWarehouse;
import com.py.bean.BigWarehouseInventory;
import com.py.bean.ClockIn;
import com.py.bean.CommercialMerchandiseReport;
import com.py.bean.CommercialTenant;
import com.py.bean.CommercialTenantReport;
import com.py.bean.Equipment;
import com.py.bean.EquipmentClassify;
import com.py.bean.EquipmentDetails;
import com.py.bean.EquipmentMessage;
import com.py.bean.EquipmentReport;
import com.py.bean.Feedback;
import com.py.bean.Merchandise;
import com.py.bean.MerchandiseReport;
import com.py.bean.Monitoring;
import com.py.bean.Order;
import com.py.bean.Point;
import com.py.bean.PointReport;
import com.py.bean.Sideboard;
import com.py.bean.User;
import com.py.dao.AdminMapper;
import com.py.dao.AdminPointMapper;
import com.py.dao.AdminRoleMapper;
import com.py.dao.AisleInventoryMapper;
import com.py.dao.AisleMapper;
import com.py.dao.AreaMapper;
import com.py.dao.BigWarehouseInventoryMapper;
import com.py.dao.BigWarehouseMapper;
import com.py.dao.ChannelMerchandiseMapper;
import com.py.dao.ClockInMapper;
import com.py.dao.CommercialTenantMapper;
import com.py.dao.EquipmentClassifyMapper;
import com.py.dao.EquipmentMapper;
import com.py.dao.EquipmentMessageMapper;
import com.py.dao.FeedbackMapper;
import com.py.dao.MerchandiseMapper;
import com.py.dao.OrderMapper;
import com.py.dao.PointMapper;
import com.py.dao.RoleMapper;
import com.py.dao.SideboardMapper;
import com.py.dao.UserMapper;
import com.py.util.CommercialMerchandiseReportUtils;
import com.py.util.CommonUtil;
import com.py.util.Msg;
import com.py.util.OfTime;
import com.py.util.CodeUtil;
import com.py.util.SMSBean;
import com.py.util.UUIDUtils;

@Service
public class AppletService {

	@Autowired
	OrderMapper orderMapper;
	@Autowired
	SideboardMapper sideboardMapper;
	@Autowired
	AdminMapper adminMapper;
	@Autowired
	AdminRoleMapper adminRoleMapper;
	@Autowired
	RoleMapper roleMapper;
	@Autowired
	AdminPointMapper adminPointMapper;
	@Autowired
	UserMapper userMapper;
	@Autowired
	EquipmentMapper equipmentMapper;
	@Autowired
	PointMapper pointMapper;
	@Autowired
	AisleMapper aisleMapper;
	@Autowired
	ChannelMerchandiseMapper channelMerchandiseMapper;
	@Autowired
	MerchandiseMapper merchandiseMapper;
	@Autowired
	AreaMapper areaMapper;
	@Autowired
	EquipmentClassifyMapper equipmentClassifyMapper;
	@Autowired
	EquipmentMessageMapper equipmentMessageMapper;
	@Autowired
	FeedbackMapper feedbackMapper;
	@Autowired
	ClockInMapper clockInMapper;
	@Autowired
	BigWarehouseMapper bigWarehouseMapper;
	@Autowired
	CommercialTenantMapper commercialTenantMapper;
	@Autowired
	BigWarehouseInventoryMapper bigWarehouseInventoryMapper;
	@Autowired
	AisleInventoryMapper aisleInventoryMapper;
	
	/**
	 * 找回密码
	 * @param phonenum
	 * @param password
	 * @return
	 */
	public String retrievePassword(String phonenum,String password) {
		User user = new User();
		user.setUserAccount(phonenum);
		User findUser = userMapper.selectByPrimary(user);
		if(findUser == null) {
			return "该号码未注册";
		}else {
			findUser.setUserPassWord(password);
		}
		userMapper.updateByPrimaryKeySelective(findUser);
		return null;
	}
	
	/**
	 * 登录
	 * @param phonenum
	 * @param password
	 * @return
	 */
	public Msg login(String phonenum, String password) {
		String type = null;//登录类型
		Integer id = null;//登录者id
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		if(smsBean != null) {
			CommonUtil.MSG_MAP.remove(phonenum);
		}
		
		Admin admin = new Admin();
		admin.setAdminAccount(phonenum);
		admin.setAdminPassword(password);
		admin = adminMapper.selectByPrimary(admin);
		if(admin != null) {//管理员或运营人员
			AdminRole adminRole =  adminRoleMapper.selectAdminRoleByAdminId(admin.getAdminId());
			if(adminRole != null) {
				if(adminRole.getAdminRoleId() == 2) {
					type = "operation";//运营人员
				}else {
					type = "admin";//管理员
				}
			}
			id = admin.getAdminId();
		}else {//用户
			User user = new User();
			user.setUserAccount(phonenum);
			user.setUserPassWord(password);
			user = userMapper.selectByPrimary(user);
			if(user != null) {
				type = "user";//用户
				id = user.getUserId();
			}else {
				return Msg.fail().add("msg", "账号或密码错误");
			}
		}
		
		SMSBean bean = new SMSBean(id,phonenum,UUIDUtils.getUUID(),type,null);
		CommonUtil.MSG_MAP.put(phonenum, bean);
		
		Msg msg = Msg.success();
		msg.add("token", bean.getValue());
		msg.add("phonenum", phonenum);
		msg.add("page", type);
		return msg;
	}
	
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public String register(User user) {
		User findUser = userMapper.selectByPrimary(user);
		if(findUser != null) {
			return "该号码已注册过";
		}
		user.setUserCreationTime(OfTime.getLongTime());
		userMapper.insertSelective(user);
		return null;
	}
	
	/**
	 * 获取点位和货道信息
	 * @param longitude
	 * @param latitude
	 * @return
	 */
	public Msg findPointAndAisle(Double longitude,Double latitude) {
		
		Equipment equipment = equipmentMapper.selectByLongitudeAndLatitude(longitude - 0.001,longitude + 0.001,latitude - 0.001,latitude + 0.001);
		
		Point point = null;
		List<AisleMerchandise> list = new ArrayList<AisleMerchandise>();
		if(equipment != null) {
			point = pointMapper.selectByPrimaryKey(equipment.getEquipmentPointId());
			List<Aisle> aisles = aisleMapper.selectByEquipmentId(equipment.getEquipmentId());
			for (Aisle aisle : aisles) {
				AisleMerchandise am = new AisleMerchandise();
				am.setAisliId(aisle.getAisleId());
				am.setAisleNumber(aisle.getAisleNumber());
				
				AisleInventory ai = aisle.getAisleInventorie();
				if(ai != null) {
					Merchandise merchandise = ai.getMerchandise();
					if(merchandise != null) {
						am.setMerchandiseName(merchandise.getMerchandiseName());
					}
				}
				list.add(am);
			}
		}
		
		Msg msg = Msg.success();
		msg.add("point", point);
		msg.add("aisles", list);
		return msg;
	}
	
	/**
	 * 获取取货码
	 * @param order
	 * @return
	 */
	public Order pickupCode(Order order) {
		order = orderMapper.getPickupCode(order);
		
		if(order != null) {
			order.setOrderPickupCode(CodeUtil.producePickupCode());
			try {
				orderMapper.updateByPrimaryKeySelective(order);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return order;
	}

	/**
	 * 销售报表
	 * @param startTime
	 * @param endTime
	 * @param index
	 * @param type
	 * @return
	 */
	public Msg salesReport(String startTime, String endTime, int index, Integer type) {
		Map<String,Double> map =new TreeMap<String,Double>();
		String key = null;
		double amount = 0;
		
		List<Order> orders = orderMapper.getSalesReport(startTime,endTime);
		for (Order order : orders) {
			key = order.getOrderCreateTime().substring(5, index);
			if(type == 0) {//计算金额
				amount = order.getOrderPrice();
			}else {//计算数量
				amount = 1;
			}
			if(map.get(key) == null) {
				map.put(key, amount);
			}else {
				map.put(key, map.get(key) + amount);
			}
		}
		
		return Msg.success(map);
	}

	/**
	 * 总销售量销售额
	 * @return
	 */
	public Msg grossSales(String startTime, String endTime) {
		Msg msg = Msg.success();
		msg.add("count", orderMapper.getSalesReportCount(startTime,endTime));
		msg.add("amount", orderMapper.getSalesReportSum(startTime,endTime));
		return msg;
	}

	/**
	 * 点位报表
	 * @param type
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<PointReport> pointReport(String type, String startTime, String endTime) {
		
		List<PointReport> pointReports = orderMapper.pointReport(startTime,endTime,type);
		
		return pointReports;
	}
	
	/**
	 * 设备报表
	 * @param pointId
	 * @param type
	 * @param startTime
	 * @param endTime
	 * @param index
	 * @return
	 */
	public List<EquipmentReport> equipmentReport(Integer pointId, String startTime, String endTime, int index) {
		Map<String,EquipmentReport> map =new TreeMap<String,EquipmentReport>();//已时间格式来key保存设备报表信息
		String date = null;//时间格式
		Equipment equipment = null;//设备
		List<EquipmentReport> equipmentReports = new ArrayList<EquipmentReport>();//设备报表
		
		//按条件查出订单
		List<Order> orders = orderMapper.equipmentReport(pointId,startTime,endTime);
		for (Order order : orders) {
			date = order.getOrderCreateTime().substring(5, index);//时间格式（key）
			equipment = order.getEquipment();//该订单的设备
			if(map.get(date) == null) {//判断map是否已存在设备报表信息
				if(equipment != null) {
					EquipmentReport equipmentReport = new EquipmentReport();
					equipmentReport.setEquipmentId(equipment.getEquipmentId());
					equipmentReport.setEquipmentName(equipment.getEquipmentName());
					equipmentReport.setAmount(1);
					equipmentReport.setSum(order.getOrderPrice());
					equipmentReport.setDate(date);
					map.put(date, equipmentReport);
				}
			}else {//已存在设备报表信息
				EquipmentReport equipmentReport = map.get(date);
				equipmentReport.setAmount(equipmentReport.getAmount() + 1);//相同时期的加1，记录该时间的销售量
				equipmentReport.setSum(equipmentReport.getSum() + order.getOrderPrice());//相同时期的加金额，记录该时间的销售额
				map.put(date, equipmentReport);
			}
		}
		
		Set<String> keySet = map.keySet();
		for (String key : keySet) {
			equipmentReports.add(map.get(key));
		}
		
		return equipmentReports;
	}

	/**
	 * 商户报表
	 * @param type
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<CommercialTenantReport> commercialTenantReport(String type, String startTime, String endTime) {
		List<CommercialTenantReport> commercialTenantReports = orderMapper.commercialTenantReport(startTime,endTime,type);
		return commercialTenantReports;
	}
	
	/**
	 * 某商户的商品在点位的销售报表
	 * @param commercialTenantId
	 * @param type
	 * @param startTime
	 * @param endTime
	 * @param index
	 * @return
	 */
	public List<CommercialMerchandiseReport> commercialMerchandiseReport(Integer commercialTenantId, Integer type, String startTime, String endTime, int index) {
		Map<String, List<CommercialMerchandiseReport>> map = new TreeMap<String, List<CommercialMerchandiseReport>>();
		String name = null;//点位商品名称
		String date = null;//
		List<CommercialMerchandiseReport> reports = new ArrayList<CommercialMerchandiseReport>();//某商户的商品在点位的销售报表
		
		List<Order> orders = orderMapper.commercialMerchandiseReport(commercialTenantId, startTime, endTime);
		for (Order order : orders) {
			date = order.getOrderCreateTime().substring(5, index);
			name = order.getOrderUserName();
			if(map.get(date) == null) {
				List<CommercialMerchandiseReport> cmrs = new ArrayList<CommercialMerchandiseReport>();
				CommercialMerchandiseReport cmr = new CommercialMerchandiseReport();
				cmr.setName(name);
				cmr.setAmount(1);
				cmr.setSum(order.getOrderPrice());
				cmr.setDate(date);
				cmrs.add(cmr);
				map.put(date, cmrs);
			}else {
				List<CommercialMerchandiseReport> cmrs = map.get(date);
				cmrs = CommercialMerchandiseReportUtils.commercialMerchandiseReport(order, cmrs, name, date);
				map.put(date, cmrs);
			}
		}
		
		Set<String> keySet = map.keySet();
		for (String key : keySet) {
			List<CommercialMerchandiseReport> cmrs = map.get(key);
			for (CommercialMerchandiseReport cmr : cmrs) {
				reports.add(cmr);
			}
		}
		
		return reports;
	}

	/**
	 * 商品报表
	 * @param type
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<MerchandiseReport> merchandiseReport(String type, String startTime, String endTime) {
		return orderMapper.merchandiseReport(startTime,endTime,type);
	}

	/**
	 * 设备监控信息查询
	 * @param pointName 
	 * @param region 
	 * @param jobNumber 
	 * @param smsBean
	 * @return 
	 */
	public List<Monitoring> pointEquipmentList(String phonenum, Integer type, String content) {
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		List<Monitoring> monitorings = new ArrayList<Monitoring>();
		List<Integer> pointIds = new ArrayList<Integer>();
		
		if("admin".equals(smsBean.getType())) {//管理員
			switch (type) {
			case 1://工號
				AdminPoint adminPoint = new AdminPoint();
				adminPoint.setAmdinPointNum(content);
				adminPoint = adminPointMapper.selectByPrimary(adminPoint);
				if(adminPoint != null) {
					pointIds.add(adminPoint.getAdminPointPointId());
				}
				break;
			case 2://地区
				Area province = new Area();
				Area city = new Area();
				Area district = new Area();
				String[] split = content.split("省");
				province = areaMapper.selectByParent(null,split[0]);
				if(split.length >= 2) {
					split = split[1].split("市");
					city = areaMapper.selectByParent(province.getId(),split[0]);
					if(split.length >= 2) {
						district = areaMapper.selectByParent(city.getId(),split[1]);
					}
				}
				Point point = new Point();
				if(province != null) {
					point.setPointProvince(province.getId());
					if(city != null) {
						point.setPointCity(city.getId());
						if(district != null) {
							point.setPointDistrict(district.getId());
						}
					}
				}
				if(point.getPointProvince() != null) {
					List<Point> points = pointMapper.selectByExample(point);
					for (Point p : points) {
						pointIds.add(p.getPointId());
					}
				}
				break;
			case 3://點位名稱
				Point record = new Point();
				record.setPointName(content);
				point = pointMapper.selectByPrimary(record);
				if(point != null) {
					pointIds.add(point.getPointId());
				}
				break;
			}
			
		}else if("operation".equals(smsBean.getType())) {//運營人員
			AdminPoint adminPoint = adminPointMapper.selectByAdminId(smsBean.getId());
			pointIds.add(adminPoint.getAdminPointPointId());
		}
		if(pointIds.isEmpty()) {//当pointId没有元素
			pointIds = null;
		}
		monitorings = equipmentMapper.pointEquipmentList(pointIds);
		for (Monitoring monitoring : monitorings) {
			try {
				monitoring.setProvince(areaMapper.selectByPrimaryKey(Integer.parseInt(monitoring.getProvince())).getName());
			} catch (Exception e) {}
			try {
				monitoring.setCity(areaMapper.selectByPrimaryKey(Integer.parseInt(monitoring.getCity())).getName());
			} catch (Exception e) {}
			try {
				monitoring.setDistrict(areaMapper.selectByPrimaryKey(Integer.parseInt(monitoring.getDistrict())).getName());
			} catch (Exception e) {}
		}
		return monitorings;
	}

	/**
	 * 设备详情(监控查询)
	 * @param equipmentId
	 * @return
	 */
	public EquipmentDetails equipmentDetails(Integer equipmentId) {
		EquipmentDetails equipmentDetails = new EquipmentDetails();
		Equipment equipment = equipmentMapper.selectByPrimaryKey(equipmentId);
		if(equipment != null) {
			equipmentDetails.setEquipmentId(equipmentId);//设备id
			equipmentDetails.setEquipmentName(equipment.getEquipmentName());//设备名称
			//设备类型
			EquipmentClassify classify = equipmentClassifyMapper.selectByPrimaryKey(equipment.getEquipmentClassifyId());
			if(classify != null) {
				equipmentDetails.setEquipmentClass(classify.getEquipmentClassifyName());
			}
			//所在地区
			Point point = pointMapper.selectByPrimaryKey(equipment.getEquipmentPointId());
			if(point != null) {
				equipmentDetails.setAddr(point.getPointAddress());
			}
			//设备信息
			EquipmentMessage equipmentMessage = equipmentMessageMapper.selectByEquipmentId(equipmentId);
			if(equipmentMessage != null) {
				equipmentDetails.setSignalStrength(equipmentMessage.getEquipmentMessageSignalStrength());
				int value = equipmentMessage.getEquipmentMessageCpuOccupy().intValue();
				equipmentDetails.setCpuOccupy(Integer.valueOf(value));
				equipmentDetails.setMemoryOccupy(equipmentMessage.getEquipmentMessageMemoryOccupy());
				equipmentDetails.setMemorySize(equipmentMessage.getEquipmentMessageMemorySize());
				equipmentDetails.setVersions(equipmentMessage.getEquipmentMessageVersions());
			}
		}
		return equipmentDetails;
	}

	/**
	 * 跟办事件-事件反馈
	 * @param phonenum
	 * @param feedback 
	 * @return 
	 */
	public int feedback(Feedback feedback) {
		AdminPoint adminPoint = adminPointMapper.selectByAdminId(feedback.getFeedbackAdminId());
		if(adminPoint != null) {
			feedback.setFeedbackPointId(adminPoint.getAdminPointPointId());
		}
		feedback.setFeedbackCreateTime(OfTime.getLongTime());
		return feedbackMapper.insertSelective(feedback);
	}

	/**
	 * 事件反馈获取个人信息
	 * @param phonenum
	 * @return
	 */
	public Msg getNameAndPointName(String phonenum) {
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		
		Msg msg = Msg.success();
		
		Admin admin = adminMapper.selectByPrimaryKey(smsBean.getId());
		if(admin != null) {
			msg.add("name", admin.getAdminRealname());
		}
		AdminPoint adminPoint = adminPointMapper.selectByAdminId(smsBean.getId());
		if(adminPoint != null) {
			Point point = pointMapper.selectByPrimaryKey(adminPoint.getAdminPointPointId());
			if(point != null) {
				msg.add("pointName", point.getPointName());
			}
		}
		
		return msg;
	}

	/**
	 * 铺货打卡
	 * @param time 
	 * @param image 
	 * @param type 
	 * @param phonenum 
	 */
	public int clockIn(String phonenum, Integer type, MultipartFile image, String time) {
		
		int i = 0;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		String path = null;
		ClockIn clockIn = new ClockIn();
		clockIn.setClockInAdminId(smsBean.getId());//运营人员id
		clockIn.setClockInType(type);//
		clockIn.setClockInTime(time);//打卡时间
		//保存图片
		try {
			path = CommonUtil.saveFile(image);
		} catch (Exception e) {}
		
		synchronized(AppletService.class) {
			//查询当天是否有铺货前打卡
			ClockIn record = new ClockIn();
			record.setClockInAdminId(clockIn.getClockInAdminId());
			record.setClockInType(1);
			record = clockInMapper.selectByPrimaryToDay(record);
			
			if(type == 1) {//补货前
				if(record == null) {//无
					clockIn.setClockInImage(path);
				}else {
					try {
						//判断是否有数据,如有则判断上传时间间隔是否小于60秒，如果小于则叠加图片
						if(format.parse(time).getTime() - format.parse(record.getClockInCreateTime()).getTime() <= 60*1000) {
							record.setClockInImage(record.getClockInImage() + ";" +path);
							i = clockInMapper.updateByPrimaryKeySelective(record);
						}else {//如果大于则新插入数据
							clockIn.setClockInImage(path);
							clockIn.setClockInCreateTime(OfTime.getLongTime());//创建时间
							i = clockInMapper.insertSelective(clockIn);
						}
					} catch (ParseException e) {}
				}
			}else if(type == 2) {//补货后
				int affiliation = 0;
				if(record == null) {
					return affiliation;
				}
				//查询当天是否有铺货后打卡
				ClockIn record2 = new ClockIn();
				record2.setClockInAdminId(clockIn.getClockInAdminId());
				record2.setClockInType(2);
				record2.setClockInAffiliation(record.getClockInId());
				record2 = clockInMapper.selectByPrimaryToDay(record2);
				
				if(record2 == null) {//无纪录则插入数据
					affiliation = record.getClockInId();//获取补货前打卡的id与铺货后打卡关联
					clockIn.setClockInAffiliation(affiliation);//
					clockIn.setClockInImage(path);
					clockIn.setClockInCreateTime(OfTime.getLongTime());//创建时间
					i = clockInMapper.insertSelective(clockIn);
				}else {//有了就在原纪录添加图片路径
					try {
						//判断是否有数据,如有则判断上传时间间隔是否小于60秒，如果小于则叠加图片
						if(format.parse(time).getTime() - format.parse(record2.getClockInCreateTime()).getTime() <= 60*1000) {
							record2.setClockInImage(record2.getClockInImage() + ";" + path);
							return clockInMapper.updateByPrimaryKeySelective(record2);
						}else {//如果大于则新插入数据
							affiliation = record.getClockInId();//获取补货前打卡的id与铺货后打卡关联
							clockIn.setClockInAffiliation(affiliation);//
							clockIn.setClockInImage(path);
							clockIn.setClockInCreateTime(OfTime.getLongTime());//创建时间
							i = clockInMapper.insertSelective(clockIn);
						}
					} catch (ParseException e) {}
				}
			}
		}
		return i;
	}

	/**
	 * 获取大仓库
	 * @return
	 */
	public List<BigWarehouse> getBigWarehouse() {
		return bigWarehouseMapper.selectByExample(new BigWarehouse());
	}

	/**
	 * 获取商户
	 * @return 
	 */
	public List<CommercialTenant> getCommercialTenant() {
		return commercialTenantMapper.selectByExample(new CommercialTenant());
	}

	/**
	 * 获取该商户的商品
	 * @param commercialTenantId
	 * @return
	 */
	public List<Merchandise> getMerchandise(Integer commercialTenantId) {
		Merchandise merchandise = new Merchandise();
		merchandise.setMerchandiseCommercialTenantNumber(String.valueOf(commercialTenantId));
		List<Merchandise> merchandises = merchandiseMapper.selectByExample(merchandise);
		return merchandises;
	}

	/**
	 * 获取设备
	 * @param id
	 * @return
	 */
	public List<Equipment> getEquipment(Integer id) {
		List<Equipment> equipments = null;
		AdminPoint adminPoint = adminPointMapper.selectByAdminId(id);
		if(adminPoint != null) {
			Equipment equipment = new Equipment();
			equipment.setEquipmentPointId(adminPoint.getAdminPointPointId());
			equipments = equipmentMapper.selectByExample(equipment);
		}
		return equipments;
	}

	/**
	 * 获取货道
	 */
	public List<Map<String, Object>> selectByEquipmentId(Integer equipmentId) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Aisle> aisles = aisleMapper.selectByEquipmentId(equipmentId);
		for (Aisle aisle : aisles) {
			AisleInventory ai = aisle.getAisleInventorie();
			Merchandise merchandise = aisle.getMerchandise();
			Map<String, Object> map = new HashMap<String, Object>();
			String merchandiseName = null;
			Integer count = 0;
			if(merchandise != null) {
				merchandiseName = merchandise.getMerchandiseName();
			}
			if(ai != null) {
				count = ai.getAisleInventoryCount();
			}
			map.put("aisleId", aisle.getAisleId());//货道id
			map.put("aisleNumber", aisle.getAisleNumber());//货道编号
			map.put("merchandiseName", merchandiseName);//商品名称
			map.put("count", count);//库存
			list.add(map);
		}
		return list;
	}

	public int getBigWarehouseInventory(Integer bigWarehouseId, Integer merchandiseId) {
		int inventory = 0;
		BigWarehouseInventory bwi = new BigWarehouseInventory();
		bwi.setBigWarehouseInventoryBigWarehouseId(bigWarehouseId);
		bwi.setBigWarehouseInventoryMerchandiseId(merchandiseId);
		bwi = bigWarehouseInventoryMapper.selectByPrimary(bwi);
		if(bwi != null) {
			inventory = bwi.getBigWarehouseInventoryCount();
		}
		return inventory;
	}

	/**
	 * 上报大仓库库存
	 * @param bigWarehouseId
	 * @param merchandiseId
	 * @param inventory
	 * @return
	 */
	public Msg reportBigWarehouseInventory(Integer bigWarehouseId, Integer merchandiseId, Integer inventory) {
		BigWarehouseInventory bwi = new BigWarehouseInventory();
		bwi.setBigWarehouseInventoryBigWarehouseId(bigWarehouseId);
		bwi.setBigWarehouseInventoryMerchandiseId(merchandiseId);
		bwi = bigWarehouseInventoryMapper.selectByPrimary(bwi);
		if(bwi != null) {
			bwi.setBigWarehouseInventoryCount(inventory);
			int i = bigWarehouseInventoryMapper.updateByPrimaryKeySelective(bwi);
			if(i != 1) {
				return Msg.fail().add("msg", "处理失败");
			}
		}else {
			return Msg.fail().add("msg", "此仓库无此商品的库存");
		}
		return Msg.success();
	}

	/**
	 * 获取大仓库某商品库存
	 * @param equipmentId
	 * @param merchandiseId
	 * @return
	 */
	public int getSideboardInventory(Integer equipmentId, Integer merchandiseId) {
		int inventory = 0;
		Sideboard sideboard = new Sideboard();
		sideboard.setSideboardEquipmentId(equipmentId);
		sideboard.setSideboardMerchandiseId(merchandiseId);
		sideboard = sideboardMapper.selectByPrimary(sideboard);
		if(sideboard != null) {
			inventory = sideboard.getSideboardCount();
		}
		return inventory;
	}

	/**
	 * 上报边柜库存
	 * @param equipmentId
	 * @param merchandiseId
	 * @param inventory
	 * @return
	 */
	public Msg reportSideboardInventory(Integer equipmentId, Integer merchandiseId, Integer inventory) {
		Sideboard sideboard = new Sideboard();
		sideboard.setSideboardEquipmentId(equipmentId);
		sideboard.setSideboardMerchandiseId(merchandiseId);
		sideboard = sideboardMapper.selectByPrimary(sideboard);
		if(sideboard != null) {
			sideboard.setSideboardCount(inventory);
			int i = sideboardMapper.updateByPrimaryKeySelective(sideboard);
			if(i != 1) {
				return Msg.fail().add("msg", "处理失败");
			}
		}else {
			return Msg.fail().add("msg", "处理失败");
		}
		return Msg.success();
	}

	/**
	 * 上报货道库存
	 * @param aisleId
	 * @param inventory
	 * @return
	 */
	public Msg reportAisleInventory(Integer aisleId, Integer inventory) {
		AisleInventory aisleInventory = aisleInventoryMapper.selectByAisleId(aisleId);
		if(aisleInventory != null) {
			aisleInventory.setAisleInventoryCount(inventory);
			int i = aisleInventoryMapper.updateByPrimaryKeySelective(aisleInventory);
			if(i != 1) {
				return Msg.fail().add("msg", "处理失败");
			}
		}else {
			return Msg.fail().add("msg", "处理失败");
		}
		return null;
	}
	
}
