package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Area;
import com.py.bean.BigWarehouse;
import com.py.bean.BigWarehouseInventory;
import com.py.bean.Sideboard;
import com.py.dao.AreaMapper;
import com.py.dao.BigWarehouseInventoryMapper;
import com.py.dao.BigWarehouseMapper;
import com.py.dao.SideboardMapper;
import com.py.util.Msg;

@Service
public class InventoryService {
	@Autowired
	SideboardMapper sideboardMapper;
	@Autowired
	BigWarehouseMapper bigWarehouseMapper;
	@Autowired
	BigWarehouseInventoryMapper bInventoryMapper;
	@Autowired
	AreaMapper areaMapper;
	
	
	
	/***************************************** 边柜库存 *****************************************/
	
	/**
	 * 根据设备Id查找边柜库存
	 * @param equipmentId
	 * @return
	 */
	public List<Sideboard> selectByEquipment(Integer equipmentId) {
		
		Sideboard sideboard = new Sideboard();
		sideboard.setSideboardEquipmentId(equipmentId);
		
		
		return sideboardMapper.findSideboard(sideboard);
	}

	/**
	 * 根据 Selective 插入
	 * @param sideboard
	 * @return
	 */
	public int insertBySideborad(Sideboard sideboard) {
		
		
		return sideboardMapper.insertSelective(sideboard);
	}

	
	
	
	/****************************************************** 大仓库存 ************************************************************/
	
	
	
	public List<BigWarehouse> selectByExample(BigWarehouse bigWarehouse) {
		
		List<BigWarehouse> b = bigWarehouseMapper.selectByExample(bigWarehouse);
		for (BigWarehouse bw : b) {
			List<Area> areas = bw.getAreas();
			
			
			areas.add(areaMapper.selectByPrimaryKey(bw.getBigWarehouseProvince()));
			areas.add(areaMapper.selectByPrimaryKey(bw.getBigWarehouseCity()));
			areas.add(areaMapper.selectByPrimaryKey(bw.getBigWarehouseDistrict()));
			
		}
		
		
		return b;
	}
	
	/**
	 * 保存大仓
	 * @param bigWarehouse
	 */
	
	public int saveBigWarewHouse(BigWarehouse bigWarehouse) {
		
		
		
		return bigWarehouseMapper.insertSelective(bigWarehouse);
	}
	
	/**
	 * 修改大仓
	 * @param bigWarehouse
	 * @return
	 */
	
	public int editBigWarewHouse(BigWarehouse bigWarehouse) {
		
		
		return bigWarehouseMapper.updateByPrimaryKeySelective(bigWarehouse);
	}
	/**
	 * 根据id查找大仓信息
	 * @param bigWarehouse
	 * @return
	 */
	public List<BigWarehouse> selectBigWareHouseByPrimary(BigWarehouse bigWarehouse) {
		List<BigWarehouse> b = bigWarehouseMapper.selectByExample(bigWarehouse);
		for (BigWarehouse bw : b) {
			List<Area> areas = bw.getAreas();
			
			
			areas.add(areaMapper.selectByPrimaryKey(bw.getBigWarehouseProvince()));
			areas.add(areaMapper.selectByPrimaryKey(bw.getBigWarehouseCity()));
			areas.add(areaMapper.selectByPrimaryKey(bw.getBigWarehouseDistrict()));
			
		}
		
		
		return  b;
	}
	
	public int deleteById(Integer sideboardId) {
		
		return sideboardMapper.deleteByPrimaryKey(sideboardId);
	}
	
	
	
	

	
	
	/****************************************************** 大仓库存 ************************************************************/
	
	
	public List<BigWarehouseInventory> selectBigWareInventoryByPrimary(BigWarehouseInventory bInventory) {
		return bInventoryMapper.selectByExample(bInventory);
	}

	public int saveBigwareInventory(BigWarehouseInventory bInventory) {
		return bInventoryMapper.insertSelective(bInventory);
	}

	public int deleteInventory(Integer inventoryId) {
		
		
		return bInventoryMapper.deleteByPrimaryKey(inventoryId);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
