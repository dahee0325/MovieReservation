package com.project.movie.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.movie.dao.MovieDao;



	@Service("reviewDeleteService")
	public class ReviewDeleteService {
			// 자동 메퍼를 이용해서 생성할 dao 
			private MovieDao dao;
			// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
			@Autowired
			private SqlSessionTemplate template;
			
			public int delete(int midx) {
				dao = template.getMapper(MovieDao.class);
				
				
				return dao.ReviewDelete(midx);
				
			}
	
}
