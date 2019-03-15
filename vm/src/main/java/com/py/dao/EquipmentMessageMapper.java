package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Equipment;
import com.py.bean.EquipmentMessage;

public interface EquipmentMessageMapper {
    int deleteByPrimaryKey(Integer equipmentMessageId);

    int insert(EquipmentMessage record);

    int insertSelective(EquipmentMessage record);

    EquipmentMessage selectByPrimaryKey(Integer equipmentMessageId);

    int updateByPrimaryKeySelective(EquipmentMessage record);

    int updateByPrimaryKey(EquipmentMessage record);

	EquipmentMessage selectByPrimary(EquipmentMessage equipmentMessage);

	List<EquipmentMessage> selectByExample(Equipment equipment);

	EquipmentMessage selectByEquipmentId(@Param("equipmentId")Integer equipmentId);
}