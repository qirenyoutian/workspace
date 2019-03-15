package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.ChannelPoint;
import com.py.bean.Point;
import com.py.service.PointService;
import com.py.util.Msg;

@Controller
public class PointController {

	@Autowired
	private PointService pointService;
	
	
	@ResponseBody
	@RequestMapping("/getPointAll")
	public Msg getPointAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam("province")Integer province,
			@RequestParam("city")Integer city,
			@RequestParam("area")Integer area,
			@RequestParam("content")String content,
			HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		 PageHelper.startPage(pn, 30);
		
		List<Point> menuList = null;
		Point point = new Point();
		point.setPointProvince(province);
		point.setPointCity(city);
		point.setPointDistrict(area);
		point.setPointName(content);
		
		menuList = pointService.selectByExample(point);
			
		PageInfo<Point> page = new PageInfo<Point>(menuList, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	
	/**
	 * 保存admin
	 * @param request
	 * @return
	 */
	@RequestMapping("/savepoint")
	@ResponseBody
	public Msg savepoint(HttpServletRequest request){
		
		String pointName = request.getParameter("pointName");
		String pointProvince = request.getParameter("pointProvince");
		String pointCity = request.getParameter("pointCity");
		String pointDistrict = request.getParameter("pointDistrict");
		String pointAddress = request.getParameter("pointAddress");
		String ChannelId = request.getParameter("ChannelId");
		
		if(pointName == null || "".equals(pointName.trim())) {
			return Msg.fail().add("msg", "请填写点位名称");
		}
		if(pointProvince == null) {
			return Msg.fail().add("msg", "请选择省");
		}
		if(pointCity == null) {
			return Msg.fail().add("msg", "请选择市");
		}
		if(pointDistrict == null) {
			return Msg.fail().add("msg", "请选择区");
		}
		if(pointAddress == null || "".equals(pointAddress.trim())) {
			return Msg.fail().add("msg", "请填写详细位置");
		}
		if(ChannelId == null) {
			return Msg.fail().add("msg", "请选择渠道");
		}
		
		
		pointService.insertSelective(request);
		
		return Msg.success();
	}
	
	
	/**
	 * 根据id查询单列
	 * @param id
	 * @return
	 */
	@RequestMapping("/getPointById")//getMerchandiseById
	@ResponseBody
	public Msg getMerchandiseById(@RequestParam("pointId")Integer id){
		Point point = new Point();
		point.setPointId(id);
		point = pointService.selectByPrimary(point);
		if(point != null){
			return Msg.success().add("menu", point);
		}else{
			return Msg.fail().add("va_msg", "未找到该菜单信息");
		}
	}
	
	//修改
	@RequestMapping("/updatepoint")
	@ResponseBody
	public Msg updateCommer(HttpServletRequest request){
		
		Msg msg = pointService.updatepoint(request);
		
		return Msg.success().add("msg", msg);
	}
	
	//删除
	@ResponseBody
	@RequestMapping("/deletePoint")
	public Msg deletePoint(@RequestParam("pointIds[]")Integer[] ids) {
		
		pointService.deleteByPointIds(ids);
		
		return Msg.success();
	}
	/**
	 * 查询用的点位名称
	 * @return
	 */
	@RequestMapping("/getPointForSelect")
	@ResponseBody
	public Msg getPointForSelect(){
		Point point = new Point();
		List<Point> list = pointService.selectByExample(point);
		return Msg.success().add("list", list);
	}
			

	/****************************************************** 点位管理 ***************************************************************/
	
	
	//获取点位
		@RequestMapping("/getPoint")
		@ResponseBody
		public Msg getPoint(HttpServletRequest request,@RequestParam("content")String content){
			List<Point> pp = pointService.getPoint(content);
			return Msg.success().add("msg", pp);
		}
	
	
	
}
