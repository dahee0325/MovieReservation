package com.project.reserve.service;

import java.util.List;

import javax.inject.Inject;

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
	
	public List<ListData> getMovieList() {

		dao = template.getMapper(ReserveDaoInterface.class);

		List<ListData> list = dao.movieList();

		return list;
	}
}
