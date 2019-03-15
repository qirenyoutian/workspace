package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.BillingMethod;
import com.py.bean.BillingMethodHour;
import com.py.bean.BillingMethodMinute15;
import com.py.bean.BillingMethodRecord;
import com.py.bean.TimeQuantum;
import com.py.service.BillingMethodHourService;
import com.py.service.BillingMethodMinute15Service;
import com.py.service.BillingMethodService;
import com.py.service.TimeQuantumService;
import com.py.util.BooleanString;
import com.py.util.Msg;

@Controller
public class BillingMethodController {
	@Autowired
	BillingMethodService billingMethodService;
	@Autowired
	TimeQuantumService timeQuantumService;
	@Autowired
	BillingMethodHourService billingMethodHourService;
	@Autowired
	BillingMethodMinute15Service billingMethodMinute15Service;
	
	/**
	 * 跳转到计算方式界面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpBillingMethod")
	public String jumpBillingMethod(Model model){
		return "billingMethod/billingMethod";
	}
	@RequestMapping("/jumpBillingMethodHour")
	public String jumpBillingMethodHour(Model model){
		return "billingMethod/billingMethodHour";
	}
	@RequestMapping("/jumpBillingMethodMinute15")
	public String jumpBillingMethodMinute15(Model model){
		return "billingMethod/billingMethodMinute15";
	}
	/**
	 * 查询全部消费类型
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getBillingMethodAll")
	@ResponseBody
	public Msg getBillingMethodAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 50);
		List<BillingMethod> billingMethodList = billingMethodService.selectByExampleRecord(new BillingMethod());
		PageInfo<BillingMethod> page = new PageInfo<BillingMethod>(billingMethodList, 5);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 查询全部消费类型
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getBillingMethodHour")
	@ResponseBody
	public Msg getBillingMethodHour(@RequestParam(value = "pn", defaultValue = "1") Integer pn) throws UnsupportedEncodingException {
		BillingMethodHour methodHour = billingMethodHourService.selectByPrimaryKey(1);
		return Msg.success(methodHour);
	}
	/**
	 * 查询全部消费类型
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getBillingMethodMinute15")
	@ResponseBody
	public Msg getBillingMethodMinute15(@RequestParam(value = "pn", defaultValue = "1") Integer pn) throws UnsupportedEncodingException {
		BillingMethodMinute15 methodMinute15 = billingMethodMinute15Service.selectByPrimaryKey(1);
		return Msg.success(methodMinute15);
	}
	/**
	 * 检查金额是否可用
	 */
	@ResponseBody
	@RequestMapping(value="/checkMoney",method=RequestMethod.POST)
	public Msg checkConsumption(@RequestParam("money")String money){
		if(BooleanString.isMoneyNumber(money)){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "请输入正确的消费金额");
		}
	}
	/**
	 * 检查分钟是否可用
	 */
	@ResponseBody
	@RequestMapping(value="/checkNumber",method=RequestMethod.POST)
	public Msg checkNumber(@RequestParam("number")String number){
		if(BooleanString.isNumber(number)){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "请输入正确的分钟数");
		}
	}
	/**
	 * 添加
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 */
	@RequestMapping(value="/saveBillingMethod",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveBillingMethod(@Valid BillingMethod billingMethod,BindingResult result,HttpServletRequest request){
		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			/*BillingMethod record = new BillingMethod();
			record.setBillingMethodName(billingMethod.getBillingMethodName());
			BillingMethod selectByPrimary = billingMethodService.selectByPrimary(record);
			if(selectByPrimary != null){
				return Msg.fail().add("msg", "名称不能重复");
			}*/
			int result1 = billingMethodService.insertSelective(billingMethod);
			if(result1 != 0){
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
	}
	/**
	 * 根据id查询单列
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getBillingMethodById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getConsumptionTypeById(@PathVariable("id")Integer id){
		BillingMethod billingMethod = new BillingMethod();
		billingMethod.setBillingMethodId(id);
		BillingMethod bm = billingMethodService.selectByPrimaryRecord(billingMethod);
		if(bm != null){
			return Msg.success().add("billingMethod", bm);
		}else{
			return Msg.fail().add("va_msg", "未找到该计算方式信息");
		}
	}
	@ResponseBody
	@RequestMapping(value="/getBillingMethodHourById",method=RequestMethod.GET)
	public Msg getBillingMethodHourById(){
		BillingMethodHour methodHour = billingMethodHourService.selectByPrimaryKey(1);
		return Msg.success().add("billingMethod", methodHour);
	}
	@ResponseBody
	@RequestMapping(value="/getBillingMethodMinute15ById",method=RequestMethod.GET)
	public Msg getBillingMethodMinute15ById(){
		BillingMethodMinute15 methodMinute15 = billingMethodMinute15Service.selectByPrimaryKey(1);
		return Msg.success().add("billingMethod", methodMinute15);
	}
	/**
	 * 更新
	 */
	@ResponseBody
	@RequestMapping(value="/updateBillingMethod/{id}",method=RequestMethod.PUT)
	public Msg updateBillingMethod(@Valid BillingMethod billingMethod){
		BillingMethod record = new BillingMethod();
		record.setBillingMethodName(billingMethod.getBillingMethodName());
		BillingMethod selectByPrimary = billingMethodService.selectByPrimary(record);
		if(selectByPrimary != null && !selectByPrimary.getBillingMethodId().equals(billingMethod.getBillingMethodId())){
			return Msg.fail().add("msg", "名称不能重复");
		}
		int result = billingMethodService.updateByPrimaryKeySelective(billingMethod);
		if(result != 0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	/**
	 * 更新
	 */
	@ResponseBody
	@RequestMapping(value="/updateBillingMethodHour",method=RequestMethod.PUT)
	public Msg updateBillingMethodHour(@Valid BillingMethodHour billingMethodHour){
		billingMethodHour.setBillingMethodHourId(1);
		int result = billingMethodHourService.updateByPrimaryKeySelective(billingMethodHour);
		if(result != 0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	/**
	 * 更新
	 */
	@ResponseBody
	@RequestMapping(value="/updateBillingMethodMinute15",method=RequestMethod.PUT)
	public Msg updateBillingMethodMinute15(@Valid BillingMethodMinute15 billingMethodMinute15){
		billingMethodMinute15.setBillingMethodMinute15Id(1);
		int result = billingMethodMinute15Service.updateByPrimaryKeySelective(billingMethodMinute15);
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
	@RequestMapping(value="/deleteBillingMethod/{ids}",method=RequestMethod.DELETE)
	public Msg deleteBillingMethod(@PathVariable("ids")String ids){
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (int i = 0; i < str_ids.length; i++) {
				Integer id = Integer.parseInt(str_ids[i]);
				int re = billingMethodService.deleteByPrimaryKey(id);
				if(re == 0){
					return Msg.fail();
				}
			}
		}else{
			Integer id = Integer.parseInt(ids);
			int re = billingMethodService.deleteByPrimaryKey(id);
			if(re == 0){
				return Msg.fail();
			}
		}
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="/savetimeQuantum",method=RequestMethod.POST)
	public Msg savetimeQuantum(@RequestParam("timeQuantumBillingMethodId")Integer timeQuantumBillingMethodId,
			@RequestParam("timeQuantumStartTime")Integer timeQuantumStartTime,
			@RequestParam("timeQuantumEndTime")Integer timeQuantumEndTime,
			@RequestParam("timeQuantumRate")Double timeQuantumRate) {
		
		if(timeQuantumEndTime <= timeQuantumStartTime) {
			return Msg.fail().add("msg", "结束时间不可小于开始时间");
		}
		
		BillingMethod billingMethod = new BillingMethod();
		billingMethod.setBillingMethodId(timeQuantumBillingMethodId);
		BillingMethodRecord methodRecord = billingMethodService.selectByPrimaryRecord(billingMethod);
		
		List<TimeQuantum> timeQuantums = methodRecord.getTimeQuantums();
		
		for (TimeQuantum timeQuantum : timeQuantums) {
			if(timeQuantumStartTime < timeQuantum.getTimeQuantumEndTime() && timeQuantumStartTime >= timeQuantum.getTimeQuantumStartTime()) {
				return Msg.fail().add("msg", "请选择还未被添加的时间段");
			}
			if(timeQuantumEndTime < timeQuantum.getTimeQuantumEndTime() && timeQuantumEndTime >= timeQuantum.getTimeQuantumStartTime()) {
				return Msg.fail().add("msg", "请选择还未被添加的时间段");
			}
		}
		
		TimeQuantum timeQuantum = new TimeQuantum();
		timeQuantum.setTimeQuantumBillingMethodId(timeQuantumBillingMethodId);
		timeQuantum.setTimeQuantumStartTime(timeQuantumStartTime);
		timeQuantum.setTimeQuantumEndTime(timeQuantumEndTime);
		timeQuantum.setTimeQuantumRate(timeQuantumRate);
		try {
			timeQuantumService.insertSelective(timeQuantum);
		} catch (Exception e) {
			return Msg.fail().add("msg", "添加失败");
		}
		return Msg.success();
	}
	
	/**
	 * 删除时间段
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteTimeQuantum/{id}",method=RequestMethod.DELETE)
	public Msg deleteTimeQuantum(@PathVariable("id")Integer timeQuantumId){
		int re = timeQuantumService.deleteByPrimaryKey(timeQuantumId);
		if(re == 0){
			return Msg.fail();
		}
		return Msg.success();
	}
}
