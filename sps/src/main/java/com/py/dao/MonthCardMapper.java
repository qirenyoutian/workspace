package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.MonthCard;
import com.py.bean.MonthCardRecord;

public interface MonthCardMapper {
    int deleteByPrimaryKey(Integer monthCardId);

    int insert(MonthCard record);

    int insertSelective(MonthCard record);

    MonthCard selectByPrimaryKey(Integer monthCardId);

    int updateByPrimaryKeySelective(MonthCard record);

    int updateByPrimaryKey(MonthCard record);

	MonthCard selectByPrimary(MonthCard monthCard);

	List<MonthCard> selectByExample(MonthCard monthCard);

	List<MonthCardRecord> selectByExampleRecord(MonthCard monthCard);

	MonthCardRecord selectByPrimaryRecord(MonthCardRecord monthCardRecord);

	List<MonthCardRecord> selectmonthCardRoute();

	int updateStatusById(@Param("id")Integer id, @Param("status")Integer status);
}