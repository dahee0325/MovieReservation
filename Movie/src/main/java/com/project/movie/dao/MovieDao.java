package com.project.movie.dao;

import java.util.List;

import com.project.movie.domain.MovieInfo;
import com.project.movie.domain.ReviewInfo;

public interface MovieDao {
	
	// 1.  영화 정보 리스트 서비스  MovieList
	public List<MovieInfo> MovieList();
	//2.  한줄평 리스트 서비스 ( 영화코드에 맟춰서 보여지도록)  ReviewList
	public List<ReviewInfo> ReviewList(int midx);
	//3.  한줄평 추가 ReviewAdd 
	public int ReviewAdd(String uId);
	//4.  한줄평 삭제 ReviewDelete
	public int ReviewDelete(String uId);
	//5.  영화 상세 정보
	public MovieInfo MovieInfo(int midx);
	//6. 
	
}
