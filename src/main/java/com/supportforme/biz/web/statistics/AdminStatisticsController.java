package com.supportforme.biz.web.statistics;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.supportforme.biz.member.MemberDTO;
import com.supportforme.biz.statistics.AdminStatisticDTO;
import com.supportforme.biz.statistics.AdminStatisticService;


@Controller
public class AdminStatisticsController {

	@Autowired AdminStatisticService adminStatisticService;
	
	@RequestMapping("/forme/AdminMemberJoinMonth")
	@ResponseBody
	public  List<Map<String, Object>> memberJoinStatisticsMonth(AdminStatisticDTO dto) {
		return adminStatisticService.memberJoinStatisticsMonth(dto);
	}
	
	@RequestMapping("/forme/AdminProjectRegMonth")
	@ResponseBody
	public  List<Map<String, Object>> projectRegMonth(AdminStatisticDTO dto) {
		return adminStatisticService.projectRegMonth(dto);
	}
	
	@RequestMapping("/forme/InvestAmountSumMonth")
	@ResponseBody
	public  List<Map<String, Object>> investAmountSumMonth(AdminStatisticDTO dto) {
		return adminStatisticService.investAmountSumMonth(dto);
	}
	
	@RequestMapping("/forme/AdminProjectHoldDayCnt")
	@ResponseBody
	public  List<Map<String, Object>> projectHoldCnt(AdminStatisticDTO dto) {
		return adminStatisticService.projectHoldDayCnt(dto);
	}
	
	
	
	@RequestMapping("/forme/AdminProjectRegDayCnt")
	@ResponseBody
	public  List<Map<String, Object>> projectRegDayCnt(AdminStatisticDTO dto) {
		return adminStatisticService.projectRegDayCnt(dto);
	}
	
	
	
	
	
	@RequestMapping("/forme/AdminDashBoard")
	public String adminDashBoard(HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("LoginInfo");
		return "admin/adminDashBoard";
	}
	

}

