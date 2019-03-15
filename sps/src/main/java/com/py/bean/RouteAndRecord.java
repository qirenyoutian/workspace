package com.py.bean;

import java.util.List;

public class RouteAndRecord  extends Route{
	
	private List<CameraExtend> cameraExtends;

	public List<CameraExtend> getCameraExtends() {
		return cameraExtends;
	}

	public void setCameraExtends(List<CameraExtend> cameraExtends) {
		this.cameraExtends = cameraExtends;
	}

}
