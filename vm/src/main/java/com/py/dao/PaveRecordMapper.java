package com.py.dao;

import java.util.List;

import com.py.bean.PaveRecord;

public interface PaveRecordMapper {
    int deleteByPrimaryKey(Integer paveRecordId);

    int insert(PaveRecord record);

    int insertSelective(PaveRecord record);

    PaveRecord selectByPrimaryKey(Integer paveRecordId);

    int updateByPrimaryKeySelective(PaveRecord record);

    int updateByPrimaryKey(PaveRecord record);

	List<PaveRecord> selectByExample(PaveRecord paveRecord);

	List<PaveRecord> selectVariousByExample(PaveRecord paveRecord);

}