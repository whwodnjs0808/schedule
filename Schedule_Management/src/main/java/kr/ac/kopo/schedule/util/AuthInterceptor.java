package kr.ac.kopo.schedule.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//현재 사용자가 로그인한 상태인지를 체크하고 컨트롤러를 호출하게 할 것인지를 결정한다. 만일 사용자가 로그인하지 않은 상태라면 로그인하는 /user/login 으로 이동하게 합니다.
public class AuthInterceptor extends HandlerInterceptorAdapter {

	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI();
		
		String query = req.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";
		}else {
			query = "?" + query;
		}
		
		if(req.getMethod().equals("GET")) {
			req.getSession().setAttribute("dest", uri + query);
		}
		
	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login")==null) {
			
			saveDest(request);
			
			response.sendRedirect("/user/login");
			return false;
		}
		return true;
	}

	
	
}
