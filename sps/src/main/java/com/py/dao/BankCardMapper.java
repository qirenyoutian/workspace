package com.py.dao;

import java.util.List;

import com.py.bean.BankCard;

public interface BankCardMapper {
    int deleteByPrimaryKey(Integer bankCardId);

    int insert(BankCard record);

    int insertSelective(BankCard record);

    BankCard selectByPrimary(BankCard record);
    
    List<BankCard> selectByExample(BankCard record);

    int updateByPrimaryKeySelective(BankCard record);

    int updateByPrimaryKey(BankCard record);
}