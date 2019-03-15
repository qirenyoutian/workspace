package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.StyledEditorKit.BoldAction;
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
import com.py.bean.ConsumptionType;
import com.py.bean.Grouping;
import com.py.service.ConsumptionTypeService;
import com.py.util.BooleanString;
import com.py.util.Msg;
import com.py.util.OfTime;

@Controller
public class ConsumptionTypeController {
	@Autowired
	ConsumptionTypeService consumptionTypeService;
	/**
	 * 跳转到消费类型界面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpConsumptionType")
	public String jumpConsumptionType(Model model){
		return "consumptionType/consumptionType";
	}
	/**
	 * 查询全部消费类型
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getConsumptionTypeAll")
	@ResponseBody
	public Msg getConsumptionTypeAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 10);
		List<ConsumptionType> ConsumptionTypeList = consumptionTypeService.selectByExample(new ConsumptionType());
		PageInfo<ConsumptionType> page = new PageInfo<ConsumptionType>(ConsumptionTypeList, 5);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 添加
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 */
	@RequestMapping(value="/saveConsumptionType",method=RequestMethod.POST)
	@ResponseBody
	public Msg ConsumptionType(@Valid ConsumptionType consumptionType,BindingResult result,HttpServletRequest request){
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
			int result1 = consumptionTypeService.insertSelective(consumptionType);
			if(result1 != 0){
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
	}
	/**
	 * 检查金额是否可用
	 */
	@ResponseBody
	@RequestMapping(value="/checkConsumption",method=RequestMethod.POST)
	public Msg checkConsumption(@RequestParam("consumption")String consumption){
		if(BooleanString.isMoneyNumber(consumption)){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "请输入正确的消费金额");
		}
	}
	/**
	 * 根据id查询单列
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getConsumptionTypeById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getConsumptionTypeById(@PathVariable("id")Integer id){
		ConsumptionType consumptionType = new ConsumptionType();
		consumptionType.setConsumptionTypeId(id);
		ConsumptionType ct = consumptionTypeService.selectByPrimary(consumptionType);
		if(ct != null){
			return Msg.success().add("consumptionType", ct);
		}else{
			return Msg.fail().add("va_msg", "未找到该消费类型信息");
		}
	}
	/**
	 * 更新
	 */
	@ResponseBody
	@RequestMapping(value="/updateConsumptionType/{id}",method=RequestMethod.PUT)
	public Msg updateConsumptionType(@Valid ConsumptionType consumptionType){
		int result = consumptionTypeService.updateByPrimaryKeySelective(consumptionType);
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
	@RequestMapping(value="/deleteConsumptionType/{ids}",method=RequestMethod.DELETE)
	public Msg deleteByServicePoint(@PathVariable("ids")String ids){
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (int i = 0; i < str_ids.length; i++) {
				Integer id = Integer.parseInt(str_ids[i]);
				int re = consumptionTypeService.deleteByPrimaryKey(id);
				if(re == 0){
					return Msg.fail();
				}
			
			}
		}else{
			Integer id = Integer.parseInt(ids);
			int re = consumptionTypeService.deleteByPrimaryKey(id);
			if(re == 0){
				return Msg.fail();
			}
		}
		return Msg.success();
	}
}
