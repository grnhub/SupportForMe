package com.supportforme.biz.member.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.member.MemberSerachDTO;
import com.supportforme.biz.member.MemberService;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired MemberDAO dao;
	@Override
	public int insertMember(MemberDTO dto) {
		return dao.insertMember(dto);
	}

	@Override
	public int updateMember(MemberDTO dto) {
		return dao.updateMember(dto);
	}

	@Override
	public int deleteMember(MemberDTO dto) {
		return dao.deleteMember(dto);
	}

	@Override
	public MemberDTO getMember(MemberDTO dto) {
		return dao.getMember(dto);
	}

	@Override
	public List<MemberDTO> getMembers(MemberSerachDTO searchDTO) {
		return dao.getMembers(searchDTO);
	}

	@Override
	public int getCnt(MemberSerachDTO searchDTO) {
		return dao.getCnt(searchDTO);
	}

	@Override
	public MemberDTO passwordCheck(MemberDTO dto) {
		return dao.passwordCheck(dto);
	}

	@Override
	public int checkId(MemberDTO dto) {
		return dao.checkId(dto);
	}

	@Override
	public MemberDTO findId(MemberDTO dto) {
		return dao.findId(dto);
	}

	@Override
	public int checkEmail(MemberDTO dto) {
		return dao.checkEmail(dto);
	}

	@Override
	public MemberDTO findPassword(MemberDTO dto) {
		return dao.findPassword(dto);
	}

	@Override
	public int updateRandomPassword(MemberDTO dto) {
		return dao.updateRandomPassword(dto);
	}

	@Override
	public int deleteMemberCheck(MemberDTO dto) {
		return dao.deleteMemberCheck(dto);
	}
	
}
