package com.py.dao;

import java.util.List;

import com.py.bean.Sideboard;

public interface SideboardMapper {
    int deleteByPrimaryKey(Integer sideboardId);

    int insert(Sideboard record);

    int insertSelective(Sideboard record);

    Sideboard selectByPrimaryKey(Integer sideboardId);

    int updateByPrimaryKeySelective(Sideboard record);

    int updateByPrimaryKey(Sideboard record);

    Sideboard selectByPrimary(Sideboard sideboard);
    
	List<Sideboard> selectByExample(Sideboard sideboard);

	List<Sideboard> findSideboard(Sideboard sideboard);
}