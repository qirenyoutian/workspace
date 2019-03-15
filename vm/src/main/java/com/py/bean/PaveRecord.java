package com.py.bean;

import java.util.Date;

public class PaveRecord {
    private Integer paveRecordId;

    private Integer paveRecordPointId;

    private Integer paveRecordAdminId;

    private String paveRecordLat;

    private String paveRecordLon;

    private String paveRecordBeforePhoto;

    private String paveRecordAfterPhoto;

    private Date paveRecordPaveDate;

    private Date paveRecordCreateTime;
    
    private Point point;
    
    private Admin admin;

    public Integer getPaveRecordId() {
        return paveRecordId;
    }

    public void setPaveRecordId(Integer paveRecordId) {
        this.paveRecordId = paveRecordId;
    }

    public Integer getPaveRecordPointId() {
        return paveRecordPointId;
    }

    public void setPaveRecordPointId(Integer paveRecordPointId) {
        this.paveRecordPointId = paveRecordPointId;
    }

    public Integer getPaveRecordAdminId() {
        return paveRecordAdminId;
    }

    public void setPaveRecordAdminId(Integer paveRecordAdminId) {
        this.paveRecordAdminId = paveRecordAdminId;
    }

    public String getPaveRecordLat() {
        return paveRecordLat;
    }

    public void setPaveRecordLat(String paveRecordLat) {
        this.paveRecordLat = paveRecordLat == null ? null : paveRecordLat.trim();
    }

    public String getPaveRecordLon() {
        return paveRecordLon;
    }

    public void setPaveRecordLon(String paveRecordLon) {
        this.paveRecordLon = paveRecordLon == null ? null : paveRecordLon.trim();
    }

    public String getPaveRecordBeforePhoto() {
        return paveRecordBeforePhoto;
    }

    public void setPaveRecordBeforePhoto(String paveRecordBeforePhoto) {
        this.paveRecordBeforePhoto = paveRecordBeforePhoto == null ? null : paveRecordBeforePhoto.trim();
    }

    public String getPaveRecordAfterPhoto() {
        return paveRecordAfterPhoto;
    }

    public void setPaveRecordAfterPhoto(String paveRecordAfterPhoto) {
        this.paveRecordAfterPhoto = paveRecordAfterPhoto == null ? null : paveRecordAfterPhoto.trim();
    }

    public Date getPaveRecordPaveDate() {
        return paveRecordPaveDate;
    }

    public void setPaveRecordPaveDate(Date paveRecordPaveDate) {
        this.paveRecordPaveDate = paveRecordPaveDate;
    }

    public Date getPaveRecordCreateTime() {
        return paveRecordCreateTime;
    }

    public void setPaveRecordCreateTime(Date paveRecordCreateTime) {
        this.paveRecordCreateTime = paveRecordCreateTime;
    }

	public Point getPoint() {
		return point;
	}

	public void setPoint(Point point) {
		this.point = point;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
}