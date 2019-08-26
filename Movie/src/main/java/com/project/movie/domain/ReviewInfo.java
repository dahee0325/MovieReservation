package com.project.movie.domain;

import java.util.Date;

public class ReviewInfo {
	private int midx;    // 영화 코드
	private int idx;    // 회원 코드
	private String rCont;  // 한줄평
	private Date rDate;   // 작성일
	
	
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getrCont() {
		return rCont;
	}
	public void setrCont(String rCont) {
		this.rCont = rCont;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	
	@Override
	public String toString() {
		return "ReviewInfo [midx=" + midx + ", idx=" + idx + ", rCont=" + rCont + ", rDate=" + rDate + "]";
	}
	
	
	
	
	
}
