package kr.ac.kopo.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.schedule.model.Board;
import kr.ac.kopo.schedule.model.PageMaker;
import kr.ac.kopo.schedule.model.SearchCriteria;
import kr.ac.kopo.schedule.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	final String path = "board/";
	
	@Autowired
	BoardService service;

	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri , Model model) {
		
		List<Board> list = service.listSearchCriteria(cri);
		model.addAttribute("list",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker",pageMaker);
		
	}
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register() {
		return path + "register";
	}
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String register(Board item) {
		
		service.register(item);
		
		return "redirect:list";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(int bno) {
		service.delete(bno);
		return "redirect:list";
	}
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(Model model,int bno) {
		Board item = service.getItem(bno);
		
		model.addAttribute("item",item);
		
		return path + "update";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(Board item) {
		
		service.update(item);
		
		return "redirect:list";
	}
	
	
}
