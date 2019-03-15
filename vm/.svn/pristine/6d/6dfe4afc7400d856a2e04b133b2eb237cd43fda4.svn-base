package com.py.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.hankcs.hanlp.dependency.nnparser.parser_dll;
import com.py.bean.ChannelPayment;
import com.py.bean.DictionaryListBean;
import com.py.bean.Payment;
import com.py.bean.Point;
import com.py.dao.PaymentMapper;
import com.py.service.PaymentService;
import com.py.service.SystemService;
import com.py.util.Msg;

@Controller
public class SystemController {
	@Autowired
	private SystemService systemService;
	@Autowired
	private PaymentService paymentService;
	
	
	
	
	/****************************************************** 支付方式管理 ***************************************************************/
	
	@RequestMapping("/getPaymentAll")
	@ResponseBody
	public Msg getPaymentAll(){
		
		Payment payment = new Payment();
		
		List<Payment> p = paymentService.selectByExample(payment);
		
		return Msg.success().add("pageInfo", p);
	}
	
	
	
	/****************************************************** 字典管理 ***************************************************************/
	
	
	//获取字典
	@RequestMapping("/getAllDictionary")
	@ResponseBody
	public Msg getAllDictionary(@RequestParam("style")Integer style){
		DictionaryListBean dictionaryListBean = systemService.selectAllClassifyDictionary(style);
		return Msg.success().add("list", dictionaryListBean);
	}
	
	/**
	 * 添加字典
	 * @param style
	 * @param dictionaryName
	 * @return
	 */
	@RequestMapping("/addDictionary")
	@ResponseBody
	public Msg addDictionary(@RequestParam("style")Integer style,
							 @RequestParam("dictionaryName")String dictionaryName){
		
		int a = 0;
		if (style == 0) {
			return Msg.fail().add("msg", "请选择表名！");
		}
		if (!"".equals(dictionaryName.trim()) && dictionaryName != null) {
			a = systemService.saveDictionary(style,dictionaryName);
			if (a == -1) {
				return Msg.fail().add("msg", "该属性名称已存在！");
			}else{
				return Msg.success().add("msg", "添加成功");
			}
		}else{
			return Msg.fail().add("msg", "请输入添加信息！");
		}
	}
	/**
	 * 删除字典
	 * @param id
	 * @param name
	 * @return
	 */
	@RequestMapping("/delDictionary")
	@ResponseBody
	public Msg delDictionary(@RequestParam("id")Integer id,
			@RequestParam("name")String name){
		
			int a = systemService.deleteDictionary(id,name);
			if (a != 0) {
				return Msg.success().add("msg", "删除成功！");
			}else{
				return Msg.fail().add("msg", "删除失败！");
			}
	}
	

}
