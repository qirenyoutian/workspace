package com.py.service;

import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Aisle;
import com.py.bean.AisleInventory;
import com.py.dao.AisleInventoryMapper;
import com.py.dao.AisleMapper;
import com.py.dao.ChannelMerchandiseMapper;
import com.py.dao.MerchandiseMapper;

@Service
public class AisleService {
	
	@Autowired
	AisleMapper aisleMapper;//货道
	@Autowired
	MerchandiseMapper merchandiseMapper;//商品
	@Autowired
	AisleInventoryMapper aisleInventoryMapper;//货道库存
	@Autowired
	ChannelMerchandiseMapper channelMerchandiseMapper;//渠道商品
	
	
	
	public int deleteByPrimaryKey(Integer aisleId) {
		return aisleMapper.deleteByPrimaryKey(aisleId);
	}

	public int insert(Aisle record) {
		return aisleMapper.insert(record);
	}

	public int insertSelective(Aisle record) {
		return aisleMapper.insertSelective(record);
	}

	public Aisle selectByPrimaryKey(Integer aisleId) {
		return aisleMapper.selectByPrimaryKey(aisleId);
	}

	public int updateByPrimaryKeySelective(Aisle record) {
		return aisleMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Aisle record) {
		return aisleMapper.updateByPrimaryKey(record);
	}

	public List<Aisle> selectAisleByAisleInventory(Aisle aisle) {
		return aisleMapper.selectAisleByAisleInventory(aisle);
	}

	public List<Aisle> selectAisleAndMerchandiseByExample(Aisle aisle) {
		return aisleMapper.selectAisleAndMerchandiseByExample(aisle);
	}
	/*
	 * 编辑货道信息
	 */
	public int updateAisle(Integer aisleId,String aisleNumber,Integer merchandiseNum, Integer aisleInventory, Integer channelMerchandiseId) {
		

		AisleInventory aisleinventory = new AisleInventory();
		aisleinventory.setAisleInventoryAisleId(aisleId);
		AisleInventory aislein = aisleInventoryMapper.selectByExample(aisleinventory);
		
		if (aislein == null) {// == null就是插入数据
			
			aisleinventory.setAisleInventoryMerchandiseId(merchandiseNum);
			aisleinventory.setAisleInventoryCount(aisleInventory);
			aisleinventory.setAisleInventoryChannelMerchandiseId(channelMerchandiseId);
			aisleinventory.setAisleInventoryUpdateTime(new Date());
			aisleinventory.setAisleInventoryCreateTime(new Date());
			int a = aisleInventoryMapper.insertSelective(aisleinventory);
			if (a == 1) {
					Aisle aisle = aisleMapper.selectByPrimaryKey(aisleId);
					aisle.setAisleNumber(aisleNumber);
					a = aisleMapper.updateByPrimaryKeySelective(aisle);
					return a;
				}else{
					return -1;
				}
			
		} else {	//否则就是更新数据
			
			aislein.setAisleInventoryMerchandiseId(merchandiseNum);
			aislein.setAisleInventoryCount(aisleInventory);
			aisleinventory.setAisleInventoryChannelMerchandiseId(channelMerchandiseId);
			aislein.setAisleInventoryUpdateTime(new Date());
			int a = aisleInventoryMapper.updateByAisleIdSelective(aislein);
			
			if (a == 1) {
				Aisle aisle = aisleMapper.selectByPrimaryKey(aisleId);
				aisle.setAisleNumber(aisleNumber);
				a = aisleMapper.updateByPrimaryKeySelective(aisle);
				return a;
			}else{
				return -1;
			}
			
		}
	}
	
	/**
	 * 锁定货道
	 * @param aisleId
	 * @return
	 */
	
	public int lockAisle(String aisleId,Integer status) {
		if (status == 0) {
			
			Aisle aisle = aisleMapper.selectByPrimaryKey(Integer.parseInt(aisleId));
			aisle.setAisleStatus(1);
			return aisleMapper.updateByPrimaryKeySelective(aisle);
		}else{
			Aisle aisle = aisleMapper.selectByPrimaryKey(Integer.parseInt(aisleId));
			aisle.setAisleStatus(0);
			return aisleMapper.updateByPrimaryKeySelective(aisle);
		}
	}
	//根据设备id查询货道
	public List<Aisle> selectByEquipmentId(Integer equipmentId) {
		return aisleMapper.selectByEquipmentId(equipmentId);
	}

}
