package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Grouping;
import com.py.dao.GroupingMapper;

@Service
public class GroupingService {
	@Autowired
	GroupingMapper groupingMapper;
	public int deleteByPrimaryKey(Integer groupingId) {
		return groupingMapper.deleteByPrimaryKey(groupingId);
	}

	public int insert(Grouping record) {
		return groupingMapper.insert(record);
	}

	public int insertSelective(Grouping record) {
		return groupingMapper.insertSelective(record);
	}

	public Grouping selectByPrimary(Grouping record) {
		return groupingMapper.selectByPrimary(record);
	}
    
	public List<Grouping> selectByExample(Grouping record) {
		return groupingMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(Grouping record) {
		return groupingMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Grouping record) {
		return groupingMapper.updateByPrimaryKey(record);
	}
}
