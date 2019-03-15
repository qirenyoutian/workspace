package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.UserInformationAudit;
import com.py.dao.UserInformationAuditMapper;

@Service
public class UserInformationAuditService {
	@Autowired
	UserInformationAuditMapper userInformationAuditMapper;
	public int deleteByPrimaryKey(Integer userInformationAuditId) {
		return userInformationAuditMapper.deleteByPrimaryKey(userInformationAuditId);
	}

	public int insert(UserInformationAudit record) {
		return userInformationAuditMapper.insert(record);
	}

	public int insertSelective(UserInformationAudit record) {
		return userInformationAuditMapper.insertSelective(record);
	}

	public UserInformationAudit selectByPrimary(UserInformationAudit record) {
		return userInformationAuditMapper.selectByPrimary(record);
	}
    
	public List<UserInformationAudit> selectByExample(UserInformationAudit record) {
		return userInformationAuditMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(UserInformationAudit record) {
		return userInformationAuditMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(UserInformationAudit record) {
		return userInformationAuditMapper.updateByPrimaryKey(record);
	}

	public UserInformationAudit selectByPrimaryTop1(UserInformationAudit userInformationAudit) {
		return userInformationAuditMapper.selectByPrimaryTop1(userInformationAudit);
	}
}
