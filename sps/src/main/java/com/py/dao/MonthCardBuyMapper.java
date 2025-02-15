package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.MonthCardBuy;
import com.py.bean.MonthCardRecord;
import com.py.bean.UserMonthCard;

public interface MonthCardBuyMapper {
    int deleteByPrimaryKey(Integer monthCardBuyId);

    int insert(MonthCardBuy record);

    int insertSelective(MonthCardBuy record);

    MonthCardBuy selectByPrimaryKey(Integer monthCardBuyId);

    int updateByPrimaryKeySelective(MonthCardBuy record);

    int updateByPrimaryKey(MonthCardBuy record);

	MonthCardBuy selectByPrimary(MonthCardBuy monthCardBuy);

	List<MonthCardBuy> selectByExample(MonthCardBuy monthCardBuy);

	MonthCardBuy selectByPrimaryTop1(MonthCardBuy monthCardBuy);

	List<MonthCardRecord> selectByExampleRecord(MonthCardBuy monthCardBuy);

	int selectById(@Param("monthCardId")Integer id);

	List<UserMonthCard> getUserMonthCard(@Param("userId")Integer userId);
}