package com.supportforme.biz.project.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectRegisterService;


@Service
public class ProjectRegisterServiceImpl implements ProjectRegisterService{

	@Autowired ProjectRegisterDAO projectDAO;
	
	@Override
	public ProjectDTO getProject(ProjectDTO dto) {
		return projectDAO.getProject(dto);
	}

	@Override
	public int insertProject(ProjectDTO dto) {
		return projectDAO.insertProject(dto);
	}

	@Override
	public int updateProject(ProjectDTO dto) {
		return projectDAO.updateProject(dto);  
	}

	@Override
	public int completeProject(ProjectDTO dto) {
		return projectDAO.completeProject(dto);
	}

	@Override
	public String getPresentCnt(ProjectDTO dto) {
		return projectDAO.getPresentCnt(dto);
	}

}
