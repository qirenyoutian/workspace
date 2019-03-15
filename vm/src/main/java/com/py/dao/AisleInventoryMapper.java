package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.AisleInventory;

public interface AisleInventoryMapper {
    int deleteByPrimaryKey(Integer aisleInventoryId);

    int insert(AisleInventory record);

    int insertSelective(AisleInventory record);

    AisleInventory selectByPrimaryKey(Integer aisleInventoryId);

    int updateByPrimaryKeySelective(AisleInventory record);

    int updateByPrimaryKey(AisleInventory record);

	AisleInventory selectByExample(AisleInventory aisleinventory);

	int updateByAisleIdSelective(AisleInventory aisleInventory);

	List<AisleInventory> selectByChannelMerchandiseId(@Param("channelMerchandiseId")Integer channelMerchandiseId);

	AisleInventory selectByAisleId(@Param("aisle_id")Integer aisle_id);
}