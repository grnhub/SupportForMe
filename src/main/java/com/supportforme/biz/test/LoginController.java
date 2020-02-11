package com.supportforme.biz.test;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller // 빈 자동등록 서블릿이 호출하도록 설정
public class LoginController {
/*	@Autowired
	UserService userService;

	// 로그인 폼
	@RequestMapping(value = { "/login.do", "in.do" }, method = RequestMethod.GET)
	public String login(UserDTO dto, HttpSession session, HttpServletRequest requset) {
		return "test/login";
	}

	// 로그인처리
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginProc(@ModelAttribute("user") UserDTO dto, HttpSession session,@RequestParam(value="id",required=false,defaultValue="admin") String userid,@RequestParam String password) {
		System.out.println("id:"+userid +", pw:"+password);
		UserDTO userDTO = userService.getUser(dto);
		if (userDTO.getId() == null || !userDTO.getPassword().equals(dto.getPassword())) {
			return "test/login";
		} else {
			return "redirect:getUsers.do";
		}
	}

	// 로그아웃처리
	@RequestMapping(value = "/logout.do", method = RequestMethod.POST)
	public String logoutProc(HttpSession session) {
		session.invalidate();
		return "test/login";
	}*/
}
