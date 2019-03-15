package com.py.bean;

import java.util.Date;

public class Coupon {
    private Integer couponId;

    private String couponName;

    private String couponImage;

    private Double couponFull;

    private Double couponParValue;

    private String couponInstructions;

    private Integer couponValidTime;

    private Integer couponIsIntegral;

    private Integer couponIntegral;

    private Date couponTime;

    private Integer couponDelfalg;

    public Integer getCouponId() {
        return couponId;
    }

    public void setCouponId(Integer couponId) {
        this.couponId = couponId;
    }

    public String getCouponName() {
        return couponName;
    }

    public void setCouponName(String couponName) {
        this.couponName = couponName == null ? null : couponName.trim();
    }

    public String getCouponImage() {
        return couponImage;
    }

    public void setCouponImage(String couponImage) {
        this.couponImage = couponImage == null ? null : couponImage.trim();
    }

    public Double getCouponFull() {
        return couponFull;
    }

    public void setCouponFull(Double couponFull) {
        this.couponFull = couponFull;
    }

    public Double getCouponParValue() {
        return couponParValue;
    }

    public void setCouponParValue(Double couponParValue) {
        this.couponParValue = couponParValue;
    }

    public String getCouponInstructions() {
        return couponInstructions;
    }

    public void setCouponInstructions(String couponInstructions) {
        this.couponInstructions = couponInstructions == null ? null : couponInstructions.trim();
    }

    public Integer getCouponValidTime() {
        return couponValidTime;
    }

    public void setCouponValidTime(Integer couponValidTime) {
        this.couponValidTime = couponValidTime;
    }

    public Integer getCouponIsIntegral() {
        return couponIsIntegral;
    }

    public void setCouponIsIntegral(Integer couponIsIntegral) {
        this.couponIsIntegral = couponIsIntegral;
    }

    public Integer getCouponIntegral() {
        return couponIntegral;
    }

    public void setCouponIntegral(Integer couponIntegral) {
        this.couponIntegral = couponIntegral;
    }

    public Date getCouponTime() {
        return couponTime;
    }

    public void setCouponTime(Date couponTime) {
        this.couponTime = couponTime;
    }

    public Integer getCouponDelfalg() {
        return couponDelfalg;
    }

    public void setCouponDelfalg(Integer couponDelfalg) {
        this.couponDelfalg = couponDelfalg;
    }
}