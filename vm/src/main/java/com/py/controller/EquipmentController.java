package com.py.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.runner.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.Banner;
import com.py.bean.Equipment;
import com.py.bean.EquipmentClassify;
import com.py.bean.EquipmentMessage;
import com.py.bean.Point;
import com.py.service.EquipmentMessageService;
import com.py.service.EquipmentService;
import com.py.socket.HairUtil;
import com.py.util.CommonUtil;
import com.py.util.Msg;

@Controller
public class EquipmentController {
	@Autowired
	private EquipmentService equipmentService;
	@Autowired
	private EquipmentMessageService equipmentMessageService;


	
	/******************************************************* 设备管理 *************************************************************/
	
	/**
	 * 获取设备,边柜，货道信息
	 * @param pn
	 * @param content
	 * @return
	 */
	@RequestMapping("/getEquipment")
	@ResponseBody
	public Msg getEquipment(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam("content")String content){
		
		PageHelper.startPage(pn, 5);
		Equipment equipment = new Equipment();
		if (!content.equals("") && !content.equals(" ") && !content.equals(null)) {
			equipment.setEquipmentNumber(content);
		}
		List<Equipment> equipmentList = equipmentService.selectAllEquipment(equipment);
		
		PageInfo<Equipment> page = new PageInfo<>(equipmentList,5);
		
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * 获取设备及点位信息
	 * @param pn
	 * @param content
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getEquipmentAndPoint")
	@ResponseBody
	public Msg getEquipmentAndPoint(@RequestParam(value="pn",defaultValue="1")Integer pn,
									@RequestParam("content")String content,
									HttpServletResponse response) throws UnsupportedEncodingException{
		
		PageHelper.startPage(pn, 5);
		Equipment equipment = new Equipment();
		if (!content.equals("") && !content.equals(" ") && !content.equals(null)) {
			byte[] b = content.getBytes("ISO-8859-1");//用tomcat的格式（iso-8859-1）方式去读。
			String name = new String(b,"utf-8");//采用utf-8去接string
			response.setContentType("text/html;charset=utf-8");//设置页面的字符编码
			equipment.setEquipmentName(name);
		}
		List<Point> PointList = equipmentService.selectEquipmentAndPoint(equipment);
		PageInfo<Point> page = new PageInfo<>(PointList,5);
		return Msg.success().add("pageInfo", page);
		
		
	}
	/**
	 * 根据Id获取设备信息
	 * @param pn
	 * @param content
	 * @return
	 */
	@RequestMapping("/getEquipmentById")
	@ResponseBody
	public Msg getEquipmentById(@RequestParam("id")Integer id){
		
		Equipment eqList = equipmentService.selectEquipmentById(id);
		
		return Msg.success().add("equipment", eqList);
	}
	

	
	/**
	 * 删除设备信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteEquipment")
	@ResponseBody
	public Msg deleteEquipment(@RequestParam("equipmenId")Integer equipmentId,HttpServletRequest request){
		
		Msg msg = equipmentService.deleteEquipment(equipmentId,request);
		
		return msg;
	}
	
	/**
	 * 修改设备信息
	 * @param pn
	 * @param content
	 * @return
	 */
	@RequestMapping("/updateEquipment")
	@ResponseBody
	public Msg updateEquipment(@RequestParam("equipmentId")Integer equipmentId,
								@RequestParam("equipmentName")String equipmentName,
								@RequestParam("equipmentType")Integer equipmentType,
								@RequestParam("equipmentPointId")Integer equipmentPointId,
		                        @RequestParam("equipmentLongitude")Double equipmentLongitude,
			                    @RequestParam("equipmentLatitude")Double equipmentLatitude){
		Equipment equipment = new Equipment();
		equipment.setEquipmentId(equipmentId);
		equipment.setEquipmentName(equipmentName);
		equipment.setEquipmentClassifyId(equipmentType);
		equipment.setEquipmentPointId(equipmentPointId);
		equipment.setEquipmentLongitude(equipmentLongitude);
		equipment.setEquipmentLatitude(equipmentLatitude);
		equipment.setEquipmentChangeTime(new Date());
		
		Msg msg = equipmentService.updateEquipment(equipment);
		
		return msg;
	}
	
	
	/*
	 * 导出设备信息
	 */
	@RequestMapping("/ExportEquipmentMessage") 
	 @ResponseBody
	public void  ExportEquipmentMessage(HttpServletResponse response,@RequestParam("content")String content) throws Exception {
		 
		equipmentService.ExportExcel(content, response);
		
	 }
	
	/**
	 * 获取设备名称
	 * @return
	 */
	@RequestMapping("/getEquipmentName")
	@ResponseBody
	public Msg getEquipmentName(){
		Equipment equipment = new Equipment();
		List<Equipment> list = equipmentService.selectByExample(equipment);
		return Msg.success().add("list", list);
	}
	
	
	/**
	 * 紧急停用设备
	 * @param ids
	 * @return
	 */
	@RequestMapping("/stopEquipment")
	@ResponseBody
	public Msg stopEquipment(@RequestParam("equipmentIds")Integer[] ids) {
		Equipment equipment = null;
		if(ids.length > 0) {
			for (Integer id : ids) {
				equipment = equipmentService.selectByPrimaryKey(id);
				if(equipment != null) {
					HairUtil.put("maintain", equipment.getEquipmentSocketKey());
					equipment.setEquipmentStatus(2);
					equipmentService.updateByPrimaryKeySelective(equipment);
				}
			}
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	
	/**
	 * 解除停用设备
	 * @param ids
	 * @return
	 */
	@RequestMapping("/RemoveEquipment")
	@ResponseBody
	public Msg RemoveEquipment(@RequestParam("equipmentIds")Integer[] ids) {
		Equipment equipment = null;
		if(ids.length > 0) {
			for (Integer id : ids) {
				equipment = equipmentService.selectByPrimaryKey(id);
				if(equipment != null) {
					HairUtil.put("remove", equipment.getEquipmentSocketKey());
					equipment.setEquipmentStatus(1);
					equipmentService.updateEquipment(equipment);
				}
			}
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	
	/**
	 * 设备缓存刷新
	 * @param ids
	 * @return
	 */
	@RequestMapping("/equipmentReflash")
	@ResponseBody
	public Msg updateEquipment(@RequestParam("equipmentIds")Integer[] ids) {
		Equipment equipment = null;
		if(ids.length > 0) {
			for (Integer id : ids) {
				equipment = equipmentService.selectByPrimaryKey(id);
				if(equipment != null) {
					HairUtil.put("update", equipment.getEquipmentSocketKey());
				}
			}
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	
	
	
	
	
	
	/*********************************************************** 设备类型 *************************************************************/
	
	/**
	 * 获取设备类型
	 * @param pn
	 * @param content
	 * @return
	 */
	@RequestMapping("/getEquipmentClassify")
	@ResponseBody
	public Msg getEquipmentClassify(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam("content")String content){
		
		//PageHelper.startPage(pn, 5);
		EquipmentClassify equipmentClassify = new EquipmentClassify();
		if (!content.equals("") && !content.equals(" ") && !content.equals(null)) {
			equipmentClassify.setEquipmentClassifyEquipmentNumber(content);
		}
		List<EquipmentClassify> equipmenClassifyList = equipmentService.selectEquipmentClassify(equipmentClassify);
		
		//PageInfo<EquipmentMessage> page = new PageInfo<>(equipmentList,10);
		
		return Msg.success().add("pageInfo", equipmenClassifyList);
	}
	
	/**
	 * 增加设备类型
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveEquipmentClassify")
	@ResponseBody
	public Msg saveEquipmentClassify(HttpServletRequest request){
		
		String manufacturer = request.getParameter("manufacturer");//生产厂家
		String equipmentNumber = request.getParameter("equipmentNumber");//设备型号
		String equipmentClassifyName = request.getParameter("equipmentClassifyName");
		String equipmentClassifyRow = request.getParameter("equipmentClassifyRow");
		String equipmentClassifyLine = request.getParameter("equipmentClassifyLine");
		String equipmentSize = request.getParameter("equipmentSize");//设备尺寸
		
		
		
		
		EquipmentClassify equipmentClassify = new EquipmentClassify();
		equipmentClassify.setEquipmentClassifyName(equipmentClassifyName);
		equipmentClassify.setEquipmentClassifyRow(Integer.parseInt(equipmentClassifyRow));
		equipmentClassify.setEquipmentClassifyLine(Integer.parseInt(equipmentClassifyLine));
		equipmentClassify.setEquipmentClassifyCreateTime(new Date());
		equipmentClassify.setEquipmentClassifyUpdateTime(new Date());
		if (!manufacturer.equals("") && !manufacturer.equals(" ") && !manufacturer.equals(null)) {
			equipmentClassify.setEquipmentClassifyManufacturer(manufacturer);
		}
		if (!equipmentNumber.equals("") && !equipmentNumber.equals(" ") && !equipmentNumber.equals(null)) {
			equipmentClassify.setEquipmentClassifyEquipmentNumber(equipmentNumber);
		}
		if (!equipmentSize.equals("") && !equipmentSize.equals(" ") && !equipmentSize.equals(null)) {
			equipmentClassify.setEquipmentClassifyEquipmentSize(equipmentSize);
		}
		
		
		int a = equipmentService.saveEquipmentClassify(equipmentClassify);
		
		return Msg.success().add("msg", a);
	}
	
	/**
	 * 根据ID查找设备类型
	 * @param equipmentClassifyId
	 * @return
	 */
	@RequestMapping("/getEquipmentClassfiyById")
	@ResponseBody
	public Msg getEquipmentClassfiyById(@RequestParam("equipmentClassifyId")Integer equipmentClassifyId){
		
		EquipmentClassify a = equipmentService.selectEquipmentClassFiyById(equipmentClassifyId);
		
		return Msg.success().add("msg", a);
	}
	
	
	/**
	 * 删除设备类型
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteEquipmentClassify")
	@ResponseBody
	public Msg deleteEquipmentClassify(@RequestParam("equipmenClassifyId")Integer equipmenClassifyId,
										@RequestParam("equipmenClassifyIds")String[] equipmenClassifyIds){
		
		Msg msg = equipmentService.deleteEquipmentClassify(equipmenClassifyId,equipmenClassifyIds);
		
		return msg;
	}
	/**
	 * 获取设备类型（不需要参数）
	 * @return
	 */
	//getEquipmentClassFiy
	@RequestMapping("/getEquipmentClassFiy")
	@ResponseBody
	public Msg getEquipmentClassFiy(){
		
		EquipmentClassify eqClassify = new EquipmentClassify();
		
		List<EquipmentClassify> classify = equipmentService.selectEquipmentClassify(eqClassify);
		
		return Msg.success().add("list", classify);
	}
	
	/**
	 * 修改设备类型
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateEquipmentClassify")
	@ResponseBody
	public Msg updateEquipmentClassify(HttpServletRequest request){
		
		
		String equipmentClassifyId = request.getParameter("equipmentClassifyId");//设备类型ID
		String manufacturer = request.getParameter("manufacturer");//生产厂家
		String equipmentNumber = request.getParameter("equipmentNumber");//设备型号
		String equipmentClassifyName = request.getParameter("equipmentClassifyName");
		String equipmentClassifyRow = request.getParameter("equipmentClassifyRow");
		String equipmentClassifyLine = request.getParameter("equipmentClassifyLine");
		String equipmentSize = request.getParameter("equipmentSize");//设备尺寸
		
		
		
		
		EquipmentClassify equipmentClassify = new EquipmentClassify();
		equipmentClassify.setEquipmentClassifyId(Integer.parseInt(equipmentClassifyId));
		equipmentClassify.setEquipmentClassifyName(equipmentClassifyName);
		equipmentClassify.setEquipmentClassifyRow(Integer.parseInt(equipmentClassifyRow));
		equipmentClassify.setEquipmentClassifyLine(Integer.parseInt(equipmentClassifyLine));
		equipmentClassify.setEquipmentClassifyCreateTime(new Date());
		equipmentClassify.setEquipmentClassifyUpdateTime(new Date());
		equipmentClassify.setEquipmentClassifyManufacturer(manufacturer);
		equipmentClassify.setEquipmentClassifyEquipmentNumber(equipmentNumber);
		equipmentClassify.setEquipmentClassifyEquipmentSize(equipmentSize);
		
		
		int a = equipmentService.updateEquipmentClassfly(equipmentClassify);
		
		return Msg.success().add("msg", a);
	}
	
	
	
	
	
	
	/********************************************************** 设备监控信息  ***********************************************************************/


	@RequestMapping("/getEquipmentMessage")
	@ResponseBody
	public Msg getEquipmentMessage(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam("content")String content){
		
		PageHelper.startPage(pn, 5);
		Equipment equipment = new Equipment();
		if (!content.equals("") && !content.equals(" ") && !content.equals(null)) {
			equipment.setEquipmentName(content);
		}
		List<EquipmentMessage> equipmentList = equipmentMessageService.selectByExample(equipment);
		
		PageInfo<EquipmentMessage> page = new PageInfo<>(equipmentList,10);
		
		return Msg.success().add("pageInfo", page);
	}
	
	
	
	
	
	
	
	
	
	
	
	/********************************************************** 广告设置 ****************************************************************/
	/**
	 * 获取图片
	 * @return
	 */
	@RequestMapping("/getBanner")
	@ResponseBody
	public Msg getBanner(){
		
		List<Banner> banner = equipmentService.selectBanner(new Equipment());
		
		return Msg.success().add("list", banner);
	}
	
	/**
	 * 编辑图片放置点位
	 * @param pointNameId
	 * @return
	 */
	@RequestMapping("/updateBanner")
	@ResponseBody
	public Msg updateBanner(@RequestParam("bannerId")Integer bannerId,@RequestParam("pointName")Integer pointNameId){
		
		Banner b = new Banner();
		b.setBannerPointId(pointNameId);
		b.setBannerId(bannerId);
		equipmentService.updateBanner(b);
		
		return Msg.success();
	}
	
	
	/**
	 * 上传广告图片或视频
	 * @param file01
	 * @return
	 */
	@RequestMapping("/saveBanner")
	@ResponseBody
	public Msg saveBanner(@RequestParam("file01")MultipartFile file01){
		if(file01 == null || file01.getSize() == 0) {
			return Msg.fail().add("msg", "请上传图片");
		}
		
		Banner b = new Banner();
		b.setBannerCreateTime(new Date());
		
		String path = null;
		try {
			path = CommonUtil.saveFile(file01);
			b.setBannerPic(path);
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "图片上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "图片上传失败");
		}
		
		
		equipmentService.insertBannerSelective(b);
		
		return Msg.success();
	}
	
	
}
