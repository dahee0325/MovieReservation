package com.project.reserve.manager.dao;

import java.util.List;

import com.project.reserve.manager.domain.ManagerCinemaData;
import com.project.reserve.manager.domain.MovieData;

public interface ManagerDaoInterface {

	//극장정보 리스트
	public  List<ManagerCinemaData> cinemaList();
	
	//영화정보 리스트
	public  List<MovieData> movieList();
	
}
