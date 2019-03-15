package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Clockin;
import com.py.dao.ClockinMapper;

@Service
public class ClockinService {
	
	@Autowired
	ClockinMapper clockinmapper;

	public int deleteByPrimaryKey(Integer clockinId) {
		return clockinmapper.deleteByPrimaryKey(clockinId);
	}

	public int insert(Clockin record) {
		return clockinmapper.insert(record);
	}

	public int insertSelective(Clockin record) {
		return clockinmapper.insertSelective(record);
	}

	public Clockin selectByPrimaryKey(Integer clockinId) {
		return clockinmapper.selectByPrimaryKey(clockinId);
	}

	public int updateByPrimaryKeySelective(Clockin record) {
		return clockinmapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Clockin record) {
		return clockinmapper.updateByPrimaryKey(record);
	}

	public List<Clockin> selectByExample(Clockin clockin) {
		return clockinmapper.selectByExample(clockin);
	}


	public Clockin findToDay(Clockin clockin) {
		return clockinmapper.findToDay(clockin);
	}

	public List<Clockin> findByClockinTime(String clockinAdminId, String clockinTime) {
		return clockinmapper.findByClockinTime(clockinAdminId,clockinTime);
	}

	

}
