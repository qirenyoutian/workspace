package com.py.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.BillingMethodHour;
import com.py.dao.BillingMethodHourMapper;

@Service
public class BillingMethodHourService {

	@Autowired
	BillingMethodHourMapper billingMethodHourMapper;
	
	public BillingMethodHour selectByPrimaryKey(Integer billingMethodHourId) {
		return billingMethodHourMapper.selectByPrimaryKey(billingMethodHourId);
	}

	public int deleteByPrimaryKey(Integer billingMethodHourId) {
		return billingMethodHourMapper.deleteByPrimaryKey(billingMethodHourId);
	}

	public int insert(BillingMethodHour record) {
		return billingMethodHourMapper.insert(record);
	}

	public int insertSelective(BillingMethodHour record) {
		return billingMethodHourMapper.insertSelective(record);
	}

	public int updateByPrimaryKeySelective(BillingMethodHour record) {
		return billingMethodHourMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(BillingMethodHour record) {
		return billingMethodHourMapper.updateByPrimaryKey(record);
	}

}
