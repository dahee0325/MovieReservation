package com.project.reserve.dao;

import java.sql.Time;
import java.util.List;

import com.project.reserve.domain.ListData;

public interface ReserveDaoInterface {

	//극장 전체 리스트
	public List<ListData> cinemaList();
	
	//날짜 전체 리스트
	public List<ListData> dateList();
	
	//영화/시간 전체 리스트
	public List<ListData> movieList();
	
	
}
