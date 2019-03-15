package com.py.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Aisle;

public interface AisleMapper {
    int deleteByPrimaryKey(Integer aisleId);

    int insert(Aisle record);

    int insertSelective(Aisle record);

    Aisle selectByPrimaryKey(Integer aisleId);

    int updateByPrimaryKeySelective(Aisle record);

    int updateByPrimaryKey(Aisle record);

	List<Aisle> selectAisleByAisleInventory(Aisle aisle);

	List<Aisle> getMerchandiseByEquipmentNumber(@Param("equipment_id")Integer equipment_id,
			@Param("classify_id")Integer classify_id);

	List<Aisle> selectAisleAndMerchandiseByExample(Aisle aisle);

	int insertSelectiveByAisle(List<Aisle> list);

	
	List<Aisle> selectByExample(Aisle aisle);

	int deleteByEquipmentId(Integer equipmentId);

	List<Aisle> selectByEquipmentId(@Param("equipmentId")Integer equipmentId);
	
	//
	List<Map<String,Object>>selectAisleIdByEquipmentId(Integer equipmentId);
	
	int deleteAisleInventory(@Param("aisleIds")String[] aisleIds);
	//多个设备删除时删除货道信息
	int deleteAisleByEquipmentIds(@Param("equipmentIds")String[] equipmentIds);
	//根据多个设备的id查出对应的货道id
	List<Map<String,Object>>selectAisleIdsByEquipmentIds(@Param("equipmentIds")String[] equipmentIds);
}