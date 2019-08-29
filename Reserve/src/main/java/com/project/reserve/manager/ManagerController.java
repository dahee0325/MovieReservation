package com.project.reserve.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.reserve.manager.domain.ManagerCinemaData;
import com.project.reserve.manager.domain.MovieData;
import com.project.reserve.manager.service.ManagerService;

@RestController
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@GetMapping("manager/cinemaList")
	@CrossOrigin
	public ResponseEntity<List<ManagerCinemaData>> getCinemaList() {

		List<ManagerCinemaData> list = managerService.getCinemaList();

		ResponseEntity<List<ManagerCinemaData>> entity = new ResponseEntity<List<ManagerCinemaData>>(list, HttpStatus.OK);

		return entity;
	}
	
	@GetMapping("manager/movieList")
	@CrossOrigin
	public ResponseEntity<List<MovieData>> getMovieList() {

		List<MovieData> list = managerService.getMovieList();

		ResponseEntity<List<MovieData>> entity = new ResponseEntity<List<MovieData>>(list, HttpStatus.OK);

		return entity;
	}
	
}
