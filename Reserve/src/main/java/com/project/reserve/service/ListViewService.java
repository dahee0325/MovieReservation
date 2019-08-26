package com.project.reserve.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.project.reserve.dao.ReserveDaoInterface;
import com.project.reserve.domain.ListData;

@Service("listServcie")
public class ListViewService {

		private ReserveDaoInterface dao;

		@Inject
		private SqlSessionTemplate template;
		
		public List<ListData> getAllList() {

			dao = template.getMapper(ReserveDaoInterface.class);
			
			List<ListData> list = dao.allList();
			
			return list;
		}
}
