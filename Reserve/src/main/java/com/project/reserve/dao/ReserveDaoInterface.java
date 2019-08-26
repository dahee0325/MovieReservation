package com.project.reserve.dao;

import java.sql.Time;
import java.util.List;

import com.project.reserve.domain.ListData;

public interface ReserveDaoInterface {

	//전체리스트
	public List<ListData> allList();
	
	//극장리스트
	public List<ListData> cinemaList(int cidx);
	
	//날짜리스트
	public List<ListData> dateList(int cDate);
	
	//영화/시간리스트
	public List<ListData> movieList(int midx, Time totalTime);
	
	
}
