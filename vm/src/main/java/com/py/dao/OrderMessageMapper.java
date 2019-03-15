package com.py.dao;

import com.py.bean.OrderMessage;

public interface OrderMessageMapper {
    int deleteByPrimaryKey(Integer orderMessageId);

    int insert(OrderMessage record);

    int insertSelective(OrderMessage record);

    OrderMessage selectByPrimaryKey(Integer orderMessageId);

    int updateByPrimaryKeySelective(OrderMessage record);

    int updateByPrimaryKey(OrderMessage record);
}