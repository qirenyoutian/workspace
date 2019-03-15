package com.py.dao;

import java.util.List;

import com.py.bean.Coupon;

public interface CouponMapper {
    int deleteByPrimaryKey(Integer couponId);

    int insert(Coupon record);

    int insertSelective(Coupon record);

    Coupon selectByPrimaryKey(Integer couponId);

    int updateByPrimaryKeySelective(Coupon record);

    int updateByPrimaryKey(Coupon record);

	List<Coupon> selectByExample(Coupon coupon);

	Coupon selectByPrimary(Coupon coupon);
}