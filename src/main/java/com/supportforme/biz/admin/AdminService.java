package com.supportforme.biz.admin;


import java.util.List;
import java.util.Map;

import com.supportforme.biz.member.MemberDTO;


public interface AdminService {

	public List<Map<String, Object>> getAdminMembers(AdminSearchDTO serachDTO);
	
	public int getCntAdminMember(AdminSearchDTO searchDTO);
	
	public List<Map<String, Object>> getAdminSupportForMePickUpList(AdminSearchDTO searchDTO);
	
	public int getCntAdminSupportForMePickUpList(AdminSearchDTO searchDTO);
	
	public int deleteAdminMembers(AdminSearchDTO searchDTO);
	
	public int adminSupportForMePick(AdminSearchDTO searchDTO);
	
	public List<Map<String, Object>> getProjectProgressList(AdminSearchDTO searchDTO);
	
	public int getCntProjectProgressList(AdminSearchDTO searchDTO);
	
	public int adminProjectProgress(AdminSearchDTO searchDTO);
}
