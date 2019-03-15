package com.py.dao;

import java.util.List;

import com.py.bean.RoleMenu;

public interface RoleMenuMapper {
    int deleteByPrimaryKey(Integer roleMenuId);

    int insert(RoleMenu record);

    int insertSelective(RoleMenu record);

    RoleMenu selectByPrimary(RoleMenu record);
    
    List<RoleMenu> selectByExample(RoleMenu record);

    int updateByPrimaryKeySelective(RoleMenu record);

    int updateByPrimaryKey(RoleMenu record);
}