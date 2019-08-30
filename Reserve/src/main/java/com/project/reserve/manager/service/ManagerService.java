package com.project.reserve.manager.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.reserve.manager.dao.ManagerDaoInterface;
import com.project.reserve.manager.domain.ManagerCinemaData;
import com.project.reserve.manager.domain.ManagerMovieData;
import com.project.reserve.manager.domain.ManagerShowMovieData;

@Service("managerService")
public class ManagerService {

	private ManagerDaoInterface dao;

	@Autowired
	private SqlSessionTemplate template;
	
	public List<ManagerMovieData> getMovieList() {
		
		dao = template.getMapper(ManagerDaoInterface.class);

		List<ManagerMovieData> list = dao.movieList();

		return list;
		
	}

	public List<ManagerCinemaData> getCinemaList() {
		
		dao = template.getMapper(ManagerDaoInterface.class);

		List<ManagerCinemaData> list = dao.cinemaList();

		return list;
		
	}
	
	public int getCinemaSeatCnt(int cidx) {
		
		dao = template.getMapper(ManagerDaoInterface.class);
		
		int seatCnt = dao.seatCnt(cidx);
		
		return seatCnt;
		
	}
	
	public int getMovieRunTime(int midx) {
		
		dao = template.getMapper(ManagerDaoInterface.class);
		
		int runTime = dao.runTime(midx);
		
		return runTime;
		
	}
	
	public int InsertMovie(ManagerShowMovieData mdate) {
		
		dao = template.getMapper(ManagerDaoInterface.class);
		
		int cnt = dao.insertMovie(mdate);
		
		return cnt;
		
	}
	
	
	
}
