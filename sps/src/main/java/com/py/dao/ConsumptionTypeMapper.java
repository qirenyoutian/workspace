package com.py.dao;

import java.util.List;

import com.py.bean.ConsumptionType;

public interface ConsumptionTypeMapper {
    int deleteByPrimaryKey(Integer consumptionTypeId);

    int insert(ConsumptionType record);

    int insertSelective(ConsumptionType record);

    ConsumptionType selectByPrimary(ConsumptionType record);
    
    List<ConsumptionType> selectByExample(ConsumptionType record);

    int updateByPrimaryKeySelective(ConsumptionType record);

    int updateByPrimaryKey(ConsumptionType record);
}