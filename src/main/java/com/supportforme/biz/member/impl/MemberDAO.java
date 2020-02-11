package com.supportforme.biz.member.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberSerachDTO;

@Repository
public class MemberDAO {
	@Autowired 
	SqlSessionTemplate mybatis;
	
	public int insertMember(MemberDTO dto) {
		return mybatis.insert("member.insertMember", dto);
	};

	// 수정
	public int updateMember(MemberDTO dto) {
		return mybatis.update("member.updateMember", dto);
	};

	// 삭제(회원 탈퇴)
	public int deleteMember(MemberDTO dto) {
		return mybatis.update("member.deleteMember", dto);
	};

	// 단건 조회
	public MemberDTO getMember(MemberDTO dto) {
		return mybatis.selectOne("member.getMember", dto);
	
	};

	// 전체 조회
	public List<MemberDTO> getMembers(MemberSerachDTO searchDTO){
		return mybatis.selectList("member.getMembers", searchDTO);
	};

	public int getCnt(MemberSerachDTO searchDTO) {
		return 0;
	}
	
	public MemberDTO passwordCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("member.passwordCheck", dto);
	}
	
	public int checkId(MemberDTO dto) {
		return mybatis.selectOne("member.checkId", dto);
	}
	
	
	public int checkEmail(MemberDTO dto) {
		return mybatis.selectOne("member.checkEmail", dto);
	}
	
	public MemberDTO findId(MemberDTO dto) {
		return mybatis.selectOne("member.findId", dto);
	}
	
	public MemberDTO findPassword(MemberDTO dto) {
		return mybatis.selectOne("member.findPassword", dto);
	}
	
	public int updateRandomPassword(MemberDTO dto) {
		return mybatis.update("member.updateRandomPassword",dto);
	}
	
	
	public int deleteMemberCheck(MemberDTO dto) {
		return mybatis.selectOne("member.deleteMemberCheck",dto);
	}
}
