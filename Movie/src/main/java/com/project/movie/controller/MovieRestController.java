package com.project.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


import com.project.movie.domain.MovieInfo;
import com.project.movie.service.MovieListService;

@RestController // @ResponseBody 생략한다.
@RequestMapping("/movie")
public class MovieRestController {
	
	@Autowired
	private MovieListService movieListService;
	
	@GetMapping
	@CrossOrigin
	public ResponseEntity<List<MovieInfo>> getAllList(){
		
		List<MovieInfo> list = movieListService.getMovieList();
		
		ResponseEntity<List<MovieInfo>> entity =
				new ResponseEntity<List<MovieInfo>>(
						list,
						HttpStatus.OK);
		// OK = 200
		// NOT_FOUND = 404
		// INTERNAL_SERVER_ERROR = 500
		
		
		
		return entity;
	}
	
}
