package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.AdminRole;
import com.py.bean.BillingMethod;
import com.py.bean.BillingMethodHour;
import com.py.bean.BillingMethodMinute15;
import com.py.bean.BillingMethodRecord;
import com.py.bean.Camera;
import com.py.bean.CameraStr;
import com.py.bean.EnterOrAppear;
import com.py.bean.LicensePlate;
import com.py.bean.Light;
import com.py.bean.Message;
import com.py.bean.MonthCardBuy;
import com.py.bean.MonthCardRecord;
import com.py.bean.Route;
import com.py.bean.RouteRecord;
import com.py.bean.SingleCar;
import com.py.bean.SingleCarDetails;
import com.py.bean.TruckSpace;
import com.py.bean.User;
import com.py.jdpush.Jdpush;
import com.py.service.AdminRoleService;
import com.py.service.BillingMethodHourService;
import com.py.service.BillingMethodMinute15Service;
import com.py.service.BillingMethodService;
import com.py.service.CameraService;
import com.py.service.LicensePlateService;
import com.py.service.LightService;
import com.py.service.MessageService;
import com.py.service.MonthCardService;
import com.py.service.RouteService;
import com.py.service.SingleCarDetailsService;
import com.py.service.SingleCarService;
import com.py.service.TruckSpaceService;
import com.py.service.UserService;
import com.py.util.BillingMethodUtils;
import com.py.util.CommonUtil;
import com.py.util.GetLatitudeUtils;
import com.py.util.Msg;
import com.py.util.OfTime;

import cn.jpush.api.push.model.audience.Audience;

@Controller
public class RouteController {
	@Autowired
	RouteService routeService;
	@Autowired
	TruckSpaceService truckSpaceService;
	@Autowired
	SingleCarService singleCarService;
	@Autowired
	SingleCarDetailsService singleCarDetailsService;
	@Autowired
	LicensePlateService licensePlateService;
	@Autowired
	UserService userService;
	@Autowired
	MessageService messageService;
	@Autowired
	BillingMethodService billingMethodService;
	@Autowired
	MonthCardService monthCardService;
	@Autowired
	CameraService cameraService;
	@Autowired
	AdminRoleService adminRoleService;
	@Autowired
	LightService lightService;
	@Autowired
	BillingMethodHourService billingMethodHourService;
	@Autowired
	BillingMethodMinute15Service billingMethodMinute15Service;
	
	
	/**
	 * 相机信息
	 * @param camera
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/monitoringInformation", method = RequestMethod.POST, consumes = "application/json;charset=UTF-8")
	public Msg monitoringInformation(@RequestBody CameraStr cameraStr,HttpServletRequest request){
		System.out.println("-----------------------传的数据-------------------------------------------");
		System.out.println(cameraStr.toString());
		System.out.println("-----------------------传的数据-------------------------------------------");
		DecimalFormat df = new DecimalFormat("#.000000");
		Camera record = new Camera();
		record.setCameraIp(cameraStr.getCameraIp());
		record = cameraService.selectByPrimary(record);
		
		Camera camera = new Camera();
		
		if(cameraStr.getCameraMemTotal() != null) {
			camera.setCameraMemTotal(cameraStr.getCameraMemTotal());
		}
		if(cameraStr.getCameraApp() != null) {
			camera.setCameraMemUsed(cameraStr.getCameraApp());
		}
		if(cameraStr.getCameraMemFree() != null) {
			camera.setCameraMemFree(cameraStr.getCameraMemFree());
		}
		if(cameraStr.getCameraCpuRate() != null) {
			camera.setCameraCpuRate(cameraStr.getCameraCpuRate());
		}
		if(cameraStr.getCameraApp() != null) {
			camera.setCameraApp(cameraStr.getCameraApp());
		}
		if(cameraStr.getCameraRTMP() != null) {
			camera.setCameraRTMP(cameraStr.getCameraRTMP());
		}
		if(cameraStr.getCameraLng() != null) {
			camera.setCameraLng(Double.valueOf(cameraStr.getCameraLng()));
		}
		if(cameraStr.getCameraLat() != null) {
			camera.setCameraLat(Double.valueOf(cameraStr.getCameraLat()));
		}
		System.out.println("-----------------------封装的数据-------------------------------------------");
		System.out.println(camera.toString());
		System.out.println("-----------------------封装的数据-------------------------------------------");
		if(record != null) {
			camera.setCameraId(record.getCameraId());
			try {
				cameraService.updateByPrimaryKeySelective(camera);
			} catch (Exception e) {
			}
		}else {
			camera.setCameraId(null);
			try {
				cameraService.insertSelective(camera);
			} catch (Exception e) {
			}
		}
		System.out.println("-----------------------处理后的数据-------------------------------------------");
		System.out.println(camera.toString());
		System.out.println("-----------------------处理后的数据-------------------------------------------");
		return Msg.success();
	}
	
	/**
	 * 泊入或泊出
	 * @param ip	 				摄像头ip(*)
	 * @param truck_space	 		车位(*)
	 * @param routeName				路段名称(*)
	 * @param license_plate 		车牌(*)
	 * @param license_plate_image 	车牌图
	 * @param photograph1			抓拍图1
	 * @param photograph2			抓拍图2
	 * @param video					录像
	 * @param triggerDate			触发时间(*)
	 * @param type					0:泊入 1：泊出(*)
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/enterOrAppear", method = RequestMethod.POST, consumes = "application/json")
	public Msg enterOrAppear(@RequestBody EnterOrAppear enterOrAppear) {

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Camera camera = new Camera();//相机
		
		if(enterOrAppear.getCamera_ip() != null) {
			camera.setCameraIp(enterOrAppear.getCamera_ip());
			camera = cameraService.selectByPrimary(camera);
		}
		
		Route route = new Route();// 根据路段名和ip查找
		TruckSpace truckSpace = new TruckSpace();								// 根据车位查找
		
		if(camera != null) {
			route = routeService.selectByPrimaryKey(camera.getCameraRouteId());	// 查找
			truckSpace.setTruckSpaceCameraId(camera.getCameraId()); 			// 相机id
		}
		
		if (route != null) {
			truckSpace.setTruckSpaceName(enterOrAppear.getTruck_space()); 		// 车位
			TruckSpace FindTruckSpace = truckSpaceService.selectByPrimary(truckSpace); 		// 查找
			if(FindTruckSpace == null){
				truckSpace.setTruckSpaceTime(new Date());
				try {
					truckSpaceService.insertSelective(truckSpace);
				} catch (Exception e) {
				}
			}
			truckSpace = FindTruckSpace;
			truckSpace.setTruckSpaceTime(new Date());
		} else {
			truckSpace = null;
		}

		// 车单
		SingleCar singleCar = new SingleCar();
		singleCar.setSingleCarCameraIp(enterOrAppear.getCamera_ip()); 			// 摄像头ip
		singleCar.setSingleCarLicensePlate(enterOrAppear.getLicense_plate()); 	// 车牌

		Integer singleCarId = 0; // 车单id
		// 车牌
		LicensePlate licensePlate = new LicensePlate();
		licensePlate.setLicensePlateNumber(enterOrAppear.getLicense_plate());
		licensePlate = licensePlateService.selectByPrimary(licensePlate);

		// 用户
		User user = null;

		if (licensePlate != null) {
			user = userService.selectByPrimaryKey(licensePlate.getLicensePlateUserId());// 用户
		}

		// 消息
		Message message = new Message();
		message.setMessageType(1);
		message.setMessageStaffType(1);
		message.setMessageTime(OfTime.getLongTime());
		
		// 推送的信息
		Map<String, String> parm = new HashMap<String, String>();
		parm.put("title", "停车信息");
		
		singleCar.setSingleCarType(0);
		if (enterOrAppear.getType() == 0) {// 泊入
			if (truckSpace != null) {
				truckSpace.setTruckSpaceStatus(1);// 修改占用状态
				try {
					truckSpaceService.updateByPrimaryKeySelective(truckSpace);
				} catch (Exception e) {
				}
			}
			message.setMessageContent("您于" + message.getMessageTime() + "泊车入位");// 消息内容
			parm.put("body", "您于" + message.getMessageTime() + "泊车入位");// 推送内容
			
			singleCar.setSingleCarRouteName(enterOrAppear.getRouteName()); // 路段名
			singleCar.setSingleCarTruckSpace(enterOrAppear.getTruck_space()); // 车位
			// 创建订单时间
			singleCar.setSingleCarTime(new Date());
			// 开始时间
			try {
				singleCar.setSingleCarStartTime(format.parse(enterOrAppear.getTriggerDate()));
			} catch (ParseException e) {
			}
			// 车单状态 0:未完成停车
			try {
				singleCarService.insertSelective(singleCar); // 泊入插入
				singleCarId = singleCar.getSingleCarId(); // 记录车单id
			} catch (Exception e) {
			}
			
		}else{//泊出																	
			if (truckSpace != null) {
				truckSpace.setTruckSpaceStatus(0);// 修改占用状态
				try {
					truckSpaceService.updateByPrimaryKeySelective(truckSpace);
				} catch (Exception e) {
				}
			}
			message.setMessageContent("您于" + message.getMessageTime() + "泊出");// 消息内容
			parm.put("body", "您于" + message.getMessageTime() + "泊出");// 推送内容
			
			SingleCar car = singleCarService.selectByPrimaryTop1(singleCar);
			if (car != null) {
				try {
					car.setSingleCarEndTime(format.parse(enterOrAppear.getTriggerDate()));// 结束时间
				} catch (ParseException e1) {
					System.out.println(format.format(car.getSingleCarEndTime()));
				}
				
				car.setSingleCarType(1);// 车单状态 1:待付款

				if (route != null) {
					Double charging = 0d;
					if(route.getRouteBillingMethodType() == 0) {
						// 计费规则
						BillingMethod billingMethod = new BillingMethod();
						billingMethod.setBillingMethodId(route.getRouteBillingMethodId());
						BillingMethodRecord billingMethodRecord = billingMethodService.selectByPrimaryRecord(billingMethod);
						if (billingMethodRecord != null) {
							try {
								charging = BillingMethodUtils.charging(billingMethodRecord, car);// 计费工具类
							} catch (ParseException e) {
							}
						}
					}else if(route.getRouteBillingMethodType() == 1) {
						BillingMethodHour billingMethodHour = billingMethodHourService.selectByPrimaryKey(1);
						try {
							charging = BillingMethodUtils.chargingHour(car,billingMethodHour);						// 计费工具类
						} catch (Exception e) {
						}
					}else if(route.getRouteBillingMethodType() == 2) {
						BillingMethodMinute15 billingMethodMinute15 = billingMethodMinute15Service.selectByPrimaryKey(1);
						try {
							charging = BillingMethodUtils.chargingMinute15(car,billingMethodMinute15);				// 计费工具类
						} catch (ParseException e) {
						}
					}
					// 计算停车费
					car.setSingleCarPrice(charging);
					
					MonthCardRecord monthCardRecord = new MonthCardRecord();
					MonthCardBuy monthCardBuy = new MonthCardBuy();
					if(user != null) {
						monthCardBuy.setMonthCardBuyUserId(user.getUserId());
					}
					monthCardRecord.setMonthCardBuy(monthCardBuy);
					monthCardRecord.setMonthCardRoute(route.getRouteId());
					//查看是否有购买了该路段的余额卡
					monthCardRecord = monthCardService.selectByPrimaryRecord(monthCardRecord);
					try {
						if(monthCardRecord != null && monthCardRecord.getMonthCardBuy().getMonthCardBuyEndTime().getTime() >= new Date().getTime() ) {
							car.setSingleCarType(2);
						}
					} catch (Exception e) {
					}
				}
				try {
					singleCarId = car.getSingleCarId();// 记录车单id
					singleCarService.updateByPrimaryKeySelective(car);// 泊入修改
				} catch (Exception e) {
				}
			}
		}
		
		if(user != null){
			message.setMessageUserId(user.getUserId());	// 消息（用户id）
			try {
				int i = messageService.insertSelective(message);
				if(i != 0){
					// 推送信息
					try {
						if (user.getUserPushType() == 0) { // 调用ios的
							Jdpush.jpushIOS(parm, Audience.registrationId(user.getUserPushRegistrationId()));
						} else {// 然后调用安卓的
							Jdpush.jpushAndroid(parm, Audience.registrationId(user.getUserPushRegistrationId()));
						}
					} catch (Exception e) {
					}
				}
			} catch (Exception e) {
			}
			
			/*拉黑*/
			if(user.getUserBlack() == 1) {
				
				Light light = lightService.selectByPrimaryKey(1);
				if(light != null){
					light.setLightStatus(1);
					try {
						lightService.updateByPrimaryKeySelective(light);
					} catch (Exception e) {
					}
				}
				
				// 消息
				Message message1 = new Message();
				message1.setMessageType(1);
				message1.setMessageStaffType(1);
				message1.setMessageUserId(user.getUserId());
				message1.setMessageTime(OfTime.getLongTime());
				message1.setMessageContent("您有欠费记录已被管理员拉黑,请及时支付并联系管理员解除黑名单");// 消息内容
				try {
					int i = messageService.insertSelective(message1);
					if(i != 0){
						// 推送的信息
						Map<String, String> parm1 = new HashMap<String, String>();
						parm1.put("title", "缴费信息");
						parm1.put("body", "您有欠费记录已被管理员拉黑,请及时支付并联系管理员解除黑名单");
						// 推送信息
						try {
							if (user.getUserPushType() == 0) { // 调用ios的
								Jdpush.jpushIOS(parm1, Audience.registrationId(user.getUserPushRegistrationId()));
							} else {// 然后调用安卓的
								Jdpush.jpushAndroid(parm1, Audience.registrationId(user.getUserPushRegistrationId()));
							}
						} catch (Exception e) {
						}
					}
				} catch (Exception e) {
				}
				
				if(route != null){
					// 消息
					Message mess = new Message();
					mess.setMessageType(6);
					mess.setMessageStaffType(2);
					mess.setMessageTime(OfTime.getLongTime());
					mess.setMessageContent("有拉黑用户在"+route.getRouteLocationName()+"泊车,车牌号："+enterOrAppear.getLicense_plate());// 消息内容
					
					// 推送的信息
					Map<String, String> parm1 = new HashMap<String, String>();
					parm1.put("title", "拉黑警报");
					parm1.put("body", "有拉黑用户在"+route.getRouteLocationName()+"泊车,车牌号："+enterOrAppear.getLicense_plate());
					List<AdminRole> ars = adminRoleService.selectByExample(new AdminRole());
					for (AdminRole ar : ars) {
						if(ar != null && ar.getAdminRoleAdmin() != null){
							if(ar.getAdminRoleRole().getRoleName().equals("路巡人员")){
								mess.setMessageUserId(ar.getAdminRoleAdminId());
								try {
									messageService.insertSelective(mess);
								} catch (Exception e){
								}
								
								try {// 推送信息
									if (ar.getAdminRoleAdmin().getAdminRegistrationType() == 0) { // 调用ios的
										Jdpush.jpushIOS(parm1, Audience.registrationId(ar.getAdminRoleAdmin().getAdminRegistrationId()));
									} else {// 然后调用安卓的
										Jdpush.jpushAndroid(parm1, Audience.registrationId(ar.getAdminRoleAdmin().getAdminRegistrationId()));
									}
								} catch (Exception e) {
								}
							}
						}
					}
				}
			}
		}

		String path = null;
		// 车单详情
		SingleCarDetails carDetails = new SingleCarDetails();
		carDetails.setSingleCarDetailsCameraIp(enterOrAppear.getCamera_ip());
		carDetails.setSingleCarDetailsRouteName(enterOrAppear.getRouteName());
		carDetails.setSingleCarDetailsTruckSpace(enterOrAppear.getTruck_space());
		carDetails.setSingleCarDetailsLicensePlate(enterOrAppear.getLicense_plate());
		carDetails.setSingleCarDetailsType(enterOrAppear.getType());
		carDetails.setSingleCarDetailsSingleCarId(singleCarId);
		try {
			if (enterOrAppear.getLicense_plate_image() != null
					&& !"".equals(enterOrAppear.getLicense_plate_image().trim())) {
				path = CommonUtil.imgStr(enterOrAppear.getLicense_plate_image());
				carDetails.setSingleCarDetailsLicensePlateImage(path);
			}
		} catch (Exception e) {
		}
		try {
			if (enterOrAppear.getPhotograph1() != null && !"".equals(enterOrAppear.getPhotograph1().trim())) {
				path = CommonUtil.imgStr(enterOrAppear.getPhotograph1());
				carDetails.setSingleCarDetailsPhotograph1(path);
			}
		} catch (Exception e) {
		}
		try {
			if (enterOrAppear.getPhotograph2() != null && !"".equals(enterOrAppear.getPhotograph2().trim())) {
				path = CommonUtil.imgStr(enterOrAppear.getPhotograph2());
				carDetails.setSingleCarDetailsPhotograph2(path);
			}
		} catch (Exception e) {
		}
		try {
			if (enterOrAppear.getVideo() != null && !"".equals(enterOrAppear.getVideo().trim())) {
				path = CommonUtil.videoStr(enterOrAppear.getVideo());
				carDetails.setSingleCarDetailsVideo(path);
			}
		} catch (Exception e) {
		}
		carDetails.setSingleCarDetailsTime(enterOrAppear.getTriggerDate());
		try {
			singleCarDetailsService.insertSelective(carDetails);
		} catch (Exception e) {
		}

		return Msg.success();
	}

	/**
	 * 查询全部路段
	 * 
	 * @throws UnsupportedEncodingException
	 */
	@ResponseBody
	@RequestMapping("/getRoute")
	public Msg getRoute(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 1000);
		List<RouteRecord> routeList = routeService.queryAllRouteRecord(new Route());
		PageInfo<RouteRecord> routeRecords = new PageInfo<RouteRecord>(routeList, 5);
		return Msg.success(routeRecords);
	}
	
	/**
	 * 根据路段查询路段
	 * 
	 * @throws UnsupportedEncodingException
	 */
	@ResponseBody
	@RequestMapping("/getRouteByRoute")
	public Msg getRouteByRoute(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam("content")Integer content) {
		PageHelper.startPage(pn, 30);
		
		Route route = new Route();
		route.setRouteId(content);
		List<RouteRecord> routeList = routeService.queryAllRouteRecord(route);
		PageInfo<RouteRecord> routeRecords = new PageInfo<RouteRecord>(routeList, 5);
		return Msg.success(routeRecords);
	}
	
	/**
	 * 检查路段名称是否可以用
	 */
	@ResponseBody
	@RequestMapping(value="/checkRouteName",method=RequestMethod.POST)
	public Msg checkRouteName(@RequestParam("routeName")String routeName){
		Route route = new Route();
		route.setRouteLocationName(routeName);
		Route routeList = routeService.selectByPrimary(route);
		if(routeList == null){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "菜单名称已存在,不能重复");
		}
	}
	
	
	
	
	//查找摄像头
	@ResponseBody
	@RequestMapping("/selectCameraIp")
	public Msg selectCameraIp(){
		List<Integer> cameraIds = new ArrayList<Integer>();
		List<Route> routes = routeService.selectByExample(new Route());
		Camera camera = new Camera();
		List<Camera> selectByExample = null;
		for (Route route : routes) {
			camera.setCameraRouteId(route.getRouteId());
			selectByExample = cameraService.selectByExample(camera);
			if(selectByExample != null){
				for (Camera c : selectByExample) {
					cameraIds.add(c.getCameraId());
				}
			}
		}
		List<Camera> list = new ArrayList<Camera>();
		if(!cameraIds.isEmpty()){
			list = cameraService.selectByNotCameraId(cameraIds);
		}else{
			list = cameraService.selectByExample(new Camera());
		}
		return Msg.success(list);
	}
	
	@ResponseBody
	@RequestMapping("/selectBillingMethodName")
	public Msg selectBillingMethodName(){
		List<BillingMethod> list = billingMethodService.selectByExample(new BillingMethod());
		return Msg.success(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/saveRoute",method = RequestMethod.POST)
	public Msg saveRoute(@Valid Route route){
		Route record = new Route();
		record.setRouteLocationName(route.getRouteLocationName());
		Route findRoute = routeService.selectByPrimary(record);
		if(findRoute != null) {
			return Msg.fail().add("msg", "改路段已存在");
		}
		Map<String, String> map = GetLatitudeUtils.getGeocoderLatitude(route.getRouteLocationName());
		if(map != null && !map.isEmpty()){
			Double longitude = Double.parseDouble(map.get("lng"));
			Double latitude = Double.parseDouble(map.get("lat"));
			route.setRouteLongitude(longitude);
			route.setRouteLatitude(latitude);
		}else{
			return Msg.fail().add("msg", "百度地图位未找到改路段的位置");
		}
		route.setRouteTime(new Date());
		int i = routeService.insertSelective(route);
		if(i != 1) {
			return Msg.fail().add("msg", "添加失败");
		}
		return Msg.success().add("msg", "添加成功");
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteroute/{ids}",method=RequestMethod.DELETE)
	public Msg deleteroute(@PathVariable("ids")String ids){
		Camera camera = new Camera();
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (int i = 0; i < str_ids.length; i++) {
				Integer id = Integer.parseInt(str_ids[i]);
				camera = cameraService.selectByPrimaryKey(id);
				if(camera != null){
					Route route = routeService.selectByPrimaryKey(camera.getCameraRouteId());
					camera.setCameraRouteId(null);
					try {
						cameraService.updateByPrimaryKey(camera);
					} catch (Exception e) {
					}
					Camera record = new Camera();
					record.setCameraRouteId(route.getRouteId());
					List<Camera> cameras = cameraService.selectByExample(record);
					if(cameras.isEmpty()) {
						int re = routeService.deleteByPrimaryKey(id);
						if(re == 0){
							return Msg.fail();
						}
					}
				}
				
				int re = routeService.deleteByPrimaryKey(id);
				if(re == 0){
					return Msg.fail();
				}
			}
		}else{
			Integer id = Integer.parseInt(ids);
			camera = cameraService.selectByPrimaryKey(id);
			if(camera != null){
				Route route = routeService.selectByPrimaryKey(camera.getCameraRouteId());
				camera.setCameraRouteId(null);
				try {
					cameraService.updateByPrimaryKey(camera);
				} catch (Exception e) {
				}
				Camera record = new Camera();
				record.setCameraRouteId(route.getRouteId());
				List<Camera> cameras = cameraService.selectByExample(record);
				if(cameras.isEmpty()) {
					int re = routeService.deleteByPrimaryKey(id);
					if(re == 0){
						return Msg.fail();
					}
				}
			}
		}
		return Msg.success();
	}
	
	/**
	 * 根据id查询单列
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getRouteById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getRouteById(@PathVariable("id")Integer routeId){
		Route route = new Route();
		route.setRouteId(routeId);
		RouteRecord routeRecord = routeService.selectRouteRecord(route);
		return Msg.success(routeRecord);
	}
	/**
	 * 更新
	 */
	@ResponseBody
	@RequestMapping(value="/updateRoute",method=RequestMethod.PUT)
	public Msg updateRoute(@Valid RouteRecord routeRecord){
		
		Route route = routeService.selectByPrimaryKey(routeRecord.getRouteId());
		if("".equals(routeRecord.getRouteLocationName().trim())) {
			return Msg.fail().add("msg", "路段名不能为空");
		}
		BillingMethod billingMethod = billingMethodService.selectByPrimary(routeRecord.getBillingMethod());
		if(billingMethod == null) {
			return Msg.fail().add("msg", "无此计费方式");
		}
		route.setRouteLocationName(routeRecord.getRouteLocationName());
		route.setRouteBillingMethodType(routeRecord.getRouteBillingMethodType());
		if(routeRecord.getRouteBillingMethodType() == 0) {
			route.setRouteBillingMethodId(billingMethod.getBillingMethodId());
		}else if(routeRecord.getRouteBillingMethodType() == 1) {
			route.setRouteBillingMethodId(null);
		}
		else if(routeRecord.getRouteBillingMethodType() == 2) {
			route.setRouteBillingMethodId(null);
		}
		int result = routeService.updateByPrimaryKeySelective(route);
		if(result != 0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteTruckSpace",method=RequestMethod.POST)
	public Msg deleteTruckSpace(@RequestParam("id")Integer cameraId){
		Camera camera = cameraService.selectByPrimaryKey(cameraId);
		if(camera != null){
			camera.setCameraRouteId(null);
			int re = cameraService.updateByPrimaryKey(camera);
			if(re == 0){
				return Msg.fail();
			}
		}
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="/saveCamera",method=RequestMethod.POST)
	public Msg saveCamera(@RequestParam("routeId")Integer routeId,@RequestParam("cameraId")Integer cameraId) {
		if(routeId == null){
			return Msg.fail().add("msg","参数错误");
		}
		if(cameraId == null){
			return Msg.fail().add("msg","参数错误");
		}
		Camera camera = cameraService.selectByPrimaryKey(cameraId);
		if(camera != null){
			if(camera.getCameraRouteId() == null){
				camera.setCameraRouteId(routeId);
				int i = cameraService.updateByPrimaryKeySelective(camera);
				if(i != 1){
					return Msg.fail().add("msg","添加失败");
				}
			}else{
				return Msg.fail().add("msg","该ip已被使用");
			}
		}else{
			return Msg.fail().add("msg","无此ip");
		}
		return Msg.success();
	}
	
}
