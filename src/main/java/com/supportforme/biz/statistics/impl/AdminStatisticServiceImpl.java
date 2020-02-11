package com.supportforme.biz.statistics.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.statistics.AdminStatisticDTO;
import com.supportforme.biz.statistics.AdminStatisticService;
@Service
public class AdminStatisticServiceImpl implements AdminStatisticService {
	
	@Autowired AdminStatisticDAO adminStatisticDAO;
	
	@Override
	public List<Map<String, Object>> memberJoinStatisticsMonth(AdminStatisticDTO dto) {
		return adminStatisticDAO.memberJoinStatisticsMonth(dto);
	}

	@Override
	public List<Map<String, Object>> projectRegMonth(AdminStatisticDTO dto) {
		return adminStatisticDAO.projectRegMonth(dto);
	}

	@Override
	public List<Map<String, Object>> investAmountSumMonth(AdminStatisticDTO dto) {
		return adminStatisticDAO.investAmountSumMonth(dto);
	}

	@Override
	public List<Map<String, Object>> projectHoldDayCnt(AdminStatisticDTO dto) {
		return adminStatisticDAO.projectHoldDayCnt(dto);
	}

	@Override
	public List<Map<String, Object>> projectRegDayCnt(AdminStatisticDTO dto) {
		return adminStatisticDAO.projectRegDayCnt(dto);
	}

}
