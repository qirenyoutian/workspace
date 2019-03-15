package com.py.bean;

import java.util.List;

public class RouteInvoice extends Route{
	private List<SingleCarRecord> singleCarRecords;

	public List<SingleCarRecord> getSingleCarRecords() {
		return singleCarRecords;
	}

	public void setSingleCarRecords(List<SingleCarRecord> singleCarRecords) {
		this.singleCarRecords = singleCarRecords;
	}
}
