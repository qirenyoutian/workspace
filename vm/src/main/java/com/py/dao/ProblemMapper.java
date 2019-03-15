package com.py.dao;

import com.py.bean.Problem;

public interface ProblemMapper {
    int deleteByPrimaryKey(Integer problemId);

    int insert(Problem record);

    int insertSelective(Problem record);

    Problem selectByPrimaryKey(Integer problemId);

    int updateByPrimaryKeySelective(Problem record);

    int updateByPrimaryKey(Problem record);
}