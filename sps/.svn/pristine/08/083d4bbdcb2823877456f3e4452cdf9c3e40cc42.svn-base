package com.py.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.TimeQuantum;
import com.py.dao.TimeQuantumMapper;

@Service
public class TimeQuantumService {
	
	@Autowired
	TimeQuantumMapper timeQuantumMapper;
	
	public int deleteByPrimaryKey(Integer timeQuantumId) {
		return timeQuantumMapper.deleteByPrimaryKey(timeQuantumId);
	}

	public int insert(TimeQuantum record) {
		return timeQuantumMapper.insert(record);
	}

	public int insertSelective(TimeQuantum record) {
		return timeQuantumMapper.insertSelective(record);
	}

	public TimeQuantum selectByPrimaryKey(Integer timeQuantumId) {
		return timeQuantumMapper.selectByPrimaryKey(timeQuantumId);
	}

	public int updateByPrimaryKeySelective(TimeQuantum record) {
		return timeQuantumMapper.updateByPrimaryKey(record);
	}

	public int updateByPrimaryKey(TimeQuantum record) {
		return timeQuantumMapper.updateByPrimaryKey(record);
	}

}
