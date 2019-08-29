package com.project.reserve.manager.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.reserve.manager.dao.ManagerDaoInterface;
import com.project.reserve.manager.domain.ManagerCinemaData;
import com.project.reserve.manager.domain.MovieData;

@Service("managerService")
public class ManagerService {

	private ManagerDaoInterface dao;

	@Autowired
	private SqlSessionTemplate template;
	
	public List<MovieData> getMovieList() {
		
		dao = template.getMapper(ManagerDaoInterface.class);

		List<MovieData> list = dao.movieList();

		return list;
		
	}

	public List<ManagerCinemaData> getCinemaList() {
		
		dao = template.getMapper(ManagerDaoInterface.class);

		List<ManagerCinemaData> list = dao.cinemaList();

		return list;
		
	}
	
}
