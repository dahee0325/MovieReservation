package com.project.reserve.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.reserve.dao.ReserveDaoInterface;
import com.project.reserve.domain.ListData;
import com.project.reserve.domain.ReserveCheck;
import com.project.reserve.domain.TicketData;

@Service("reserveService")
public class ReserveService {

	private ReserveDaoInterface dao;

	@Autowired
	private SqlSessionTemplate template;
	
	public List<ListData> getCinemaList() {

		dao = template.getMapper(ReserveDaoInterface.class);

		List<ListData> list = dao.cinemaList();

		return list;
	}
	
	public List<ListData> getDatemaList() {

		dao = template.getMapper(ReserveDaoInterface.class);

		List<ListData> list = dao.dateList();

		return list;
	}
	

	public List<ListData> getByCinemaList(int cidx) {
		dao =template.getMapper(ReserveDaoInterface.class);
		
		List<ListData> list = dao.byCinema(cidx);
		
		return list;
	}
	
	public List<ListData> getSelectTimeList(int cidx, int tDate) {
		dao =template.getMapper(ReserveDaoInterface.class);
		
		List<ListData> list = dao.selectTimeList(cidx, tDate);
		
		return list;
	}
	
	public int getTicketNum(int cidx, int tDate, String tTime) {
		
		dao =template.getMapper(ReserveDaoInterface.class);
		
		int num = dao.ticketNum(cidx, tDate, tTime);
		
		return num;
		
	}
	
	public ReserveCheck getSeatPrint(int cidx,int tidx) {
		
		dao = template.getMapper(ReserveDaoInterface.class);
		
		ReserveCheck rc = new ReserveCheck();
		rc.setTidx(tidx);
		int sCnt = dao.seatCount(cidx);
		rc.setSeatCnt(sCnt);
		List<Integer> list = dao.seatResult(tidx);
		rc.setSidx(list);
		int sTotalCnt = dao.seatResultCount(tidx);
		rc.setReserveTotalCnt(sTotalCnt);
		
		return rc;
		
	}
	
	public int reserve(int sidx, int tidx) {
		
		dao =template.getMapper(ReserveDaoInterface.class);
		
		int num = dao.reserve(sidx, tidx);
		
		return num;
	}
	
}
