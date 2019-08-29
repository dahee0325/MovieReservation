package com.project.movies.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@GetMapping("/reserve")
	public String getReserveManagerMain() {
		
		return("manager/ticketForm");
	}
	
}
