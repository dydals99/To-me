package com.edu.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String home() {
		
		return "home";
	}
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	@RequestMapping("/signUp")
	public String signUp() {
		return "member/signUp";
	}
}