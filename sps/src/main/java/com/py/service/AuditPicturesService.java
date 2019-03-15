package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.AdminPhotoAudit;
import com.py.bean.AuditPictures;
import com.py.dao.AuditPicturesMapper;

@Service
public class AuditPicturesService {

	@Autowired
	AuditPicturesMapper auditPicturesMapper;
	
	public int deleteByPrimaryKey(Integer auditPicturesId) {
		return auditPicturesMapper.deleteByPrimaryKey(auditPicturesId);
	}

	public int insert(AuditPictures record) {
		return auditPicturesMapper.insert(record);
	}

	public int insertSelective(AuditPictures record) {
		return auditPicturesMapper.insertSelective(record);
	}

	public AuditPictures selectByPrimaryKey(Integer auditPicturesId) {
		return auditPicturesMapper.selectByPrimaryKey(auditPicturesId);
	}

	public int updateByPrimaryKeySelective(AuditPictures record) {
		return auditPicturesMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(AuditPictures record) {
		return auditPicturesMapper.updateByPrimaryKey(record);
	}

	public List<AdminPhotoAudit> selectBySampleWithAdmin(AdminPhotoAudit adminPhotoAudit) {
		// TODO Auto-generated method stub
		return auditPicturesMapper.selectBySampleWithAdmin(adminPhotoAudit);
	}

	public List<AdminPhotoAudit> selectById(Integer auditId) {
		// TODO Auto-generated method stub
		return auditPicturesMapper.selectById(auditId);
	}

	public int updateForStatusById(Integer id, Integer adminPhotoAuditResult) {
		// TODO Auto-generated method stub
		return auditPicturesMapper.updateForStatusById(id,adminPhotoAuditResult);
	}

	public List<AdminPhotoAudit> selectAuditByTime(String startTime, String endTime) {
		// TODO Auto-generated method stub
		return auditPicturesMapper.selectAuditByTime(startTime,endTime);
		
	}

	public List<AdminPhotoAudit> selectByStatus(Integer status) {
		// TODO Auto-generated method stub
		return auditPicturesMapper.selectByStatus(status);
	}

	public List<AdminPhotoAudit> selectByRealName(String realname) {
		// TODO Auto-generated method stub
		return auditPicturesMapper.selectByRealName(realname);
	}

}
