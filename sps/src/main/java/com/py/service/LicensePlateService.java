package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.LicensePlate;
import com.py.dao.LicensePlateMapper;

@Service
public class LicensePlateService {
	@Autowired
	LicensePlateMapper licensePlateMapper;
	public int deleteByPrimaryKey(Integer licensePlateId) {
		return licensePlateMapper.deleteByPrimaryKey(licensePlateId);
	}

	public int insert(LicensePlate record) {
		return licensePlateMapper.insert(record);
	}

	public int insertSelective(LicensePlate record) {
		return licensePlateMapper.insertSelective(record);
	}

	public LicensePlate selectByPrimary(LicensePlate record) {
		return licensePlateMapper.selectByPrimary(record);
	}
    
	public List<LicensePlate> selectByExample(LicensePlate record) {
		return licensePlateMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(LicensePlate record) {
		return licensePlateMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(LicensePlate record) {
		return licensePlateMapper.updateByPrimaryKey(record);
	}
}
