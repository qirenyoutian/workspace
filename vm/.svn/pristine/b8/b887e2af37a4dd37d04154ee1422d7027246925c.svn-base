package com.py.service;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Feedback;
import com.py.bean.PavePlan;
import com.py.bean.PaveRecord;
import com.py.bean.PaveRecordDetail;
import com.py.dao.FeedbackMapper;
import com.py.dao.PavePlanMapper;
import com.py.dao.PaveRecordDetailMapper;
import com.py.dao.PaveRecordMapper;
import com.py.dao.ProblemMapper;

@Service
public class OperatService {
	@Autowired
	private PavePlanMapper pavePlanMapper; //铺货计划
	@Autowired
	private PaveRecordMapper paveRecordMapper;//铺货记录
	@Autowired
	private PaveRecordDetailMapper paveRecordDetailMapper;//铺货记录详情
	@Autowired
	private ProblemMapper problemMapper;
	@Autowired
	private FeedbackMapper feedbackMapper;
	
	
	
	
	
	/*************************************************** 铺货计划 ***********************************************************/
	
	public List<PavePlan> selectPavePlan() {
		
		PavePlan pavePlan = new PavePlan();
		
		return pavePlanMapper.selectVariousByExample(pavePlan);
	}


	/**
	 * 保存铺货计划
	 * @param request
	 * @return
	 * @throws ParseException 
	 */
	public int savePlan(HttpServletRequest request) throws ParseException {
		String planTitle = request.getParameter("planTitle");
		String planComit = request.getParameter("planComit");
		String planTime = request.getParameter("planTime");
		String pavePlanAdminId = request.getParameter("pavePlanAdminId");
		
		
		
		PavePlan pavePlan = new PavePlan();
		pavePlan.setPavePlanTitle(planTitle);
		pavePlan.setPavePlanComit(planComit);
		pavePlan.setPavePlanTime(planTime);
		pavePlan.setPavePlanAdminId(Integer.parseInt(pavePlanAdminId));
		
		int a = pavePlanMapper.insertSelective(pavePlan);
		
		
		
		return a;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	/*************************************************** 铺货记录 ***********************************************************/
	

	public List<PaveRecord> selectPaveRecord() {
		
		PaveRecord paveRecord = new PaveRecord();
		
		return paveRecordMapper.selectVariousByExample(paveRecord);
	}


	
	
	
	/*************************************************** 铺货记录详情 ***********************************************************/
	
	
	public List<PaveRecordDetail> PaveDetailById(Integer paveRecordId) {
		
		
		PaveRecordDetail paveRecordDetail = new PaveRecordDetail();
	
		paveRecordDetail.setPaveRecordEtailRecordId(paveRecordId);
		
		return paveRecordDetailMapper.selectVariousByExample(paveRecordDetail);
		
	}

	
	
	/*************************************************** 跟办问题 ***********************************************************/

	public List<Feedback> selectByExample(Feedback feedback) {
		
		
		return feedbackMapper.selectByExample(feedback);
	}




	//添加跟办问题
	public int insertFeedBack(Feedback fb){
		return feedbackMapper.insert(fb);
	}




	//删除跟办问题
	public int deleteFeedBack(Integer feedbackId){
		return feedbackMapper.deleteByPrimaryKey(feedbackId);
	}




	
	
	
	

}
