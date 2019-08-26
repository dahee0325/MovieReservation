package com.project.movies.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@CrossOrigin
@RequestMapping("/movie")
public class MovieController {
	
	@GetMapping
	public String getMain() {
		
		return "movie/movieMain";
	}
	

}



