package com.py.dao;

import java.util.List;

import com.py.bean.BillingMethod;
import com.py.bean.BillingMethodRecord;

public interface BillingMethodMapper {
    int deleteByPrimaryKey(Integer billingMethodId);

    int insert(BillingMethod record);

    int insertSelective(BillingMethod record);

    BillingMethod selectByPrimaryKey(Integer billingMethodId);

    int updateByPrimaryKeySelective(BillingMethod record);

    int updateByPrimaryKey(BillingMethod record);

	BillingMethod selectByPrimary(BillingMethod record);

	List<BillingMethod> selectByExample(BillingMethod record);

	BillingMethodRecord selectByPrimaryRecord(BillingMethod billingMethod);

	List<BillingMethod> selectByExampleRecord(BillingMethod billingMethod);
}