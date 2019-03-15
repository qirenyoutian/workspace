package com.py.bean;

import java.sql.Date;

public class UserMonthCard {
	private String monthCardName;
	private String routeName;
	private Date startTime;
	private Date endTime;
	public String getMonthCardName() {
		return monthCardName;
	}
	public void setMonthCardName(String monthCardName) {
		this.monthCardName = monthCardName;
	}
	public String getRouteName() {
		return routeName;
	}
	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
}
