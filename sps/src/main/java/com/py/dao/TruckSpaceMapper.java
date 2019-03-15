package com.py.dao;

import java.util.List;

import com.py.bean.TruckSpace;

public interface TruckSpaceMapper {
    int deleteByPrimaryKey(Integer truckSpaceId);

    int insert(TruckSpace record);

    int insertSelective(TruckSpace record);

    TruckSpace selectByPrimaryKey(Integer truckSpaceId);

    int updateByPrimaryKeySelective(TruckSpace record);

    int updateByPrimaryKey(TruckSpace record);

	TruckSpace selectByPrimary(TruckSpace truckSpace);

	List<TruckSpace> selectByExample(TruckSpace truckSpace);
}