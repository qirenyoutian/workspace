package com.py.bean;

import java.util.Date;
import java.util.List;

public class Point {
    private Integer pointId;

    private String pointName;

    private Integer pointProvince;

    private Integer pointCity;

    private Integer pointDistrict;

    private String pointAddress;

    private Date pointCreateTime;

    private Date pointChangeTime;

    private Integer count;
    
    private List<Equipment> equipments;
    
    private List<Area> areas;
    
    private Channel channel;
    
    public Integer getPointId() {
        return pointId;
    }

    public void setPointId(Integer pointId) {
        this.pointId = pointId;
    }

    public String getPointName() {
        return pointName;
    }

    public void setPointName(String pointName) {
        this.pointName = pointName == null ? null : pointName.trim();
    }

    public Integer getPointProvince() {
        return pointProvince;
    }

    public void setPointProvince(Integer pointProvince) {
        this.pointProvince = pointProvince;
    }

    public Integer getPointCity() {
        return pointCity;
    }

    public void setPointCity(Integer pointCity) {
        this.pointCity = pointCity;
    }

    public Integer getPointDistrict() {
        return pointDistrict;
    }

    public void setPointDistrict(Integer pointDistrict) {
        this.pointDistrict = pointDistrict;
    }

    public String getPointAddress() {
        return pointAddress;
    }

    public void setPointAddress(String pointAddress) {
        this.pointAddress = pointAddress == null ? null : pointAddress.trim();
    }

    public Date getPointCreateTime() {
        return pointCreateTime;
    }

    public void setPointCreateTime(Date pointCreateTime) {
        this.pointCreateTime = pointCreateTime;
    }

    public Date getPointChangeTime() {
        return pointChangeTime;
    }

    public void setPointChangeTime(Date pointChangeTime) {
        this.pointChangeTime = pointChangeTime;
    }

	public List<Equipment> getEquipments() {
		return equipments;
	}

	public void setEquipments(List<Equipment> equipments) {
		this.equipments = equipments;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public List<Area> getAreas() {
		return areas;
	}

	public void setAreas(List<Area> areas) {
		this.areas = areas;
	}

	public Channel getChannel() {
		return channel;
	}

	public void setChannelPoint(Channel channel) {
		this.channel = channel;
	}
}