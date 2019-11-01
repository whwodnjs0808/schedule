package kr.ac.kopo.schedule.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.schedule.dto.LoginDTO;
import kr.ac.kopo.schedule.model.User;
import kr.ac.kopo.schedule.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	 final String path = "user/";
	
	@Autowired
	UserService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginGET(@ModelAttribute("dto") LoginDTO dto) {
		return "/user/login";
	}
//	로그인 화면에서 /user/login 결과 처리는 /user/loginPost로 설정
//	실제 로그인 처리가 이뤄지는 loginPost()에서는 Model 객체에 사용자가 존재하는 경우에 'user'라는 이름으로 저장
	@RequestMapping(value="/loginPost",method=RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session,Model model) {
		User user = service.login(dto);
		
		if(user==null) {
			return;
		}
		model.addAttribute("user",user);
	}
	
	@RequestMapping(value="/idCheck",method=RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userid") String userid) {
		return service.useridCheck(userid);
	}
	

	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	String register() {
		return path + "register";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	String register(User item) {
		service.register(item);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.POST)
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
}
