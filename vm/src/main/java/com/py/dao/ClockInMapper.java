package com.py.dao;

import com.py.bean.ClockIn;

public interface ClockInMapper {
    int deleteByPrimaryKey(Integer clockInId);

    int insert(ClockIn record);

    int insertSelective(ClockIn record);

    ClockIn selectByPrimaryKey(Integer clockInId);

    int updateByPrimaryKeySelective(ClockIn record);

    int updateByPrimaryKey(ClockIn record);

	ClockIn selectByPrimary(ClockIn record);
	
	ClockIn selectByExample(ClockIn record);

	ClockIn selectByPrimaryToDay(ClockIn record);
}