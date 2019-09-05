package com.project.movies.reserve;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReserveController {

	@GetMapping("/reserve")
	public String getMain() {
		
		return "reserve/reserveMain";
	}
	
	@GetMapping("/confirm")
	public String getConfirm() {
		
		return "reserve/reserveConfirm";
	}
}
