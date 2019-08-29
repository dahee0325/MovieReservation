package com.project.reserve.domain;

public class ListData {

	private int tidx;
	private int midx;
	private int cidx;
	private int tDate;
	private String tTime;
	private String totalTime;
	private int cSeatCnt;
	
	public ListData() {}

	public ListData(int tidx, int midx, int cidx, int tDate, String tTime, String totalTime, int cSeatCnt) {
		super();
		this.tidx = tidx;
		this.midx = midx;
		this.cidx = cidx;
		this.tDate = tDate;
		this.tTime = tTime;
		this.totalTime = totalTime;
		this.cSeatCnt = cSeatCnt;
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

	public String getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}

	public int getcSeatCnt() {
		return cSeatCnt;
	}

	public void setcSeatCnt(int cSeatCnt) {
		this.cSeatCnt = cSeatCnt;
	}
		
	
	
	
}
