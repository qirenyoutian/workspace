package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Clockin;

public interface ClockinMapper {
    int deleteByPrimaryKey(Integer clockinId);

    int insert(Clockin record);

    int insertSelective(Clockin record);

    Clockin selectByPrimaryKey(Integer clockinId);

    int updateByPrimaryKeySelective(Clockin record);

    int updateByPrimaryKey(Clockin record);

	List<Clockin> selectByExample(Clockin clockin);

	Clockin findToDay(Clockin clockin);

	List<Clockin> findByClockinTime(@Param("clockinAdminId")String clockinAdminId, @Param("clockinTime")String clockinTime);
}