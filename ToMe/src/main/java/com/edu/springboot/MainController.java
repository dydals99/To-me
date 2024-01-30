package com.edu.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.springboot.jdbc.IUserService;
import com.edu.springboot.jdbc.UserDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@Autowired
	IUserService dao; 
	
//	@RequestMapping("/")
//	public String home() {
//		
//		return "home";
//	}
	//로그인 화면 
	@RequestMapping("/")
	public String login() {
		return "user/login";
	}
	//로그인 실행
	@RequestMapping(value = "login_act", method = RequestMethod.POST)
	public String login_act(HttpServletRequest req, HttpSession session, Model model) {
		
		//파라미터로 받은 정보를 dto에 저장 
		UserDTO dto = dao.login_act(req.getParameter("email"), req.getParameter("password"));
		//dto에 아무런 정보가 없다면 아래와 같이
		if (dto == null) {
			System.out.println("회원정보 없음");
		} 
		//정보가 있다면 세션영역에 저장 후 home으로 이동
		else {
			session.setAttribute("siteUserInfo", dto);
		}
		return "home";
	}
	@RequestMapping("logout")
	public String logout(HttpServletRequest req, HttpSession session) {

		session.removeAttribute("siteUserInfo");
		session.invalidate(); 
		return "home";
	}
	//회원가입 화면
	@RequestMapping("/signUp")
	public String signUp() {
		return "user/signUp";
	}
	//회원가입 실행
	@RequestMapping(value = "signUp_act", method = RequestMethod.POST)
	public String signup_act(HttpServletRequest req, HttpSession session, UserDTO dto) {
		
		int result = dao.signUp_act(dto);
		
		if(result==1) System.out.println("입력되었습니다.");
		
		return "user/login";
	}
	@RequestMapping(value="/checkemail", method=RequestMethod.POST)
	@ResponseBody
	public int checkEmail(UserDTO dto) {
		int result = dao.checkEmail(dto);
		System.out.println(result);
        return result;
	}
}