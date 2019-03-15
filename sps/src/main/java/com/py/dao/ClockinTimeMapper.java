package com.py.dao;

import java.util.List;

import com.py.bean.ClockinTime;

public interface ClockinTimeMapper {
    int deleteByPrimaryKey(Integer clockinTimeId);

    int insert(ClockinTime record);

    int insertSelective(ClockinTime record);

    ClockinTime selectByPrimaryKey(Integer clockinTimeId);
    
    List<ClockinTime> selectAllTime();

    int updateByPrimaryKeySelective(ClockinTime record);

    int updateByPrimaryKey(ClockinTime record);
}