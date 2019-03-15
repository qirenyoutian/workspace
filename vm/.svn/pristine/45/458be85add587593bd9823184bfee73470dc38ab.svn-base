package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.CommercialTenantPayment;

public interface CommercialTenantPaymentMapper {
    int deleteByPrimaryKey(Integer commercialTenantPaymentId);

    int insert(CommercialTenantPayment record);

    int insertSelective(CommercialTenantPayment record);

    CommercialTenantPayment selectByPrimaryKey(Integer commercialTenantPaymentId);

    int updateByPrimaryKeySelective(CommercialTenantPayment record);

    int updateByPrimaryKey(CommercialTenantPayment record);

	List<CommercialTenantPayment> selectByExample(CommercialTenantPayment ctp);

	int deleteByCommerId(@Param("commercialTenantPaymentCommercialTenantId")Integer parseInt);
}