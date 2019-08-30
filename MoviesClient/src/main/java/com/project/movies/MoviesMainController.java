package com.project.movies;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoviesMainController {

	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/write")
	public String write() {
		return "manager/movieWrite";
	}
	
	@RequestMapping("/delete")
	public String delete() {
		return "manager/movieDelete";
	
	}
	
	@RequestMapping("/reviewDelete")
	public String reviewdelete() {
		return "manager/reviewDelete";
	}
	
	@RequestMapping("/api")
	public String api() {
		return "movie/api";
	}
	
	
}
