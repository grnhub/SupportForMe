package com.supportforme.biz.member;

import java.util.List;


public interface MemberService {

	//등록
	public int insertMember(MemberDTO dto);
	//수정
	public int updateMember(MemberDTO dto);
	//삭제(회원 탈퇴)
	public int deleteMember(MemberDTO dto);
	//단건 조회
	public MemberDTO getMember(MemberDTO dto);
	
	//전체 조회
	public List<MemberDTO> getMembers(MemberSerachDTO serachDTO);
	
	public int getCnt(MemberSerachDTO searchDTO); 
	
	public MemberDTO passwordCheck(MemberDTO dto);
	
	public int checkId(MemberDTO dto);
	
	public int checkEmail(MemberDTO dto);
	
	public MemberDTO findId(MemberDTO dto);
	
	public MemberDTO findPassword(MemberDTO dto);
	
	public int updateRandomPassword(MemberDTO dto);
	
	public int deleteMemberCheck(MemberDTO dto);
}
