package com.supportforme.biz.present.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.present.PresentDTO;
import com.supportforme.biz.project.ProjectDTO;

@Repository
public class PresentDAO {
	
	@Autowired SqlSessionTemplate mybatis;
	
	//선물 단건 조회
	public PresentDTO getPresent(PresentDTO pdto) {
		return mybatis.selectOne("present.getPresent", pdto);
	}
	//선물 등록
	public int insertPresent(PresentDTO pdto) {
		return mybatis.insert("present.insertPresent", pdto);
	}
	//선물 수정
	public int updatePresent(PresentDTO pdto) {
		return mybatis.update("present.updatePresent", pdto);
	}
	//선물 삭제
	public int deletePresent(PresentDTO pdto) {
		return mybatis.delete("present.deletePresent", pdto);
	}
	//선물 다건 조회
	public List<PresentDTO> getPresents(PresentDTO pdto) {
		return mybatis.selectList("present.getPresents", pdto);
	}
	
}
