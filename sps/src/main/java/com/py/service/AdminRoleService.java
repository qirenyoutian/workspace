package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.AdminRole;
import com.py.dao.AdminRoleMapper;

@Service
public class AdminRoleService {
	@Autowired
	AdminRoleMapper adminRoleMapper;
	public int deleteByPrimaryKey(Integer adminRoleId) {
		return adminRoleMapper.deleteByPrimaryKey(adminRoleId);
	}

	public int insert(AdminRole record) {
		return adminRoleMapper.insert(record);
	}

	public int insertSelective(AdminRole record) {
		return adminRoleMapper.insertSelective(record);
	}

	public AdminRole selectByPrimary(AdminRole record) {
		return adminRoleMapper.selectByPrimary(record);
	}
    
	public List<AdminRole> selectByExample(AdminRole record) {
		return adminRoleMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(AdminRole record) {
		return adminRoleMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(AdminRole record) {
		return adminRoleMapper.updateByPrimaryKey(record);
	}
}
