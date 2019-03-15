package com.py.dao;

import java.util.List;

import com.py.bean.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

	List<Role> selectByExample(Role role);

	Role selectByPrimary(Role role);

	int deleteByArray(String[] aa);
}