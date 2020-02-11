package com.supportforme.biz.invest.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.invest.InvestDTO;
import com.supportforme.biz.invest.InvestSearchDTO;


@Repository
public class InvestDAO {
	@Autowired 
	SqlSessionTemplate mybatis;
	
	//등록
	public int insertInvest(InvestDTO dto) {
		return mybatis.insert("invest.insertInvest", dto);
	}
	
	//수정
	public int updateInvest(InvestDTO dto) {
		return 0;
	}
	
	//삭제(회원 탈퇴)
	public int deleteInvest(InvestDTO dto) {
		return 0;
	}
	
	//단건 조회
	public Map<String, Object> getInvest(InvestDTO dto) {
		return mybatis.selectOne("invest.getInvest", dto);
	}
	 
	//전체 조회
	public List<Map<String, Object>> getInvests(InvestSearchDTO serachDTO) {
		return mybatis.selectList("invest.getInvests", serachDTO);
	}
	
	public int getCnt(InvestSearchDTO searchDTO) {
		return  mybatis.selectOne("invest.getCnt", searchDTO);
	}

	public List<Map<String, Object>>  getPresentList(InvestDTO dto){
		return mybatis.selectList("invest.getPresentList", dto);
		
	}
	public List<Map<String, Object>>  getMyInvestList(InvestSearchDTO dto){
		return mybatis.selectList("invest.getMyInvestList", dto); 
	}
	
	//마이페이지 나의 투자자
	public List<Map<String,Object>> getMyInvestorList(InvestSearchDTO searchDTO){
		return mybatis.selectList("invest.getMyInvestorList",searchDTO);
	}
	
	//마이페이지 나의 투자자 전체 개수 가져오기
	public int getInvestorCnt(InvestSearchDTO searchDTO) {
		return mybatis.selectOne("invest.getInvestorCnt", searchDTO);
	}
}
