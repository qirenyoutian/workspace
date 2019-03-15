package com.py.bean;

import java.util.Date;
import java.util.List;

public class BigWarehouseInventory {
    private Integer bigWarehouseInventoryId;

    private Integer bigWarehouseInventoryBigWarehouseId;

    private Integer bigWarehouseInventoryMerchandiseId;

    private Integer bigWarehouseInventoryCount;

    private Integer bigWarehouseInventoryVersions;

    private Date bigWarehouseInventoryCreteTime;

    private Date bigWarehouseInventoryUpdateTime;
    
    private BigWarehouse bigWarehouse;
    
    private List<Merchandise> merchandises;
    
    private CommercialTenant commer;
    
    

    public Integer getBigWarehouseInventoryId() {
        return bigWarehouseInventoryId;
    }

    public void setBigWarehouseInventoryId(Integer bigWarehouseInventoryId) {
        this.bigWarehouseInventoryId = bigWarehouseInventoryId;
    }

    public Integer getBigWarehouseInventoryBigWarehouseId() {
        return bigWarehouseInventoryBigWarehouseId;
    }

    public void setBigWarehouseInventoryBigWarehouseId(Integer bigWarehouseInventoryBigWarehouseId) {
        this.bigWarehouseInventoryBigWarehouseId = bigWarehouseInventoryBigWarehouseId;
    }

    public Integer getBigWarehouseInventoryMerchandiseId() {
        return bigWarehouseInventoryMerchandiseId;
    }

    public void setBigWarehouseInventoryMerchandiseId(Integer bigWarehouseInventoryMerchandiseId) {
        this.bigWarehouseInventoryMerchandiseId = bigWarehouseInventoryMerchandiseId;
    }

    public Integer getBigWarehouseInventoryCount() {
        return bigWarehouseInventoryCount;
    }

    public void setBigWarehouseInventoryCount(Integer bigWarehouseInventoryCount) {
        this.bigWarehouseInventoryCount = bigWarehouseInventoryCount;
    }

    public Integer getBigWarehouseInventoryVersions() {
        return bigWarehouseInventoryVersions;
    }

    public void setBigWarehouseInventoryVersions(Integer bigWarehouseInventoryVersions) {
        this.bigWarehouseInventoryVersions = bigWarehouseInventoryVersions;
    }

    public Date getBigWarehouseInventoryCreteTime() {
        return bigWarehouseInventoryCreteTime;
    }

    public void setBigWarehouseInventoryCreteTime(Date bigWarehouseInventoryCreteTime) {
        this.bigWarehouseInventoryCreteTime = bigWarehouseInventoryCreteTime;
    }

    public Date getBigWarehouseInventoryUpdateTime() {
        return bigWarehouseInventoryUpdateTime;
    }

    public void setBigWarehouseInventoryUpdateTime(Date bigWarehouseInventoryUpdateTime) {
        this.bigWarehouseInventoryUpdateTime = bigWarehouseInventoryUpdateTime;
    }

	public BigWarehouse getBigWarehouse() {
		return bigWarehouse;
	}

	public void setBigWarehouse(BigWarehouse bigWarehouse) {
		this.bigWarehouse = bigWarehouse;
	}

	public List<Merchandise> getMerchandises() {
		return merchandises;
	}

	public void setMerchandises(List<Merchandise> merchandises) {
		this.merchandises = merchandises;
	}

	public CommercialTenant getCommer() {
		return commer;
	}

	public void setCommer(CommercialTenant commer) {
		this.commer = commer;
	}
}