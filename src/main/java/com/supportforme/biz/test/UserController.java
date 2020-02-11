package com.supportforme.biz.test;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.supportforme.biz.common.Paging;



@Controller
public class UserController {
	
	@Autowired //DI
	UserService userService;
	
	
	@ModelAttribute("roleMap") //		model.addAttribute("roleMap", map)	
	public Map<String,String>	roleMap() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("Admin", "관리자");
		map.put("User", "사용자");
		map.put("Super", "최고관리자");
		return map;

	}
	
	
	@RequestMapping("/getUsers.do")
	public ModelAndView getUsers(ModelAndView mv,UserSearchDTO searchDTO, Paging paging) {
		paging.setPageUnit(5);
		//현재페이지 번호 파라미터
		if(paging.getPage() ==null) {
			paging.setPage(1);
		}
		//전체 건수
		int total = userService.getCnt(searchDTO);
		paging.setTotalRecord(total);
		mv.addObject("paging",paging);
		
		//시작 /마지막 레코드 번호
		searchDTO.setStart(paging.getFirst());
		searchDTO.setEnd(paging.getLast());
		mv.addObject("list", userService.getUsers(searchDTO));
		mv.setViewName("test/getUsers");
		return mv;
	}
	
	
	@RequestMapping("/updateUserForm.do")
	public String updateUserForm(Model model, UserDTO dto) {
		model.addAttribute("user", userService.getUser(dto));
		return "test/updateUser";
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(Model model, UserDTO dto) {
		userService.updateUser(dto);
		return "redirect:getUsers.do";
	}
	
	
	
	@RequestMapping("/insertUserForm.do")
	public String insertUserForm() {
		return "user/insertUser";
	}
	
	@RequestMapping("/insertUser.do")
	public String insertUser(Model model, UserDTO dto) {
		userService.insertUser(dto);
		return "redirect:getUsers.do";
	}
	
}
