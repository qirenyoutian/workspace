package com.py.dao;

import java.util.List;

import com.py.bean.PavePlan;

public interface PavePlanMapper {
    int deleteByPrimaryKey(Integer pavePlanId);

    int insert(PavePlan record);

    int insertSelective(PavePlan record);

    PavePlan selectByPrimaryKey(Integer pavePlanId);

    int updateByPrimaryKeySelective(PavePlan record);

    int updateByPrimaryKey(PavePlan record);

	List<PavePlan> selectByExample(PavePlan pavePlan);

	List<PavePlan> selectVariousByExample(PavePlan pavePlan);
}