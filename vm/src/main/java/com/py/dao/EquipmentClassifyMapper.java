package com.py.dao;

import java.util.List;

import com.py.bean.EquipmentClassify;

public interface EquipmentClassifyMapper {
    int deleteByPrimaryKey(Integer equipmentClassifyId);

    int insert(EquipmentClassify record);

    int insertSelective(EquipmentClassify record);

    EquipmentClassify selectByPrimaryKey(Integer equipmentClassifyId);

    int updateByPrimaryKeySelective(EquipmentClassify record);

    int updateByPrimaryKey(EquipmentClassify record);

	List<EquipmentClassify> selectByExample(EquipmentClassify equipmentClassify);

	int deleteByArray(String[] equipmenClassifyIds);
}