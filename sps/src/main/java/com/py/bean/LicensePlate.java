package com.py.bean;

public class LicensePlate {
    private Integer licensePlateId;

    private String licensePlateNumber;

    private String licensePlateInformation;

    private String licensePlateTheOwner;

    private String licensePlatePhotoUrl;

    private Integer licensePlateUserId;

    public Integer getLicensePlateId() {
        return licensePlateId;
    }

    public void setLicensePlateId(Integer licensePlateId) {
        this.licensePlateId = licensePlateId;
    }

    public String getLicensePlateNumber() {
        return licensePlateNumber;
    }

    public void setLicensePlateNumber(String licensePlateNumber) {
        this.licensePlateNumber = licensePlateNumber == null ? null : licensePlateNumber.trim();
    }

    public String getLicensePlateInformation() {
        return licensePlateInformation;
    }

    public void setLicensePlateInformation(String licensePlateInformation) {
        this.licensePlateInformation = licensePlateInformation == null ? null : licensePlateInformation.trim();
    }

    public String getLicensePlateTheOwner() {
        return licensePlateTheOwner;
    }

    public void setLicensePlateTheOwner(String licensePlateTheOwner) {
        this.licensePlateTheOwner = licensePlateTheOwner == null ? null : licensePlateTheOwner.trim();
    }

    public String getLicensePlatePhotoUrl() {
        return licensePlatePhotoUrl;
    }

    public void setLicensePlatePhotoUrl(String licensePlatePhotoUrl) {
        this.licensePlatePhotoUrl = licensePlatePhotoUrl == null ? null : licensePlatePhotoUrl.trim();
    }

    public Integer getLicensePlateUserId() {
        return licensePlateUserId;
    }

    public void setLicensePlateUserId(Integer licensePlateUserId) {
        this.licensePlateUserId = licensePlateUserId;
    }
}