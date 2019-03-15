package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

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
import com.py.bean.Admin;
import com.py.bean.AdminPhotoAudit;
import com.py.bean.AuditPictures;
import com.py.service.AdminPhotoAuditService;
import com.py.service.AuditPicturesService;
import com.py.util.Msg;
import com.py.util.OfTime;

@Controller
public class AdminPhotoAuditController {
	@Autowired
	AdminPhotoAuditService adminPhotoAuditService;
	@Autowired
	AuditPicturesService auditPicturesService;
	
	
	/**
	 * 跳转到路巡工作人员图片审核页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpAdminPhotoAudit")
	public String jumpAdminPhotoAudit(Model model){
		return "adminPhotoAudit/adminPhotoAudit";
	}
	/**
	 * 查询全部路巡工作人员图片审核
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getAdminPhotoAuditAll")
	@ResponseBody
	public Msg getAdminPhotoAuditAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam("realname")String realname,HttpServletRequest request){
		PageHelper.startPage(pn, 10);
		AdminPhotoAudit adminPhotoAudit = new AdminPhotoAudit();
		List<AdminPhotoAudit> adminPhotoAuditList = null;
		if(!realname.equals("") && !realname.equals(null) && !realname.equals(" ")){
			
			try {
				String routeName = new String(realname.getBytes("ISO-8859-1"),"UTF-8");
				adminPhotoAuditList = auditPicturesService.selectByRealName(routeName);
			} catch (UnsupportedEncodingException e) {
			}
			
		}else{
			adminPhotoAuditList = auditPicturesService.selectBySampleWithAdmin(adminPhotoAudit);
		}		
		PageInfo<AdminPhotoAudit> page = new PageInfo<AdminPhotoAudit>(adminPhotoAuditList, 5);
		
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 根据状态查询
	 * @param pn 页码
	 * @param status 状态
	 * @param request
	 * @return
	 */
	@RequestMapping("/getAdminPhotoAuditByStatus")
	@ResponseBody
	public Msg getAdminPhotoAuditByStatus(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam("status")Integer status,HttpServletRequest request){
		PageHelper.startPage(pn, 10);
		
		List<AdminPhotoAudit> adminPhotoAuditList  = auditPicturesService.selectByStatus(status);
		
		PageInfo<AdminPhotoAudit> page = new PageInfo<AdminPhotoAudit>(adminPhotoAuditList, 5);
		
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 根据时间查询
	 * @param pn
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @param request
	 * @return
	 */
	@RequestMapping("/getAdminPhotoAuditByTime")
	@ResponseBody
	public Msg getAdminPhotoAuditByTime(@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam("startTime")String startTime,@RequestParam("endTime")String endTime,HttpServletRequest request){
		PageHelper.startPage(pn, 10);
			List<AdminPhotoAudit> adminPhotoAuditList = auditPicturesService.selectAuditByTime(startTime,endTime);
			PageInfo<AdminPhotoAudit> page = new PageInfo<AdminPhotoAudit>(adminPhotoAuditList, 5);
			
			return Msg.success().add("pageInfo", page);
		
	}
	
	
	/**
	 * 根据id查询单列
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getAdminPhotoAuditById/{auditId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getAdminPhotoAuditById(@PathVariable("auditId")Integer auditId){
		
		List<AdminPhotoAudit> apa = auditPicturesService.selectById(auditId);
		if(apa != null){
			return Msg.success().add("adminPhotoAudit", apa);
		}else{
			return Msg.fail().add("va_msg", "未找到该审核信息");
		}
	}
	/**
	 * 更新
	 * @throws UnsupportedEncodingException 
	 */
	//updateAdminPhotoAudit
	@RequestMapping(value="/updateAdminPhotoAudit")
	@ResponseBody
	public Msg updateAdminPhotoAudit(@RequestParam("adminPhotoAuditId")Integer id,@RequestParam("adminPhotoAuditResult")Integer adminPhotoAuditResult){
		
		int result = auditPicturesService.updateForStatusById(id,adminPhotoAuditResult);
		
		if(result != 0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	
	
}