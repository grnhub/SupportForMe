package com.supportforme.biz.web.present;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supportforme.biz.present.PresentDTO;
import com.supportforme.biz.present.PresentService;

@Controller
public class PresentController {
	
	@Autowired PresentService presentService;
	
	@RequestMapping("/forme/insertReward")
	@ResponseBody
	public PresentDTO insertReward(PresentDTO pdto){
		presentFunc(pdto);
		presentService.insertPresent(pdto);
		return presentService.getPresent(pdto);
	}
	
	@RequestMapping("/forme/getRewards")
	@ResponseBody
	public List<PresentDTO> getRewards(PresentDTO pdto){
		return presentService.getPresents(pdto);
	}
	
	@RequestMapping("/forme/deleteReward")
	@ResponseBody
	public PresentDTO deleteReward(PresentDTO pdto) {
		presentService.deletePresent(pdto);
		return pdto;
	}
	
	@RequestMapping("/forme/updateReward")
	@ResponseBody
	public PresentDTO updateReward(PresentDTO pdto) {
		presentFunc(pdto);
		presentService.updatePresent(pdto);
		return pdto;
	}
	
	PresentDTO presentFunc(PresentDTO pdto){
		if(!pdto.getPresentPrice().equals("")) {
			String tempPrice = pdto.getPresentPrice();
			pdto.setPresentPrice(tempPrice.replace(",",""));
		}
		return pdto;
	}
}
