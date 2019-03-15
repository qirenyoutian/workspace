package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.AdminPhotoAudit;
import com.py.bean.AuditPictures;
import com.py.dao.AdminPhotoAuditMapper;

@Service
public class AdminPhotoAuditService {
	@Autowired
	AdminPhotoAuditMapper adminPhotoAuditMapper;
	public int deleteByPrimaryKey(Integer adminPhotoAuditId) {
		return adminPhotoAuditMapper.deleteByPrimaryKey(adminPhotoAuditId);
	}

	public int insert(AdminPhotoAudit record) {
		return adminPhotoAuditMapper.insert(record);
	}

	public int insertSelective(AdminPhotoAudit record) {
		return adminPhotoAuditMapper.insertSelective(record);
	}

	public AdminPhotoAudit selectByPrimary(AdminPhotoAudit record) {
		return adminPhotoAuditMapper.selectByPrimary(record);
	}
    
	public List<AdminPhotoAudit> selectByExample(AuditPictures auditPictures) {
		return adminPhotoAuditMapper.selectByExample(auditPictures);
	}

	public int updateByPrimaryKeySelective(AdminPhotoAudit record) {
		return adminPhotoAuditMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(AdminPhotoAudit record) {
		return adminPhotoAuditMapper.updateByPrimaryKey(record);
	}

}
