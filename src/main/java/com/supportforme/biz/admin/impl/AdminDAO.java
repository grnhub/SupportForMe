package com.supportforme.biz.admin.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.admin.AdminDTO;
import com.supportforme.biz.admin.AdminSearchDTO;


@Repository
public class AdminDAO {
	@Autowired 
	SqlSessionTemplate mybatis;
	
	
	public List<Map<String, Object>> getAdminMembers(AdminSearchDTO searchDTO) {
		return mybatis.selectList("admin.getAdminMembers", searchDTO);
	}

	
	public int getCntAdminMember(AdminSearchDTO searchDTO) {
		return mybatis.selectOne("admin.getCntAdminMembers", searchDTO);
	}
	
	
	public int deleteAdminMembers(AdminSearchDTO searchDTO) {
		return mybatis.delete("admin.deleteAdminMembers", searchDTO);
	}
	
	
	public List<Map<String, Object>> getAdminSupportForMePickUpList(AdminSearchDTO searchDTO){
		return mybatis.selectList("admin.supportForMePickUpList", searchDTO);
	};
	
	public int getCntAdminSupportForMePickUpList(AdminSearchDTO searchDTO) {
		return mybatis.selectOne("admin.supportForMePickUpListCnt", searchDTO);
	};
	
	public int adminSupportForMePick(AdminSearchDTO searchDTO) {
		return mybatis.update("admin.adminSupportForMePick", searchDTO);
	}
	
	public List<Map<String, Object>> getProjectProgressList(AdminSearchDTO searchDTO) {
		return mybatis.selectList("admin.getProjectProgressList", searchDTO);
	}
	public int getCntProjectProgressList(AdminSearchDTO searchDTO) {
		return mybatis.selectOne("admin.ProjectProgressListCount", searchDTO);
	}

	public int adminProjectProgress(AdminSearchDTO searchDTO) {
		return mybatis.update("admin.adminProjectProgress", searchDTO);
	}
}
