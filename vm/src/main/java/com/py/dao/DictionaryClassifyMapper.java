package com.py.dao;

import java.util.List;

import com.py.bean.DictionaryClassify;

public interface DictionaryClassifyMapper {
    int deleteByPrimaryKey(Integer dictionaryClassifyId);

    int insert(DictionaryClassify record);

    int insertSelective(DictionaryClassify record);

    DictionaryClassify selectByPrimaryKey(Integer dictionaryClassifyId);

    int updateByPrimaryKeySelective(DictionaryClassify record);

    int updateByPrimaryKey(DictionaryClassify record);
    
    List<DictionaryClassify> selectByExample(DictionaryClassify dictionaryClassify);
    
    
}