package com.py.dao;

import java.util.List;

import com.py.bean.Banner;
import com.py.bean.Equipment;

public interface BannerMapper {
    int deleteByPrimaryKey(Integer bannerId);

    int insert(Banner record);

    int insertSelective(Banner record);

    Banner selectByPrimaryKey(Integer bannerId);

    int updateByPrimaryKeySelective(Banner record);

    int updateByPrimaryKey(Banner record);

	List<Banner> selectBannerAll(Equipment equipment);
}