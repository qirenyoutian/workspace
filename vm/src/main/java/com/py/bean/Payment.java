package com.py.bean;

import java.util.Date;

public class Payment {
    private Integer paymentId;

    private String paymentName;

    private Date paymentCreateTime;

    private Date paymentUpdateTime;

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName == null ? null : paymentName.trim();
    }

    public Date getPaymentCreateTime() {
        return paymentCreateTime;
    }

    public void setPaymentCreateTime(Date paymentCreateTime) {
        this.paymentCreateTime = paymentCreateTime;
    }

    public Date getPaymentUpdateTime() {
        return paymentUpdateTime;
    }

    public void setPaymentUpdateTime(Date paymentUpdateTime) {
        this.paymentUpdateTime = paymentUpdateTime;
    }
}