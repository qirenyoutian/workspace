package com.py.bean;

public class Authentication {
	private Integer status;
	private String path;
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Authentication(Integer status, String path) {
		super();
		this.status = status;
		this.path = path;
	}

	public Authentication() {
		super();
	}
	
}
