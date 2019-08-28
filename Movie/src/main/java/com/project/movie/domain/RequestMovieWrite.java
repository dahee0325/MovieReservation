package com.project.movie.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;


public class RequestMovieWrite {
	
	private String mName;
	private String mCont;
	private String mPer;
	private String mDate;
	private MultipartFile mPhoto;
	
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmCont() {
		return mCont;
	}
	public void setmCont(String mCont) {
		this.mCont = mCont;
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
	public MultipartFile getmPhoto() {
		return mPhoto;
	}
	public void setmPhoto(MultipartFile mPhoto) {
		this.mPhoto = mPhoto;
	}
	@Override
	public String toString() {
		return "RequestMovieWrite [mName=" + mName + ", mCont=" + mCont + ", mPer=" + mPer + ", mDate=" + mDate
				+ ", mPhoto=" + mPhoto + "]";
	}
	
	public MovieInfo toMovieInfo() {
		MovieInfo info = new MovieInfo();
		
		info.setmName(mName);
		info.setmCont(mCont);
		info.setmPer(mPer);
		
		String[] ar = mDate.split("-");
		//info.setmDate(new Date (Integer.parseInt(ar[0]),Integer.parseInt(ar[1]),Integer.parseInt(ar[2])));
		info.setmDate(mDate);
		
		return info;
		
	}
	
	
	
	
}
