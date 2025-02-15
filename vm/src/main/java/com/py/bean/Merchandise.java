package com.py.bean;

import java.util.Date;

public class Merchandise {
    private Integer merchandiseId;

    private String merchandiseName;

    private String merchandiseNumber;

    private String merchandiseCommercialTenantNumber;

    private Integer merchandiseClassify;

    private Double merchandisePrice;

    private String merchandiseImageUrl;

    private String merchandiseExhibitionImageUrl;
    
    private Integer merchandiseInformationComefrom;

    private String merchandiseH5ImageUrl;

    private Integer merchandiseStatus;

    private Date merchandiseTime;

    private Date merchandiseUploadTime;

    private Date merchandiseUpdateTime;

    private CommercialTenant commercialTenant;
    
    private MerchandiseClassify classify;
    
    private Channel channel;
    
    
    
    public Integer getMerchandiseId() {
        return merchandiseId;
    }

    public void setMerchandiseId(Integer merchandiseId) {
        this.merchandiseId = merchandiseId;
    }

    public String getMerchandiseName() {
        return merchandiseName;
    }

    public void setMerchandiseName(String merchandiseName) {
        this.merchandiseName = merchandiseName == null ? null : merchandiseName.trim();
    }

    public String getMerchandiseNumber() {
        return merchandiseNumber;
    }

    public void setMerchandiseNumber(String merchandiseNumber) {
        this.merchandiseNumber = merchandiseNumber == null ? null : merchandiseNumber.trim();
    }

    public String getMerchandiseCommercialTenantNumber() {
        return merchandiseCommercialTenantNumber;
    }

    public void setMerchandiseCommercialTenantNumber(String merchandiseCommercialTenantNumber) {
        this.merchandiseCommercialTenantNumber = merchandiseCommercialTenantNumber == null ? null : merchandiseCommercialTenantNumber.trim();
    }

    public Integer getMerchandiseClassify() {
        return merchandiseClassify;
    }

    public void setMerchandiseClassify(Integer merchandiseClassify) {
        this.merchandiseClassify = merchandiseClassify;
    }

    public Double getMerchandisePrice() {
        return merchandisePrice;
    }

    public void setMerchandisePrice(Double merchandisePrice) {
        this.merchandisePrice = merchandisePrice;
    }

    public String getMerchandiseImageUrl() {
        return merchandiseImageUrl;
    }

    public void setMerchandiseImageUrl(String merchandiseImageUrl) {
        this.merchandiseImageUrl = merchandiseImageUrl == null ? null : merchandiseImageUrl.trim();
    }

    public String getMerchandiseExhibitionImageUrl() {
        return merchandiseExhibitionImageUrl;
    }

    public void setMerchandiseExhibitionImageUrl(String merchandiseExhibitionImageUrl) {
        this.merchandiseExhibitionImageUrl = merchandiseExhibitionImageUrl == null ? null : merchandiseExhibitionImageUrl.trim();
    }

    public String getMerchandiseH5ImageUrl() {
        return merchandiseH5ImageUrl;
    }

    public void setMerchandiseH5ImageUrl(String merchandiseH5ImageUrl) {
        this.merchandiseH5ImageUrl = merchandiseH5ImageUrl == null ? null : merchandiseH5ImageUrl.trim();
    }

    public Integer getMerchandiseStatus() {
        return merchandiseStatus;
    }

    public void setMerchandiseStatus(Integer merchandiseStatus) {
        this.merchandiseStatus = merchandiseStatus;
    }

    public Date getMerchandiseTime() {
        return merchandiseTime;
    }

    public void setMerchandiseTime(Date merchandiseTime) {
        this.merchandiseTime = merchandiseTime;
    }

    public Date getMerchandiseUploadTime() {
        return merchandiseUploadTime;
    }

    public void setMerchandiseUploadTime(Date merchandiseUploadTime) {
        this.merchandiseUploadTime = merchandiseUploadTime;
    }

    public Date getMerchandiseUpdateTime() {
        return merchandiseUpdateTime;
    }

    public void setMerchandiseUpdateTime(Date merchandiseUpdateTime) {
        this.merchandiseUpdateTime = merchandiseUpdateTime;
    }

	public CommercialTenant getCommercialTenant() {
		return commercialTenant;
	}

	public void setCommercialTenant(CommercialTenant commercialTenant) {
		this.commercialTenant = commercialTenant;
	}

	public MerchandiseClassify getClassify() {
		return classify;
	}

	public void setClassify(MerchandiseClassify classify) {
		this.classify = classify;
	}

	public Integer getMerchandiseInformationComefrom() {
		return merchandiseInformationComefrom;
	}

	public void setMerchandiseInformationComefrom(Integer merchandiseInformationComefrom) {
		this.merchandiseInformationComefrom = merchandiseInformationComefrom;
	}

	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

}