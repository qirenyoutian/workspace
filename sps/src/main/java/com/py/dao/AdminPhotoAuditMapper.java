package com.py.dao;

import java.util.List;

import com.py.bean.AdminPhotoAudit;
import com.py.bean.AuditPictures;

public interface AdminPhotoAuditMapper {
    int deleteByPrimaryKey(Integer adminPhotoAuditId);

    int insert(AdminPhotoAudit record);

    int insertSelective(AdminPhotoAudit record);

    AdminPhotoAudit selectByPrimary(AdminPhotoAudit record);
    
    List<AdminPhotoAudit> selectByExample(AuditPictures auditPictures);

    int updateByPrimaryKeySelective(AdminPhotoAudit record);

    int updateByPrimaryKey(AdminPhotoAudit record);
}