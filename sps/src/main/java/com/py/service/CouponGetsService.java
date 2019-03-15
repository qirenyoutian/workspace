package com.py.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.CouponGet;
import com.py.dao.CouponGetMapper;

@Service
public class CouponGetsService {
	
	@Autowired
	CouponGetMapper couponGetMapper;

	public int deleteByPrimaryKey(Integer couponGetId) {
		return couponGetMapper.deleteByPrimaryKey(couponGetId);
	}

	public int insert(CouponGet record) {
		return couponGetMapper.insert(record);
	}

	public int insertSelective(CouponGet record) {
		return couponGetMapper.insertSelective(record);
	}

	public CouponGet selectByPrimaryKey(Integer couponGetId) {
		return couponGetMapper.selectByPrimaryKey(couponGetId);
	}

	public int updateByPrimaryKeySelective(CouponGet record) {
		return couponGetMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(CouponGet record) {
		return couponGetMapper.updateByPrimaryKey(record);
	}

}
