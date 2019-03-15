package com.py.bean;

import java.util.Date;

public class ClockinTime {
    private Integer clockinTimeId;

    private Date clockinTimeOfficetime;

    private Date clockinTimeClosingtime;

    public Integer getClockinTimeId() {
        return clockinTimeId;
    }

    public void setClockinTimeId(Integer clockinTimeId) {
        this.clockinTimeId = clockinTimeId;
    }

    public Date getClockinTimeOfficetime() {
        return clockinTimeOfficetime;
    }

    public void setClockinTimeOfficetime(Date clockinTimeOfficetime) {
        this.clockinTimeOfficetime = clockinTimeOfficetime;
    }

    public Date getClockinTimeClosingtime() {
        return clockinTimeClosingtime;
    }

    public void setClockinTimeClosingtime(Date clockinTimeClosingtime) {
        this.clockinTimeClosingtime = clockinTimeClosingtime;
    }
}