package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.MonthCardBuy;
import com.py.bean.MonthCardRecord;
import com.py.bean.UserMonthCard;
import com.py.dao.MonthCardBuyMapper;

@Service
public class MonthCardBuyService {

	@Autowired
	MonthCardBuyMapper monthCardBuyMapper;
	
	public int deleteByPrimaryKey(Integer monthCardBuyId) {
		return monthCardBuyMapper.deleteByPrimaryKey(monthCardBuyId);
	}

	public int insert(MonthCardBuy record) {
		return monthCardBuyMapper.insert(record);
	}

	public int insertSelective(MonthCardBuy record) {
		return monthCardBuyMapper.insertSelective(record);
	}

	public MonthCardBuy selectByPrimaryKey(Integer monthCardBuyId) {
		return monthCardBuyMapper.selectByPrimaryKey(monthCardBuyId);
	}

	public int updateByPrimaryKeySelective(MonthCardBuy record) {
		return monthCardBuyMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(MonthCardBuy record) {
		return monthCardBuyMapper.updateByPrimaryKey(record);
	}

	public MonthCardBuy selectByPrimary(MonthCardBuy monthCardBuy) {
		return monthCardBuyMapper.selectByPrimary(monthCardBuy);
	}

	public List<MonthCardBuy> selectByExample(MonthCardBuy monthCardBuy) {
		return monthCardBuyMapper.selectByExample(monthCardBuy);
	}

	public MonthCardBuy selectByPrimaryTop1(MonthCardBuy monthCardBuy) {
		return monthCardBuyMapper.selectByPrimaryTop1(monthCardBuy);
	}

	public List<MonthCardRecord> selectByExampleRecord(MonthCardBuy monthCardBuy) {
		return monthCardBuyMapper.selectByExampleRecord(monthCardBuy);
	}

	public int selectById(Integer id) {
		return monthCardBuyMapper.selectById(id);
	}

	public List<UserMonthCard> getUserMonthCard(Integer userId) {
		return monthCardBuyMapper.getUserMonthCard(userId);
	}

}
