package com.py.dao;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Alipay;

public interface AlipayMapper {
    int deleteByPrimaryKey(Integer alipayId);

    int insert(Alipay record);

    int insertSelective(Alipay record);

    Alipay selectByPrimaryKey(Integer alipayId);

    int updateByPrimaryKeySelective(Alipay record);

    int updateByPrimaryKey(Alipay record);

	Alipay selectByCommercialTenantId(@Param("commercialTenantId")Integer commercialTenantId);
}