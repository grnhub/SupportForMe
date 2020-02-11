package com.supportforme.biz.invest;


import java.util.List;
import java.util.Map;


public interface InvestService {

	//등록
	public int insertInvest(InvestDTO dto);
	//수정
	public int updateInvest(InvestDTO dto);
	//삭제(회원 탈퇴)
	public int deleteInvest(InvestDTO dto);
	//단건 조회
	public Map<String, Object> getInvest(InvestDTO dto);
	 
	//전체 조회
	public List<Map<String, Object>> getInvests(InvestSearchDTO serachDTO);
	
	public int getCnt(InvestSearchDTO searchDTO); 
	
	public List<Map<String, Object>>  getPresentList(InvestDTO dto);
	
	public List<Map<String, Object>>  getMyInvestList(InvestSearchDTO dto);
	
	//마이페이지 나의 투자자
	public List<Map<String,Object>> getMyInvestorList(InvestSearchDTO searchDTO);
	
	//마이페이지 나의 투자자 전체 개수 가져오기
	public int getInvestorCnt(InvestSearchDTO searchDTO);
}
