package kr.ac.kopo.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.schedule.model.Calendar;
import kr.ac.kopo.schedule.service.CalendarService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

	@Autowired
	CalendarService service;
	
	@RequestMapping(value="/fullcalendar")
	String fullcalendar() {
		return "/calendar/fullcalendar";
	}
	
	@ResponseBody
	@RequestMapping(value="/add")
	String add(Calendar item) {
		return String.valueOf(service.add(item));
	}
}
