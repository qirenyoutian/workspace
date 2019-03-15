package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.CommercialTenantReport;
import com.py.bean.MerchandiseReport;
import com.py.bean.PointReport;
import com.py.bean.Single;

public interface SingleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Single record);

    int insertSelective(Single record);

    Single selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Single record);

    int updateByPrimaryKey(Single record);

	Single selectByChannelOrderNumber(@Param("order_id")String order_id);

	//商品报表-----后管用
	List<MerchandiseReport> getMerchandiseReport(@Param("startTime")String startTime,
			@Param("endTime")String endTime);
	
	//商户报表-----后管用
		List<CommercialTenantReport> getCommercialTenantReport(
				@Param("startTime")String startTime,
				@Param("endTime")String endTime);

	//点位报表-----后管用
	List<PointReport> getPointReport(@Param("startTime")String startTime,
			@Param("endTime")String endTime);
	
}