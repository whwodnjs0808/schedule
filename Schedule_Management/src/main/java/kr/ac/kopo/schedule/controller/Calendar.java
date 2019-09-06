package kr.ac.kopo.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("calendar/")
public class Calendar {

	/*
	 * @Autowired Calendar service;
	 */
	
	@RequestMapping(value="/fullcalendar")
	String fullcalendar() {
		return "/calendar/fullcalendar";
	}
	
}
