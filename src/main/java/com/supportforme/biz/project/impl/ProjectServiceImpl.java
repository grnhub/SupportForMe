package com.supportforme.biz.project.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectSearchDTO;
import com.supportforme.biz.project.ProjectService;
import com.supportforme.biz.project.ProjectService;

//유저 서비스 실행
@Service 
public class ProjectServiceImpl implements ProjectService {

	@Autowired ProjectDAO dao; // Mybatis로 만든 ProjectDAO
	
	//전체 검색결과 조회, 분야별 전체결과 조회
	@Override
	public List<ProjectDTO> getProjects(ProjectSearchDTO searchDto) {
		System.out.println("프로젝트 목록 조회"); 
		return dao.getProjects(searchDto); // 핵심관심
	}
	//공연조회
	@Override
	public List<ProjectDTO> getPerformanceProjects() {
		// TODO Auto-generated method stub
		return dao.getPerformanceProjects();
	}
	//미술조회 
	@Override
	public List<ProjectDTO> getArtProjects() {
		// TODO Auto-generated method stub
		return dao.getArtProjects();
	}
	//건수조회
	@Override
	public int getCnt(ProjectSearchDTO searchDto) {
		// TODO Auto-generated method stub
		return dao.getCnt(searchDto);
	}
	//랭킹조회
	@Override
	public List<ProjectDTO> getInvsetTop5() {
		// TODO Auto-generated method stub
		return dao.getInvsetTop5();
	}
	//서포미픽 조회
	@Override
	public List<ProjectDTO> getSupportForMePicks() {
		// TODO Auto-generated method stub
		return dao.getSupportForMePicks();
	}
	//도서 조회
	@Override
	public List<ProjectDTO> getBookProjects() {
		// TODO Auto-generated method stub
		return dao.getBookProjects();
	}
	//영화 조회
	@Override
	public List<ProjectDTO> getMovieProjects() {
		// TODO Auto-generated method stub
		return dao.getMovieProjects();
	}
	//최신프로젝트 조회
	@Override
	public List<ProjectDTO> getLatestProjects() {
		// TODO Auto-generated method stub
		return dao.getLatestProjects();
	}
	//나의 프로젝트 조회
	@Override
	public List<ProjectDTO> getMyProjects(ProjectSearchDTO searchDto) {
		// TODO Auto-generated method stub
		return dao.getMyProjects(searchDto);
	}
	//프로젝트 삭제
	@Override
	public void deleteProject(ProjectDTO Dto) {
		// TODO Auto-generated method stub
		dao.deleteProject(Dto);
	} 
	
	
	
}
