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
		return "movie/movieWrite";
	}
	
	@RequestMapping("/delete")
	public String delete() {
		return "movie/movieDelete";
	}
	
}
