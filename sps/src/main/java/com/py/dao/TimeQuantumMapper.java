package com.py.dao;

import com.py.bean.TimeQuantum;

public interface TimeQuantumMapper {
    int deleteByPrimaryKey(Integer timeQuantumId);

    int insert(TimeQuantum record);

    int insertSelective(TimeQuantum record);

    TimeQuantum selectByPrimaryKey(Integer timeQuantumId);

    int updateByPrimaryKeySelective(TimeQuantum record);

    int updateByPrimaryKey(TimeQuantum record);
}