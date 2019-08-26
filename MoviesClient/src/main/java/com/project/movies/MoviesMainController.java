package com.project.movies;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoviesMainController {

	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/OK")
	public String OK() {
		return "movie/movie";
	}
}
