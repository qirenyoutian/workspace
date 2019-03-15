package com.py.bean;

public class CameraStr {
    private String cameraIp;

    private Integer cameraMemTotal;

    private Integer cameraMemUsed;

    private Integer cameraMemFree;

    private Double cameraCpuRate;

    private Integer cameraApp;

    private String cameraRTMP;

    private String cameraLng;

    private String cameraLat;


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

    public String getCameraLng() {
        return cameraLng;
    }

    public void setCameraLng(String cameraLng) {
        this.cameraLng = cameraLng;
    }

    public String getCameraLat() {
        return cameraLat;
    }

    public void setCameraLat(String cameraLat) {
        this.cameraLat = cameraLat;
    }

	@Override
	public String toString() {
		return "Camera [cameraIp=" + cameraIp
				+ ", cameraMemTotal=" + cameraMemTotal + ", cameraMemUsed=" + cameraMemUsed + ", cameraMemFree="
				+ cameraMemFree + ", cameraCpuRate=" + cameraCpuRate + ", cameraApp=" + cameraApp + ", cameraRTMP="
				+ cameraRTMP + ", cameraLng=" + cameraLng + ", cameraLat=" + cameraLat + "]";
	}
    
}