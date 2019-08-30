package com.project.reserve.dao;

import java.util.List;

import com.project.reserve.domain.CinemaData;
import com.project.reserve.domain.ListData;
import com.project.reserve.domain.MovieTimeData;
import com.project.reserve.domain.ReserveData;

public interface ReserveDaoInterface {

	//극장 전체 리스트
	public List<CinemaData> cinemaList();
	
	//날짜 전체 리스트
	public List<ListData> dateList();
	
	//영화/시간 전체 리스트
	public List<ListData> movieList();
	
	//극장 별 날짜 리스트
	public List<ListData> byCinema(int cidx);
	
	//날짜 별 극장 리스트
	public List<MovieTimeData> selectTimeList(int cidx, int tDate);
	
	//티켓번호
	public int ticketNum(int cidx, int tDate, String tTime);
	
	//좌석개수
	public int seatCount(int cidx);
	
	//예약된 좌석번호
	public List<Integer> seatResult(int tidx);
	
	//예약된 좌석번호 수
	public int seatResultCount(int tidx);
	
	//예매하기
	public int reserve(int idx, int cidx, int tidx);
	
	//예매정보가져오기
	public List<ReserveData> reserveInfo(int idx);
	
	//예매취소
	public int reserveDel(int ridx);
	
}
