package kr.ac.kopo.schedule.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
			HttpSession session = request.getSession();
			
			if(session.getAttribute(LOGIN) != null) {
//				기존 HttpSession에 남아있는 정보가 있는 경우에는 정보를 삭제한다.
				session.removeAttribute(LOGIN);
			}
			return true;
		}


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();

//		UserController에서 'user'라는 이름으로 객체를 담아둔 상태이므로 이 상태를 체크해서 HttpSession에 저장한다.
		ModelMap modelMap = modelAndView.getModelMap();
		Object user = modelMap.get("user");
		
		if(user !=null) {
			
			session.setAttribute(LOGIN, user);
			/* response.sendRedirect("/"); */
		
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest!=null ? (String)dest:"/" );
			
	}
	
}
	}
