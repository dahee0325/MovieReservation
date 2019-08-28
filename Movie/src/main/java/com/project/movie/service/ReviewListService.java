package com.project.movie.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.movie.dao.MovieDao;
import com.project.movie.domain.MovieInfo;
import com.project.movie.domain.ReviewInfo;

@Service("reviewListService")
public class ReviewListService {
		// 자동 메퍼를 이용해서 생성할 dao 
		private MovieDao dao;
		// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
		@Autowired
		private SqlSessionTemplate template;
			
		public List<ReviewInfo> getreviewList(int midx) {
			
			dao = template.getMapper(MovieDao.class);
			
			List<ReviewInfo> reviewList = dao.ReviewList(midx);
			
			
			return reviewList;
		}
		
		public List<ReviewInfo> getreviewAllList(){
			
			dao = template.getMapper(MovieDao.class);
			
			List<ReviewInfo> reviewList = dao.ReviewAllList();
			
			
			return reviewList;
		}
		
}
