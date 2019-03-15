package com.py.dao;

import java.util.List;

import com.py.bean.LicensePlate;

public interface LicensePlateMapper {
    int deleteByPrimaryKey(Integer licensePlateId);

    int insert(LicensePlate record);

    int insertSelective(LicensePlate record);

    LicensePlate selectByPrimaryKey(Integer licensePlateId);

    int updateByPrimaryKeySelective(LicensePlate record);

    int updateByPrimaryKey(LicensePlate record);

	LicensePlate selectByPrimary(LicensePlate record);

	List<LicensePlate> selectByExample(LicensePlate record);
}