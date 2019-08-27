package com.project.reserve.domain;

public class ListData {

	private int tidx;
	private int midx;
	private int cidx;
	private int cDate;
	private String cTime;
	private String totalTime;
	
	public ListData() {}
	
	public ListData(int tidx, int midx, int cidx, int cDate, String cTime, String totalTime) {
		super();
		this.tidx = tidx;
		this.midx = midx;
		this.cidx = cidx;
		this.cDate = cDate;
		this.cTime = cTime;
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
	public int getcDate() {
		return cDate;
	}
	public void setcDate(int cDate) {
		this.cDate = cDate;
	}
	public String getcTime() {
		return cTime;
	}
	public void setcTime(String cTime) {
		this.cTime = cTime;
	}

	public String getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}
	
	
	
}
