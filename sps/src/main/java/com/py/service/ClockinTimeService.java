package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.ClockinTime;
import com.py.dao.ClockinTimeMapper;

@Service
public class ClockinTimeService {
	
	@Autowired
	ClockinTimeMapper ctp;
	
	public int deleteByPrimaryKey(Integer clockinTimeId) {
		// TODO Auto-generated method stub
		return ctp.deleteByPrimaryKey(clockinTimeId);
	}

	public int insert(ClockinTime record) {
		// TODO Auto-generated method stub
		return ctp.insert(record);
	}

	public int insertSelective(ClockinTime record) {
		// TODO Auto-generated method stub
		return ctp.insertSelective(record);
	}

	public ClockinTime selectByPrimaryKey(Integer clockinTimeId) {
		// TODO Auto-generated method stub
		return ctp.selectByPrimaryKey(clockinTimeId);
	}

	public int updateByPrimaryKeySelective(ClockinTime record) {
		// TODO Auto-generated method stub
		return ctp.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(ClockinTime record) {
		// TODO Auto-generated method stub
		return ctp.updateByPrimaryKey(record);
	}

	public List<ClockinTime> selectAllTime() {
		// TODO Auto-generated method stub
		return ctp.selectAllTime();
	}

}
