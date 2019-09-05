package com.project.movie.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.movie.dao.MovieDao;
import com.project.movie.domain.Review;
import com.project.movie.domain.ReviewInfo;

@Service("reviewAddService")
public class ReviewAddService {
		
	// 자동 메퍼를 이용해서 생성할 dao 
			private MovieDao dao;
			// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
			@Autowired
			private SqlSessionTemplate template;
			
			public int reviewAdd(Review reviewInfo) {
				dao = template.getMapper(MovieDao.class);
				int resultCnt = 0;
				
				resultCnt = dao.ReviewAdd(reviewInfo);
				
				return resultCnt;
			}
	
}
