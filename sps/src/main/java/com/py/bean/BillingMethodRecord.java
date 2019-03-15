package com.py.bean;

import java.util.List;

public class BillingMethodRecord extends BillingMethod{
	private List<TimeQuantum> timeQuantums;

	public List<TimeQuantum> getTimeQuantums() {
		return timeQuantums;
	}

	public void setTimeQuantums(List<TimeQuantum> timeQuantums) {
		this.timeQuantums = timeQuantums;
	}
	
}
