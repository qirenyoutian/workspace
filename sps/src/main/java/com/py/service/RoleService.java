package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Role;
import com.py.dao.RoleMapper;

@Service
public class RoleService {
	@Autowired
	RoleMapper roleMapper;
	public int deleteByPrimaryKey(Integer roleId) {
		return roleMapper.deleteByPrimaryKey(roleId);
	}

	public int insert(Role record) {
		return roleMapper.insert(record);
	}

	public int insertSelective(Role record) {
		return roleMapper.insertSelective(record);
	}

	public Role selectByPrimary(Role record) {
		return roleMapper.selectByPrimary(record);
	}
    
	public List<Role> selectByExample(Role record) {
		return roleMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(Role record) {
		return roleMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Role record) {
		return roleMapper.updateByPrimaryKey(record);
	}
}
