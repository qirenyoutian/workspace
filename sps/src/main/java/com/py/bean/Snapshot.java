package com.py.bean;

import java.util.Date;

public class Snapshot {
    private Integer snapshotId;

    private String snapshotCameraIp;

    private Integer snapshotSingleCarDetailsId;

    private Date snapshotTime;

    private Integer snapshotStatus;

    public Integer getSnapshotId() {
        return snapshotId;
    }

    public void setSnapshotId(Integer snapshotId) {
        this.snapshotId = snapshotId;
    }

    public String getSnapshotCameraIp() {
        return snapshotCameraIp;
    }

    public void setSnapshotCameraIp(String snapshotCameraIp) {
        this.snapshotCameraIp = snapshotCameraIp == null ? null : snapshotCameraIp.trim();
    }

    public Integer getSnapshotSingleCarDetailsId() {
        return snapshotSingleCarDetailsId;
    }

    public void setSnapshotSingleCarDetailsId(Integer snapshotSingleCarDetailsId) {
        this.snapshotSingleCarDetailsId = snapshotSingleCarDetailsId;
    }

    public Date getSnapshotTime() {
        return snapshotTime;
    }

    public void setSnapshotTime(Date snapshotTime) {
        this.snapshotTime = snapshotTime;
    }

    public Integer getSnapshotStatus() {
        return snapshotStatus;
    }

    public void setSnapshotStatus(Integer snapshotStatus) {
        this.snapshotStatus = snapshotStatus;
    }
}