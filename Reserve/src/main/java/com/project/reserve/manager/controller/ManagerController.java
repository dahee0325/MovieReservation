package com.project.reserve.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.reserve.manager.domain.ManagerCinemaData;
import com.project.reserve.manager.domain.ManagerMovieData;
import com.project.reserve.manager.domain.ManagerShowMovieData;
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
	public ResponseEntity<List<ManagerMovieData>> getMovieList() {

		List<ManagerMovieData> list = managerService.getMovieList();

		ResponseEntity<List<ManagerMovieData>> entity = new ResponseEntity<List<ManagerMovieData>>(list, HttpStatus.OK);

		return entity;
	}
	
	@GetMapping("manager/cinemaList/{cidx}")
	@CrossOrigin
	public ResponseEntity<Integer> getCinemaSeatCnt(@PathVariable("cidx")int cidx) {

		int seatCnt = managerService.getCinemaSeatCnt(cidx);

		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(seatCnt, HttpStatus.OK);

		return entity;
	}
	
	@GetMapping("manager/movieList/{midx}")
	@CrossOrigin
	public ResponseEntity<Integer> getMovieRunTime(@PathVariable("midx")int midx) {

		int runTime = managerService.getMovieRunTime(midx);

		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(runTime, HttpStatus.OK);

		return entity;
	}
	
	@PostMapping("manager/movies")
	@CrossOrigin
	public ResponseEntity<Integer> InsertMovie(ManagerShowMovieData mdate) {

		int cnt = managerService.InsertMovie(mdate);

		ResponseEntity<Integer> entity = new ResponseEntity<Integer>(cnt, HttpStatus.OK);

		return entity;
	}
	
}
