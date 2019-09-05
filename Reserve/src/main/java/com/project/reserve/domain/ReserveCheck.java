package com.project.reserve.domain;

import java.util.List;

public class ReserveCheck {

	private int tidx;
	private int seatCnt;
	private int reserveTotalCnt;
	private List<Integer> sidx;
	
	public int getTidx() {
		return tidx;
	}
	public void setTidx(int tidx) {
		this.tidx = tidx;
	}
	public int getSeatCnt() {
		return seatCnt;
	}
	public void setSeatCnt(int seatCnt) {
		this.seatCnt = seatCnt;
	}
	public List<Integer> getSidx() {
		return sidx;
	}
	public void setSidx(List<Integer> sidx) {
		this.sidx = sidx;
	}
	public int getReserveTotalCnt() {
		return reserveTotalCnt;
	}
	public void setReserveTotalCnt(int reserveTotalCnt) {
		this.reserveTotalCnt = reserveTotalCnt;
	}	
	
	
}
