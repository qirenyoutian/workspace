package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.TradingRecord;
import com.py.dao.TradingRecordMapper;

@Service
public class TradingRecordService {
	
	@Autowired
	TradingRecordMapper tradingRecordMapper;
	
	public int deleteByPrimaryKey(Integer tradingRecordId) {
		return tradingRecordMapper.deleteByPrimaryKey(tradingRecordId);
	}

	public int insert(TradingRecord record) {
		return tradingRecordMapper.insert(record);
	}

	public int insertSelective(TradingRecord record) {
		return tradingRecordMapper.insertSelective(record);
	}

	public TradingRecord selectByPrimaryKey(Integer tradingRecordId) {
		return tradingRecordMapper.selectByPrimaryKey(tradingRecordId);
	}

	public int updateByPrimaryKeySelective(TradingRecord record) {
		return tradingRecordMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(TradingRecord record) {
		return tradingRecordMapper.updateByPrimaryKey(record);
	}
	
	public List<TradingRecord> selectByExample(TradingRecord record){
		return tradingRecordMapper.selectByExample(record);
	}	
	

}
