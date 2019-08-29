package com.project.movie.dao;

import java.util.List;

import com.project.movie.domain.MovieInfo;
import com.project.movie.domain.RequestMovieWrite;
import com.project.movie.domain.Review;
import com.project.movie.domain.ReviewInfo;

public interface MovieDao {
	
	// 1.  영화 정보 리스트 서비스  MovieList
	public List<MovieInfo> MovieList();
	//2.  한줄평 리스트 서비스 ( 영화코드에 맟춰서 보여지도록)  ReviewList
	public List<ReviewInfo> ReviewList(int midx);
	//3.  한줄평 추가 ReviewAdd 
	public int ReviewAdd(Review reviewInfo);
	//4.  한줄평 삭제 ReviewDelete
	public int ReviewDelete(int midx);
	// 4-5. 한줄평 전체 보기
	public List<ReviewInfo> ReviewAllList();
	//5.  영화 상세 정보
	public MovieInfo MovieInfo(int midx);
	//6.  영화 추가
	public int MovieWrite(MovieInfo movieInfo);
	//7.  영화 삭제
	public int MovieDelete(int midx);
	
	//8.  영화 수정
	public int MovieEdit(MovieInfo movieInfo);
	//9.  수정을위한 정보획득
	public MovieInfo selectMovieMidx(int midx);
	
	
}
