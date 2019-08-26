package com.project.movie.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.movie.dao.MovieDao;
import com.project.movie.domain.MovieInfo;

@Service("movieInfoService")
public class MovieInfoService {
	// 자동 메퍼를 이용해서 생성할 dao 
	private MovieDao dao;
	// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
	@Autowired
	private SqlSessionTemplate template;
		
	public MovieInfo getMovieInfo(int midx) {
		dao = template.getMapper(MovieDao.class);
		MovieInfo movie = dao.MovieInfo(midx);
		
		
		return movie;
	}
		
	
}
