package com.py.bean;

import java.util.Date;

public class AuditPictures {
    private Integer auditPicturesId;

    private Integer auditPicturesAdminId;

    private String auditPicturesPictures;

    private String auditPicturesLicensePlate;

    private String auditPicturesRouteName;

    private String auditPicturesTruckSpaceName;

    private Date auditPicturesTime;

    private Integer auditPicturesStatus;

    public Integer getAuditPicturesId() {
        return auditPicturesId;
    }

    public void setAuditPicturesId(Integer auditPicturesId) {
        this.auditPicturesId = auditPicturesId;
    }

    public Integer getAuditPicturesAdminId() {
        return auditPicturesAdminId;
    }

    public void setAuditPicturesAdminId(Integer auditPicturesAdminId) {
        this.auditPicturesAdminId = auditPicturesAdminId;
    }

    public String getAuditPicturesPictures() {
        return auditPicturesPictures;
    }

    public void setAuditPicturesPictures(String auditPicturesPictures) {
        this.auditPicturesPictures = auditPicturesPictures == null ? null : auditPicturesPictures.trim();
    }

    public String getAuditPicturesLicensePlate() {
        return auditPicturesLicensePlate;
    }

    public void setAuditPicturesLicensePlate(String auditPicturesLicensePlate) {
        this.auditPicturesLicensePlate = auditPicturesLicensePlate == null ? null : auditPicturesLicensePlate.trim();
    }

    public String getAuditPicturesRouteName() {
        return auditPicturesRouteName;
    }

    public void setAuditPicturesRouteName(String auditPicturesRouteName) {
        this.auditPicturesRouteName = auditPicturesRouteName == null ? null : auditPicturesRouteName.trim();
    }

    public String getAuditPicturesTruckSpaceName() {
        return auditPicturesTruckSpaceName;
    }

    public void setAuditPicturesTruckSpaceName(String auditPicturesTruckSpaceName) {
        this.auditPicturesTruckSpaceName = auditPicturesTruckSpaceName == null ? null : auditPicturesTruckSpaceName.trim();
    }

    public Date getAuditPicturesTime() {
        return auditPicturesTime;
    }

    public void setAuditPicturesTime(Date auditPicturesTime) {
        this.auditPicturesTime = auditPicturesTime;
    }

    public Integer getAuditPicturesStatus() {
        return auditPicturesStatus;
    }

    public void setAuditPicturesStatus(Integer auditPicturesStatus) {
        this.auditPicturesStatus = auditPicturesStatus;
    }
}