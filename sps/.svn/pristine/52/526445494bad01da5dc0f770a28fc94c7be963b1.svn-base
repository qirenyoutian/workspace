package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.LicensePlate;
import com.py.bean.Route;
import com.py.bean.SingleCar;
import com.py.bean.SingleCarDetails;
import com.py.bean.SingleCarDetailsRecord;
import com.py.bean.User;
import com.py.service.LicensePlateService;
import com.py.service.RouteService;
import com.py.service.SingleCarDetailsService;
import com.py.service.SingleCarService;
import com.py.service.UserService;
import com.py.util.Msg;

@Controller
public class SingleCarController {
	@Autowired
	SingleCarService singleCarService;
	@Autowired
	RouteService routeService;
	@Autowired
	UserService userService;
	@Autowired
	LicensePlateService licensePlateService;
	@Autowired
	SingleCarDetailsService singleCarDetailsService;
	
	/**
	 * 跳转到停车场页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpParkingLot")
	public String jumpParkingLot(Model model){
		return "parkingLot/parkingLot";
	}
	/**
	 * 查询全部停车场
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getParkingLotAll")
	@ResponseBody
	public Msg getParkingLotAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String content,HttpServletRequest request) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 10);
		Route route = new Route();
		if(content != null && content != "" && content != " "){
			route.setRouteLocationName(content);
		}
		List<Route> parkingLotList = routeService.selectByExample(route);
		PageInfo<Route> page = new PageInfo<Route>(parkingLotList, 5);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 跳转到停车位页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpParkingSpace")
	public String jumpParkingSpace(Model model){
		return "parkingLot/singleCarTruckSpace";
	}
	
	/**
	 * 查询全部路段
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getSingleCarRoute")
	@ResponseBody
	public Msg getSingleCarRoute(@RequestParam(value="pn",defaultValue="1")Integer pn,String content,HttpServletRequest request) throws UnsupportedEncodingException {
		
		if (!content.equals("") && !content.equals(" ") && !content.equals(null)) {
			PageHelper.startPage(pn, 10);
			SingleCar singleCar = new SingleCar();
			singleCar.setSingleCarRouteName(content);
			List<SingleCar> parkingLotList = singleCarService.selectAllRoute();
			PageInfo<SingleCar> page = new PageInfo<SingleCar>(parkingLotList, 5);
			return Msg.success().add("pageInfo", page);
		}else{
			List<SingleCar> singleCarList = singleCarService.selectAllRoute();
			return Msg.success().add("singleCarList", singleCarList);
		}
	}

	@RequestMapping("/parkingRecord")
	public String parkingRecord() {
		return "parkingRecord/parkingRecord";
	}
	
	@ResponseBody
	@RequestMapping("/getParkingRecordAll")
	public Msg getParkingRecordAll(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam("type")Integer type,@RequestParam("value")String value) {
		PageHelper.startPage(pn, 30);
		
		SingleCar singleCar = new SingleCar();
		List<SingleCarDetailsRecord> singleCarRecords = null;
		if(type == 1) {//用户
			if(value == null || "".equals(value.trim())) {
				return Msg.fail().add("msg", "请输入用户名");
			}
			User user = new User();
			user.setUserAccount(value);
			user = userService.selectByPrimary(user);
			if(user == null) {
				return Msg.fail().add("msg", "无此用户");
			}
			LicensePlate licensePlate = new LicensePlate();
			licensePlate.setLicensePlateUserId(user.getUserId());
			List<LicensePlate> licensePlateList = licensePlateService.selectByExample(licensePlate);
			//车牌集合
			List<String> licensePlates = new ArrayList<String>();
			for (LicensePlate lp : licensePlateList) {
				licensePlates.add(lp.getLicensePlateNumber());
			}
			if(!licensePlates.isEmpty()) {
				singleCarRecords = singleCarService.selectSingleCarRecordsByLicensePlate(licensePlates);
			}
		}else if(type == 2) {//摄像头ip
			if(value == null || "".equals(value.trim())) {
				return Msg.fail().add("msg", "请输入摄像头ip");
			}
			singleCar.setSingleCarCameraIp(value);
		}
		singleCarRecords = singleCarService.selectByExampleSingleCarDetailsRecordRecord(singleCar);
		if(singleCarRecords == null) {
			singleCarRecords = new ArrayList<SingleCarDetailsRecord>();
		}
		PageInfo<SingleCarDetailsRecord> page = new PageInfo<SingleCarDetailsRecord>(singleCarRecords,5);
		return Msg.success().add("pageInfo", page);
	}
	@ResponseBody
	@RequestMapping("/getParkingRecordNewFive")
	public Msg getParkingRecordNewFive(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam("type")Integer type,@RequestParam("value")String value) {
		
		SingleCar singleCar = new SingleCar();
		List<SingleCarDetailsRecord> singleCarRecords = null;
		
		singleCarRecords = singleCarService.selectByExampleSingleCarDetailsRecordRecordByNewFive(singleCar);
		if(singleCarRecords == null) {
			singleCarRecords = new ArrayList<SingleCarDetailsRecord>();
		}
		return Msg.success().add("pageInfo", singleCarRecords);
	}
	
	@ResponseBody
	@RequestMapping("/getPictureBySingleCarDetailsId")
	public Msg getPictureBySingleCarDetailsId(@RequestParam("id")Integer id) {
		SingleCarDetails singleCarDetails = singleCarDetailsService.selectByPrimaryKey(id);
		return Msg.success(singleCarDetails);
	}
	
	@ResponseBody
	@RequestMapping("/updateSingleCarDetailsById")
	public Msg updateSingleCarDetailsById(@RequestParam("id")Integer id,
			@RequestParam("truckSpace")String truckSpace,
			@RequestParam("licensePlate")String licensePlate) {
		SingleCarDetails singleCarDetails = singleCarDetailsService.selectByPrimaryKey(id);
		if(singleCarDetails != null) {
			if(truckSpace != null) {
				singleCarDetails.setSingleCarDetailsTruckSpace(truckSpace);
			}
			if(licensePlate != null) {
				singleCarDetails.setSingleCarDetailsLicensePlate(licensePlate);
			}
			try {
				singleCarDetailsService.updateByPrimaryKeySelective(singleCarDetails);
			} catch (Exception e) {
				return Msg.fail().add("msg", "修改失败");
			}
			SingleCar singleCar = singleCarService.selectByPrimaryKey(singleCarDetails.getSingleCarDetailsSingleCarId());
			if(singleCar != null) {
				if(truckSpace != null) {
					singleCar.setSingleCarTruckSpace(truckSpace);
				}
				if(truckSpace != null) {
					singleCar.setSingleCarLicensePlate(licensePlate);
				}
				try {
					singleCarService.updateByPrimaryKeySelective(singleCar);
				} catch (Exception e) {
					return Msg.fail().add("msg", "修改失败");
				}
			}
		}else {
			return Msg.fail().add("msg", "修改失败");
		}
		return Msg.success(singleCarDetails);
	}
	
}
