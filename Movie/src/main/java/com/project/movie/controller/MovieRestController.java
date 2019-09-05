package com.project.movie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.project.movie.domain.MovieInfo;
import com.project.movie.domain.RequestMovieEdit;
import com.project.movie.domain.RequestMovieWrite;
import com.project.movie.domain.ReviewInfo;
import com.project.movie.service.MovieDeleteService;
import com.project.movie.service.MovieEditService;
import com.project.movie.service.MovieInfoService;
import com.project.movie.service.MovieListService;
import com.project.movie.service.MovieWriteService;
import com.project.movie.service.ReviewListService;

@RestController // @ResponseBody 생략한다.
@RequestMapping("/movie")
public class MovieRestController {
	
	@Autowired
	private MovieListService movieListService;
	
	@Autowired
	private MovieInfoService movieInfoService;
	@Autowired
	private MovieWriteService movieWriteService;
	
	@Autowired
	private MovieDeleteService movieDeleteService;
	
	@Autowired
	private MovieEditService movieEditService;
	
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
	
	
	
	@CrossOrigin
	@GetMapping("/{midx}")  
	public ResponseEntity<MovieInfo> getMovie(
			@PathVariable("midx") int midx,
			Model model
			) {
		MovieInfo movieInfo = movieInfoService.getMovieInfo(midx);
		
		
		System.out.println(movieInfo);
		
		
		return new ResponseEntity<MovieInfo>(movieInfo, HttpStatus.OK);
	}
	
	
	@CrossOrigin
	@PostMapping
	public ResponseEntity<String> write(
			RequestMovieWrite regRequest,
			MultipartHttpServletRequest request
			) {
		
		System.out.println("2  "+ request.getFile("mPhoto").getOriginalFilename());
		
		return new ResponseEntity<String>(
				movieWriteService.write(request, regRequest)>0? "success": "fail",
				HttpStatus.OK
				);
		
	}
	
	@CrossOrigin
	@DeleteMapping("/{midx}")  // /rest/members/12
	public ResponseEntity<String> MovieDelete(
			@PathVariable("midx") int midx
			) {
		//int cnt = deleteService.memberDelete(idx);
		
		return new ResponseEntity<String>(
				movieDeleteService.delete(midx)>0? "success": "fail",
				HttpStatus.OK
				);
	}
	
	
	
	
	@CrossOrigin
	@PostMapping("/{midx}")
	public ResponseEntity<String> editMember(
			/* @PathVariable("midx") int midx, */
			RequestMovieEdit editRequest,
			HttpServletRequest request
			){
		
		/*
		 * editRequest.setMidx(midx); System.out.println("1"+midx);
		 */
		System.out.println("20"+editRequest);
		
		int cnt = movieEditService.edit(editRequest, request);
		
		return new ResponseEntity<String>(cnt>0?"success":"fail" , HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
}
