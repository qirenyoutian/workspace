package com.py.dao;

import java.util.List;

import com.py.bean.PaveRecordDetail;

public interface PaveRecordDetailMapper {
    int deleteByPrimaryKey(Integer paveRecordDetailId);

    int insert(PaveRecordDetail record);

    int insertSelective(PaveRecordDetail record);

    PaveRecordDetail selectByPrimaryKey(Integer paveRecordDetailId);

    int updateByPrimaryKeySelective(PaveRecordDetail record);

    int updateByPrimaryKey(PaveRecordDetail record);

	List<PaveRecordDetail> selectVariousByExample(PaveRecordDetail paveRecordDetail);
}