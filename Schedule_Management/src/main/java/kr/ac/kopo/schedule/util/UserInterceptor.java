package kr.ac.kopo.schedule.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	
//	기존의 로그인 정보가 있을 경우 초기화하는 역할을 수행한다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
			HttpSession httpSession = request.getSession();
			
			if(httpSession.getAttribute(LOGIN) != null) {
//				기존 HttpSession에 남아있는 정보가 있는 경우에는 정보를 삭제한다.
				httpSession.removeAttribute(LOGIN);
			}
			return true;
		}

// httpSession 에 컨트롤러에서 저장한 user를 저장하고, / 로 리다이렉트를 한다.
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession httpSession = request.getSession();
//		UserController에서 'user'라는 이름으로 객체를 담아둔 상태이므로 이 상태를 체크해서 HttpSession에 저장한다.
		ModelMap modelMap = modelAndView.getModelMap();
		Object user = modelMap.get("user");
		
		if(user !=null) {
			
			httpSession.setAttribute(LOGIN, user);
			/* response.sendRedirect("/"); */

			  Object destination = httpSession.getAttribute("destination"); 
			  response.sendRedirect(destination!=null ? (String) destination:"/" );
			
	}

}
	}
