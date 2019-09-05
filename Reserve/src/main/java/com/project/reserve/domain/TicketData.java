package com.project.reserve.domain;

public class TicketData {

	private int tidx;
	private int idx;
	private int sidx;

	public TicketData() {}
	
	
	public TicketData(int tidx, int idx, int sidx) {
		super();
		this.tidx = tidx;
		this.idx = idx;
		this.sidx = sidx;
	}

	public int getTidx() {
		return tidx;
	}
	public void setTidx(int tidx) {
		this.tidx = tidx;
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
	
}
