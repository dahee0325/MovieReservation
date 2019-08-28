package com.project.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.movie.domain.RequestMovieWrite;
import com.project.movie.domain.Review;
import com.project.movie.domain.ReviewInfo;
import com.project.movie.service.ReviewAddService;
import com.project.movie.service.ReviewListService;

@RestController // @ResponseBody 생략한다.
@RequestMapping("/review")
public class ReviewListController {
	@Autowired
	private ReviewListService reviewListService;
	
	@Autowired
	private ReviewAddService reviewAddService; 
	
	@CrossOrigin
	@GetMapping("/{midx}") 
	public ResponseEntity<List<ReviewInfo>> getReviewList(
			@PathVariable("midx") int midx
			){
		
		List<ReviewInfo> reviewlist = reviewListService.getreviewList(midx);
		
		ResponseEntity<List<ReviewInfo>> entity =
				new ResponseEntity<List<ReviewInfo>>(
						reviewlist,
						HttpStatus.OK);
		// OK = 200
		// NOT_FOUND = 404
		// INTERNAL_SERVER_ERROR = 500
		
		
		
		return entity;
	}
	
	
	
	@CrossOrigin
	@PostMapping
	public ResponseEntity<String> review(
			Review reviewRequest
			) {
		
		System.out.println("30  "+ reviewRequest);
		
		return new ResponseEntity<String>(
				reviewAddService.reviewAdd(reviewRequest)>0? "success": "fail",
				HttpStatus.OK
				);
	}
}
