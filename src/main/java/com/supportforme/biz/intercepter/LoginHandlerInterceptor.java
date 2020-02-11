package com.supportforme.biz.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.supportforme.biz.member.MemberDTO;

public class LoginHandlerInterceptor  extends HandlerInterceptorAdapter{
	// preHandle() : 컨트롤러보다 먼저 수행되는 메서드
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
    	String uri = request.getRequestURI();
        HttpSession session = request.getSession();
        String context =request.getContextPath();
        MemberDTO member = (MemberDTO) session.getAttribute("LoginInfo");
		if (uri.contains("support")) {

			if (member == null) {
				return true;
			} else {
				if (uri.contains("Login") || uri.contains("Join") || uri.contains("Find")) {
					response.sendRedirect(context);
					return false;
				}else {
					return true;
				}

			}
		} else if (uri.contains("forme")) {
			if (member == null) {
				response.sendRedirect(context + "/support/login");
				return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
			} else {
				if (uri.contains("Admin")) {
					if (member.getUserId().contains("Admin")) {
						return true;
					} else {
						response.sendRedirect(context);
						return false; // 더이상 컨트롤러 요청으로 가지 않도록
					}
				} else {
					return true;
				}
			}

		}
		response.sendRedirect(context);
		return false;
	}
}
