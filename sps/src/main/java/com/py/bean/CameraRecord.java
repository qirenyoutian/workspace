package com.py.bean;

import java.util.List;

public class CameraRecord extends Camera{
	private List<TruckSpace> truckSpaces;

	public List<TruckSpace> getTruckSpaces() {
		return truckSpaces;
	}

	public void setTruckSpaces(List<TruckSpace> truckSpaces) {
		this.truckSpaces = truckSpaces;
	}
	
}