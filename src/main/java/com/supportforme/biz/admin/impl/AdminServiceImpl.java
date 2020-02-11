package com.supportforme.biz.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.admin.AdminDTO;
import com.supportforme.biz.admin.AdminSearchDTO;
import com.supportforme.biz.admin.AdminService;



@Service
public class AdminServiceImpl implements AdminService {

	
	@Autowired AdminDAO dao;

	@Override
	public List<Map<String, Object>> getAdminMembers(AdminSearchDTO serachDTO) {
		return dao.getAdminMembers(serachDTO);
	}

	@Override
	public int getCntAdminMember(AdminSearchDTO searchDTO) {
		return dao.getCntAdminMember(searchDTO);
	}

	@Override
	public int deleteAdminMembers(AdminSearchDTO searchDTO) {
		return dao.deleteAdminMembers(searchDTO);
	}

	@Override
	public List<Map<String, Object>> getAdminSupportForMePickUpList(AdminSearchDTO searchDTO) {
		return dao.getAdminSupportForMePickUpList(searchDTO);
	}

	@Override
	public int getCntAdminSupportForMePickUpList(AdminSearchDTO searchDTO) {
		return dao.getCntAdminSupportForMePickUpList(searchDTO);
	}

	@Override
	public int adminSupportForMePick(AdminSearchDTO searchDTO) {
		return dao.adminSupportForMePick(searchDTO);
	}

	@Override
	public List<Map<String, Object>> getProjectProgressList(AdminSearchDTO searchDTO) {
		return dao.getProjectProgressList(searchDTO);
	}

	@Override
	public int getCntProjectProgressList(AdminSearchDTO searchDTO) {
		return dao.getCntProjectProgressList(searchDTO);
	}

	@Override
	public int adminProjectProgress(AdminSearchDTO searchDTO) {
		return dao.adminProjectProgress(searchDTO);
	}
	
}
