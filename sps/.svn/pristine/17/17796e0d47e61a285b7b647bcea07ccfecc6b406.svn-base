package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.TruckSpace;
import com.py.dao.TruckSpaceMapper;

@Service
public class TruckSpaceService {
	@Autowired
	TruckSpaceMapper truckSpaceMapper;

	public int deleteByPrimaryKey(Integer truckSpaceId) {
		return truckSpaceMapper.deleteByPrimaryKey(truckSpaceId);
	}

	public int insert(TruckSpace record) {
		return truckSpaceMapper.insert(record);
	}

	public int insertSelective(TruckSpace record) {
		return truckSpaceMapper.insertSelective(record);
	}

	public TruckSpace selectByPrimaryKey(Integer truckSpaceId) {
		return truckSpaceMapper.selectByPrimaryKey(truckSpaceId);
	}

	public int updateByPrimaryKeySelective(TruckSpace record) {
		return truckSpaceMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(TruckSpace record) {
		return truckSpaceMapper.updateByPrimaryKey(record);
	}

	public TruckSpace selectByPrimary(TruckSpace truckSpace) {
		return truckSpaceMapper.selectByPrimary(truckSpace);
	}

	public List<TruckSpace> selectByExample(TruckSpace truckSpace) {
		return truckSpaceMapper.selectByExample(truckSpace);
	}
	
}
