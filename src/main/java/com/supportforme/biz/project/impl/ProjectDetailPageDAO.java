package com.supportforme.biz.project.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.hashtag.HashtagDTO;
import com.supportforme.biz.invest.InvestDTO;
import com.supportforme.biz.present.PresentDTO;
import com.supportforme.biz.project.ProjectDTO;

@Repository
public class ProjectDetailPageDAO {
	
	@Autowired SqlSessionTemplate mybatis;
	
	//프로젝트 기본정보 조회
	public ProjectDTO getProjectDetail(ProjectDTO dto) {
		return mybatis.selectOne("projectDetail.getProjectDetail", dto);
	}
	
	//프토젝트가 포함된 해시태그 조회
	public List<HashtagDTO> getProjectHashtags(ProjectDTO dto) {
		return mybatis.selectList("projectDetail.getProjectHashtags", dto);
	}
	
	//프로젝트의 총 모금액, 투자자 수
	public InvestDTO getProjectAboutInvest(ProjectDTO dto) {
		return mybatis.selectOne("projectDetail.getProjectAboutInvest", dto);
	}
	
	//프로젝트의 리워드 목록 조회
	public List<PresentDTO> getProjectPresents(ProjectDTO dto) {
		return mybatis.selectList("projectDetail.getProjectPresents", dto);
	}
	public List<PresentDTO> getProjectPresentsCount(ProjectDTO dto) {
		return mybatis.selectList("projectDetail.getProjectPresentsCount", dto);
	}
	
	
	//관리자 픽 Yes/No
	public void updatePick(ProjectDTO dto) {
		mybatis.update("projectDetail.updatePick", dto);
	}
	
	
}
