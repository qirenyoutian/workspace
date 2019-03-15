package com.py.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.Feedback;
import com.py.bean.PavePlan;
import com.py.bean.PaveRecord;
import com.py.bean.PaveRecordDetail;
import com.py.service.AdminService;
import com.py.service.OperatService;
import com.py.service.PointService;
import com.py.util.CommonUtil;
import com.py.util.Msg;
import com.py.util.OfTime;

@Controller
public class OperatController {
	@Autowired
	private OperatService operatService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private PointService pointService;
	
	//铺货计划
	//铺货计划记录
	//跟办问题
	//
	
	/********************************************************* 铺货计划 *************************************************************/
	
	/**
	 * 获取铺货计划
	 * @return
	 */
	@RequestMapping("/getPavePlan")
	@ResponseBody
	public Msg getPavePlan(@RequestParam(value="pn",defaultValue="1")Integer pn){
		
		PageHelper.startPage(pn, 10);
		List<PavePlan> pp = operatService.selectPavePlan();
		
		PageInfo<PavePlan> pglist = new PageInfo<PavePlan>(pp,5);
		
		return Msg.success().add("pageInfo", pglist);
	}
	
	
	/**
	 * 保存铺货计划
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("/savePlan")
	@ResponseBody
	public Msg savePlan(HttpServletRequest request) throws ParseException{
		
		String planTitle = request.getParameter("planTitle");
		String planTime = request.getParameter("planTime");
		
		if (planTitle.equals("") || planTitle.equals(null) || planTitle.equals(" ")) {
			return Msg.fail().add("msg", "计划标题不能为空!");
		}
		if (planTime.equals("") || planTime.equals(null) || planTime.equals(" ")) {
			return Msg.fail().add("msg", "计划时间不能为空!");
		}else{
			String time1 = planTime.substring(0, 1);
			String time2 = "";
			if (planTime.length() > 1) {
				time2 = planTime.substring(2, 3);
			}	
			if (!time1.equals("周")) {
				if(!time2.equals("日")){
					return Msg.fail().add("msg", "计划时间格式不正确!");
				}
			}
		}
		
		operatService.savePlan(request);
		
		
		return Msg.success();
	}
	
	
	
	
	
	
	
	/********************************************************* 铺货计划记录 *************************************************************/
	
	/**
	 * 获取铺货计划记录
	 * @return
	 */
	@RequestMapping("/getPaveRecord")
	@ResponseBody
	public Msg getPaveRecord(@RequestParam(value="pn",defaultValue="1")Integer pn){
		
		PageHelper.startPage(pn, 10);
		List<PaveRecord> pp = operatService.selectPaveRecord();
		
		PageInfo<PaveRecord> pglist = new PageInfo<PaveRecord>(pp,5);
		
		return Msg.success().add("pageInfo", pglist);
	}
	
	/**
	 * 根据记录ID获取记录详情
	 * @param paveRecordId
	 * @return
	 */
	@RequestMapping("/getPaveDetail")
	@ResponseBody
	public Msg getPaveDetail(@RequestParam("paveRecordId")Integer paveRecordId){
		
		List<PaveRecordDetail> pc = operatService.PaveDetailById(paveRecordId);
		
		return Msg.success().add("list", pc);
	}
	
	
	
	
	
	/********************************************************* 跟办问题*************************************************************/
	
	
	/**
	 * 获取跟办问题
	 * @return
	 */
	@RequestMapping("/getProblem")
	@ResponseBody
	public Msg getProblem(@RequestParam(value="pn",defaultValue="1")Integer pn){
		
		PageHelper.startPage(pn, 10);
		List<Feedback> pp = operatService.selectByExample(new Feedback());
		
		PageInfo<Feedback> pglist = new PageInfo<Feedback>(pp,5);
		
		return Msg.success().add("pageInfo", pglist);
	}
	
	
	/**
	 * 添加跟办问题
	 */

	@RequestMapping("/saveProblem")
	@ResponseBody
	public Msg savePromble(HttpServletRequest request,@RequestParam("file01")MultipartFile file01){
		//问题描述
		String feedbackProblemDescription = request.getParameter("feedbackProblemDescription");
		String adminId = request.getParameter("adminId");
		String pointId = request.getParameter("pointId");
		
		
		
		if(feedbackProblemDescription.equals("")||feedbackProblemDescription.equals(" ")||feedbackProblemDescription.equals(null)){
			Msg.fail().add("msg", "问题描述不能为空!");
		}
		//运营人员名字
		if(adminId.equals("0")){
			Msg.fail().add("msg", "运营人员不能为空!");
		}
		//点位名字
		if(pointId.equals("0")){
			Msg.fail().add("msg", "所属点位不能为空!");
		}
		
		Feedback fb = new Feedback();
		
		//图片
        String path = null;
		
		try {
			path = CommonUtil.saveFile(file01);
			fb.setFeedbackImage(path);
		} catch (IllegalStateException e) {
			return Msg.fail().add("msg", "商品图片上传失败");
		} catch (IOException e) {
			return Msg.fail().add("msg", "商品图片上传失败");
		}
		
		fb.setFeedbackAdminId(Integer.parseInt(adminId));
		fb.setFeedbackCreateTime(OfTime.getLongTime());
		fb.setFeedbackMaintenanceState(1);
		fb.setFeedbackPointId(Integer.parseInt(pointId));
		fb.setFeedbackProblemDescription(feedbackProblemDescription);
		fb.setFeedbackRead(0);
		
		int i = operatService.insertFeedBack(fb);
		
		return Msg.success().add("msg", i);
	}

	
	/**
	 * 删除跟办问题
	 * @param feedbackId
	 */
	@RequestMapping("/deleteProblem")
	@ResponseBody
	public Msg deletePromble(HttpServletRequest request){
		String feedbackId = request.getParameter("feedbackId");
		int i = operatService.deleteFeedBack(Integer.parseInt(feedbackId));
		if(i==1){
			return Msg.success().add("msg", i);
		}else{
			return Msg.fail().add("msg", "删除失败");
		}
		
	}
	
	
}
