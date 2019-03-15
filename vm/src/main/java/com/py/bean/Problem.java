package com.py.bean;

import java.util.Date;

public class Problem {
    private Integer problemId;

    private Integer problemType;

    private String problemComit;

    private Integer problemChannelId;

    private Integer problemPointId;

    private Integer problemAdminId;

    private String problemStatus;

    private Date problemCreateTime;

    private Date problemChangeTime;

    public Integer getProblemId() {
        return problemId;
    }

    public void setProblemId(Integer problemId) {
        this.problemId = problemId;
    }

    public Integer getProblemType() {
        return problemType;
    }

    public void setProblemType(Integer problemType) {
        this.problemType = problemType;
    }

    public String getProblemComit() {
        return problemComit;
    }

    public void setProblemComit(String problemComit) {
        this.problemComit = problemComit == null ? null : problemComit.trim();
    }

    public Integer getProblemChannelId() {
        return problemChannelId;
    }

    public void setProblemChannelId(Integer problemChannelId) {
        this.problemChannelId = problemChannelId;
    }

    public Integer getProblemPointId() {
        return problemPointId;
    }

    public void setProblemPointId(Integer problemPointId) {
        this.problemPointId = problemPointId;
    }

    public Integer getProblemAdminId() {
        return problemAdminId;
    }

    public void setProblemAdminId(Integer problemAdminId) {
        this.problemAdminId = problemAdminId;
    }

    public String getProblemStatus() {
        return problemStatus;
    }

    public void setProblemStatus(String problemStatus) {
        this.problemStatus = problemStatus == null ? null : problemStatus.trim();
    }

    public Date getProblemCreateTime() {
        return problemCreateTime;
    }

    public void setProblemCreateTime(Date problemCreateTime) {
        this.problemCreateTime = problemCreateTime;
    }

    public Date getProblemChangeTime() {
        return problemChangeTime;
    }

    public void setProblemChangeTime(Date problemChangeTime) {
        this.problemChangeTime = problemChangeTime;
    }
}