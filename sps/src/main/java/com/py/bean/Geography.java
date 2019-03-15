package com.py.bean;

public class Geography {
	private Double log_left;
	private Double log_right;
	private Double lat_left;
	private Double lat_right;
	private Integer status;
	public Double getLog_left() {
		return log_left;
	}
	public void setLog_left(Double log_left) {
		this.log_left = log_left;
	}
	public Double getLog_right() {
		return log_right;
	}
	public void setLog_right(Double log_right) {
		this.log_right = log_right;
	}
	public Double getLat_left() {
		return lat_left;
	}
	public void setLat_left(Double lat_left) {
		this.lat_left = lat_left;
	}
	public Double getLat_right() {
		return lat_right;
	}
	public void setLat_right(Double lat_right) {
		this.lat_right = lat_right;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Geography(Double log_left, Double log_right, Double lat_left, Double lat_right, Integer status) {
		super();
		this.log_left = log_left;
		this.log_right = log_right;
		this.lat_left = lat_left;
		this.lat_right = lat_right;
		this.status = status;
	}
	public Geography() {
		super();
	}
	
}
