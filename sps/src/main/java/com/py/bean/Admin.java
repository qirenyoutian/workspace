package com.py.bean;

public class Admin {
    private Integer adminId;

    private String adminAccount;

    private String adminPassWord;

    private String adminRealname;

    private String adminPhoto;

    private String adminEmail;

    private String adminRegistrationId;

    private Integer adminRegistrationType;

    private String adminPosition;

    private String adminCreationTime;

    private String adminLocation;

	private String adminLocationTime;

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminAccount() {
        return adminAccount;
    }

    public void setAdminAccount(String adminAccount) {
        this.adminAccount = adminAccount == null ? null : adminAccount.trim();
    }

    public String getAdminPassWord() {
        return adminPassWord;
    }

    public void setAdminPassWord(String adminPassWord) {
        this.adminPassWord = adminPassWord == null ? null : adminPassWord.trim();
    }

    public String getAdminRealname() {
        return adminRealname;
    }

    public void setAdminRealname(String adminRealname) {
        this.adminRealname = adminRealname == null ? null : adminRealname.trim();
    }

    public String getAdminPhoto() {
        return adminPhoto;
    }

    public void setAdminPhoto(String adminPhoto) {
        this.adminPhoto = adminPhoto == null ? null : adminPhoto.trim();
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail == null ? null : adminEmail.trim();
    }

    public String getAdminRegistrationId() {
        return adminRegistrationId;
    }

    public void setAdminRegistrationId(String adminRegistrationId) {
        this.adminRegistrationId = adminRegistrationId == null ? null : adminRegistrationId.trim();
    }

    public Integer getAdminRegistrationType() {
        return adminRegistrationType;
    }

    public void setAdminRegistrationType(Integer adminRegistrationType) {
        this.adminRegistrationType = adminRegistrationType;
    }

    public String getAdminPosition() {
        return adminPosition;
    }

    public void setAdminPosition(String adminPosition) {
        this.adminPosition = adminPosition == null ? null : adminPosition.trim();
    }

    public String getAdminCreationTime() {
        return adminCreationTime;
    }

    public void setAdminCreationTime(String adminCreationTime) {
        this.adminCreationTime = adminCreationTime == null ? null : adminCreationTime.trim();
    }

    public String getAdminLocation() {
        return adminLocation;
    }

    public void setAdminLocation(String adminLocation) {
        this.adminLocation = adminLocation == null ? null : adminLocation.trim();
    }

    public String getAdminLocationTime() {
        return adminLocationTime;
    }

    public void setAdminLocationTime(String adminLocationTime) {
        this.adminLocationTime = adminLocationTime == null ? null : adminLocationTime.trim();
    }
}