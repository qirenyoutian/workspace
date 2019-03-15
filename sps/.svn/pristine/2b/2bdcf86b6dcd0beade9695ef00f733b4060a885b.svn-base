package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.RoleMenu;
import com.py.dao.RoleMenuMapper;

@Service
public class RoleMenuService {
	@Autowired
	RoleMenuMapper roleMenuMapper;
	public int deleteByPrimaryKey(Integer roleMenuId) {
		return roleMenuMapper.deleteByPrimaryKey(roleMenuId);
	}

	public int insert(RoleMenu record) {
		return roleMenuMapper.insert(record);
	}

	public int insertSelective(RoleMenu record) {
		return roleMenuMapper.insertSelective(record);
	}

	public RoleMenu selectByPrimary(RoleMenu record) {
		return roleMenuMapper.selectByPrimary(record);
	}
    
	public List<RoleMenu> selectByExample(RoleMenu record) {
		return roleMenuMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(RoleMenu record) {
		return roleMenuMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(RoleMenu record) {
		return roleMenuMapper.updateByPrimaryKey(record);
	}
}
