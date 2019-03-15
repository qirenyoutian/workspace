package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.MonthCard;
import com.py.bean.MonthCardRecord;
import com.py.dao.MonthCardMapper;

@Service
public class MonthCardService {
	
	@Autowired
	MonthCardMapper monthCardMapper;

	public int deleteByPrimaryKey(Integer monthCardId) {
		return monthCardMapper.deleteByPrimaryKey(monthCardId);
	}

	public int insert(MonthCard record) {
		return monthCardMapper.insert(record);
	}

	public int insertSelective(MonthCard record) {
		return monthCardMapper.insertSelective(record);
	}

	public MonthCard selectByPrimaryKey(Integer monthCardId) {
		return monthCardMapper.selectByPrimaryKey(monthCardId);
	}

	public int updateByPrimaryKeySelective(MonthCard record) {
		return monthCardMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(MonthCard record) {
		return monthCardMapper.updateByPrimaryKey(record);
	}

	public MonthCard selectByPrimary(MonthCard record) {
		return monthCardMapper.selectByPrimary(record);
	}

	public List<MonthCard> selectByExample(MonthCard monthCard) {
		return monthCardMapper.selectByExample(monthCard);
	}

	public List<MonthCardRecord> selectByExampleRecord(MonthCard monthCard) {
		return monthCardMapper.selectByExampleRecord(monthCard);
	}

	public MonthCardRecord selectByPrimaryRecord(MonthCardRecord monthCardRecord) {
		return monthCardMapper.selectByPrimaryRecord(monthCardRecord);
	}

	public List<MonthCardRecord> selectmonthCardRoute() {
		// TODO Auto-generated method stub
		return monthCardMapper.selectmonthCardRoute();
	}

	public int updateStatusById(Integer id, Integer status) {
		// TODO Auto-generated method stub
		return monthCardMapper.updateStatusById(id,status);
	}

}
