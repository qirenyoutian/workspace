package com.py.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Light;
import com.py.dao.LightMapper;

@Service
public class LightService {

	@Autowired
	LightMapper lightMapper;
	
	public int deleteByPrimaryKey(Integer lightId) {
		return lightMapper.deleteByPrimaryKey(lightId);
	}

	public int insert(Light record) {
		return lightMapper.insert(record);
	}

	public int insertSelective(Light record) {
		return lightMapper.insertSelective(record);
	}

	public Light selectByPrimaryKey(Integer lightId) {
		return lightMapper.selectByPrimaryKey(lightId);
	}

	public int updateByPrimaryKeySelective(Light record) {
		return lightMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Light record) {
		return lightMapper.updateByPrimaryKey(record);
	}

}
