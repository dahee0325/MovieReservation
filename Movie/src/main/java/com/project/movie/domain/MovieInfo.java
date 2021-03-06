package com.project.movie.domain;

import java.util.Date;

public class MovieInfo {
	private int midx;    // 영화 코드
	private String mName; // 영화제목
	private String mCont;  // 영화 줄거리
	private String mPer; // 영화감독/ 배우
	private String mDate;  // 개봉날짜
	private String mPhoto;  // 영화 포스터
	private int mRunTime; // 상영시간
	
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmPer() {
		return mPer;
	}
	public void setmPer(String mPer) {
		this.mPer = mPer;
	}
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	
	public String getmCont() {
		return mCont;
	}
	public void setmCont(String mCont) {
		this.mCont = mCont;
	}
	public String getmPhoto() {
		return mPhoto;
	}
	public void setmPhoto(String mPhoto) {
		this.mPhoto = mPhoto;
	}
	public int getmRunTime() {
		return mRunTime;
	}
	public void setmRunTime(int mRunTime) {
		this.mRunTime = mRunTime;
	}
	@Override
	public String toString() {
		return "MovieInfo [midx=" + midx + ", mName=" + mName + ", mCont=" + mCont + ", mPer=" + mPer + ", mDate="
				+ mDate + ", mPhoto=" + mPhoto + ", mRunTime=" + mRunTime + "]";
	}
	
	
	
	
	
	
	
	
	
}
