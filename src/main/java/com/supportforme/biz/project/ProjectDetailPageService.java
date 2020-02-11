package com.supportforme.biz.project;
import java.util.List;

import com.supportforme.biz.hashtag.HashtagDTO;
import com.supportforme.biz.invest.InvestDTO;
import com.supportforme.biz.present.PresentDTO;

public interface ProjectDetailPageService {
	
	//프로젝트 기본정보 조회
	public ProjectDTO getProjectDetail(ProjectDTO dto);
	
	//프토젝트가 포함된 해시태그 조회
	public List<HashtagDTO> getProjectHashtags(ProjectDTO dto);
	
	//프로젝트의 모금액, 투자자수 조회
	public InvestDTO getProjectAboutInvest(ProjectDTO dto);
	
	//프로젝트의 리워드 목록 조회
	public List<PresentDTO> getProjectPresents(ProjectDTO dto);
	public List<PresentDTO> getProjectPresentsCount(ProjectDTO dto);

	//관리자 픽 Yes/No
	public void updatePick(ProjectDTO dto);
	
}
