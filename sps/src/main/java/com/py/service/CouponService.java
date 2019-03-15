package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Coupon;
import com.py.dao.CouponMapper;

@Service
public class CouponService {
	@Autowired
	CouponMapper couponMapper;

	public int deleteByPrimaryKey(Integer couponId) {
		return couponMapper.deleteByPrimaryKey(couponId);
	}

	public int insert(Coupon record) {
		return couponMapper.insert(record);
	}

	public int insertSelective(Coupon record) {
		return couponMapper.insertSelective(record);
	}

	public Coupon selectByPrimaryKey(Integer couponId) {
		return couponMapper.selectByPrimaryKey(couponId);
	}

	public int updateByPrimaryKeySelective(Coupon record) {
		return couponMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Coupon record) {
		return couponMapper.updateByPrimaryKey(record);
	}

	public Coupon selectByPrimary(Coupon coupon) {
		return couponMapper.selectByPrimary(coupon);
	}

	public List<Coupon> selectByExample(Coupon coupon) {
		return couponMapper.selectByExample(coupon);
	}
}
