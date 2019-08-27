package com.project.reserve.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.reserve.dao.ReserveDaoInterface;
import com.project.reserve.domain.ListData;

@Service("listService")
public class ListViewService {

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
	
	public List<ListData> getSelectTimeList(int cidx, int cDate) {
		dao =template.getMapper(ReserveDaoInterface.class);
		
		List<ListData> list = dao.selectTimeList(cidx, cDate);
		
		return list;
	}
	
	public int getTicketNum(int cidx, int cDate, String cTime) {
		
		dao =template.getMapper(ReserveDaoInterface.class);
		
		int num = dao.ticketNum(cidx, cDate, cTime);
		
		return num;
		
	}
}
