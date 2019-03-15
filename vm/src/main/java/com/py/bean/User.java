package com.py.bean;

public class User {
    private Integer userId;

    private String userAccount;

    private String userPassWord;

    private String userNickname;

    private String userFullName;

    private String userHeadPortrait;

    private Double userBalance;

    private Double userIntegral;

    private String userMailbox;

    private String userCreationTime;

    private Integer userBlack;

    private Integer userVersions;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount == null ? null : userAccount.trim();
    }

    public String getUserPassWord() {
        return userPassWord;
    }

    public void setUserPassWord(String userPassWord) {
        this.userPassWord = userPassWord == null ? null : userPassWord.trim();
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname == null ? null : userNickname.trim();
    }

    public String getUserFullName() {
        return userFullName;
    }

    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName == null ? null : userFullName.trim();
    }

    public String getUserHeadPortrait() {
        return userHeadPortrait;
    }

    public void setUserHeadPortrait(String userHeadPortrait) {
        this.userHeadPortrait = userHeadPortrait == null ? null : userHeadPortrait.trim();
    }

    public Double getUserBalance() {
        return userBalance;
    }

    public void setUserBalance(Double userBalance) {
        this.userBalance = userBalance;
    }

    public Double getUserIntegral() {
        return userIntegral;
    }

    public void setUserIntegral(Double userIntegral) {
        this.userIntegral = userIntegral;
    }

    public String getUserMailbox() {
        return userMailbox;
    }

    public void setUserMailbox(String userMailbox) {
        this.userMailbox = userMailbox == null ? null : userMailbox.trim();
    }

    public String getUserCreationTime() {
        return userCreationTime;
    }

    public void setUserCreationTime(String userCreationTime) {
        this.userCreationTime = userCreationTime == null ? null : userCreationTime.trim();
    }

    public Integer getUserBlack() {
        return userBlack;
    }

    public void setUserBlack(Integer userBlack) {
        this.userBlack = userBlack;
    }

    public Integer getUserVersions() {
        return userVersions;
    }

    public void setUserVersions(Integer userVersions) {
        this.userVersions = userVersions;
    }
}