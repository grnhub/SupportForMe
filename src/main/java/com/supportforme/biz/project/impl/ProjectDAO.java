package com.supportforme.biz.project.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectSearchDTO;

@Repository
public class ProjectDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	//전체검색 결과조회, 분야별 결과 조회
	public List<ProjectDTO> getProjects(ProjectSearchDTO searchDto) {
		return mybatis.selectList("project.getProjects", searchDto);  
	}
	//최신프로젝트 조회
	public List<ProjectDTO> getLatestProjects() {
		return mybatis.selectList("project.getLatestProjects");
	}
	//공연조회
	public List<ProjectDTO> getPerformanceProjects() {
		return mybatis.selectList("project.getPerformanceProjects");
	}
	//미술조회
	public List<ProjectDTO> getArtProjects() {
		return mybatis.selectList("project.getArtProjects");
	}
	//도서조회
	public List<ProjectDTO> getBookProjects() {
		return mybatis.selectList("project.getBookProjects");
	}
	//영화조회
	public List<ProjectDTO> getMovieProjects() {
		return mybatis.selectList("project.getMovieProjects");
	}
	
	//건수 조회
	public int getCnt(ProjectSearchDTO searchDto) {
		return mybatis.selectOne("project.getCnt", searchDto);
	}
	//랭킹 조회
	public List<ProjectDTO> getInvsetTop5(){
		return mybatis.selectList("project.getInvsetTop5");
	}
	//서포미픽 조회
	public List<ProjectDTO> getSupportForMePicks(){
		return mybatis.selectList("project.getSupportForMePicks");
	}
	
	//나의 프로젝트 조회
	public List<ProjectDTO> getMyProjects(ProjectSearchDTO searchDto) {
		return mybatis.selectList("project.getMyProjects", searchDto);  
	}
	
	//프로젝트 삭제
	public void deleteProject(ProjectDTO Dto) {
		mybatis.delete("project.deleteProject", Dto);  
	}
}
