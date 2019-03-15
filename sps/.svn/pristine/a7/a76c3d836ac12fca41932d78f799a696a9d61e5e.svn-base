package com.py.dao;

import java.util.List;

import com.py.bean.TradingRecord;

public interface TradingRecordMapper {
    int deleteByPrimaryKey(Integer tradingRecordId);

    int insert(TradingRecord record);

    int insertSelective(TradingRecord record);

    TradingRecord selectByPrimaryKey(Integer tradingRecordId);

    int updateByPrimaryKeySelective(TradingRecord record);

    int updateByPrimaryKey(TradingRecord record);

	List<TradingRecord> selectByExample(TradingRecord record);
}