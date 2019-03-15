package com.py.bean;

public class Invoice {
    private Integer invoiceId;

    private Integer invoiceUserId;

    private Integer invoiceSingleCarId;

    private Integer invoiceType;

    private Integer invoiceRiseType;

    private String invoiceRiseName;

    private String invoiceDutyParagraph;

    private String invoiceContent;

    private Double invoiceSum;

    private String invoiceDes;

    private Integer invoiceReceiveMode;

    private String invoiceMailbox;

    private String invoiceAddressee;

    private String invoicePhone;

    private String invoiceAddress;

    private String invoiceDetailedAddress;

    private String invoiceTime;

    private Integer invoiceStatus;

    public Integer getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(Integer invoiceId) {
        this.invoiceId = invoiceId;
    }

    public Integer getInvoiceUserId() {
        return invoiceUserId;
    }

    public void setInvoiceUserId(Integer invoiceUserId) {
        this.invoiceUserId = invoiceUserId;
    }

    public Integer getInvoiceSingleCarId() {
        return invoiceSingleCarId;
    }

    public void setInvoiceSingleCarId(Integer invoiceSingleCarId) {
        this.invoiceSingleCarId = invoiceSingleCarId;
    }

    public Integer getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(Integer invoiceType) {
        this.invoiceType = invoiceType;
    }

    public Integer getInvoiceRiseType() {
        return invoiceRiseType;
    }

    public void setInvoiceRiseType(Integer invoiceRiseType) {
        this.invoiceRiseType = invoiceRiseType;
    }

    public String getInvoiceRiseName() {
        return invoiceRiseName;
    }

    public void setInvoiceRiseName(String invoiceRiseName) {
        this.invoiceRiseName = invoiceRiseName == null ? null : invoiceRiseName.trim();
    }

    public String getInvoiceDutyParagraph() {
        return invoiceDutyParagraph;
    }

    public void setInvoiceDutyParagraph(String invoiceDutyParagraph) {
        this.invoiceDutyParagraph = invoiceDutyParagraph == null ? null : invoiceDutyParagraph.trim();
    }

    public String getInvoiceContent() {
        return invoiceContent;
    }

    public void setInvoiceContent(String invoiceContent) {
        this.invoiceContent = invoiceContent == null ? null : invoiceContent.trim();
    }

    public Double getInvoiceSum() {
        return invoiceSum;
    }

    public void setInvoiceSum(Double invoiceSum) {
        this.invoiceSum = invoiceSum;
    }

    public String getInvoiceDes() {
        return invoiceDes;
    }

    public void setInvoiceDes(String invoiceDes) {
        this.invoiceDes = invoiceDes == null ? null : invoiceDes.trim();
    }

    public Integer getInvoiceReceiveMode() {
        return invoiceReceiveMode;
    }

    public void setInvoiceReceiveMode(Integer invoiceReceiveMode) {
        this.invoiceReceiveMode = invoiceReceiveMode;
    }

    public String getInvoiceMailbox() {
        return invoiceMailbox;
    }

    public void setInvoiceMailbox(String invoiceMailbox) {
        this.invoiceMailbox = invoiceMailbox == null ? null : invoiceMailbox.trim();
    }

    public String getInvoiceAddressee() {
        return invoiceAddressee;
    }

    public void setInvoiceAddressee(String invoiceAddressee) {
        this.invoiceAddressee = invoiceAddressee == null ? null : invoiceAddressee.trim();
    }

    public String getInvoicePhone() {
        return invoicePhone;
    }

    public void setInvoicePhone(String invoicePhone) {
        this.invoicePhone = invoicePhone == null ? null : invoicePhone.trim();
    }

    public String getInvoiceAddress() {
        return invoiceAddress;
    }

    public void setInvoiceAddress(String invoiceAddress) {
        this.invoiceAddress = invoiceAddress == null ? null : invoiceAddress.trim();
    }

    public String getInvoiceDetailedAddress() {
        return invoiceDetailedAddress;
    }

    public void setInvoiceDetailedAddress(String invoiceDetailedAddress) {
        this.invoiceDetailedAddress = invoiceDetailedAddress == null ? null : invoiceDetailedAddress.trim();
    }

    public String getInvoiceTime() {
        return invoiceTime;
    }

    public void setInvoiceTime(String invoiceTime) {
        this.invoiceTime = invoiceTime == null ? null : invoiceTime.trim();
    }

    public Integer getInvoiceStatus() {
        return invoiceStatus;
    }

    public void setInvoiceStatus(Integer invoiceStatus) {
        this.invoiceStatus = invoiceStatus;
    }
}