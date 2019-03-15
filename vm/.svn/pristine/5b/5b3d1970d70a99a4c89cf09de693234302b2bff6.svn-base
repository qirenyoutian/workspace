package com.py.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Dictionary;
import com.py.bean.DictionaryClassify;
import com.py.bean.DictionaryListBean;
import com.py.bean.MerchandiseClassify;
import com.py.bean.MerchandiseExtend;
import com.py.bean.Payment;
import com.py.dao.DictionaryClassifyMapper;
import com.py.dao.DictionaryMapper;
import com.py.dao.MerchandiseClassifyMapper;
import com.py.dao.PaymentMapper;
import com.py.dao.PointMapper;

@Service
public class SystemService {
	@Autowired
	PointMapper pointMapper;
	@Autowired
	private DictionaryMapper dictionaryMapper;
	@Autowired
	private DictionaryClassifyMapper dictionaryClassifyMapper;
	@Autowired
	private MerchandiseClassifyMapper mClassifyMapper;
	@Autowired
	private PaymentMapper paymentMapper;
	
	
	
	
	
	
	
	
	/**
	 * 根据名字找字典类型
	 * @param name
	 * @return
	 */
	public List<DictionaryClassify> selectDictionaryClassifyByName(String name) {
		
		DictionaryClassify dictionaryClassify = new DictionaryClassify();
		dictionaryClassify.setDictionaryClassifyName(name);
		
		return dictionaryClassifyMapper.selectByExample(dictionaryClassify);
	}


	/**
	 * 根据类型ID找字典值
	 * @param dictionaryClassifyId
	 * @return
	 */
	public List<Dictionary> selectDictionaryByClassifyId(Integer dictionaryClassifyId) {
		
		Dictionary dictionary = new Dictionary();
		dictionary.setDictionaryClassifyId(dictionaryClassifyId);
		
		return dictionaryMapper.selectByExample(dictionary);
	}

	
	/**
	 * 查找所有的字典字段
	 * @return
	 */
	public DictionaryListBean selectAllClassifyDictionary(Integer style) {
		
		List<Dictionary> dictionarys = null;
		List<Payment> payMents = null;
		List<MerchandiseClassify> merchandiseClassifies = null;
		
		if (style == 1) {
			dictionarys = dictionaryMapper.selectByExample(new Dictionary());
		}else if (style == 2) {
			payMents = paymentMapper.selectByExample(new Payment());
		}else if (style == 3) {
			merchandiseClassifies = mClassifyMapper.selectByExample(new MerchandiseClassify());
		}else{
			dictionarys = dictionaryMapper.selectByExample(new Dictionary());
			payMents = paymentMapper.selectByExample(new Payment());
			merchandiseClassifies = mClassifyMapper.selectByExample(new MerchandiseClassify());
		}
		
		
		DictionaryListBean dlb = new DictionaryListBean();
		dlb.setDictionaries(dictionarys);
		dlb.setMerchandiseClassifies(merchandiseClassifies);
		dlb.setPayMents(payMents);
		
		
		return dlb;
	}

	
	/**
	 * 保存字典值
	 * @param style
	 * @param dictionaryName
	 * @return
	 */
	public int saveDictionary(Integer style, String dictionaryName) {
		
		int s = 0;
		if (style == 1) {
			Dictionary dictionary = new Dictionary();
			dictionary.setDictionaryValue(dictionaryName);
			Dictionary dd = dictionaryMapper.selectBySelective(dictionary);
			if (dd == null) {
				dictionary.setDictionaryTime(new Date());
				s = dictionaryMapper.insertSelective(dictionary);
			}else{
				s = -1;
			}
		}
		if(style == 2){
			Payment payment = new Payment();
			payment.setPaymentName(dictionaryName);
			Payment pp = paymentMapper.selectBySelective(payment);
			if (pp == null) {
				payment.setPaymentCreateTime(new Date());
				payment.setPaymentUpdateTime(new Date());
				s = paymentMapper.insertSelective(payment);
			}else{
				s = -1;
			}
			
		}
		if(style == 3){
			MerchandiseClassify merchandiseClassify = new MerchandiseClassify();
			merchandiseClassify.setMerchandiseClassifyName(dictionaryName);
			MerchandiseClassify ss = mClassifyMapper.selectBySelective(merchandiseClassify);
			if (ss == null) {
				merchandiseClassify.setMerchandiseClassifyTime(new Date());
				merchandiseClassify.setMerchandiseClassifyUpdateTime(new Date());
				s = mClassifyMapper.insertSelective(merchandiseClassify);
			}else{
				s = -1;
			}
		}
		return s;
	}

	/**
	 * 删除字典信息
	 * @param id
	 * @param name
	 * @return
	 */
	public int deleteDictionary(Integer id, String name) {
		
		Dictionary dictionary = new Dictionary();
		MerchandiseClassify mClassify = new MerchandiseClassify();
		Payment payment = new Payment();
		dictionary.setDictionaryId(id);
		dictionary.setDictionaryValue(name);
		mClassify.setMerchandiseClassifyName(name);
		mClassify.setMerchandiseClassifyId(id);
		payment.setPaymentId(id);
		payment.setPaymentName(name);
		
		Dictionary bySelective = dictionaryMapper.selectBySelective(dictionary);
		MerchandiseClassify mm = mClassifyMapper.selectBySelective(mClassify);
		Payment pp = paymentMapper.selectBySelective(payment);
		int status = 0;
		
		if (bySelective != null) {
			status = dictionaryMapper.deleteByPrimaryKey(id);
		}else if(mm != null){
			status = mClassifyMapper.deleteByPrimaryKey(id);
		}else if (pp != null) {
			status = paymentMapper.deleteByPrimaryKey(id);
		}
		
		return status;
	}
	
	
	
	

}
