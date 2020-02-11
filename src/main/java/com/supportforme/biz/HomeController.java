package com.supportforme.biz;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired	 
	ProjectService projectService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)

	public String home(Model model, HttpSession session, HttpServletRequest request) {
		String userId = null;
		String contextPath = request.getContextPath();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("LoginInfo");
		
		if ( dto == null ) {
			model.addAttribute("member", null);
		}
		else {
		/*MemberDTO dto = (MemberDTO) session.getAttribute("LoginInfo");*/
			userId = dto.getUserId();
			model.addAttribute("member", dto);
		}
	
		//최신 프로젝트조회
		model.addAttribute("Latest",projectService.getLatestProjects());
		model.addAttribute("Pick",projectService.getSupportForMePicks());
		model.addAttribute("Performance",projectService.getPerformanceProjects());
		model.addAttribute("Art",projectService.getArtProjects());
		model.addAttribute("Book",projectService.getBookProjects());
		model.addAttribute("Movie",projectService.getMovieProjects());
		model.addAttribute("Rank",projectService.getInvsetTop5());
		
		if(userId !=null) {
			if(userId.contains("Admin")) {
				model.addAttribute("url", contextPath+"/forme/AdminDashBoard");
				return "commons/alertRedirect";
			}
			else {
				return "noNav/home";
			}
		}
		 else {
			return "noNav/home";
		}
	}
	@RequestMapping(value = "/", method = RequestMethod.POST)
	@ResponseBody
	public List<ProjectDTO> Rank(){
		return projectService.getInvsetTop5();
		
	
	}
}
