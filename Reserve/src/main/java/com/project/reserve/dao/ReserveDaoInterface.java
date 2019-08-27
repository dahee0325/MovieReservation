package com.project.reserve.dao;

import java.util.List;

import com.project.reserve.domain.ListData;

public interface ReserveDaoInterface {

	//극장 전체 리스트
	public List<ListData> cinemaList();
	
	//날짜 전체 리스트
	public List<ListData> dateList();
	
	//영화/시간 전체 리스트
	public List<ListData> movieList();
	
	//극장 별 날짜 리스트
	public List<ListData> byCinema(int cidx);
	
	//날짜 별 극장 리스트
	public List<ListData> selectTimeList(int cidx, int cDate);
	
	//티켓번호
	public int ticketNum(int cidx, int cDate, String cTime);
	
	//좌석개수
	public int seatPrint(int cidx);
	
}
