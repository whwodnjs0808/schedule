package kr.ac.kopo.schedule.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

//	model 타입의 객체를 파라미터로 받는다. model을 이용해서 모든 게시물을 jsp로 전송하는 작업을 model.addAttribute()로 처리하고있다.
	@RequestMapping(value="/list", method=RequestMethod.GET)
//	Criteria cri를 파라미터로 사용하고 Model객체를 이용해서 발생하는 PageMaker를 저장
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
	
	@RequestMapping(value="/delete")
	public String delete(@RequestParam("bno") int bno,SearchCriteria cri,RedirectAttributes rttr) {
		service.delete(bno);
		
//		rttr.addAttribute를 이용해 주소줄에 출력
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
//		addFlashAttribute() 는 브라우저까지 전송되기는 하지만, url상에는 보이지 않는 숨겨진 데이터의 형태로 전달된다. 따라서 redirect할때 BoardController를 호출하는 경로가 '/board/listPage?msg=SUCCESS'에서 msg=SUCCESS문자열이 숨겨진다.
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:list";
	}
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(Model model,int bno, @ModelAttribute("cri") SearchCriteria cri) {
		Board item = service.read(bno);
		
		model.addAttribute("item",item);
		
		return path + "update";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(Board item,RedirectAttributes rttr,SearchCriteria cri) {
		
		service.update(item);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		rttr.addFlashAttribute("msg","SUCCESS");
		
		return "redirect:list";
	}
	
//	조회페이지 : 파라미터는 외부에서 전달될 bno값을 전달 받는다. 좀 더 명확하게 표현하기 위해 @RequestParam을 이용해서 구성했다. 또한 조회된 결과 게시물을 jsp로 전달해야 하기 때문에 Model 객체를 사용했다.
//	특정한 페이지를 보다가 조회페이지로 이동하는 것에 대한 처리인데, 사용자가 조회 페이지에서 다시 목록 보기를 이용해서 기존에 자신이 보던 목록 페이지로 전환되기위해 파라미터를 받아온다.
	@RequestMapping(value="/readPage",method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,@ModelAttribute("cri") SearchCriteria cri, Model model){
		Board board = service.read(bno);
		
		model.addAttribute("list",board);
	
	}
	 
//	  시간 포맷
	  @InitBinder
	  public void initBinder(WebDataBinder binder) {
		  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		  binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat, true));
	  }
	
}
