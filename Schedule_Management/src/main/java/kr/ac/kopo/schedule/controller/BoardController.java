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
	
}
