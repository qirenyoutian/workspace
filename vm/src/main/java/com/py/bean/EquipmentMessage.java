package com.py.bean;

import java.util.Date;
import java.util.List;

public class EquipmentMessage {
    private Integer equipmentMessageId;

    private Integer equipmentMessageEquipmentId;

    private String equipmentMessageSignalStrength;

    private Double equipmentMessageCpuOccupy;

    private Integer equipmentMessageMemoryOccupy;

    private String equipmentMessageMemorySize;

    private String equipmentMessageSdCapacity;

    private Integer equipmentMessageBatteryStatus;

    private Integer equipmentMessageBatteryCapacity;

    private Integer equipmentMessageSimStatus;

    private String equipmentMessageImeiInformation;

    private String equipmentMessageIpAddress;

    private String equipmentMessageWlanmacAddress;

    private String equipmentMessageBluetoothAddress;

    private String equipmentMessageSerialNumber;

    private String equipmentMessageVersions;

    private Date equipmentMessageCreateTime;

    private Date equipmentMessageChangeTime;

    private List<Equipment> eqList;
    
    public Integer getEquipmentMessageId() {
        return equipmentMessageId;
    }

    public void setEquipmentMessageId(Integer equipmentMessageId) {
        this.equipmentMessageId = equipmentMessageId;
    }

    public Integer getEquipmentMessageEquipmentId() {
        return equipmentMessageEquipmentId;
    }

    public void setEquipmentMessageEquipmentId(Integer equipmentMessageEquipmentId) {
        this.equipmentMessageEquipmentId = equipmentMessageEquipmentId;
    }

    public String getEquipmentMessageSignalStrength() {
        return equipmentMessageSignalStrength;
    }

    public void setEquipmentMessageSignalStrength(String equipmentMessageSignalStrength) {
        this.equipmentMessageSignalStrength = equipmentMessageSignalStrength == null ? null : equipmentMessageSignalStrength.trim();
    }

    public Double getEquipmentMessageCpuOccupy() {
        return equipmentMessageCpuOccupy;
    }

    public void setEquipmentMessageCpuOccupy(Double equipmentMessageCpuOccupy) {
        this.equipmentMessageCpuOccupy = equipmentMessageCpuOccupy;
    }

    public Integer getEquipmentMessageMemoryOccupy() {
        return equipmentMessageMemoryOccupy;
    }

    public void setEquipmentMessageMemoryOccupy(Integer equipmentMessageMemoryOccupy) {
        this.equipmentMessageMemoryOccupy = equipmentMessageMemoryOccupy;
    }

    public String getEquipmentMessageMemorySize() {
        return equipmentMessageMemorySize;
    }

    public void setEquipmentMessageMemorySize(String equipmentMessageMemorySize) {
        this.equipmentMessageMemorySize = equipmentMessageMemorySize == null ? null : equipmentMessageMemorySize.trim();
    }

    public String getEquipmentMessageSdCapacity() {
        return equipmentMessageSdCapacity;
    }

    public void setEquipmentMessageSdCapacity(String equipmentMessageSdCapacity) {
        this.equipmentMessageSdCapacity = equipmentMessageSdCapacity == null ? null : equipmentMessageSdCapacity.trim();
    }

    public Integer getEquipmentMessageBatteryStatus() {
        return equipmentMessageBatteryStatus;
    }

    public void setEquipmentMessageBatteryStatus(Integer equipmentMessageBatteryStatus) {
        this.equipmentMessageBatteryStatus = equipmentMessageBatteryStatus;
    }

    public Integer getEquipmentMessageBatteryCapacity() {
        return equipmentMessageBatteryCapacity;
    }

    public void setEquipmentMessageBatteryCapacity(Integer equipmentMessageBatteryCapacity) {
        this.equipmentMessageBatteryCapacity = equipmentMessageBatteryCapacity;
    }

    public Integer getEquipmentMessageSimStatus() {
        return equipmentMessageSimStatus;
    }

    public void setEquipmentMessageSimStatus(Integer equipmentMessageSimStatus) {
        this.equipmentMessageSimStatus = equipmentMessageSimStatus;
    }

    public String getEquipmentMessageImeiInformation() {
        return equipmentMessageImeiInformation;
    }

    public void setEquipmentMessageImeiInformation(String equipmentMessageImeiInformation) {
        this.equipmentMessageImeiInformation = equipmentMessageImeiInformation == null ? null : equipmentMessageImeiInformation.trim();
    }

    public String getEquipmentMessageIpAddress() {
        return equipmentMessageIpAddress;
    }

    public void setEquipmentMessageIpAddress(String equipmentMessageIpAddress) {
        this.equipmentMessageIpAddress = equipmentMessageIpAddress == null ? null : equipmentMessageIpAddress.trim();
    }

    public String getEquipmentMessageWlanmacAddress() {
        return equipmentMessageWlanmacAddress;
    }

    public void setEquipmentMessageWlanmacAddress(String equipmentMessageWlanmacAddress) {
        this.equipmentMessageWlanmacAddress = equipmentMessageWlanmacAddress == null ? null : equipmentMessageWlanmacAddress.trim();
    }

    public String getEquipmentMessageBluetoothAddress() {
        return equipmentMessageBluetoothAddress;
    }

    public void setEquipmentMessageBluetoothAddress(String equipmentMessageBluetoothAddress) {
        this.equipmentMessageBluetoothAddress = equipmentMessageBluetoothAddress == null ? null : equipmentMessageBluetoothAddress.trim();
    }

    public String getEquipmentMessageSerialNumber() {
        return equipmentMessageSerialNumber;
    }

    public void setEquipmentMessageSerialNumber(String equipmentMessageSerialNumber) {
        this.equipmentMessageSerialNumber = equipmentMessageSerialNumber == null ? null : equipmentMessageSerialNumber.trim();
    }

    public String getEquipmentMessageVersions() {
        return equipmentMessageVersions;
    }

    public void setEquipmentMessageVersions(String equipmentMessageVersions) {
        this.equipmentMessageVersions = equipmentMessageVersions == null ? null : equipmentMessageVersions.trim();
    }

    public Date getEquipmentMessageCreateTime() {
        return equipmentMessageCreateTime;
    }

    public void setEquipmentMessageCreateTime(Date equipmentMessageCreateTime) {
        this.equipmentMessageCreateTime = equipmentMessageCreateTime;
    }

    public Date getEquipmentMessageChangeTime() {
        return equipmentMessageChangeTime;
    }

    public void setEquipmentMessageChangeTime(Date equipmentMessageChangeTime) {
        this.equipmentMessageChangeTime = equipmentMessageChangeTime;
    }

	public List<Equipment> getEqList() {
		return eqList;
	}

	public void setEqList(List<Equipment> eqList) {
		this.eqList = eqList;
	}
    
}