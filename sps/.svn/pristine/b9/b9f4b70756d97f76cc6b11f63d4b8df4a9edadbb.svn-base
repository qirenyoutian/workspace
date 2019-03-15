package com.py.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.BillingMethodMinute15;
import com.py.dao.BillingMethodMinute15Mapper;

@Service
public class BillingMethodMinute15Service {

	@Autowired
	BillingMethodMinute15Mapper billingMethodMinute15Mapper;
	
	public BillingMethodMinute15 selectByPrimaryKey(Integer billingMethodHourId) {
		return billingMethodMinute15Mapper.selectByPrimaryKey(billingMethodHourId);
	}

	public int deleteByPrimaryKey(Integer billingMethodHourId) {
		return billingMethodMinute15Mapper.deleteByPrimaryKey(billingMethodHourId);
	}

	public int insert(BillingMethodMinute15 record) {
		return billingMethodMinute15Mapper.insert(record);
	}

	public int insertSelective(BillingMethodMinute15 record) {
		return billingMethodMinute15Mapper.insertSelective(record);
	}

	public int updateByPrimaryKeySelective(BillingMethodMinute15 record) {
		return billingMethodMinute15Mapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(BillingMethodMinute15 record) {
		return billingMethodMinute15Mapper.updateByPrimaryKey(record);
	}

}
