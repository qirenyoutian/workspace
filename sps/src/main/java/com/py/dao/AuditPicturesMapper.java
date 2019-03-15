package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.AdminPhotoAudit;
import com.py.bean.AuditPictures;

public interface AuditPicturesMapper {
    int deleteByPrimaryKey(Integer auditPicturesId);

    int insert(AuditPictures record);

    int insertSelective(AuditPictures record);

    AuditPictures selectByPrimaryKey(Integer auditPicturesId);

    int updateByPrimaryKeySelective(AuditPictures record);

    int updateByPrimaryKey(AuditPictures record);

	List<AdminPhotoAudit> selectBySampleWithAdmin(AdminPhotoAudit adminPhotoAudit);

	List<AdminPhotoAudit> selectById(@Param("auditId")Integer auditId);

	int updateForStatusById(@Param("adminPhotoAuditId")Integer id, @Param("adminPhotoAuditResult")Integer adminPhotoAuditResult);

	List<AdminPhotoAudit> selectAuditByTime(@Param("startTime")String startTime, @Param("endTime")String endTime);

	List<AdminPhotoAudit> selectByStatus(@Param("status")Integer status);

	List<AdminPhotoAudit> selectByRealName(@Param("realname")String realname);
}