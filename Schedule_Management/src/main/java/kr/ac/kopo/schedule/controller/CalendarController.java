package kr.ac.kopo.schedule.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
	  String fullcalendar(Model model) { 
     List<Calendar> list = service.list();
	  
	  model.addAttribute("list",list);
	  
	  return "/calendar/fullcalendar";
	  
	  }
	 
//	  시간 포맷
	  @InitBinder
	  public void initBinder(WebDataBinder binder) {
		  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		  binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat, true));
	  }
	  

	
	
//	  fullcalendar 일정 추가 시 ajax으로 처리
	 @ResponseBody
	  @RequestMapping(value="/add") 
	  String add(Calendar item,HttpSession session) {
		 System.out.println("111");
	  return String.valueOf(service.add(item)); 
	  }
	
	
	@ResponseBody
	@RequestMapping(value="/delete")
	String delete(int pid) {
		return String.valueOf(service.delete(pid));
	}
	
	/*
	 * @RequestMapping("/delete") String delete(int pid) { service.delete(pid);
	 * return "redirect:fullcalendar"; }
	 */
	
}
