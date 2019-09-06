package kr.ac.kopo.schedule.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/")
public class RootController {

	@RequestMapping(value="/")
	String index() {
		return "index";
	}
	
	@RequestMapping(value="/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
}
