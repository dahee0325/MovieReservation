package com.project.reserve.domain;

public class ReserveData {

	private int idx;
	private int sidx;
	private String tDate;
	private int midx;
	private int cidx;
	private String cDate;
	private String cTime;
	private String totalTime;
	
	
	public ReserveData () {}	
	
	public ReserveData(int idx, int sidx, String tDate, int midx, int cidx, String cDate, String cTime,
			String totalTime) {
		super();
		this.idx = idx;
		this.sidx = sidx;
		this.tDate = tDate;
		this.midx = midx;
		this.cidx = cidx;
		this.cDate = cDate;
		this.cTime = cTime;
		this.totalTime = totalTime;
	}
	
	public int getIdx() {
		return idx;
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getSidx() {
		return sidx;
	}
	public void setSidx(int sidx) {
		this.sidx = sidx;
	}
	public String gettDate() {
		return tDate;
	}
	public void settDate(String tDate) {
		this.tDate = tDate;
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
	public String getcDate() {
		return cDate;
	}
	public void setcDate(String cDate) {
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
