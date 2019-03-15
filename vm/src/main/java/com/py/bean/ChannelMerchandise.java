package com.py.bean;

import java.util.Date;

public class ChannelMerchandise {
    private Integer channelMerchandiseId;

    private String channelMerchandiseName;

    private Integer channelMerchandiseChannelId;

    private Integer channelMerchandisePaymentId;

    private Integer channelMerchandiseEquipmentId;

    private Integer channelMerchandiseMerchandiseId;

    private Double channelMerchandisePrice;

    private String channelMerchandiseNumber;

    private String channelMerchandiseMerchandiseUrl;

    private Date channelMerchandiseCreateTime;

    private Date channelMerchandiseUpdateTime;
    
    private Channel channel;
    
    private Merchandise merchandise;
    
    private Equipment equipment;
    
    private Payment payment;
    

    public Integer getChannelMerchandiseId() {
        return channelMerchandiseId;
    }

    public void setChannelMerchandiseId(Integer channelMerchandiseId) {
        this.channelMerchandiseId = channelMerchandiseId;
    }

    public String getChannelMerchandiseName() {
        return channelMerchandiseName;
    }

    public void setChannelMerchandiseName(String channelMerchandiseName) {
        this.channelMerchandiseName = channelMerchandiseName == null ? null : channelMerchandiseName.trim();
    }

    public Integer getChannelMerchandiseChannelId() {
        return channelMerchandiseChannelId;
    }

    public void setChannelMerchandiseChannelId(Integer channelMerchandiseChannelId) {
        this.channelMerchandiseChannelId = channelMerchandiseChannelId;
    }

    public Integer getChannelMerchandisePaymentId() {
        return channelMerchandisePaymentId;
    }

    public void setChannelMerchandisePaymentId(Integer channelMerchandisePaymentId) {
        this.channelMerchandisePaymentId = channelMerchandisePaymentId;
    }

    public Integer getChannelMerchandiseEquipmentId() {
        return channelMerchandiseEquipmentId;
    }

    public void setChannelMerchandiseEquipmentId(Integer channelMerchandiseEquipmentId) {
        this.channelMerchandiseEquipmentId = channelMerchandiseEquipmentId;
    }

    public Integer getChannelMerchandiseMerchandiseId() {
        return channelMerchandiseMerchandiseId;
    }

    public void setChannelMerchandiseMerchandiseId(Integer channelMerchandiseMerchandiseId) {
        this.channelMerchandiseMerchandiseId = channelMerchandiseMerchandiseId;
    }

    public Double getChannelMerchandisePrice() {
        return channelMerchandisePrice;
    }

    public void setChannelMerchandisePrice(Double channelMerchandisePrice) {
        this.channelMerchandisePrice = channelMerchandisePrice;
    }

    public String getChannelMerchandiseNumber() {
        return channelMerchandiseNumber;
    }

    public void setChannelMerchandiseNumber(String channelMerchandiseNumber) {
        this.channelMerchandiseNumber = channelMerchandiseNumber == null ? null : channelMerchandiseNumber.trim();
    }

    public String getChannelMerchandiseMerchandiseUrl() {
        return channelMerchandiseMerchandiseUrl;
    }

    public void setChannelMerchandiseMerchandiseUrl(String channelMerchandiseMerchandiseUrl) {
        this.channelMerchandiseMerchandiseUrl = channelMerchandiseMerchandiseUrl == null ? null : channelMerchandiseMerchandiseUrl.trim();
    }

    public Date getChannelMerchandiseCreateTime() {
        return channelMerchandiseCreateTime;
    }

    public void setChannelMerchandiseCreateTime(Date channelMerchandiseCreateTime) {
        this.channelMerchandiseCreateTime = channelMerchandiseCreateTime;
    }

    public Date getChannelMerchandiseUpdateTime() {
        return channelMerchandiseUpdateTime;
    }

    public void setChannelMerchandiseUpdateTime(Date channelMerchandiseUpdateTime) {
        this.channelMerchandiseUpdateTime = channelMerchandiseUpdateTime;
    }

	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	public Merchandise getMerchandise() {
		return merchandise;
	}

	public void setMerchandise(Merchandise merchandise) {
		this.merchandise = merchandise;
	}

	public Equipment getEquipment() {
		return equipment;
	}

	public void setEquipment(Equipment equipment) {
		this.equipment = equipment;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}
}