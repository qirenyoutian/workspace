package com.py.bean;

public class CommercialTenantReport {
	private Integer commercialTenantId;
	private String commercialTenantName;
	private Integer count;
	private Double sum;
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
		this.commercialTenantName = commercialTenantName;
	}
	public Double getSum() {
		return sum;
	}
	public void setSum(Double sum) {
		this.sum = sum;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
}
