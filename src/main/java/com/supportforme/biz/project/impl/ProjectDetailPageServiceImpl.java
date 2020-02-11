package com.supportforme.biz.project.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.hashtag.HashtagDTO;
import com.supportforme.biz.invest.InvestDTO;
import com.supportforme.biz.present.PresentDTO;
import com.supportforme.biz.project.ProjectDTO;
import com.supportforme.biz.project.ProjectDetailPageService;

@Service
public class ProjectDetailPageServiceImpl implements ProjectDetailPageService {

	@Autowired ProjectDetailPageDAO projectDetailPageDAO;
	
	@Override
	public ProjectDTO getProjectDetail(ProjectDTO dto) {
		return projectDetailPageDAO.getProjectDetail(dto);
	}

	@Override
	public List<HashtagDTO> getProjectHashtags(ProjectDTO dto) {
		return projectDetailPageDAO.getProjectHashtags(dto);
	}

	@Override
	public InvestDTO getProjectAboutInvest(ProjectDTO dto) {
		return projectDetailPageDAO.getProjectAboutInvest(dto);
	}
	//리워드 리스트
	@Override
	public List<PresentDTO> getProjectPresents(ProjectDTO dto) {
		return projectDetailPageDAO.getProjectPresents(dto);
	}
	@Override
	public List<PresentDTO> getProjectPresentsCount(ProjectDTO dto) {
		return projectDetailPageDAO.getProjectPresentsCount(dto);
	}
	
	//관리자 픽[Yes/No]
	@Override
	public void updatePick(ProjectDTO dto) {
		projectDetailPageDAO.updatePick(dto);
	}

}
