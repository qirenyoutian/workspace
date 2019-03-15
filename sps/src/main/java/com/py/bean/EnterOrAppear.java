package com.py.bean;

public class EnterOrAppear {
	private String camera_ip;
	private String truck_space;
	private String routeName;
	private String license_plate;
	private String triggerDate;
	private Integer type;
	private String photograph1;
	private String photograph2;
	private String license_plate_image;
	private String video;
	public String getCamera_ip() {
		return camera_ip;
	}
	public void setCamera_ip(String camera_ip) {
		this.camera_ip = camera_ip;
	}
	public String getTruck_space() {
		return truck_space;
	}
	public void setTruck_space(String truck_space) {
		this.truck_space = truck_space;
	}
	public String getRouteName() {
		return routeName;
	}
	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}
	public String getLicense_plate() {
		return license_plate;
	}
	public void setLicense_plate(String license_plate) {
		this.license_plate = license_plate;
	}
	public String getTriggerDate() {
		return triggerDate;
	}
	public void setTriggerDate(String triggerDate) {
		this.triggerDate = triggerDate;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getPhotograph1() {
		return photograph1;
	}
	public void setPhotograph1(String photograph1) {
		this.photograph1 = photograph1;
	}
	public String getPhotograph2() {
		return photograph2;
	}
	public void setPhotograph2(String photograph2) {
		this.photograph2 = photograph2;
	}
	public String getLicense_plate_image() {
		return license_plate_image;
	}
	public void setLicense_plate_image(String license_plate_image) {
		this.license_plate_image = license_plate_image;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	@Override
	public String toString() {
		return "EnterOrAppear [camera_ip=" + camera_ip + ", truck_space=" + truck_space + ", routeName=" + routeName
				+ ", license_plate=" + license_plate + ", triggerDate=" + triggerDate + ", type=" + type
				+ ", photograph1=" + photograph1 + ", photograph2=" + photograph2 + ", license_plate_image="
				+ license_plate_image + ", video=" + video + "]";
	}
	
}
