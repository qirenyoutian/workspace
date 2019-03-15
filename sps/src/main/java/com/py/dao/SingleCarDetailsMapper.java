package com.py.dao;

import com.py.bean.SingleCarDetails;

public interface SingleCarDetailsMapper {
    int deleteByPrimaryKey(Integer singleCarDetailsId);

    int insert(SingleCarDetails record);

    int insertSelective(SingleCarDetails record);

    SingleCarDetails selectByPrimaryKey(Integer singleCarDetailsId);

    int updateByPrimaryKeySelective(SingleCarDetails record);

    int updateByPrimaryKey(SingleCarDetails record);
}