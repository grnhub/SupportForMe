package com.supportforme.biz.statistics;

import java.util.List;
import java.util.Map;

public interface AdminStatisticService {
	public List<Map<String, Object>>  memberJoinStatisticsMonth(AdminStatisticDTO dto);
	
	public List<Map<String, Object>>  projectRegMonth(AdminStatisticDTO dto);
	
	public List<Map<String, Object>>  investAmountSumMonth(AdminStatisticDTO dto);
	
	
	public List<Map<String, Object>>  projectHoldDayCnt(AdminStatisticDTO dto);
	
	public List<Map<String, Object>>  projectRegDayCnt(AdminStatisticDTO dto);
	
}
