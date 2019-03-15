package com.py.bean;

import java.util.Date;

public class AisleInventory {
    private Integer aisleInventoryId;

    private Integer aisleInventoryAisleId;

    private Integer aisleInventoryMerchandiseId;

    private Integer aisleInventoryChannelMerchandiseId;

    private Integer aisleInventoryCount;

    private Date aisleInventoryCreateTime;

    private Date aisleInventoryUpdateTime;
    
    private Aisle aisle;
    
    private Merchandise merchandise;
    
    private ChannelMerchandise channelMerchandise;
    
    public Integer getAisleInventoryId() {
        return aisleInventoryId;
    }

    public void setAisleInventoryId(Integer aisleInventoryId) {
        this.aisleInventoryId = aisleInventoryId;
    }

    public Integer getAisleInventoryAisleId() {
        return aisleInventoryAisleId;
    }

    public void setAisleInventoryAisleId(Integer aisleInventoryAisleId) {
        this.aisleInventoryAisleId = aisleInventoryAisleId;
    }

    public Integer getAisleInventoryMerchandiseId() {
        return aisleInventoryMerchandiseId;
    }

    public void setAisleInventoryMerchandiseId(Integer aisleInventoryMerchandiseId) {
        this.aisleInventoryMerchandiseId = aisleInventoryMerchandiseId;
    }

    public Integer getAisleInventoryChannelMerchandiseId() {
        return aisleInventoryChannelMerchandiseId;
    }

    public void setAisleInventoryChannelMerchandiseId(Integer aisleInventoryChannelMerchandiseId) {
        this.aisleInventoryChannelMerchandiseId = aisleInventoryChannelMerchandiseId;
    }

    public Integer getAisleInventoryCount() {
        return aisleInventoryCount;
    }

    public void setAisleInventoryCount(Integer aisleInventoryCount) {
        this.aisleInventoryCount = aisleInventoryCount;
    }

    public Date getAisleInventoryCreateTime() {
        return aisleInventoryCreateTime;
    }

    public void setAisleInventoryCreateTime(Date aisleInventoryCreateTime) {
        this.aisleInventoryCreateTime = aisleInventoryCreateTime;
    }

    public Date getAisleInventoryUpdateTime() {
        return aisleInventoryUpdateTime;
    }

    public void setAisleInventoryUpdateTime(Date aisleInventoryUpdateTime) {
        this.aisleInventoryUpdateTime = aisleInventoryUpdateTime;
    }

	public Aisle getAisle() {
		return aisle;
	}

	public void setAisle(Aisle aisle) {
		this.aisle = aisle;
	}

	public Merchandise getMerchandise() {
		return merchandise;
	}

	public void setMerchandise(Merchandise merchandise) {
		this.merchandise = merchandise;
	}

	public ChannelMerchandise getChannelMerchandise() {
		return channelMerchandise;
	}

	public void setChannelMerchandise(ChannelMerchandise channelMerchandise) {
		this.channelMerchandise = channelMerchandise;
	}

}