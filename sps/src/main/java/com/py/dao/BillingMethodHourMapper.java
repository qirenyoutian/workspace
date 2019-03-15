package com.py.dao;

import com.py.bean.BillingMethodHour;

public interface BillingMethodHourMapper {
    int deleteByPrimaryKey(Integer billingMethodHourId);

    int insert(BillingMethodHour record);

    int insertSelective(BillingMethodHour record);

    BillingMethodHour selectByPrimaryKey(Integer billingMethodHourId);

    int updateByPrimaryKeySelective(BillingMethodHour record);

    int updateByPrimaryKey(BillingMethodHour record);
}