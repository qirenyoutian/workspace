package com.py.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.py.bean.Admin;
import com.py.bean.AuditPictures;
import com.py.bean.Clockin;
import com.py.bean.Message;
import com.py.service.AdminService;
import com.py.service.AuditPicturesService;
import com.py.service.ClockinService;
import com.py.service.MessageService;
import com.py.util.CommonUtil;
import com.py.util.Msg;
import com.py.util.OfTime;
import com.py.util.SMSBean;

@Controller
@RequestMapping("/roadTour")
public class RoadTourController {

	@Autowired
	AdminService adminService;
	@Autowired
	ClockinService clockinService;
	@Autowired
	AuditPicturesService auditPicturesService;
	@Autowired
	MessageService messageService;
	
	/**
	 * 查询打卡记录
	 * @param account
	 * @param clockinTime
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/punchTheTimeClockRecord",method=RequestMethod.POST)
	public Msg punchTheTimeClockRecord(@RequestParam("account")String account,
			@RequestParam("clockinTime")String clockinTime) {
		
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(account);
		
		List<Clockin> clockins = clockinService.findByClockinTime(String.valueOf(smsBean.getId()),clockinTime);
		
		String yyyyMMdd = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Map<String,List<Clockin>> maps = new TreeMap<String,List<Clockin>>();
		
		for (Clockin clockin : clockins) {
			try {
				yyyyMMdd = format.format(clockin.getClockinTime());
			} catch (Exception e) {
				Msg.fail().add("msg", "时间格式不对");
			}
			if(maps.get(yyyyMMdd) == null) {
				List<Clockin> list = new ArrayList<Clockin>();
				list.add(clockin);
				maps.put(yyyyMMdd, list);
			}else {
				maps.get(yyyyMMdd).add(clockin);
			}
		}
		
		List<List<Clockin>> list = new ArrayList<List<Clockin>>();
		
		Set<String> set = maps.keySet();
		for (String key : set) {
			list.add(maps.get(key));
		}
		
		return Msg.success(list);
	}
	
	/**
	 * 根据信息类型删除
	 * @param account
	 * @param message_type
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteByMessageType",method=RequestMethod.POST)
	public Msg deleteByMessageType(@RequestParam("account")String account,@RequestParam("message_type")Integer message_type) {
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(account);
		Message message = new Message();
		message.setMessageUserId(smsBean.getId());
		message.setMessageStaffType(2);
		message.setMessageType(message_type);
		try {
			int i = messageService.deleteByPrimary(message);
			if(i != 0) {
				return Msg.success();
			}else {
				return Msg.fail();
			}
		} catch (Exception e) {
			return Msg.fail();
		}
	}
	
	/**
	 * 读
	 * @param message_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/read",method=RequestMethod.POST)
	public Msg read(@RequestParam("message_id")Integer message_id) {
		if(message_id != null) {
			Message message = messageService.selectByPrimaryKey(message_id);
			if(message != null) {
				message.setMessageRead(1);
				try {
					messageService.updateByPrimaryKeySelective(message);
				} catch (Exception e) {
				}
			}
		}
		return Msg.success();
	}
	
	/**
	 * 消息
	 * @param account
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/messger",method=RequestMethod.POST)
	public Msg messger(@RequestParam("account")String account) {
		//获取用户信息
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(account);
		Message message = new Message();
		message.setMessageStaffType(2);
		message.setMessageType(6);
		message.setMessageUserId(smsBean.getId());
		List<Message> list = messageService.selectByExample(message);
		return Msg.success(list);
	}
	
	/**
	 * 上传图片(base64)
	 * @param account				路巡工作人员账号
	 * @param pictures				图片
	 * @param route_name			路段名
	 * @param truck_space_name		车位名
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/uploadPicturesBase64",method=RequestMethod.POST)
	public Msg uploadPicturesBase64(@RequestParam("account")String account,
			@RequestParam("license_plate")String license_plate,
			@RequestParam("pictures")String pictures,
			@RequestParam("route_name")String route_name,
			@RequestParam("truck_space_name")String truck_space_name) {
		if(pictures == null || "".equals(pictures.trim())) {
			return Msg.fail().add("msg", "请上传图片");
		}
		if(license_plate == null || "".equals(license_plate.trim())) {
			return Msg.fail().add("msg", "请填写车牌号");
		}
		if(route_name == null || "".equals(route_name.trim())) {
			return Msg.fail().add("msg", "请填写路段名");
		}
		if(truck_space_name == null || "".equals(truck_space_name.trim())) {
			return Msg.fail().add("msg", "请填写车位号");
		}
		//获取用户信息
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(account);
		AuditPictures auditPictures = new AuditPictures();
		auditPictures.setAuditPicturesAdminId(smsBean.getId());
		auditPictures.setAuditPicturesLicensePlate(license_plate);
		auditPictures.setAuditPicturesRouteName(route_name);
		auditPictures.setAuditPicturesTruckSpaceName(truck_space_name);
		auditPictures.setAuditPicturesTime(new Date());
		try {
			auditPictures.setAuditPicturesPictures(CommonUtil.imgStr(pictures));
		} catch (IOException e) {
			return Msg.fail().add("msg", "上传失败");
		}
		auditPicturesService.insertSelective(auditPictures);
		
		return Msg.success();
	}
	
	/**
	 * 上传图片
	 * @param account				路巡工作人员账号
	 * @param pictures				图片
	 * @param route_name			路段名
	 * @param truck_space_name		车位名
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/uploadPictures",method=RequestMethod.POST)
	public Msg uploadPictures(@RequestParam("account")String account,
			@RequestParam("license_plate")String license_plate,
			@RequestParam("pictures")MultipartFile pictures,
			@RequestParam("route_name")String route_name,
			@RequestParam("truck_space_name")String truck_space_name) {
		
		if(pictures == null) {
			return Msg.fail().add("msg", "请上传图片");
		}
		if(license_plate == null || "".equals(license_plate.trim())) {
			return Msg.fail().add("msg", "请填写车牌号");
		}
		if(route_name == null || "".equals(route_name.trim())) {
			return Msg.fail().add("msg", "请填写路段名");
		}
		if(truck_space_name == null || "".equals(truck_space_name.trim())) {
			return Msg.fail().add("msg", "请填写车位号");
		}
		//获取用户信息
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(account);
		AuditPictures auditPictures = new AuditPictures();
		auditPictures.setAuditPicturesAdminId(smsBean.getId());
		auditPictures.setAuditPicturesLicensePlate(license_plate);
		auditPictures.setAuditPicturesRouteName(route_name);
		auditPictures.setAuditPicturesTruckSpaceName(truck_space_name);
		auditPictures.setAuditPicturesTime(new Date());
		try {
			auditPictures.setAuditPicturesPictures(CommonUtil.saveFile(pictures));
		} catch (IOException e) {
			return Msg.fail().add("msg", "上传失败");
		}
		auditPicturesService.insertSelective(auditPictures);
		
		return Msg.success();
	}
	
	/**
	 * 打卡
	 * @param account
	 * @param location
	 * @param longitude
	 * @param latitude
	 * @return
	 * @throws ParseException 
	 */
	@ResponseBody
	@RequestMapping(value="/punchTheTimeClockBase64",method=RequestMethod.POST)
	public Msg punchTheTimeClockBase64(@RequestParam("account")String account,
			@RequestParam("location")String location,
			@RequestParam("longitude")Double longitude,
			@RequestParam("latitude")Double latitude,
			@RequestParam("date")String date,
			@RequestParam("picture")String picture) throws ParseException {
		
		if(location == null) {
			return Msg.fail().add("msg", "请上传位置");
		}
		if(date == null) {
			return Msg.fail().add("msg", "请上传时间");
		}
		if(picture == null) {
			return Msg.fail().add("msg", "请上传图片");
		}
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
		if(!format0.format(format0.parse(date)).equals(format0.format(new Date()))) {
			return Msg.fail().add("msg", "打卡时间非今天");
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		//获取用户信息
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(account);
		//查找改路巡工作人员当天是否有上班打卡记录
		Clockin clockin = new Clockin();
		clockin.setClockinAdminId(smsBean.getId());
		clockin.setClockinType(0);
		Clockin findClockin = clockinService.findToDay(clockin);//查找
		if(findClockin == null) {//无上班打卡记录
			clockin.setClockinType(0);
			clockin.setClockinTime(format.parse(date));
			clockin.setClockinPlace(location);
			try {
				clockin.setClockinPicture(CommonUtil.imgStr(picture));
			} catch (IllegalStateException e) {
				return Msg.fail().add("msg", "图片上传有误");
			} catch (IOException e) {
				return Msg.fail().add("msg", "图片上传有误");
			}
			clockinService.insertSelective(clockin);//插入上班打卡记录
		}else {//有上班打卡记录,查找有无下班打卡记录
			clockin.setClockinType(1);
			findClockin = clockinService.findToDay(clockin);
			if(findClockin == null) {//无下班打卡记录
				clockin.setClockinTime(format.parse(date));
				clockin.setClockinPlace(location);
				try {
					clockin.setClockinPicture(CommonUtil.imgStr(picture));
				} catch (IllegalStateException e) {
					return Msg.fail().add("msg", "图片上传有误");
				} catch (IOException e) {
					return Msg.fail().add("msg", "图片上传有误");
				}
				clockinService.insertSelective(clockin);
			}else {//有下班打卡记录,修改打卡时间、位置信息
				findClockin.setClockinTime(format.parse(date));
				findClockin.setClockinPlace(location);
				try {
					clockin.setClockinPicture(CommonUtil.imgStr(picture));
				} catch (IllegalStateException e) {
					return Msg.fail().add("msg", "图片上传有误");
				} catch (IOException e) {
					return Msg.fail().add("msg", "图片上传有误");
				}
				clockinService.updateByPrimaryKeySelective(findClockin);
			}
		}
		
		//修改路巡工作人员的位置、定位时间
		Admin admin = new Admin();
		admin.setAdminId(smsBean.getId());
		admin = adminService.selectByPrimary(admin);
		admin.setAdminLocation(location);
		admin.setAdminLocationTime(OfTime.getLongTime());
		adminService.updateByPrimaryKeySelective(admin);
		
		return Msg.success();
	}
	
	/**
	 * 打卡
	 * @param account
	 * @param location
	 * @param longitude
	 * @param latitude
	 * @return
	 * @throws ParseException 
	 */
	@ResponseBody
	@RequestMapping(value="/punchTheTimeClock",method=RequestMethod.POST)
	public Msg punchTheTimeClock(@RequestParam("account")String account,
			@RequestParam("location")String location,
			@RequestParam("longitude")Double longitude,
			@RequestParam("latitude")Double latitude,
			@RequestParam("date")String date,
			@RequestParam("picture")MultipartFile picture) throws ParseException {
		if(location == null) {
			return Msg.fail().add("msg", "请上传位置");
		}
		if(date == null) {
			return Msg.fail().add("msg", "请上传时间");
		}
		if(picture == null) {
			return Msg.fail().add("msg", "请上传图片");
		}
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
		if(!format0.format(format0.parse(date)).equals(format0.format(new Date()))) {
			return Msg.fail().add("msg", "打卡时间非今天");
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		//获取用户信息
		SMSBean smsBean = (SMSBean) CommonUtil.MSG_MAP.get(account);
		//查找改路巡工作人员当天是否有上班打卡记录
		Clockin clockin = new Clockin();
		clockin.setClockinAdminId(smsBean.getId());
		clockin.setClockinType(0);
		Clockin findClockin = clockinService.findToDay(clockin);//查找
		if(findClockin == null) {//无上班打卡记录
			clockin.setClockinType(0);
			clockin.setClockinTime(format.parse(date));
			clockin.setClockinPlace(location);
			try {
				clockin.setClockinPicture(CommonUtil.saveFile(picture));
			} catch (IllegalStateException e) {
				return Msg.fail().add("msg", "图片上传有误");
			} catch (IOException e) {
				return Msg.fail().add("msg", "图片上传有误");
			}
			clockinService.insertSelective(clockin);//插入上班打卡记录
		}else {//有上班打卡记录,查找有无下班打卡记录
			clockin.setClockinType(1);
			findClockin = clockinService.findToDay(clockin);
			if(findClockin == null) {//无下班打卡记录
				clockin.setClockinTime(format.parse(date));
				clockin.setClockinPlace(location);
				try {
					clockin.setClockinPicture(CommonUtil.saveFile(picture));
				} catch (IllegalStateException e) {
					return Msg.fail().add("msg", "图片上传有误");
				} catch (IOException e) {
					return Msg.fail().add("msg", "图片上传有误");
				}
				clockinService.insertSelective(clockin);
			}else {//有下班打卡记录,修改打卡时间、位置信息
				findClockin.setClockinTime(format.parse(date));
				findClockin.setClockinPlace(location);
				try {
					clockin.setClockinPicture(CommonUtil.saveFile(picture));
				} catch (IllegalStateException e) {
					return Msg.fail().add("msg", "图片上传有误");
				} catch (IOException e) {
					return Msg.fail().add("msg", "图片上传有误");
				}
				clockinService.updateByPrimaryKeySelective(findClockin);
			}
		}
		
		//修改路巡工作人员的位置、定位时间
		Admin admin = new Admin();
		admin.setAdminId(smsBean.getId());
		admin = adminService.selectByPrimary(admin);
		admin.setAdminLocation(location);
		admin.setAdminLocationTime(OfTime.getLongTime());
		adminService.updateByPrimaryKeySelective(admin);
		
		return Msg.success();
	}
	
}
