package com.py.dao;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Area;

public interface AreaMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Area record);

    int insertSelective(Area record);

    Area selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Area record);

    int updateByPrimaryKey(Area record);

	Area selectByPrimary(Area area);

	Area selectByParent(@Param("parent")Integer parent, @Param("name")String name);
}