package com.project.reserve.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.reserve.domain.ListData;
import com.project.reserve.service.ListViewService;

@RestController
public class ListController {

	@Autowired
	private ListViewService listService;
	
	@RequestMapping("/cinemaList")
	@CrossOrigin
	@GetMapping
	public ResponseEntity<List<ListData>> getCinemaList() {
		
		List<ListData> list = listService.getCinemaList();
		
		ResponseEntity<List<ListData>> entity = new ResponseEntity<List<ListData>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/dateList")
	@CrossOrigin
	@GetMapping
	public ResponseEntity<List<ListData>> getDateList() {
		
		List<ListData> list = listService.getDatemaList();
		
		ResponseEntity<List<ListData>> entity = new ResponseEntity<List<ListData>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping("/movieList")
	@CrossOrigin
	@GetMapping
	public ResponseEntity<List<ListData>> getMovieList() {
		
		List<ListData> list = listService.getMovieList();
		
		ResponseEntity<List<ListData>> entity = new ResponseEntity<List<ListData>>(list, HttpStatus.OK);
		
		return entity;
	}
	
}
