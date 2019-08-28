package com.project.movie.domain;

import java.util.Date;

public class ReviewInfo {
	private int midx;    // 영화 코드
	private String mName; // 영화제목
	private String rCont;  // 한줄평
	private String rDate;   // 작성일
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getrCont() {
		return rCont;
	}
	public void setrCont(String rCont) {
		this.rCont = rCont;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	@Override
	public String toString() {
		return "ReviewInfo [midx=" + midx + ", mName=" + mName + ", rCont=" + rCont + ", rDate=" + rDate + "]";
	}
	
	
	
	
}
