package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Merchandise;

public interface MerchandiseMapper {
    int deleteByPrimaryKey(Integer merchandiseId);

    int insert(Merchandise record);

    int insertSelective(Merchandise record);

    Merchandise selectByPrimaryKey(Integer merchandiseId);

    int updateByPrimaryKeySelective(Merchandise record);

    int updateByPrimaryKey(Merchandise record);

	List<Merchandise> selectByExample(Merchandise merchandise);

	List<Merchandise> selectByTime(@Param("startTime")String startTime, @Param("endTime")String endTime);

	Merchandise selectByPrimary(Merchandise merchandise);

	int deleteByArray(String[] merchandiseIds);

	List<Merchandise> selectByStatus(Merchandise merchandise);
}