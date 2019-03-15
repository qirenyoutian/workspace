package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Equipment;
import com.py.bean.Monitoring;

public interface EquipmentMapper {
    int deleteByPrimaryKey(Integer equipmentId);

    int insert(Equipment record);

    int insertSelective(Equipment record);

    Equipment selectByPrimaryKey(Integer equipmentId);

    int updateByPrimaryKeySelective(Equipment record);

    int updateByPrimaryKey(Equipment record);

	List<Equipment> selectAllEquipment(Equipment equipment);

	int deleteByArray(@Param("equipmenIds")String[] equipmenIds);

	List<Equipment> selectByExample(Equipment equipment);

	Equipment selectByPrimary(Equipment equipment);

	Equipment selectByEquipmentName(Equipment equipment);

	Equipment selectByLongitudeAndLatitude(
			@Param("d")Double d,
			@Param("e")Double e, 
			@Param("f")Double f,
			@Param("g")Double g);

	List<Monitoring> pointEquipmentList(@Param("pointIds")List<Integer> pointIds);
	
	
}