package com.py.dao;

import java.util.List;

import com.py.bean.RoleMenu;

public interface RoleMenuMapper {
    int deleteByPrimaryKey(Integer roleMenuId);

    int insert(RoleMenu record);

    int insertSelective(RoleMenu record);

    RoleMenu selectByPrimaryKey(Integer roleMenuId);

    int updateByPrimaryKeySelective(RoleMenu record);

    int updateByPrimaryKey(RoleMenu record);

	List<RoleMenu> selectByRoleId(Integer roleId);

	int deleteByRoleId(RoleMenu rm);

	RoleMenu selectByExample(RoleMenu rm);
}