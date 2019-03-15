package com.py.bean;

public class Camera {
    private Integer cameraId;

    private String cameraName;

    private String cameraIp;

    private Integer cameraMemTotal;

    private Integer cameraMemUsed;

    private Integer cameraMemFree;

    private Double cameraCpuRate;

    private Integer cameraApp;

    private String cameraRTMP;

    private Double cameraLng;

    private Double cameraLat;

    private Integer cameraStatus;

    private Integer cameraRouteId;

    public Integer getCameraId() {
        return cameraId;
    }

    public void setCameraId(Integer cameraId) {
        this.cameraId = cameraId;
    }

    public String getCameraName() {
        return cameraName;
    }

    public void setCameraName(String cameraName) {
        this.cameraName = cameraName == null ? null : cameraName.trim();
    }

    public String getCameraIp() {
        return cameraIp;
    }

    public void setCameraIp(String cameraIp) {
        this.cameraIp = cameraIp == null ? null : cameraIp.trim();
    }

    public Integer getCameraMemTotal() {
        return cameraMemTotal;
    }

    public void setCameraMemTotal(Integer cameraMemTotal) {
        this.cameraMemTotal = cameraMemTotal;
    }

    public Integer getCameraMemUsed() {
        return cameraMemUsed;
    }

    public void setCameraMemUsed(Integer cameraMemUsed) {
        this.cameraMemUsed = cameraMemUsed;
    }

    public Integer getCameraMemFree() {
        return cameraMemFree;
    }

    public void setCameraMemFree(Integer cameraMemFree) {
        this.cameraMemFree = cameraMemFree;
    }

    public Double getCameraCpuRate() {
        return cameraCpuRate;
    }

    public void setCameraCpuRate(Double cameraCpuRate) {
        this.cameraCpuRate = cameraCpuRate;
    }

    public Integer getCameraApp() {
        return cameraApp;
    }

    public void setCameraApp(Integer cameraApp) {
        this.cameraApp = cameraApp;
    }

    public String getCameraRTMP() {
        return cameraRTMP;
    }

    public void setCameraRTMP(String cameraRTMP) {
        this.cameraRTMP = cameraRTMP == null ? null : cameraRTMP.trim();
    }

    public Double getCameraLng() {
        return cameraLng;
    }

    public void setCameraLng(Double cameraLng) {
        this.cameraLng = cameraLng;
    }

    public Double getCameraLat() {
        return cameraLat;
    }

    public void setCameraLat(Double cameraLat) {
        this.cameraLat = cameraLat;
    }

    public Integer getCameraStatus() {
        return cameraStatus;
    }

    public void setCameraStatus(Integer cameraStatus) {
        this.cameraStatus = cameraStatus;
    }

    public Integer getCameraRouteId() {
        return cameraRouteId;
    }

    public void setCameraRouteId(Integer cameraRouteId) {
        this.cameraRouteId = cameraRouteId;
    }

	@Override
	public String toString() {
		return "Camera [cameraId=" + cameraId + ", cameraName=" + cameraName + ", cameraIp=" + cameraIp
				+ ", cameraMemTotal=" + cameraMemTotal + ", cameraMemUsed=" + cameraMemUsed + ", cameraMemFree="
				+ cameraMemFree + ", cameraCpuRate=" + cameraCpuRate + ", cameraApp=" + cameraApp + ", cameraRTMP="
				+ cameraRTMP + ", cameraLng=" + cameraLng + ", cameraLat=" + cameraLat + ", cameraStatus="
				+ cameraStatus + ", cameraRouteId=" + cameraRouteId + "]";
	}
    
}