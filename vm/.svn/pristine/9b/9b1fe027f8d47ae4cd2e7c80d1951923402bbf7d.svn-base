package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.CommercialTenant;

public interface CommercialTenantMapper {
    int deleteByPrimaryKey(Integer commercialTenantId);

    int insert(CommercialTenant record);

    int insertSelective(CommercialTenant record);

    CommercialTenant selectByPrimaryKey(Integer commercialTenantId);

    int updateByPrimaryKeySelective(CommercialTenant record);

    int updateByPrimaryKey(CommercialTenant record);
    
    List<CommercialTenant> selectByExample(CommercialTenant commercialTenant);

	List<CommercialTenant> selectByTime(@Param("startTime")String startTime, @Param("endTime")String endTime);

	int deleteByArray(String[] commercialtIds);

	List<CommercialTenant> selectCommerAndPaymentByCommerId(@Param("commerId")Integer commerId);
	
	//根据商户id查找商户名称
	String selectCommercialTenantNameByCommerId(@Param("commerId")Integer commerId);
}