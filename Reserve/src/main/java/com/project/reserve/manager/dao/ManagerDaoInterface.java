package com.project.reserve.manager.dao;

import java.util.List;

import com.project.reserve.manager.domain.ManagerCinemaData;
import com.project.reserve.manager.domain.ManagerMovieData;
import com.project.reserve.manager.domain.ManagerShowMovieData;

public interface ManagerDaoInterface {

	//극장정보 리스트
	public List<ManagerCinemaData> cinemaList();
	
	//영화정보 리스트
	public List<ManagerMovieData> movieList();
	
	//극장에 따른 좌석개수
	public int seatCnt(int cidx);
	
	//영화에 따른 러닝타임
	public int runTime(int midx);
	
	//상영영화추가
	public int insertMovie(ManagerShowMovieData mDate);
	
}
