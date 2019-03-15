package com.py.bean;

import java.util.Date;
import java.util.List;

public class CommercialTenant {
    private Integer commercialTenantId;

    private String commercialTenantName;

    private String commercialTenantNumber;

    private String commercialTenantDescribe;

    private String commercialTenantPerson;

    private String commercialTenantAttr;

    private String commercialTenantPhone;

    private String commercialTenantLogo;

    private String commercialTenantOfficialWebsite;

    private Date commercialTenantCreateTime;

    private Date commercialTenantChangeTime;
    
    private List<Payment> payments;
    

    public Integer getCommercialTenantId() {
        return commercialTenantId;
    }

    public void setCommercialTenantId(Integer commercialTenantId) {
        this.commercialTenantId = commercialTenantId;
    }

    public String getCommercialTenantName() {
        return commercialTenantName;
    }

    public void setCommercialTenantName(String commercialTenantName) {
        this.commercialTenantName = commercialTenantName == null ? null : commercialTenantName.trim();
    }

    public String getCommercialTenantNumber() {
        return commercialTenantNumber;
    }

    public void setCommercialTenantNumber(String commercialTenantNumber) {
        this.commercialTenantNumber = commercialTenantNumber == null ? null : commercialTenantNumber.trim();
    }

    public String getCommercialTenantDescribe() {
        return commercialTenantDescribe;
    }

    public void setCommercialTenantDescribe(String commercialTenantDescribe) {
        this.commercialTenantDescribe = commercialTenantDescribe == null ? null : commercialTenantDescribe.trim();
    }

    public String getCommercialTenantAttr() {
        return commercialTenantAttr;
    }

    public void setCommercialTenantAttr(String commercialTenantAttr) {
        this.commercialTenantAttr = commercialTenantAttr == null ? null : commercialTenantAttr.trim();
    }

    public String getCommercialTenantPhone() {
        return commercialTenantPhone;
    }

    public void setCommercialTenantPhone(String commercialTenantPhone) {
        this.commercialTenantPhone = commercialTenantPhone == null ? null : commercialTenantPhone.trim();
    }

    public String getCommercialTenantLogo() {
        return commercialTenantLogo;
    }

    public void setCommercialTenantLogo(String commercialTenantLogo) {
        this.commercialTenantLogo = commercialTenantLogo == null ? null : commercialTenantLogo.trim();
    }

    public String getCommercialTenantOfficialWebsite() {
        return commercialTenantOfficialWebsite;
    }

    public void setCommercialTenantOfficialWebsite(String commercialTenantOfficialWebsite) {
        this.commercialTenantOfficialWebsite = commercialTenantOfficialWebsite == null ? null : commercialTenantOfficialWebsite.trim();
    }

    public Date getCommercialTenantCreateTime() {
        return commercialTenantCreateTime;
    }

    public void setCommercialTenantCreateTime(Date commercialTenantCreateTime) {
        this.commercialTenantCreateTime = commercialTenantCreateTime;
    }

    public Date getCommercialTenantChangeTime() {
        return commercialTenantChangeTime;
    }

    public void setCommercialTenantChangeTime(Date commercialTenantChangeTime) {
        this.commercialTenantChangeTime = commercialTenantChangeTime;
    }

	public List<Payment> getPayments() {
		return payments;
	}

	public void setPayments(List<Payment> payments) {
		this.payments = payments;
	}

	public String getCommercialTenantPerson() {
		return commercialTenantPerson;
	}

	public void setCommercialTenantPerson(String commercialTenantPerson) {
		this.commercialTenantPerson = commercialTenantPerson;
	}
}