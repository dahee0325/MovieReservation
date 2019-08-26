package com.project.reserve.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.reserve.domain.ListData;
import com.project.reserve.service.ListViewService;

@RestController
@RequestMapping("/")
public class ListController {

	@Autowired
	private ListViewService listService;
	
	@CrossOrigin
	@GetMapping
	public ResponseEntity<List<ListData>> getAllList() {
		
		List<ListData> list = listService.getAllList();
		
		ResponseEntity<List<ListData>> entity = new ResponseEntity<List<ListData>>(list, HttpStatus.OK);
		
		return entity;
	}
	
}
