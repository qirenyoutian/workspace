package com.py.bean;

import java.util.Date;
import java.util.List;

public class BigWarehouse {
    private Integer bigWarehouseId;

    private String bigWarehouseName;

    private Integer bigWarehouseProvince;

    private Integer bigWarehouseCity;

    private Integer bigWarehouseDistrict;

    private String bigWarehouseAddress;

    private Date bigWarehouseCreateTime;

    private Date bigWarehouseUpdateTime;
    
    private List<Area> areas;
    

	public Integer getBigWarehouseId() {
        return bigWarehouseId;
    }

    public void setBigWarehouseId(Integer bigWarehouseId) {
        this.bigWarehouseId = bigWarehouseId;
    }

    public String getBigWarehouseName() {
        return bigWarehouseName;
    }

    public void setBigWarehouseName(String bigWarehouseName) {
        this.bigWarehouseName = bigWarehouseName == null ? null : bigWarehouseName.trim();
    }

    public Integer getBigWarehouseProvince() {
        return bigWarehouseProvince;
    }

    public void setBigWarehouseProvince(Integer bigWarehouseProvince) {
        this.bigWarehouseProvince = bigWarehouseProvince;
    }

    public Integer getBigWarehouseCity() {
        return bigWarehouseCity;
    }

    public void setBigWarehouseCity(Integer bigWarehouseCity) {
        this.bigWarehouseCity = bigWarehouseCity;
    }

    public Integer getBigWarehouseDistrict() {
        return bigWarehouseDistrict;
    }

    public void setBigWarehouseDistrict(Integer bigWarehouseDistrict) {
        this.bigWarehouseDistrict = bigWarehouseDistrict;
    }

    public String getBigWarehouseAddress() {
        return bigWarehouseAddress;
    }

    public void setBigWarehouseAddress(String bigWarehouseAddress) {
        this.bigWarehouseAddress = bigWarehouseAddress == null ? null : bigWarehouseAddress.trim();
    }

    public Date getBigWarehouseCreateTime() {
        return bigWarehouseCreateTime;
    }

    public void setBigWarehouseCreateTime(Date bigWarehouseCreateTime) {
        this.bigWarehouseCreateTime = bigWarehouseCreateTime;
    }

    public Date getBigWarehouseUpdateTime() {
        return bigWarehouseUpdateTime;
    }

    public void setBigWarehouseUpdateTime(Date bigWarehouseUpdateTime) {
        this.bigWarehouseUpdateTime = bigWarehouseUpdateTime;
    }

	public List<Area> getAreas() {
		return areas;
	}

	public void setAreas(List<Area> areas) {
		this.areas = areas;
	}
}