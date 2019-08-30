package com.project.movies.member;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class LoginController {
	
	//로그인
	@GetMapping("/login")
	public String getMain() {
		
		return "member/loginForm";
	}

	//로그아웃
	@GetMapping("/logout")
	public String logoutMember(HttpSession session){
		session.invalidate();
		
		return "main";
	}
}
