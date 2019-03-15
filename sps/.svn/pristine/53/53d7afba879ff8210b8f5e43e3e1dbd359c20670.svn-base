package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.Invoice;
import com.py.bean.LicensePlate;
import com.py.bean.MonthCard;
import com.py.bean.MonthCardRecord;
import com.py.bean.SingleCar;
import com.py.bean.User;
import com.py.bean.UserInvoice;
import com.py.bean.UserMonthCard;
import com.py.service.InvoiceService;
import com.py.service.LicensePlateService;
import com.py.service.MonthCardBuyService;
import com.py.service.MonthCardService;
import com.py.service.SingleCarService;
import com.py.service.UserService;
import com.py.util.MD5;
import com.py.util.Msg;
import com.py.util.OfTime;
import com.py.util.UUIDUtils;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	MonthCardService monthCardService;
	@Autowired
	SingleCarService singleCarService;
	@Autowired
	LicensePlateService licensePlateService;
	@Autowired
	MonthCardBuyService monthCardBuyService;
	@Autowired
	InvoiceService invoiceService;
	
	
	/**
	 * 跳转到管理员页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpUser")
	public String jumpUser(Model model){
		return "user/user";
	}
	/**
	 * 查询全部注册用户
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getUserAll")
	@ResponseBody
	public Msg getUserAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam("content")String content,
			@RequestParam("startTime")String startTime,
			@RequestParam("endTime")String endTime,
			HttpServletRequest request) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 10);
		Map<String, String> map = new HashMap<String, String>();
		if(content != null && !"".equals(content.trim())){
			map.put("content", content);
		}else {
			map.put("content", null);
		}
		if(startTime != null && !"".equals(startTime.trim())){
			map.put("startTime", startTime);
		}else {
			map.put("startTime", null);
		}
		if(endTime != null && !"".equals(endTime.trim())){
			map.put("endTime", endTime);
		}else {
			map.put("endTime", null);
		}
		List<User> userList = userService.selectByTimeQuantum(map);
		PageInfo<User> page = new PageInfo<User>(userList, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	/*
	 * 跳转月卡管理界面
	 */
	@RequestMapping("/jumpMonthCard")
	public String jumpMonthCard(Model model){
		return "monthCardAndInvoice/monthCard";
	}
	
	/**
	 * 查询全部月卡信息
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getAllMonthCard")
	@ResponseBody
	public Msg getAllMonthCard(@RequestParam(value="pn",defaultValue="1")Integer pn,HttpServletRequest request) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 10);
		MonthCard monthCard = new MonthCard();
		List<MonthCardRecord> monthCardList = monthCardService.selectByExampleRecord(monthCard);
		PageInfo<MonthCardRecord> pagelist = new PageInfo<MonthCardRecord>(monthCardList,5);
		return Msg.success().add("monthCardList", pagelist);
	}
	/**
	 * 查询全部月卡信息根据ID
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getMonthCardCount")
	@ResponseBody
	public Msg getMonthCardCount(@RequestParam("id")Integer id,HttpServletRequest request) throws UnsupportedEncodingException {
		
		if (!id.equals("") && !id.equals(" ") && !id.equals(null)) {
			int count = monthCardBuyService.selectById(id);
			return Msg.success().add("count", count);
		}
		return Msg.fail();
	}
	
	/**
	 * 查询到月卡里面的路段
	 * 
	 */
	//
	@RequestMapping("/getRouteBymonthCard")
	@ResponseBody
	public Msg getRouteBymonthCard(HttpServletRequest request) throws UnsupportedEncodingException {
		
		List<MonthCardRecord> monthCardList = monthCardService.selectmonthCardRoute();
		return Msg.success().add("monthCardList", monthCardList);
	}
	
	/**
	 * 保存月卡信息
	 * @param model
	 * @return 
	 */
	@RequestMapping("/saveMonthCard")
	@ResponseBody
	public Msg saveMonthCard(@RequestParam("monthCardName")String monthCardName,@RequestParam("monthCardRoute")Integer monthCardRoute,
			@RequestParam("monthCardPrice")Double monthCardPrice,@RequestParam("monthCardStatus")Integer monthCardStatus,
			HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
			
			
			byte[] a=monthCardName.getBytes("ISO-8859-1");//用tomcat的格式（iso-8859-1）方式去读。
			String name=new String(a,"utf-8");//采用utf-8去接string
			response.setContentType("text/html;charset=utf-8");
			
			MonthCard record = new MonthCard();
			record.setMonthCardRoute(monthCardRoute);
			record = monthCardService.selectByPrimary(record);
			if(record != null){
				return Msg.fail().add("msp", "该路段已有月卡");
			}
			
			MonthCard monthCard = new MonthCard();
			monthCard.setMonthCardName(name);
			monthCard.setMonthCardPrice(monthCardPrice);
			monthCard.setMonthCardRoute(monthCardRoute);
			monthCard.setMonthCardStatus(monthCardStatus);
			
			int result1 = monthCardService.insert(monthCard);
			if(result1 != 0){
				return Msg.success();
			}else{
				return Msg.fail().add("msp", "添加失败");
			}
	}
	
	/**
	 * 根据ID获取月卡信息
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getmonthCardById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getmonthCardById(@PathVariable("id")Integer id){
		MonthCard monthCard = new MonthCard();
		monthCard.setMonthCardId(id);
		MonthCard m = monthCardService.selectByPrimary(monthCard);
		if(m != null){
			return Msg.success().add("monthCard", m);
		}else{
			return Msg.fail().add("va_msg", "未找到该管理员信息");
		}
	}
	
	
	
	/**
	 * 更新状态
	 */
	@ResponseBody
	@RequestMapping("/updateMonthCardStatus")
	public Msg updateMonthCardStatus(@RequestParam("status")Integer status,@RequestParam("id")Integer id){
		
		
		int result = monthCardService.updateStatusById(id,status);
		
		if(result != 0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	/**
	 * 
	 * 修改月卡信息updateMonthCard
	 */
	@ResponseBody
	@RequestMapping("/updateMonthCard")
	public Msg updateMonthCard(@RequestParam("monthCardId")Integer monthCardId,@RequestParam("monthCardName")String monthCardName,@RequestParam("monthCardRoute")Integer monthCardRoute,
			@RequestParam("monthCardPrice")Double monthCardPrice,@RequestParam("monthCardStatus")Integer monthCardStatus,
			HttpServletRequest request,HttpServletResponse response)throws UnsupportedEncodingException{
		
		byte[] a=monthCardName.getBytes("ISO-8859-1");//用tomcat的格式（iso-8859-1）方式去读。
		String name=new String(a,"utf-8");//采用utf-8去接string
		response.setContentType("text/html;charset=utf-8");
		
		MonthCard monthCard = new MonthCard();
		monthCard.setMonthCardId(monthCardId);
		monthCard.setMonthCardName(name);
		monthCard.setMonthCardPrice(monthCardPrice);
		if(monthCardStatus != 0) {
			monthCard.setMonthCardRoute(monthCardRoute);
		}
		monthCard.setMonthCardStatus(monthCardStatus);
		
		int result = monthCardService.updateByPrimaryKeySelective(monthCard);
		
		if(result != 0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	/**
	 * 单个批量二合一
	 * 批量删除：1-2-3
	 * 单个删除：1
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteMonthCard/{ids}",method=RequestMethod.DELETE)
	public Msg deleteMonthCard(@PathVariable("ids")String ids){
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (int i = 0; i < str_ids.length; i++) {
				Integer id = Integer.parseInt(str_ids[i]);
					int re = monthCardService.deleteByPrimaryKey(id);
					if(re == 0){
						return Msg.fail();
					}
			}
		}else{
			Integer id = Integer.parseInt(ids);
				int re = monthCardService.deleteByPrimaryKey(id);
				if(re != 0){
					return Msg.success();
				}else{
					return Msg.fail();
			}
		}
		return Msg.success();
	}
	
	
	
	
	/*
	 * 跳转发票管理界面
	 */
	@RequestMapping("/jumpInvoice")
	public String jumpInvoice(Model model){
		return "monthCardAndInvoice/invoice";
	}
	
	//selectExsampleWithInvoice
	
	/**
	 * 查询全部发票信息
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getAllInvoice")
	@ResponseBody
	public Msg getAllInvoice(@RequestParam(value="pn",defaultValue="1")Integer pn,String content,HttpServletRequest request) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 10);
		User user = new User();
		
		if (!content.equals("") && !content.equals(null) && !content.equals(" ")) {
			String fullName = new String(content.getBytes("ISO-8859-1"),"UTF-8");
			user.setUserFullName(fullName);
		}
		List<UserInvoice> uiList = userService.selectExsampleWithInvoice(user);

		PageInfo<UserInvoice> page = new PageInfo<UserInvoice>(uiList, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	//根据类型查找发票
	@RequestMapping("/getAllInvoiceByType")
	@ResponseBody
	public Msg getAllInvoiceByType(@RequestParam(value="pn",defaultValue="1")Integer pn,Integer invoiceType,HttpServletRequest request) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 10);
		Invoice invoice = new Invoice();
		List<UserInvoice> uiList = null;
		if(invoiceType == 0){
			invoice.setInvoiceType(invoiceType);
			uiList = userService.selectAllInvoiceByType(invoice);
		}else if(invoiceType == 1){
			invoice.setInvoiceType(invoiceType);
			uiList = userService.selectAllInvoiceByType(invoice);
		}
		
		PageInfo<UserInvoice> page = new PageInfo<UserInvoice>(uiList, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	//根据时间段查找发票信息
	@RequestMapping("/getAllInvoiceByTime")
	@ResponseBody
	public Msg getAllInvoiceByTime(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam("startTime")String startTime,@RequestParam("endTime")String endTime,HttpServletRequest request) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 10);
		List<UserInvoice> uiList = userService.selectAllInvoiceByTime(startTime, endTime);
		PageInfo<UserInvoice> page = new PageInfo<UserInvoice>(uiList, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	//出票处理
	/**
	 * 
	 */
	@RequestMapping(value="/updateInvoiceStatusById")
	@ResponseBody
	public Msg updateInvoiceStatusById(@RequestParam("invoiceId")Integer invoiceId,@RequestParam("status")Integer status){
		if(status == 0){
			status = 1;
		}
		Invoice invoice = invoiceService.selectByPrimaryKey(invoiceId);
		invoice.setInvoiceStatus(status);
		invoice.setInvoiceTime(OfTime.getLongTime());
		try {
			int result = invoiceService.updateByPrimaryKeySelective(invoice);
			if(result == 0){
				return Msg.fail();
			}
		} catch (Exception e) {
			return Msg.fail();
		}
		return Msg.success();
	}
	
	/**
	 * 单个批量二合一
	 * 批量删除：1-2-3
	 * 单个删除：1
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteuser/{ids}",method=RequestMethod.DELETE)
	public Msg deleteuser(@PathVariable("ids")String ids){
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (int i = 0; i < str_ids.length; i++) {
				Integer id = Integer.parseInt(str_ids[i]);
				int re = userService.deleteByPrimaryKey(id);
				if(re != 1){
					return Msg.success();
				}
			}
		}else{
			Integer id = Integer.parseInt(ids);
			int re = userService.deleteByPrimaryKey(id);
			if(re != 0){
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
		return Msg.success();
	}
	
	/**
	 * 单个批量二合一
	 * 批量拉黑：1-2-3
	 * 单个拉黑：1
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/blackuser/{ids}",method=RequestMethod.POST)
	public Msg blackuser(@PathVariable("ids")String ids){
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (int i = 0; i < str_ids.length; i++) {
				Integer id = Integer.parseInt(str_ids[i]);
				User user = userService.selectByPrimaryKey(id);
				user.setUserBlack(1);
				int re = userService.updateByPrimaryKeySelective(user);
				if(re != 0){
					return Msg.success();
				}else{
					return Msg.fail();
				}
			}
		}else{
			Integer id = Integer.parseInt(ids);
			User user = userService.selectByPrimaryKey(id);
			user.setUserBlack(1);
			int re = userService.updateByPrimaryKeySelective(user);
			if(re != 0){
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
		return Msg.success();
	}
	
	/**
	 * 单个批量二合一
	 * 批量拉黑：1-2-3
	 * 单个拉黑：1
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/relieveblackuser/{ids}",method=RequestMethod.POST)
	public Msg relieveblackuser(@PathVariable("ids")String ids){
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (int i = 0; i < str_ids.length; i++) {
				Integer id = Integer.parseInt(str_ids[i]);
				User user = userService.selectByPrimaryKey(id);
				user.setUserBlack(0);
				int re = userService.updateByPrimaryKeySelective(user);
				if(re != 0){
					return Msg.success();
				}else{
					return Msg.fail();
				}
			}
		}else{
			Integer id = Integer.parseInt(ids);
			User user = userService.selectByPrimaryKey(id);
			user.setUserBlack(0);
			int re = userService.updateByPrimaryKeySelective(user);
			if(re != 0){
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
		return Msg.success();
	}
	
	/**
	 * 添加用户
	 * @param userAccount
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/saveuser",method=RequestMethod.POST)
	public Msg saveuser(@RequestParam("userAccount")String userAccount) {
		if(userAccount == null || "".equals(userAccount.trim())) {
			return Msg.fail().add("msg", "请填写电话号码");
		}
		User user = new User();
		user.setUserAccount(userAccount);
		User findUser = userService.selectByPrimary(user);
		if(findUser != null) {
			return Msg.fail().add("mag", "该账号已存在");
		}
		user.setUserNumber(UUIDUtils.getUUID());
		user.setUserPassWord(MD5.string2MD5(userAccount.substring(5,userAccount.length())));
		user.setUserCreationTime(OfTime.getLongTime());
		int i = userService.insertSelective(user);
		if(i != 1) {
			return Msg.fail().add("msg", "添加失败");
		}
		return Msg.success();
	}
	
	/**
	 * 停车记录
	 * @param userId
	 * @param pn
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getuserEzStop",method=RequestMethod.GET)
	public Msg getuserEzStop(@RequestParam("userId")Integer userId,@RequestParam(value="pn",defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, 10);
		User user = null;
		if(userId != null) {
			user = userService.selectByPrimaryKey(userId);
		}
		LicensePlate licensePlate = new LicensePlate();
		licensePlate.setLicensePlateUserId(user.getUserId());
		List<LicensePlate> licensePlateList = licensePlateService.selectByExample(licensePlate);
		//车牌集合
		List<String> licensePlates = new ArrayList<String>();
		List<SingleCar> list = new ArrayList<SingleCar>();
		for (LicensePlate lp : licensePlateList) {
			licensePlates.add(lp.getLicensePlateNumber());
		}
		if(!licensePlates.isEmpty()) {
			list = singleCarService.selectByLicensePlate(licensePlates);
		}
		PageInfo<SingleCar> singlecarList = new PageInfo<SingleCar>(list, 5);
		return Msg.success().add("pageInfo", singlecarList);
	}
	
	/**
	 * 月票信息
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getUserMonthCard",method=RequestMethod.GET)
	public Msg getUserMonthCard(@RequestParam("userId")Integer userId) {
		List<UserMonthCard> userMonthCards = new ArrayList<UserMonthCard>();
		if(userId != null) {
			userMonthCards = monthCardBuyService.getUserMonthCard(userId);
		}
		return Msg.success(userMonthCards);
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getuserById/{id}",method=RequestMethod.GET)
	public Msg getuserById(@PathVariable("id")Integer id){
		User user = userService.selectByPrimaryKey(id);
		return Msg.success(user);
	}
	
	/**
	 * 
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateuser",method=RequestMethod.POST)
	public Msg updateuser(@Valid User user){
		User findUser = userService.selectByPrimaryKey(user.getUserId());
		int result = 0;
		if(findUser != null) {
			findUser.setUserNickname(user.getUserNickname());
			if("男".equals(user.getUserGender()) || "女".equals(user.getUserGender())) {
				findUser.setUserGender(user.getUserGender());
			}else {
				Msg msg = Msg.fail();
				msg.setMsg("性别填写错误");
				return msg;
			}
			if(user.getUserPassWord() != null && !"".equals(user.getUserPassWord().trim())) {
				findUser.setUserPassWord(MD5.string2MD5(user.getUserPassWord()));
			}
			findUser.setUserFullName(user.getUserFullName());
			result = userService.updateByPrimaryKeySelective(findUser);
		}
		if(result != 0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
}
