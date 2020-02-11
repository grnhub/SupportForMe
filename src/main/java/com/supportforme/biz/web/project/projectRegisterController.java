package com.supportforme.biz.web.project;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectRegisterService;

@Controller
public class projectRegisterController {
		
	@Autowired ProjectRegisterService projectService;
	
	Map<String,String> map = new HashMap<String,String>();
	
	//url get 방식으로 입력하여 들어오는 것 방지
	@RequestMapping(value="/forme/registerProject", method=RequestMethod.GET )
	public String protectInsertProject() {
		return  "redirect:/";
	}
	
	//등록 post 방식
	@RequestMapping(value="/forme/registerProject", method=RequestMethod.POST )
	public String insertProject(ProjectDTO dto , HttpSession session) {
		MemberDTO member = (MemberDTO) session.getAttribute("LoginInfo");
		dto.setUserId(member.getUserId());
		projectService.insertProject(dto);
		return "redirect:/forme/make/"+dto.getProjectNo();	
	}
	
	//등록페이지 기본정보 등록 페이지로 forward
	@RequestMapping("/forme/make/{projectNo}")			
	public String makeProject(Model model,@PathVariable String projectNo,HttpSession session) {
		ProjectDTO dto = new ProjectDTO();
		dto.setProjectNo(projectNo);
		dto = projectService.getProject(dto);
		if ( session.getAttribute("LoginInfo") == null ) {
			model.addAttribute("member", null);
			return  "redirect:/";
		}
		else {
			MemberDTO member = (MemberDTO) session.getAttribute("LoginInfo");
			model.addAttribute("member", member);
			if(dto.getUserId().equals(member.getUserId())) {
				model.addAttribute("project",dto);
				return "rgNav/register/projectRegister";
			}else { return "redirect:/";}
		}
	}
	
	@RequestMapping("/forme/updateProject/basic")
	public String projectBasic(Model model, @RequestBody ProjectDTO dto) {
		model.addAttribute("project", projectService.getProject(dto));
		return "ajax/register/projectRegisterBasic";
	}
	
	//기본정보 수정 후 스토리 입력 페이지로 넘어감 
	@RequestMapping("/forme/updateProject/story")
	public String updateProjectBasic(Model model, ProjectDTO dto) {
		basicFunc(dto);
		projectService.updateProject(dto);
		model.addAttribute("project", projectService.getProject(dto));
		return "ajax/register/projectRegisterStory";
	}
	
	//스토리 정보 수정 후 선물 등록 페이지로 넘어감 
	@RequestMapping("/forme/updateProject/reward")
	public String updateProjectStory(Model model, ProjectDTO dto) {
		storyImageVideo(dto);
		projectService.updateProject(dto);
		model.addAttribute("project", projectService.getProject(dto));
		return "ajax/register/projectRegisterReward";
	}
	
	//선물 등록 수정 후 부가정보 페이지로 넘어감 
	@RequestMapping("/forme/updateProject/account")
	public String updateProject(Model model, ProjectDTO dto) {
		projectService.updateProject(dto);
		model.addAttribute("project", projectService.getProject(dto));	
		return "ajax/register/projectRegisterAccount";
		
	}
	@RequestMapping("/forme/pageMove/{projectNo}/{page}")
	public String moveProject(Model model,@PathVariable String projectNo ,@PathVariable String page) {
		ProjectDTO dto = new ProjectDTO();
		dto.setProjectNo(projectNo);
		model.addAttribute("project", projectService.getProject(dto));
		String path ="";
		if("bs".equals(page)) {
			path = "ajax/register/projectRegisterBasic";
		}else if("st".equals(page)) {
			path = "ajax/register/projectRegisterStory";
		}else if("rw".equals(page)) {
			path = "ajax/register/projectRegisterReward";
		}else if("ac".equals(page)){
			path = "ajax/register/projectRegisterAccount";
		}
		return path;
	}
	//저장하기 
	@RequestMapping(value= {"/forme/saveProject/ex","forme/saveProject/basic","forme/saveProject/story"})
	@ResponseBody
	public Map<String,String> saveProject(ProjectDTO dto, HttpServletRequest request){
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String[] com = uri.substring(conPath.length()).split("/");
		
		if(("basic").equals(com[3])){
			basicFunc(dto);
		}else if(("story").equals(com[3])) {
			storyImageVideo(dto);
		}

		projectService.updateProject(dto);
		map.put("code", "success");
		return map;
	}
	
	//등록완료 하기 
	@RequestMapping("/forme/registerComplete")
	@ResponseBody
	public Map<String,String> completeProject(ProjectDTO dto){
		String cnt = projectService.getPresentCnt(dto);
		if(!cnt.equals("0")) {
			projectService.completeProject(dto);
			map.put("code", "success");
		}else {
			map.put("code", "fail");
		}
		return map;
	}
	
	//미리보기
	@RequestMapping("/forme/preview/{projectNo}")
	public String privewProject(Model model,@PathVariable String projectNo) {
		model.addAttribute("projectNo",projectNo);
		return "ajax/register/registerPreview";
	}
	//파일 업로드 
	@RequestMapping(value="/forme/fileUpload" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> fileUpload(@ModelAttribute("project") ProjectDTO dto, HttpServletRequest request) throws IllegalStateException, IOException {
		String folder = request.getSession().getServletContext().getRealPath("/upload");
	
		File file = new File(folder);  
        //디렉토리 존재하지 않을경우 디렉토리 생성
        if(!file.exists()) {
        	file.mkdirs();
        }
		
		//첨부파일 처리
		MultipartFile uploadFile = dto.getUploadFile();
		String filename = "";
		if(!uploadFile.isEmpty() && uploadFile.getSize() > 0) {
			String tempFn = uploadFile.getOriginalFilename();
			int index = tempFn.lastIndexOf(".");
			String realfilename = tempFn.substring(0, index);
			String extension = "." + tempFn.substring(index+1);
			filename = realfilename + System.currentTimeMillis() + extension; 
			uploadFile.transferTo(new File(folder,filename));
//			uploadFile.transferTo(new File(folder2,filename));
		}

		map.put("code", "success");
		map.put("filename", filename);
		return map;
	}
	
	//이미지 서버에서 삭제 
	@RequestMapping(value="/forme/deleteIntroductionImg")
	@ResponseBody
	public Map<String,String> deleteIntroductionImg(@RequestParam(value="removeIntroductionImg",required=false)String removeImg,HttpServletRequest request){
		 String folder =  request.getSession().getServletContext().getRealPath("/upload");// 삭제할 파일의 경로
		 File file = new File(folder,removeImg);
		 if(file.exists()){
			 file.delete();
		}
		map.put("code", "success");
		return map;
	}  
	
	
	//마감일 rrrr-MM-dd -> rrrr.MM.dd 로 변환 함수
	ProjectDTO basicFunc(ProjectDTO dto) {
		if(!dto.getTargetAmount().equals("")) {
			String ta = dto.getTargetAmount();
			dto.setTargetAmount(ta.replace(",", ""));
		}
		if(!dto.getProjectDeadline().equals("")) {
			String[] deadLine = dto.getProjectDeadline().split("-");
			dto.setProjectDeadline(deadLine[0].toString()+"."+deadLine[1].toString()+"."+deadLine[2].toString());
		}
		return dto;
	}
	//story image, video 처리 함수
	ProjectDTO storyImageVideo(ProjectDTO dto) {
		String introductionImg = "";
		if(dto.getArrImage() != null && dto.getArrImage().length>0) {
			for(String img : dto.getArrImage()) {
				introductionImg += (img + "||");
			}
		}
		dto.setIntroductionImage(introductionImg);

		String introductionVideo = "";
		if(dto.getArrVideo().length>0) {
			for(String video : dto.getArrVideo()) {
				if(video != "") {
					int index = video.lastIndexOf("/");
					introductionVideo += (video.substring(index+1) + "||");	
				}
							
			}
		}
		dto.setIntroductionVideo(introductionVideo);
		return dto;
	}
	
}
