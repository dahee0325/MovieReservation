package com.project.reserve.manager.domain;

public class ManagerShowMovieData {

	private int midx;
	private int cidx;
	private int tDate;
	private String tTime;
	private int mRunTime;
	private int cSeatCnt;
	
	public ManagerShowMovieData() {}
	
	public ManagerShowMovieData(int midx, int cidx, int tDate, String tTime, int mRunTime, int cSeatCnt) {
		super();
		this.midx = midx;
		this.cidx = cidx;
		this.tDate = tDate;
		this.tTime = tTime;
		this.mRunTime = mRunTime;
		this.cSeatCnt = cSeatCnt;
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
	public int gettDate() {
		return tDate;
	}
	public void settDate(int tDate) {
		this.tDate = tDate;
	}
	public String gettTime() {
		return tTime;
	}
	public void settTime(String tTime) {
		this.tTime = tTime;
	}
	public int getmRunTime() {
		return mRunTime;
	}
	public void setmRunTime(int mRunTime) {
		this.mRunTime = mRunTime;
	}
	public int getcSeatCnt() {
		return cSeatCnt;
	}
	public void setcSeatCnt(int cSeatCnt) {
		this.cSeatCnt = cSeatCnt;
	}
	
	
	
}
