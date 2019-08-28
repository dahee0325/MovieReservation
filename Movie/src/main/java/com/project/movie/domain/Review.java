package com.project.movie.domain;

public class Review {
	private int midx;
	private String mName;
	private String rCont;
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
	@Override
	public String toString() {
		return "Review [midx=" + midx + ", mName=" + mName + ", rCont=" + rCont + "]";
	}
	
	
	
	
}
