package com.project.movie.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.movie.dao.MovieDao;
import com.project.movie.domain.MovieInfo;

@Service("movieListService")
public class MovieListService {
	
	// 자동 메퍼를 이용해서 생성할 dao 
	private MovieDao dao;
	// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
	@Autowired
	private SqlSessionTemplate template;
		
	public List<MovieInfo> getMovieList() {
		dao = template.getMapper(MovieDao.class);
		List<MovieInfo> movieList = dao.MovieList();
		
		
		return movieList;
	}
		
	
}
