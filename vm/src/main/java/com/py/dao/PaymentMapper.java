package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Payment;

public interface PaymentMapper {
    int deleteByPrimaryKey(Integer paymentId);

    int insert(Payment record);

    int insertSelective(Payment record);

    Payment selectByPrimaryKey(Integer paymentId);

    int updateByPrimaryKeySelective(Payment record);

    int updateByPrimaryKey(Payment record);
    
    List<Payment> getPaymentByAisleId(@Param("aisle_id")Integer aisle_id);

	List<Payment> selectByExample(Payment payment);

	List<Payment> getPaymentByChannelIdAndCommercialTenantId(@Param("commercialTenantId")Integer commercialTenantId, @Param("channelId")Integer channelId);

	Payment selectBySelective(Payment payment);
    
}