package com.project.movies.reserve;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reserve")
public class ReserveController {

	@GetMapping
	public String getMain() {
		
		return "reserve/reserveMain";
	}
	
}
