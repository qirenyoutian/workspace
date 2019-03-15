package com.py.dao;

import java.util.List;

import com.py.bean.MerchandiseClassify;

public interface MerchandiseClassifyMapper {
    int deleteByPrimaryKey(Integer merchandiseClassifyId);

    int insert(MerchandiseClassify record);

    int insertSelective(MerchandiseClassify record);

    MerchandiseClassify selectByPrimaryKey(Integer merchandiseClassifyId);

    int updateByPrimaryKeySelective(MerchandiseClassify record);

    int updateByPrimaryKey(MerchandiseClassify record);

	List<MerchandiseClassify> selectByExample(MerchandiseClassify classify);

	 MerchandiseClassify selectBySelective(MerchandiseClassify merchandiseClassify);
}