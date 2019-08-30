package com.project.movies.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/regist")
public class RegistController {

	@GetMapping
	public String getMain() {

		return "member/registForm";
	}

}
