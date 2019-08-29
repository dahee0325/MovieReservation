package com.project.reserve.domain;

public class ReserveData {

	private int ridx;//예약번호
	private int idx;//회원번호
	private int sidx;//좌석번호
	private String rDate;//예약한시간날짜
	private int midx;//영화번호
	private int cidx;//상영관번호
	private String tDate;//예약날짜
	private String tTime;//예약시간
	private String totalTime;
	
	
	public ReserveData () {}


	public ReserveData(int ridx, int idx, int sidx, String rDate, int midx, int cidx, String tDate, String tTime,
			String totalTime) {
		super();
		this.ridx = ridx;
		this.idx = idx;
		this.sidx = sidx;
		this.rDate = rDate;
		this.midx = midx;
		this.cidx = cidx;
		this.tDate = tDate;
		this.tTime = tTime;
		this.totalTime = totalTime;
	}


	public int getRidx() {
		return ridx;
	}


	public void setRidx(int ridx) {
		this.ridx = ridx;
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


	public String getrDate() {
		return rDate;
	}


	public void setrDate(String rDate) {
		this.rDate = rDate;
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


	public String gettDate() {
		return tDate;
	}


	public void settDate(String tDate) {
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


	
	
	
}
