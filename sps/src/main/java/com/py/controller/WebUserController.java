package com.py.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.Authentication;
import com.py.bean.BillingMethod;
import com.py.bean.BillingMethodHour;
import com.py.bean.BillingMethodMinute15;
import com.py.bean.BillingMethodRecord;
import com.py.bean.Camera;
import com.py.bean.Coupon;
import com.py.bean.CouponGet;
import com.py.bean.CouponGetRecord;
import com.py.bean.Geography;
import com.py.bean.Invoice;
import com.py.bean.LicensePlate;
import com.py.bean.Message;
import com.py.bean.MonthCard;
import com.py.bean.MonthCardBuy;
import com.py.bean.MonthCardRecord;
import com.py.bean.Route;
import com.py.bean.RouteAndRecord;
import com.py.bean.SingleCar;
import com.py.bean.SingleCarInvoice;
import com.py.bean.TimeQuantum;
import com.py.bean.TradingRecord;
import com.py.bean.TruckSpace;
import com.py.bean.User;
import com.py.bean.UserInformationAudit;
import com.py.jdpush.Jdpush;
import com.py.service.BillingMethodHourService;
import com.py.service.BillingMethodMinute15Service;
import com.py.service.BillingMethodService;
import com.py.service.CameraService;
import com.py.service.CouponGetService;
import com.py.service.CouponGetsService;
import com.py.service.CouponService;
import com.py.service.InvoiceService;
import com.py.service.LicensePlateService;
import com.py.service.MessageService;
import com.py.service.MonthCardBuyService;
import com.py.service.MonthCardService;
import com.py.service.RouteService;
import com.py.service.SingleCarService;
import com.py.service.TradingRecordService;
import com.py.service.TruckSpaceService;
import com.py.service.UserInformationAuditService;
import com.py.service.UserService;
import com.py.util.CommonUtil;
import com.py.util.DateUtil;
import com.py.util.GetLatitudeUtils;
import com.py.util.Map2;
import com.py.util.Msg;
import com.py.util.OfTime;
import com.py.util.SMSBean;

import cn.jpush.api.push.model.audience.Audience;

@Controller
@RequestMapping("/web")
public class WebUserController {
	@Autowired
	UserService userService;
	@Autowired
	LicensePlateService licensePlateService;
	@Autowired
	RouteService routeService;
	@Autowired
	TruckSpaceService truckSpaceService;
	@Autowired
	SingleCarService singleCarService;
	@Autowired
	UserInformationAuditService userInformationAuditService;
	@Autowired
	CouponService couponService;
	@Autowired
	CouponGetService couponGetService;
	@Autowired
	MonthCardService monthCardService;
	@Autowired
	MonthCardBuyService monthCardBuyService;
	@Autowired
	TradingRecordService tradingRecordService;
	@Autowired
	InvoiceService invoiceService;
	@Autowired
	MessageService messageService;
	@Autowired
	BillingMethodService billingMethodService;
	@Autowired
	CouponGetsService couponGetsService;
	@Autowired
	CameraService cameraService;
	@Autowired
	BillingMethodHourService billingMethodHourService;
	@Autowired
	BillingMethodMinute15Service billingMethodMinute15Service;
	
	
	
	/**************************************************消息begin*******************************************************/
	
	/**
	 * 根据消息类型删除消息
	 * @param phonenum
	 * @param message_type
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteByMessageType",method=RequestMethod.POST)
	public Msg deleteByMessageType(@RequestParam("phonenum")String phonenum,@RequestParam("message_type")Integer message_type) {
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		Message message = new Message();
		message.setMessageUserId(smsBean.getId());
		message.setMessageStaffType(1);
		message.setMessageType(message_type);
		try {
			//删除消息
			int i = messageService.deleteByPrimary(message);
			if(i != 0) {
				//如果返回值不为0则删除成功
				return Msg.success();
			}else {
				//否则删除失败
				return Msg.fail();
			}
		} catch (Exception e) {
			return Msg.fail();
		}
	}
	
	/**
	 * 消息是否已读
	 * @param message_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/read",method=RequestMethod.POST)
	public Msg read(@RequestParam("message_id")Integer message_id) {
		if(message_id != null) {
			Message message = messageService.selectByPrimaryKey(message_id);
			if(message != null) {
				message.setMessageRead(1);//改成已读状态
				try {
					messageService.updateByPrimaryKeySelective(message);
				} catch (Exception e) {
				}
			}
		}
		return Msg.success();
	}
	
	/**
	 * 获取每个类型的信息的第一条
	 * @param phonenum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/messgerTop1",method=RequestMethod.POST)
	public Msg messgerTop1(@RequestParam("phonenum")String phonenum) {
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		Message message = new Message();
		message.setMessageStaffType(1);
		message.setMessageUserId(smsBean.getId());
		List<Message> messages = new ArrayList<Message>();
		Message selectByPrimary = null;
		for (int i = 1; i < 6; i++) {
			message.setMessageType(i);
			selectByPrimary = messageService.selectByPrimary(message);//查找每类型的信息的第一条
			if(selectByPrimary != null) {
				messages.add(selectByPrimary);
			}
		}
		return Msg.success(messages);
	}
	
	/**
	 * 获取所有消息
	 * @param phonenum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/messger",method=RequestMethod.POST)
	public Msg messger(@RequestParam("phonenum")String phonenum,@RequestParam("message_type")Integer messageType) {
		//获取用户信息
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		Message message = new Message();
		message.setMessageStaffType(1);
		if(messageType != 0) {
			message.setMessageType(messageType);
		}
		message.setMessageUserId(smsBean.getId());
		List<Message> list = messageService.selectByExample(message);
		return Msg.success(list);
	}
	
	/**************************************************消息end*********************************************************/
	
	/**************************************************我的钱包begin*****************************************************/
	/*--------------------------------------------------发票begin-----------------------------------------------------*/
	
	/**
	 * 申请发票
	 * @param invoice			发票
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/applyForInvoice",method=RequestMethod.POST)
	public Msg applyForInvoice(@RequestParam("phonenum")String phonenum,@Valid Invoice invoice) {
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		
		if(invoice.getInvoiceType() == 1) {//纸质发票
			User user = userService.selectByPrimaryKey(smsBean.getId());
			if(user.getUserBalance() < 10) {
				return Msg.fail().add("msg", "余额不足,请先充值!");
			}
			user.setUserBalance(user.getUserBalance() - 10);//扣除申请发票的费用10元
			userService.updateByPrimaryKeySelective(user);
			//生成交易记录
			TradingRecord tradingRecord = new TradingRecord();
		    tradingRecord.setTradingRecordUserId(smsBean.getId());
		    tradingRecord.setTradingRecordType(2);
		    tradingRecord.setTradingRecordPrice(10d);
		    tradingRecord.setTradingRecordDes("申请纸质发票10元");
		    tradingRecord.setTradingRecordStatus(1);
		    tradingRecord.setTradingRecordTime(new Date());
		    try {
		    	tradingRecordService.insertSelective(tradingRecord);
			} catch (Exception e) {
				Msg.fail().add("msg", "支付失败");
			}
		}
		invoice.setInvoiceUserId(smsBean.getId());
		invoice.setInvoiceReceiveMode(invoice.getInvoiceType());
		invoiceService.insertSelective(invoice);
		return Msg.success();
	}
	
	/*---------------------------------------------------发票end------------------------------------------------------*/
	/**
	 * 车单支付
	 * @param phonenum
	 * @param single_car_id
	 * @param coupon_get_id			获取的优惠券id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/singleCarPay",method=RequestMethod.POST)
	public Msg singleCarPay(@RequestParam("phonenum")String phonenum,
			@RequestParam("single_car_id")Integer single_car_id,
			@RequestParam("coupon_get_id")Integer coupon_get_id) {
		//获取用户信息
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User user = userService.selectByPrimaryKey(smsBean.getId());
		//获取车单
		SingleCar singleCar = singleCarService.selectByPrimaryKey(single_car_id);
		if(singleCar == null) {
			return Msg.fail().add("msg", "该订单无效!");
		}
		if(user.getUserBalance() < singleCar.getSingleCarPrice()) {
			return Msg.fail().add("msg", "余额不足,请先充值!");
		}
		
		Double price = singleCar.getSingleCarPrice();//费用
		
		Coupon coupon = null;//优惠券模板
		CouponGet couponGet = null;//获取的优惠券
		
		if(coupon_get_id != null && coupon_get_id != 0) {
			couponGet = couponGetService.selectByPrimaryKey(coupon_get_id);
		}
		
  		if(couponGet != null) {
  			coupon = couponService.selectByPrimaryKey(couponGet.getCouponGetCouponId());
  			if(coupon != null && coupon.getCouponFull() <= price) {
  				price -= coupon.getCouponParValue();
  				couponGet.setCouponGetStatus(1);
  				try {
  					int i = couponGetService.updateByPrimaryKeySelective(couponGet);
  					if(i != 1) {
  						Msg.fail().add("msg", "优惠券使用异常");
  					}
  				} catch (Exception e) {
  					Msg.fail().add("msg", "优惠券使用异常");
  				}
  			}
  		}
  		
  		singleCar.setSingleCarType(2);
		
		//生成交易记录
		TradingRecord tradingRecord = new TradingRecord();
	    tradingRecord.setTradingRecordUserId(smsBean.getId());
	    tradingRecord.setTradingRecordType(2);
	    tradingRecord.setTradingRecordPrice(price);
    	tradingRecord.setTradingRecordDes("支付车单"+price +"元");
	    tradingRecord.setTradingRecordStatus(1);
	    tradingRecord.setTradingRecordBill(String.valueOf(singleCar.getSingleCarId()));
	    tradingRecord.setTradingRecordTime(new Date());
	    //扣处月卡费用
  		user.setUserBalance(user.getUserBalance() - price);
  		//购买月卡送积分(一元一积分)
  		user.setUserIntegral(user.getUserIntegral() + price.intValue());
  		
		try {
			singleCarService.updateByPrimaryKeySelective(singleCar);
			userService.updateByPrimaryKeySelective(user);
			tradingRecordService.insertSelective(tradingRecord);
		} catch (Exception e) {
			Msg.fail().add("msg", "支付失败");
		}
		
		//消息   ---  推送
		Message message = new Message();
		message.setMessageType(2);
		message.setMessageStaffType(1);
		message.setMessageUserId(user.getUserId());
		message.setMessageTime(OfTime.getLongTime());
		message.setMessageContent("支付车单"+ price +"元");
		try {
			int i = messageService.insertSelective(message);
			if(i != 0){
				Map<String, String> parm =new HashMap<String, String>();
				parm.put("title","缴费信息");
				parm.put("body","支付车单"+ price +"元");
				if(user.getUserPushType() == 0) { //调用ios的
					Jdpush.jpushIOS(parm, Audience.registrationId(user.getUserPushRegistrationId()));
				}else {//然后调用安卓的
					Jdpush.jpushAndroid(parm, Audience.registrationId(user.getUserPushRegistrationId()));
				}
			}
		} catch (Exception e) {
		}
		return Msg.success();
	}
	
	/**
	 * 获取可用的优惠券
	 * @param phonenum
	 * @param price
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/usableCoupon",method=RequestMethod.POST)
	public Msg usableCoupon(@RequestParam("phonenum")String phonenum,@RequestParam("price")Double price) {
		//获取用户信息
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		
		Coupon coupon = new Coupon();
		if(price != null) {
			coupon.setCouponFull(price);
		}else {
			return Msg.fail().add("msg", "请上传金额");
		}
		
		CouponGetRecord couponGetRecord = new CouponGetRecord();
		couponGetRecord.setCouponGetUserId(smsBean.getId());
		couponGetRecord.setCouponGetStatus(0);
		couponGetRecord.setCoupon(coupon);
		
		List<CouponGetRecord> coupons =  couponGetService.selectCouponGetRecord(couponGetRecord);
		
		return Msg.success(coupons);
	}
	
	/*---------------------------------------------------月卡begin-----------------------------------------------------*/
	/**
	 * 购买月卡
	 * @param phonenum
	 * @param month_card_id    月卡id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/monthCardBuy",method=RequestMethod.POST)
	public Msg monthCardBuy(@RequestParam("phonenum")String phonenum,@RequestParam("month_card_id")Integer month_card_id) {
		//获取用户信息
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User user = userService.selectByPrimaryKey(smsBean.getId());
		
		Date date = new Date();
		
		//根据用户id查找该月卡id有没有被购买
		MonthCardBuy monthCardBuy = new MonthCardBuy();
		monthCardBuy.setMonthCardId(month_card_id);
		monthCardBuy.setMonthCardBuyUserId(user.getUserId());
		monthCardBuy.setMonthCardBuyStartTime(date);
		//查找最新的一个
		MonthCardBuy cardBuy = monthCardBuyService.selectByPrimaryTop1(monthCardBuy);
		//获取该月卡
		MonthCard monthCard = monthCardService.selectByPrimaryKey(month_card_id);
		//判断余额是否足够
		if(user.getUserBalance() < monthCard.getMonthCardPrice()) {
			return Msg.fail().add("msg", "余额不足,请先充值!");
		}
		
		//生成交易记录
		TradingRecord tradingRecord = new TradingRecord();
	    tradingRecord.setTradingRecordUserId(smsBean.getId());
	    tradingRecord.setTradingRecordType(2);
	    tradingRecord.setTradingRecordPrice(monthCard.getMonthCardPrice());
	    tradingRecord.setTradingRecordDes("购买月卡"+monthCard.getMonthCardPrice() +"元");
	    tradingRecord.setTradingRecordStatus(1);
	    tradingRecord.setTradingRecordTime(date);
		//扣处月卡费用
		user.setUserBalance(user.getUserBalance() - monthCard.getMonthCardPrice());
		//购买月卡送积分(一元一积分)
		user.setUserIntegral(user.getUserIntegral() + monthCard.getMonthCardPrice().intValue());
		
		try {
			userService.updateByPrimaryKeySelective(user);
			tradingRecordService.insertSelective(tradingRecord);
		} catch (Exception e) {
			Msg.fail().add("msg", "购买失败");
		}
		
		if(cardBuy == null) {
			//设置结束时间
			monthCardBuy.setMonthCardBuyEndTime(DateUtil.getDateAddMonth(date, 1));
			try {
				monthCardBuyService.insertSelective(monthCardBuy);
			} catch (Exception e) {
				Msg.fail().add("msg", "购买失败");
			}
		}else {//叠加月卡的，但现运作未被用到
			cardBuy.setMonthCardBuyEndTime(DateUtil.getDateAddMonth(cardBuy.getMonthCardBuyEndTime(), 1));
			try {
				monthCardBuyService.updateByPrimaryKeySelective(cardBuy);
			} catch (Exception e) {
				Msg.fail().add("msg", "购买失败");
			}
		}
		
		//消息   ---  推送
		Message message = new Message();
		message.setMessageType(2);	
		message.setMessageStaffType(1);
		message.setMessageUserId(user.getUserId());
		message.setMessageTime(OfTime.getLongTime());
		message.setMessageContent("购买月卡"+monthCard.getMonthCardPrice() +"元");
		try {
			int i = messageService.insertSelective(message);
			if(i != 0){
				Map<String, String> parm =new HashMap<String, String>();
				parm.put("title","缴费信息");
				parm.put("body","购买月卡"+monthCard.getMonthCardPrice() +"元");
				if(user.getUserPushType() == 0) { //调用ios的
					try {
						Jdpush.jpushIOS(parm, Audience.registrationId(user.getUserPushRegistrationId()));
					} catch (Exception e) {}
				}else {//然后调用安卓的
					try {
						Jdpush.jpushAndroid(parm, Audience.registrationId(user.getUserPushRegistrationId()));
					} catch (Exception e) {}
				}
			}
		} catch (Exception e) {
		}
		return Msg.success();
	}
	/**
	 * 我的月卡
	 * @param phonenum
	 * @return
	 */
	/**
	 * 我的月卡
	 * @param phonenum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/myMonthCard",method=RequestMethod.POST)
	public Msg myMonthCard(@RequestParam("phonenum")String phonenum) {
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		MonthCardBuy monthCardBuy = new MonthCardBuy();
		monthCardBuy.setMonthCardBuyUserId(smsBean.getId());
		List<MonthCardRecord> monthCardRecords = monthCardBuyService.selectByExampleRecord(monthCardBuy);
		return Msg.success(monthCardRecords);
	}
	
	/**
	 * 所有的月卡
	 * @param pn		页码
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/monthCard",method=RequestMethod.POST)
	public Msg monthCard(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam("phonenum")String phonenum) {
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		
		PageHelper.startPage(pn, 10);//每页条数
		
		MonthCard monthCard = new MonthCard();//月卡模板
		monthCard.setMonthCardStatus(1);//开启状态的月卡
		
		List<MonthCardRecord> monthCardRecords = monthCardService.selectByExampleRecord(monthCard);
		
		MonthCardBuy monthCardBuy = new MonthCardBuy();
		monthCardBuy.setMonthCardBuyUserId(smsBean.getId());
		
		MonthCardBuy findMonthCardBuy = null;
		
		for (MonthCardRecord monthCardRecord : monthCardRecords) {
			monthCardBuy.setMonthCardId(monthCardRecord.getMonthCardId());
			findMonthCardBuy = monthCardBuyService.selectByPrimaryTop1(monthCardBuy);
			if(findMonthCardBuy != null) {
				monthCardRecord.setMonthCardBuy(findMonthCardBuy);//该客户购买的月卡
			}
		}
		
		PageInfo<MonthCardRecord> page = new PageInfo<MonthCardRecord>(monthCardRecords,5);
		return Msg.success(page);
	}
	/*---------------------------------------------------月卡end-------------------------------------------------------*/
	/*--------------------------------------------------优惠券begin-----------------------------------------------------*/
	
	/**
	 * 我的优惠券
	 * @param phonenum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/myCoupon",method=RequestMethod.POST)
	public Msg myCoupon(@RequestParam("phonenum")String phonenum) {
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		
		CouponGet couponGet = new CouponGet();
		couponGet.setCouponGetUserId(smsBean.getId());
		couponGet.setCouponGetStatus(0);
		
		List<CouponGetRecord> couponGets = couponGetService.selectByExampleRecord(couponGet);
		
		return Msg.success(couponGets);
	}
	
	/**
	 * 兑换优惠券
	 * @param phonenum
	 * @param coupon_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/integralExchange",method=RequestMethod.POST)
	public Msg couponExchange(@RequestParam("phonenum")String phonenum,
			@RequestParam("coupon_id")Integer coupon_id) {
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User user = userService.selectByPrimaryKey(smsBean.getId());
		//优惠券
		Coupon coupon = couponService.selectByPrimaryKey(coupon_id);
		//判断积分是否足够兑换
		if(user.getUserIntegral() < coupon.getCouponIntegral()) {
			return Msg.fail().add("msg", "积分不足");
		}
		
		Date date = new Date();
		
		CouponGet couponGet = new CouponGet();
		couponGet.setCouponGetUserId(smsBean.getId());
		couponGet.setCouponGetCouponId(coupon.getCouponId());
		couponGet.setCouponGetStartTime(date);
		couponGet.setCouponGetEndTime(DateUtil.getDateAddDay(date, coupon.getCouponValidTime()));
		couponGet.setCouponGetTime(date);
		
		user.setUserIntegral(user.getUserIntegral() - coupon.getCouponIntegral());//扣除积分
		
		couponGetService.insertSelective(couponGet);
		userService.updateByPrimaryKeySelective(user);
		
		return Msg.success();
	}
	
	/**
	 * 获取积分兑换的优惠券（我的优惠券）
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/fintIntegralExchange",method=RequestMethod.POST)
	public Msg fintIntegralExchange() {
		Coupon coupon = new Coupon();
		coupon.setCouponIsIntegral(1);
		coupon.setCouponDelfalg(0);
		List<Coupon> list = couponService.selectByExample(coupon);
		return Msg.success(list);
	}
	/*--------------------------------------------------优惠券end-------------------------------------------------------*/
	
	/**
	 * 我的积分
	 * @param phonenum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/myIntegral",method=RequestMethod.POST)
	public Msg myIntegral(@RequestParam("phonenum")String phonenum) {
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User user = userService.selectByPrimaryKey(smsBean.getId());
		return Msg.success(user.getUserIntegral());
	}
	
	/**
	 * 我的金额
	 * @param phonenum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/myBurse",method=RequestMethod.POST)
	public Msg myBurse(@RequestParam("phonenum")String phonenum) {
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User user = userService.selectByPrimaryKey(smsBean.getId());
		return Msg.success(user.getUserBalance());
	}
	
	/***************************************************我的钱包end******************************************************/
	
	/**************************************************我的车单begin*****************************************************/
	
	/**
	 * 我的车单
	 * @param phonenum			
	 * @param singleCarType		车单状态: 6:全部, 0:未完成停车 1:待付款 2:已完成
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/mySingleCar",method=RequestMethod.POST)
	public Msg mySingleCar(@RequestParam("phonenum")String phonenum,
			@RequestParam("singleCarType")Integer singleCarType) {
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User user = userService.selectByPrimaryKey(smsBean.getId());
		//获取我的车牌
		LicensePlate licensePlate = new LicensePlate();
		licensePlate.setLicensePlateUserId(user.getUserId());
		List<LicensePlate> licensePlateList = licensePlateService.selectByExample(licensePlate);
		//车牌集合
		List<String> licensePlates = new ArrayList<String>();
		for (LicensePlate lp : licensePlateList) {
			licensePlates.add(lp.getLicensePlateNumber());//把我的车牌装进集合，用于
		}
		Map<String, Object> map = new HashMap<String,Object>();
		if(!licensePlates.isEmpty()) {
			if(!licensePlates.isEmpty()) {
				map.put("licensePlates", licensePlates);//车牌集合
			}
			if(singleCarType != 6) {
				map.put("singleCarType", singleCarType);//订单类型
			}
			List<SingleCarInvoice> list = singleCarService.selectByLicensePlateByMap(map);
			for (SingleCarInvoice singleCarInvoice : list) {
				if(singleCarInvoice.getInvoice() == null) {
					singleCarInvoice.setStatus(0);//未申请发票
				}else {
					if(singleCarInvoice.getInvoice().getInvoiceStatus() == 0) {
						singleCarInvoice.setStatus(1);//申请中
					}else if(singleCarInvoice.getInvoice().getInvoiceStatus() == 1) {
						singleCarInvoice.setStatus(2);//已出票
					}
				}
			}
			return Msg.success(list);
		}
		//我的车单
		//List<SingleCar> list = singleCarService.selectByLicensePlate(licensePlates);
		
		return Msg.success();
		
	}
	
	/***************************************************我的车单end******************************************************/
	
	/****************************************************主頁begin*****************************************************/
	
	/**
	 * 找车位
	 * @param route_name			路段名
	 * @param range_x   			范围-x(km)
	 * @param range_y   			范围-y(km)
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/lookForTruckSpace",method=RequestMethod.POST)
	public Msg lookForTruckSpace(@RequestParam("route_name")String route_name,
			@RequestParam("range_x")Double range_x,
			@RequestParam("range_y")Double range_y) {
		//向百度api获取该路段名的经纬度
		Map<String, String> map = GetLatitudeUtils.getGeocoderLatitude(route_name);
		Double longitude = Double.parseDouble(map.get("lng"));
		Double latitude = Double.parseDouble(map.get("lat"));
		
		double longt = Map2.getLongt(longitude, latitude, Map2.LONGT*range_x);
		double lat = Map2.getLat(longitude, latitude, Map2.LAT*range_y);
		//设置范围查找
		double log_left = longitude - longt;	//
		double log_right = longitude + longt;	//
		double lat_left = latitude - lat;		//
		double lat_right = latitude + lat;		//
		
		Geography geography = new Geography(log_left, log_right, lat_left, lat_right, 0);//按范围查找
		List<RouteAndRecord> list = routeService.selectByRange(geography);
		
		Msg msg = Msg.success();
		msg.setObject(list);
		msg.add("lng", longitude);
		msg.add("lat", latitude);
		
		return msg;
	}
	
	/**
	 * 找车
	 * @param license_plate				车牌
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/lookForCar",method=RequestMethod.POST)
	public Msg lookForCar(@RequestParam("phonenum")String phonenum,@RequestParam("license_plate")String license_plate) {
		//根据车牌号查找最新的泊车记录
		SingleCar singleCar = new SingleCar();
		singleCar.setSingleCarLicensePlate(license_plate);
		singleCar.setSingleCarType(0);
		singleCar = singleCarService.selectByPrimary(singleCar);//按车牌查找到的最新的泊入记录
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User user = userService.selectByPrimaryKey(smsBean.getId());
		if(user.getUserStatus() != 1) {
			return Msg.fail().add("mag", "请先认证");
		}
		
		Map<String,Double> map = new HashMap<String,Double>();
		
		if(singleCar != null) {
			Camera camera = new Camera();//相机
			camera.setCameraIp(singleCar.getSingleCarCameraIp());
			camera = cameraService.selectByPrimary(camera);
			if(camera != null) {
				if(camera.getCameraLng() != null && camera.getCameraLat() != null) {
					map.put("log", camera.getCameraLng());
					map.put("lat", camera.getCameraLat());
				}else {
					return Msg.fail().add("mag", "未找到该车辆位置");
				}
			}else {
				return Msg.fail().add("mag", "未找到该车辆位置");
			}
		}else {
			return Msg.fail().add("mag", "未找到该车辆位置");
		}
		return Msg.success(map);
	}
	
	/**
	 * 获取某个路段的信息
	 * @param routeId 停车场id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getRoute",method=RequestMethod.POST)
	public Msg getRoute(@RequestParam("routeId")Integer routeId) {
		if(routeId == null) {
			return Msg.fail().add("msg", "停车场id不能为空");
		}
		//获取当前时间（时）
		int hours = new Date().getHours();
		double price = 0;
		
		Route route = routeService.selectByPrimaryKey(routeId);
		
		Camera record = new Camera();
		record.setCameraRouteId(routeId);
		List<Camera> cameras = cameraService.selectByExample(record);
		
		List<TruckSpace> list = new ArrayList<TruckSpace>();
		
		for (Camera camera : cameras) {
			//获取该路段的空车位
			TruckSpace truckSpace = new TruckSpace();
			truckSpace.setTruckSpaceCameraId(camera.getCameraId());
			truckSpace.setTruckSpaceStatus(0);//未停车
			truckSpace.setTruckSpaceDelfalg(0);
			List<TruckSpace> truckSpaces = truckSpaceService.selectByExample(truckSpace);
			for (TruckSpace ts : truckSpaces) {
				list.add(ts);
			}
		}
		
		//封装返回的数据
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("route_name", route.getRouteLocationName());//路段名
		map.put("num", list.size());//空车位数
		
		switch (route.getRouteBillingMethodType()) {//计费方式类型 0:时间段 1：小时 2:15分钟
		case 0:
			//计费方式(时间段)
			BillingMethod billingMethod = new BillingMethod();
			billingMethod.setBillingMethodId(route.getRouteBillingMethodId());
			BillingMethodRecord billingMethodRecord = billingMethodService.selectByPrimaryRecord(billingMethod);
			List<TimeQuantum> timeQuantums = billingMethodRecord.getTimeQuantums();
			//获取该点所在的时间段的价格
			for (TimeQuantum timeQuantum : timeQuantums) {
				if( hours >= timeQuantum.getTimeQuantumStartTime() && hours < timeQuantum.getTimeQuantumEndTime()) {
					price = timeQuantum.getTimeQuantumRate();
				}
			}
			break;
		case 1:
			//计费方式(时)
			BillingMethodHour billingMethodHour = billingMethodHourService.selectByPrimaryKey(1);
			price = billingMethodHour.getBillingMethodHourAddPrice();
			break;
		case 2:
			//计费方式(15分)
			BillingMethodMinute15 billingMethodMinute15 = billingMethodMinute15Service.selectByPrimaryKey(1);
			price = billingMethodMinute15.getBillingMethodMinute15AddPrice();
			break;
		}
		map.put("price", price);//价格
		return Msg.success(map);
	}
	
	/**
	 * 查看可用停车场
	 * @param longitude 中心点经度
	 * @param latitude  中心点纬度
	 * @param range_x   范围-x(km)
	 * @param range_y   范围-y(km)
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/findParkingLots",method=RequestMethod.POST)
	public Msg findParkingLots(
			@RequestParam("phonenum")String phonenum,
			@RequestParam("longitude")Double longitude,
			@RequestParam("latitude")Double latitude,
			@RequestParam("range_x")Double range_x,
			@RequestParam("range_y")Double range_y) {
		
		double longt = Map2.getLongt(longitude, latitude, Map2.LONGT*range_x);
		double lat = Map2.getLat(longitude, latitude, Map2.LAT*range_y);
		//设置范围查找
		double log_left = longitude - longt;	//
		double log_right = longitude + longt;	//
		double lat_left = latitude - lat;		//
		double lat_right = latitude + lat;		//
		//查找该范围的停车场（路段）
		Geography geography = new Geography(log_left, log_right, lat_left, lat_right, 0);
		List<RouteAndRecord> list = routeService.selectByRange(geography);
		Msg msg = Msg.success(list);
		return Msg.success(msg);
	}
	
	/***************************************************主頁中心end*****************************************************/
	
	/****************************************************车牌begin*****************************************************/
	
	/**
	 * 我的车牌
	 * @param phonenum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/myPlateNumber",method=RequestMethod.POST)
	public Msg myPlateNumber(@RequestParam("phonenum")String phonenum) {
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User user = userService.selectByPrimaryKey(smsBean.getId());
		
		LicensePlate licensePlate = new LicensePlate();
		licensePlate.setLicensePlateUserId(user.getUserId());
		List<LicensePlate> list = licensePlateService.selectByExample(licensePlate);
		return Msg.success(list);
	}
	
	/**
	 * 删除车牌
	 * @param license_plate_ids 车牌id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delectPlateNumber",method=RequestMethod.POST)
	public Msg delectPlateNumber(@RequestParam("phonenum")String phonenum,@RequestParam("license_plate_ids")String license_plate_ids) {
		if(license_plate_ids != null) {
			String[] split = license_plate_ids.split(",");
			if(split != null && split.length != 0) {
				for (String license_plate_id : split) {
					try {
						licensePlateService.deleteByPrimaryKey(Integer.parseInt(license_plate_id));
					} catch (Exception e) {
						return Msg.fail().add("msg", "参数错误");
					}
				}
			}else {
				return Msg.fail().add("msg", "请选择车牌");
			}
		}else {
			return Msg.fail().add("msg", "请选择车牌");
		}
		return Msg.success();
	}
	
	/***
	 * 添加车牌
	 * @param phonenum
	 * @param license_plate_photo_url    车辆图片
	 * @param license_plate_information  车辆信息
	 * @param license_plate_number		   车牌号
	 * @param license_plate_the_owner    车主姓名
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addPlateNumberBase64",method=RequestMethod.POST)
	public Msg addPlateNumberBase64(@RequestParam("phonenum")String phonenum,
			@RequestParam("license_plate_photo_url")String license_plate_photo_url,
			@RequestParam("license_plate_information")String license_plate_information,
			@RequestParam("license_plate_number")String license_plate_number,
			@RequestParam("license_plate_the_owner")String license_plate_the_owner) {
		if(license_plate_photo_url == null) {
			return Msg.fail().add("msg", "请上传车辆图片");
		}
		if(license_plate_information == null) {
			return Msg.fail().add("msg", "请填写车辆信息");
		}
		if(license_plate_number == null) {
			return Msg.fail().add("msg", "请填写车牌号");
		}
		if(license_plate_the_owner == null) {
			return Msg.fail().add("msg", "请填写车主姓名");
		}
		
		User user = new User();
		user.setUserAccount(phonenum);
		User findUser = userService.selectByPrimary(user);
		String path = null;
		
		LicensePlate record = new LicensePlate();
		record.setLicensePlateNumber(license_plate_number);
		//record.setLicensePlateUserId(findUser.getUserId());
		record = licensePlateService.selectByPrimary(record);
		if(record != null) {
			return Msg.fail().add("msg", "该车牌号已存在");
		}
		
		LicensePlate licensePlate = new LicensePlate();
		//车辆图片
		try {
			path = CommonUtil.imgStr(license_plate_photo_url);
			licensePlate.setLicensePlatePhotoUrl(path);
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "车辆图片上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "车辆图片上传失败");
		}
		licensePlate.setLicensePlateInformation(license_plate_information);
		licensePlate.setLicensePlateNumber(license_plate_number);
		licensePlate.setLicensePlateTheOwner(license_plate_the_owner);
		licensePlate.setLicensePlateUserId(findUser.getUserId());
		try {
			licensePlateService.insertSelective(licensePlate);
		} catch (Exception e) {
			e.printStackTrace();
			return Msg.fail().add("msg", "添加失败");
		}
		
		return Msg.success();
	}
	
	/***
	 * 添加车牌
	 * @param phonenum
	 * @param license_plate_photo_url    车辆图片
	 * @param license_plate_information  车辆信息
	 * @param license_plate_number		   车牌号
	 * @param license_plate_the_owner    车主姓名
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addPlateNumber",method=RequestMethod.POST)
	public Msg addPlateNumber(@RequestParam("phonenum")String phonenum,
			@RequestParam("license_plate_photo_url")MultipartFile license_plate_photo_url,
			@RequestParam("license_plate_information")String license_plate_information,
			@RequestParam("license_plate_number")String license_plate_number,
			@RequestParam("license_plate_the_owner")String license_plate_the_owner) {
		if(license_plate_photo_url == null) {
			return Msg.fail().add("msg", "请上传车辆图片");
		}
		if(license_plate_information == null) {
			return Msg.fail().add("msg", "请填写车辆信息");
		}
		if(license_plate_number == null) {
			return Msg.fail().add("msg", "请填写车牌号");
		}
		if(license_plate_the_owner == null) {
			return Msg.fail().add("msg", "请填写车主姓名");
		}
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User user = userService.selectByPrimaryKey(smsBean.getId());
		String path = null;
		
		LicensePlate record = new LicensePlate();
		record.setLicensePlateNumber(license_plate_number);
		//record.setLicensePlateUserId(findUser.getUserId());
		record = licensePlateService.selectByPrimary(record);
		if(record != null) {
			return Msg.fail().add("msg", "该车牌号已存在");
		}
		
		LicensePlate licensePlate = new LicensePlate();
		//车辆图片
		try {
			path = CommonUtil.saveFile(license_plate_photo_url);
			licensePlate.setLicensePlatePhotoUrl(path);
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "车辆图片上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "车辆图片上传失败");
		}
		licensePlate.setLicensePlateInformation(license_plate_information);
		licensePlate.setLicensePlateNumber(license_plate_number);
		licensePlate.setLicensePlateTheOwner(license_plate_the_owner);
		licensePlate.setLicensePlateUserId(user.getUserId());
		
		try {
			licensePlateService.insertSelective(licensePlate);
		} catch (Exception e) {
			return Msg.fail().add("msg", "添加失败");
		}
		List<LicensePlate> list = new ArrayList<LicensePlate>();
		list.add(licensePlate);
		return Msg.success(list);
	}
	
	/*****************************************************车牌end****************************************************/
	
	
	
	/*****************************************************个人信息begin****************************************************/
	
	/**
	 * 实名验证上传资料Base64
	 * @param phonenum
	 * @param facade_of_id_card						手持身份证正面照
	 * @param reverse_photo_of_id_card				手持身份证反面照
	 * @param positive_license_of_driver_license	手持驾驶证正面照
	 * @param reverse_photo_of_driver_license		手持驾驶证反面照
	 * @param full_name								真实姓名
	 * @param id_number								身份证号
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/certificationBase64",method=RequestMethod.POST)
	public Msg certificationBase64(@RequestParam("phonenum")String phonenum,
			@RequestParam("facade_of_id_card")String facade_of_id_card,
			@RequestParam("reverse_photo_of_id_card")String reverse_photo_of_id_card,
			@RequestParam("positive_license_of_driver_license")String positive_license_of_driver_license,
			@RequestParam("reverse_photo_of_driver_license")String reverse_photo_of_driver_license,
			@RequestParam("full_name")String full_name,
			@RequestParam("id_number")String id_number) {
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User u = userService.selectByPrimaryKey(smsBean.getId());
		String path = null;
		//真实姓名
		if(full_name != null) {
			u.setUserFullName(full_name);
		}
		//身份证号
		if(id_number != null) {
			u.setUserIdNumber(id_number);
		}
		
		UserInformationAudit userInformationAudit = new UserInformationAudit();
		userInformationAudit.setUserInformationAuditUserNumber(u.getUserNumber());
		
		//手持身份证正面照
		try {
			userInformationAudit.setUserInformationAuditType(1);
			UserInformationAudit audit = userInformationAuditService.selectByPrimary(userInformationAudit);
			if(audit == null) {//当为申请过时 添加
				path = CommonUtil.imgStr(facade_of_id_card);
				userInformationAudit.setUserInformationAuditPhoto(path);
				userInformationAudit.setUserInformationAuditApplyTime(OfTime.getLongTime());
				userInformationAuditService.insertSelective(userInformationAudit);
			}else {//当为已申请过时 修改
				//需审核过了并且未通过才可修改
				if(audit.getUserInformationAuditState() == 1 && audit.getUserInformationAuditResult() == 0) {
					path = CommonUtil.imgStr(facade_of_id_card);
					audit.setUserInformationAuditPhoto(path);
					audit.setUserInformationAuditState(0);
					userInformationAuditService.updateByPrimaryKeySelective(audit);
				}
			}
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "手持身份证正面照上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "手持身份证正面照上传失败");
		}
		//手持身份证反面照
		try {
			userInformationAudit.setUserInformationAuditType(2);
			UserInformationAudit audit = userInformationAuditService.selectByPrimary(userInformationAudit);
			if(audit == null) {
				path = CommonUtil.imgStr(reverse_photo_of_id_card);
				userInformationAudit.setUserInformationAuditPhoto(path);
				userInformationAudit.setUserInformationAuditApplyTime(OfTime.getLongTime());
				userInformationAuditService.insertSelective(userInformationAudit);
			}else {
				if(audit.getUserInformationAuditState() == 1 && audit.getUserInformationAuditResult() == 0) {
					path = CommonUtil.imgStr(reverse_photo_of_id_card);
					audit.setUserInformationAuditPhoto(path);
					audit.setUserInformationAuditState(0);
					userInformationAuditService.updateByPrimaryKeySelective(audit);
				}
			}
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "手持身份证反面照上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "手持身份证反面照上传失败");
		}
		//手持驾驶证正面照
		try {
			userInformationAudit.setUserInformationAuditType(3);
			UserInformationAudit audit = userInformationAuditService.selectByPrimary(userInformationAudit);
			if(audit == null) {
				path = CommonUtil.imgStr(positive_license_of_driver_license);
				userInformationAudit.setUserInformationAuditPhoto(path);
				userInformationAudit.setUserInformationAuditApplyTime(OfTime.getLongTime());
				userInformationAuditService.insertSelective(userInformationAudit);
			}else {
				if(audit.getUserInformationAuditState() == 1 && audit.getUserInformationAuditResult() == 0) {
					path = CommonUtil.imgStr(positive_license_of_driver_license);
					audit.setUserInformationAuditPhoto(path);
					audit.setUserInformationAuditState(0);
					userInformationAuditService.updateByPrimaryKeySelective(audit);
				}
			}
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "手持驾驶证正面照上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "手持驾驶证正面照上传失败");
		}
		//手持驾驶证反面照
		try {
			userInformationAudit.setUserInformationAuditType(4);
			UserInformationAudit audit = userInformationAuditService.selectByPrimary(userInformationAudit);
			if(audit == null) {
				path = CommonUtil.imgStr(reverse_photo_of_driver_license);
				userInformationAudit.setUserInformationAuditPhoto(path);
				userInformationAudit.setUserInformationAuditApplyTime(OfTime.getLongTime());
				userInformationAuditService.insertSelective(userInformationAudit);
			}else {
				if(audit.getUserInformationAuditState() == 1 && audit.getUserInformationAuditResult() == 0) {
					path = CommonUtil.imgStr(reverse_photo_of_driver_license);
					audit.setUserInformationAuditPhoto(path);
					audit.setUserInformationAuditState(0);
					userInformationAuditService.updateByPrimaryKeySelective(audit);
				}
			}
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "手持驾驶证反面照上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "手持驾驶证反面照上传失败");
		}
		
		try {
			userService.updateByPrimaryKey(u);
		} catch (Exception e) {
			return Msg.fail().add("msg", "上传失败");
		}
		
		return Msg.success();
	}
	
	/**
	 * 实名验证上传资料
	* @param phonenum
	 * @param facade_of_id_card						手持身份证正面照
	 * @param reverse_photo_of_id_card				手持身份证反面照
	 * @param positive_license_of_driver_license	手持驾驶证正面照
	 * @param reverse_photo_of_driver_license		手持驾驶证反面照
	 * @param full_name								真实姓名
	 * @param id_number								身份证号
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/certification",method=RequestMethod.POST)
	public Msg certification(@RequestParam("phonenum")String phonenum,
			@RequestParam("facade_of_id_card")MultipartFile facade_of_id_card,
			@RequestParam("reverse_photo_of_id_card")MultipartFile reverse_photo_of_id_card,
			@RequestParam("positive_license_of_driver_license")MultipartFile positive_license_of_driver_license,
			@RequestParam("reverse_photo_of_driver_license")MultipartFile reverse_photo_of_driver_license,
			@RequestParam("full_name")String full_name,
			@RequestParam("id_number")String id_number) {
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User u = userService.selectByPrimaryKey(smsBean.getId());
		String path = null;
		//真实姓名
		if(full_name != null) {
			u.setUserFullName(full_name);
		}
		//身份证号
		if(id_number != null) {
			u.setUserIdNumber(id_number);
		}
		
		UserInformationAudit userInformationAudit = new UserInformationAudit();
		userInformationAudit.setUserInformationAuditUserNumber(u.getUserNumber());
		
		//手持身份证正面照
		try {
			userInformationAudit.setUserInformationAuditType(1);
			UserInformationAudit audit = userInformationAuditService.selectByPrimary(userInformationAudit);
			if(audit == null) {
				path = CommonUtil.saveFile(facade_of_id_card);
				userInformationAudit.setUserInformationAuditPhoto(path);
				userInformationAudit.setUserInformationAuditApplyTime(OfTime.getLongTime());
				userInformationAuditService.insertSelective(userInformationAudit);
			}else {
				if(audit.getUserInformationAuditState() == 1 && audit.getUserInformationAuditResult() == 0) {
					path = CommonUtil.saveFile(facade_of_id_card);
					audit.setUserInformationAuditPhoto(path);
					audit.setUserInformationAuditState(0);
					userInformationAuditService.updateByPrimaryKeySelective(audit);
				}
			}
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "手持身份证正面照上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "手持身份证正面照上传失败");
		}
		//手持身份证反面照
		try {
			userInformationAudit.setUserInformationAuditType(2);
			UserInformationAudit audit = userInformationAuditService.selectByPrimary(userInformationAudit);
			if(audit == null) {
				path = CommonUtil.saveFile(reverse_photo_of_id_card);
				userInformationAudit.setUserInformationAuditPhoto(path);
				userInformationAudit.setUserInformationAuditApplyTime(OfTime.getLongTime());
				userInformationAuditService.insertSelective(userInformationAudit);
			}else {
				if(audit.getUserInformationAuditState() == 1 && audit.getUserInformationAuditResult() == 0) {
					path = CommonUtil.saveFile(reverse_photo_of_id_card);
					audit.setUserInformationAuditPhoto(path);
					audit.setUserInformationAuditState(0);
					userInformationAuditService.updateByPrimaryKeySelective(audit);
				}
			}
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "手持身份证反面照上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "手持身份证反面照上传失败");
		}
		//手持驾驶证正面照
		try {
			userInformationAudit.setUserInformationAuditType(3);
			UserInformationAudit audit = userInformationAuditService.selectByPrimary(userInformationAudit);
			if(audit == null) {
				path = CommonUtil.saveFile(positive_license_of_driver_license);
				userInformationAudit.setUserInformationAuditPhoto(path);
				userInformationAudit.setUserInformationAuditApplyTime(OfTime.getLongTime());
				userInformationAuditService.insertSelective(userInformationAudit);
			}else {
				if(audit.getUserInformationAuditState() == 1 && audit.getUserInformationAuditResult() == 0) {
					path = CommonUtil.saveFile(positive_license_of_driver_license);
					audit.setUserInformationAuditPhoto(path);
					audit.setUserInformationAuditState(0);
					userInformationAuditService.updateByPrimaryKeySelective(audit);
				}
			}
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "手持驾驶证正面照上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "手持驾驶证正面照上传失败");
		}
		//手持驾驶证反面照
		try {
			userInformationAudit.setUserInformationAuditType(4);
			UserInformationAudit audit = userInformationAuditService.selectByPrimary(userInformationAudit);
			if(audit == null) {
				path = CommonUtil.saveFile(reverse_photo_of_driver_license);
				userInformationAudit.setUserInformationAuditPhoto(path);
				userInformationAudit.setUserInformationAuditApplyTime(OfTime.getLongTime());
				userInformationAuditService.insertSelective(userInformationAudit);
			}else {
				if(audit.getUserInformationAuditState() == 1 && audit.getUserInformationAuditResult() == 0) {
					path = CommonUtil.saveFile(reverse_photo_of_driver_license);
					audit.setUserInformationAuditPhoto(path);
					audit.setUserInformationAuditState(0);
					userInformationAuditService.updateByPrimaryKeySelective(audit);
				}
			}
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "手持驾驶证反面照上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "手持驾驶证反面照上传失败");
		}
		
		try {
			userService.updateByPrimaryKey(u);
		} catch (Exception e) {
			return Msg.fail().add("msg", "上传失败");
		}
		
		return Msg.success();
	}
	
	/**
	 * 认证状态（该接口暂未用）
	 * @param phonenum
	 * @return
	 */
	@ResponseBody
    @RequestMapping(value="/authentication",method=RequestMethod.POST)
	public Msg authentication(@RequestParam("phonenum")String phonenum) {
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User u = userService.selectByPrimaryKey(smsBean.getId());
		
		UserInformationAudit userInformationAudit = new UserInformationAudit();
		userInformationAudit.setUserInformationAuditUserNumber(u.getUserNumber());
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		List<UserInformationAudit> list = userInformationAuditService.selectByExample(userInformationAudit);
		for (UserInformationAudit audit : list) {
			Authentication authentication = new Authentication(audit.getUserInformationAuditResult(), audit.getUserInformationAuditPhoto());
			switch (audit.getUserInformationAuditType()) {
			case 1:
				map.put("facade_of_id_card", authentication);
				break;
			case 2:
				map.put("reverse_photo_of_id_card", authentication);
				break;
			case 3:
				map.put("positive_license_of_driver_license", authentication);
				break;
			case 4:
				map.put("reverse_photo_of_driver_license", authentication);
				break;
			}
		}
		map.put("full_name", u.getUserFullName());
		map.put("id_number", u.getUserIdNumber());
		return Msg.success(map);
	}
	
	/**
	 * 修改头像(Base64)
	 * @param phonenum
	 * @param head_portrait	头像
	 * @return
	 */
    @ResponseBody
    @RequestMapping(value="/updateHeadPortraitBase64",method=RequestMethod.POST)
	public Msg base64UpLoad(@RequestParam("phonenum")String phonenum,@RequestParam("head_portrait") String head_portrait) {
    	if(head_portrait == null) {
			return Msg.fail().add("msg", "头像未上传");
		}
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User u = userService.selectByPrimaryKey(smsBean.getId());
		
		String path = null;
		
		try {
			path = CommonUtil.imgStr(head_portrait);
			u.setUserHeadPortrait(path);
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "头像上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "头像未上传失败");
		}
		
		try {
			int i = userService.updateByPrimaryKeySelective(u);
			if(i != 1) {
				return Msg.fail().add("msg", "修改失败");
			}
		} catch (Exception e) {
			return Msg.fail().add("msg", "修改失败");
		}
		return Msg.success(path);
	}
	
	/**
	 * 修改头像
	 * @param phonenum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateHeadPortrait",method=RequestMethod.POST)
	public Msg updateHeadPortrait(@RequestParam("phonenum")String phonenum,@RequestParam("head_portrait") MultipartFile head_portrait) {
		if(head_portrait.isEmpty()) {
			return Msg.fail().add("msg", "头像未上传");
		}
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User u = userService.selectByPrimaryKey(smsBean.getId());
		String path = null;
		
		try {
			path = CommonUtil.saveFile(head_portrait);
			u.setUserHeadPortrait(path);
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "头像上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "头像未上传失败");
		}
		
		try {
			userService.updateByPrimaryKeySelective(u);
		} catch (Exception e) {
			return Msg.fail().add("msg", "修改失败");
		}
		return Msg.success(path);
	}
	
	/**
	 * 修改昵称
	 * @param phonenum
	 * @param nickname	昵称
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateNickname",method=RequestMethod.POST)
	public Msg updateNickname(@RequestParam("phonenum")String phonenum,@RequestParam("nickname")String nickname) {
		if (nickname == null) {
			return Msg.fail().add("msg", "昵称不能为空");
		}
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User u = userService.selectByPrimaryKey(smsBean.getId());
		if(nickname != null) {
			u.setUserNickname(nickname);
		}
		try {
			userService.updateByPrimaryKeySelective(u);
		} catch (Exception e) {
			return Msg.fail().add("msg", "修改失败");
		}
		return Msg.success();
	}
	
	/**
	 * 修改性别
	 * @param phonenum
	 * @param gender	性别
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateGender",method=RequestMethod.POST)
	public Msg updateGender(@RequestParam("phonenum")String phonenum,@RequestParam("gender")String gender) {
		if (gender == null) {
			return Msg.fail().add("msg", "性别不能为空");
		}
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User u = userService.selectByPrimaryKey(smsBean.getId());
		if(gender != null) {
			u.setUserGender(gender);
		}
		try {
			userService.updateByPrimaryKeySelective(u);
		} catch (Exception e) {
			return Msg.fail().add("msg", "修改失败");
		}
		return Msg.success();
	}
	
	/**
	 * 修改密码
	 * @param phonenum
	 * @param password	密码
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updatePassword",method=RequestMethod.POST)
	public Msg updatePassword(@RequestParam("phonenum")String phonenum,@RequestParam("password")String password,@RequestParam("pass")String pass) {
		if (password == null) {
			return Msg.fail().add("msg", "密码不能为空");
		}
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User u = userService.selectByPrimaryKey(smsBean.getId());
		
		if(!pass.equals(u.getUserPassWord())) {
			return Msg.fail().add("msg", "旧密码不正确");
		}
		
		if(password != null) {
			u.setUserPassWord(password);
		}
		try {
			userService.updateByPrimaryKeySelective(u);
			CommonUtil.MSG_MAP.remove(phonenum);
		} catch (Exception e) {
			return Msg.fail().add("msg", "修改失败");
		}
		
		return Msg.success();
	}
	
	/**
	 * 获取用户信息
	 * @param phonenum
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getUserData",method=RequestMethod.POST)
	public Msg getUserData(@RequestParam("phonenum")String phonenum) {
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(phonenum);
		User u = userService.selectByPrimaryKey(smsBean.getId());
		
		if(u.getUserStatus() != 1){
			UserInformationAudit userInformationAudit = new UserInformationAudit();
			userInformationAudit.setUserInformationAuditUserNumber(u.getUserNumber());
			
			int i = 0;
			List<UserInformationAudit> list = userInformationAuditService.selectByExample(userInformationAudit);
			if(!list.isEmpty()){
				for (UserInformationAudit uia : list) {
					if(uia.getUserInformationAuditState() == 1 && uia.getUserInformationAuditResult() == 0){
						i ++;
					}
				}
				if(i > 0){
					u.setUserStatus(3);
				}else{
					u.setUserStatus(2);
				}
			}
		}
		
		u.setUserPassWord(null);
		return Msg.success(u);
	}
	
	/*****************************************************个人信息end****************************************************/
	
}
