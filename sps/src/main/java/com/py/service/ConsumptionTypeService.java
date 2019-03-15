package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.ConsumptionType;
import com.py.dao.ConsumptionTypeMapper;

@Service
public class ConsumptionTypeService {
	@Autowired
	ConsumptionTypeMapper consumptionTypeMapper;
	public int deleteByPrimaryKey(Integer consumptionTypeId) {
		return consumptionTypeMapper.deleteByPrimaryKey(consumptionTypeId);
	}

	public int insert(ConsumptionType record) {
		return consumptionTypeMapper.insert(record);
	}

	public int insertSelective(ConsumptionType record) {
		return consumptionTypeMapper.insertSelective(record);
	}

	public ConsumptionType selectByPrimary(ConsumptionType record) {
		return consumptionTypeMapper.selectByPrimary(record);
	}
    
	public List<ConsumptionType> selectByExample(ConsumptionType record) {
		return consumptionTypeMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(ConsumptionType record) {
		return consumptionTypeMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(ConsumptionType record) {
		return consumptionTypeMapper.updateByPrimaryKey(record);
	}
}
