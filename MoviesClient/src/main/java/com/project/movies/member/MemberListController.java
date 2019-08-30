package com.project.movies.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberListController {

	@RequestMapping("/list")
	public String getMain() {
		
		return "member/memberList";
	}
}
