package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.AdminGrouping;
import com.py.dao.AdminGroupingMapper;

@Service
public class AdminGroupingService {
	@Autowired
	AdminGroupingMapper adminGroupingMapper;
	
	public int deleteByPrimaryKey(Integer adminGroupingId) {
		return adminGroupingMapper.deleteByPrimaryKey(adminGroupingId);
	}

	public int insert(AdminGrouping record) {
		return adminGroupingMapper.insert(record);
	}

	public int insertSelective(AdminGrouping record) {
		return adminGroupingMapper.insertSelective(record);
	}

	public AdminGrouping selectByPrimary(AdminGrouping record) {
		return adminGroupingMapper.selectByPrimary(record);
	}
    
	public List<AdminGrouping> selectByExample(AdminGrouping record) {
		return adminGroupingMapper.selectByExample(record);
	}
    
	public int updateByPrimaryKeySelective(AdminGrouping record) {
		return adminGroupingMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(AdminGrouping record) {
		return adminGroupingMapper.updateByPrimaryKey(record);
	}
}
