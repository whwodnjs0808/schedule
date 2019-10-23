package kr.ac.kopo.schedule.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.schedule.model.Calendar;
import kr.ac.kopo.schedule.service.CalendarService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

	@Autowired
	CalendarService service;
	
	@RequestMapping(value="/fullcalendar")
	String fullcalendar(HttpSession session, Model model,Calendar calendar) {
		List<Calendar> list = service.list(calendar);
		
		model.addAttribute("list",list);
		
		return "/calendar/fullcalendar";
	
	}
	
	
	 @ResponseBody
	  @RequestMapping(value="/add") String add(Calendar item,HttpSession session) {
	  return String.valueOf(service.add(item)); }
	
	
	@RequestMapping(value="/insert", method=RequestMethod.GET)
		public void insert() {
	}
		
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(Calendar item,HttpSession session) {
		
		service.insert(item);
		
		return "/calendar/fullcalendar";
	}
	
	
}
