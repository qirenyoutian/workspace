package com.py.bean;

import java.util.Date;

public class EquipmentClassify {
    private Integer equipmentClassifyId;

    private String equipmentClassifyManufacturer;

    private String equipmentClassifyEquipmentNumber;

    private String equipmentClassifyEquipmentSize;

    private String equipmentClassifyName;

    private Integer equipmentClassifyRow;

    private Integer equipmentClassifyLine;

    private Date equipmentClassifyCreateTime;

    private Date equipmentClassifyUpdateTime;

    public Integer getEquipmentClassifyId() {
        return equipmentClassifyId;
    }

    public void setEquipmentClassifyId(Integer equipmentClassifyId) {
        this.equipmentClassifyId = equipmentClassifyId;
    }

    public String getEquipmentClassifyManufacturer() {
        return equipmentClassifyManufacturer;
    }

    public void setEquipmentClassifyManufacturer(String equipmentClassifyManufacturer) {
        this.equipmentClassifyManufacturer = equipmentClassifyManufacturer == null ? null : equipmentClassifyManufacturer.trim();
    }

    public String getEquipmentClassifyEquipmentNumber() {
        return equipmentClassifyEquipmentNumber;
    }

    public void setEquipmentClassifyEquipmentNumber(String equipmentClassifyEquipmentNumber) {
        this.equipmentClassifyEquipmentNumber = equipmentClassifyEquipmentNumber == null ? null : equipmentClassifyEquipmentNumber.trim();
    }

    public String getEquipmentClassifyEquipmentSize() {
        return equipmentClassifyEquipmentSize;
    }

    public void setEquipmentClassifyEquipmentSize(String equipmentClassifyEquipmentSize) {
        this.equipmentClassifyEquipmentSize = equipmentClassifyEquipmentSize == null ? null : equipmentClassifyEquipmentSize.trim();
    }

    public String getEquipmentClassifyName() {
        return equipmentClassifyName;
    }

    public void setEquipmentClassifyName(String equipmentClassifyName) {
        this.equipmentClassifyName = equipmentClassifyName == null ? null : equipmentClassifyName.trim();
    }

    public Integer getEquipmentClassifyRow() {
        return equipmentClassifyRow;
    }

    public void setEquipmentClassifyRow(Integer equipmentClassifyRow) {
        this.equipmentClassifyRow = equipmentClassifyRow;
    }

    public Integer getEquipmentClassifyLine() {
        return equipmentClassifyLine;
    }

    public void setEquipmentClassifyLine(Integer equipmentClassifyLine) {
        this.equipmentClassifyLine = equipmentClassifyLine;
    }

    public Date getEquipmentClassifyCreateTime() {
        return equipmentClassifyCreateTime;
    }

    public void setEquipmentClassifyCreateTime(Date equipmentClassifyCreateTime) {
        this.equipmentClassifyCreateTime = equipmentClassifyCreateTime;
    }

    public Date getEquipmentClassifyUpdateTime() {
        return equipmentClassifyUpdateTime;
    }

    public void setEquipmentClassifyUpdateTime(Date equipmentClassifyUpdateTime) {
        this.equipmentClassifyUpdateTime = equipmentClassifyUpdateTime;
    }
}