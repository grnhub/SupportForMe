package com.supportforme.biz.statistics.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.statistics.AdminStatisticDTO;

@Repository
public class AdminStatisticDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	public List<Map<String, Object>> memberJoinStatisticsMonth(AdminStatisticDTO dto) {
		return mybatis.selectList("statistics.memberJoinStatisticsMonth", dto);
	}
	

	public List<Map<String, Object>> projectRegMonth(AdminStatisticDTO dto) {
		return mybatis.selectList("statistics.projectRegMonth", dto);
	}
	
	
	public List<Map<String, Object>> investAmountSumMonth(AdminStatisticDTO dto) {
		return mybatis.selectList("statistics.investAmountSumMonth", dto);
	}
	
	
	public List<Map<String, Object>> projectHoldDayCnt(AdminStatisticDTO dto) {
		return mybatis.selectList("statistics.projectHoldCnt", dto);
	
	}
	
	
	public List<Map<String, Object>> projectRegDayCnt(AdminStatisticDTO dto) {
		return mybatis.selectList("statistics.projectRegDayCnt", dto);
	}
}
