package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.BillingMethod;
import com.py.bean.BillingMethodRecord;
import com.py.dao.BillingMethodMapper;

@Service
public class BillingMethodService {
	@Autowired
	BillingMethodMapper billingMethodMapper;
	public int deleteByPrimaryKey(Integer billingMethodId) {
		return billingMethodMapper.deleteByPrimaryKey(billingMethodId);
	}

	public int insert(BillingMethod record) {
		return billingMethodMapper.insert(record);
	}

	public int insertSelective(BillingMethod record) {
		return billingMethodMapper.insertSelective(record);
	}

	public BillingMethod selectByPrimary(BillingMethod record) {
		return billingMethodMapper.selectByPrimary(record);
	}
    
	public List<BillingMethod> selectByExample(BillingMethod record) {
		return billingMethodMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(BillingMethod record) {
		return billingMethodMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(BillingMethod record) {
		return billingMethodMapper.updateByPrimaryKey(record);
	}

	public BillingMethod selectByPrimaryKey(Integer billingMethodId) {
		return billingMethodMapper.selectByPrimaryKey(billingMethodId);
	}

	public BillingMethodRecord selectByPrimaryRecord(BillingMethod billingMethod) {
		return billingMethodMapper.selectByPrimaryRecord(billingMethod);
	}

	public List<BillingMethod> selectByExampleRecord(BillingMethod billingMethod) {
		return billingMethodMapper.selectByExampleRecord(billingMethod);
	}
}
