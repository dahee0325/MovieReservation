package com.project.reserve.domain;

import java.sql.Date;
import java.sql.Time;

public class ListData {

	private int tidx;
	private int midx;
	private int cidx;
	private Date cDate;
	private Time cTime;
	private Time runningTime;
	private Time totalTime;
	
	public ListData() {}
	
	public ListData(int tidx, int midx, int cidx, Date cDate, Time cTime, Time runningTime, Time totalTime) {
		super();
		this.tidx = tidx;
		this.midx = midx;
		this.cidx = cidx;
		this.cDate = cDate;
		this.cTime = cTime;
		this.runningTime = runningTime;
		this.totalTime = totalTime;
	}
	
	public int getTidx() {
		return tidx;
	}
	public void setTidx(int tidx) {
		this.tidx = tidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public Time getcTime() {
		return cTime;
	}
	public void setcTime(Time cTime) {
		this.cTime = cTime;
	}
	public Time getRunningTime() {
		return runningTime;
	}
	public void setRunningTime(Time runningTime) {
		this.runningTime = runningTime;
	}

	public Time getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(Time totalTime) {
		this.totalTime = totalTime;
	}
	
	
	
}
