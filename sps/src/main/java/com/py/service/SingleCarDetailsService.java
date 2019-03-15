package com.py.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.SingleCarDetails;
import com.py.dao.SingleCarDetailsMapper;

@Service
public class SingleCarDetailsService {
	
	@Autowired
	SingleCarDetailsMapper singleCarDetailsMapper;

	public int deleteByPrimaryKey(Integer id) {
		return singleCarDetailsMapper.deleteByPrimaryKey(id);
	}

	public int insert(SingleCarDetails record) {
		return singleCarDetailsMapper.insert(record);
	}

	public int insertSelective(SingleCarDetails record) {
		return singleCarDetailsMapper.insertSelective(record);
	}

	public SingleCarDetails selectByPrimaryKey(Integer id) {
		return singleCarDetailsMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(SingleCarDetails record) {
		return singleCarDetailsMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(SingleCarDetails record) {
		return singleCarDetailsMapper.updateByPrimaryKey(record);
	}

}
