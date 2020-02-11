package com.supportforme.biz.web.hashtag;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.supportforme.biz.hashtag.HashtagDTO;
import com.supportforme.biz.hashtag.HashtagService;

@RestController
public class HashtagController {
	
	@Autowired HashtagService service;
	
	public Map<String,Object> map = new HashMap<String,Object>();
	
	
	@RequestMapping(value="/forme/hashtags/{projectNo}",method=RequestMethod.GET)
	public List<HashtagDTO> getHashtags(@PathVariable String projectNo){
		return service.getHashtags(projectNo);
	}
	
	@RequestMapping(value="/forme/hashtags",method=RequestMethod.POST,consumes="application/json")
	public Map<String,Object> insertHashtag(@RequestBody HashtagDTO htdto) {
		List<HashtagDTO> list = service.getHashtags(htdto.getProjectNo());  
		
		String code="";
		if(list.size()>0) {
			for(HashtagDTO ht : list) {
				String htName = ht.getHashtagName();
				if(htName.equals(htdto.getHashtagName())) {
					code = "same";
				}
			}
		}
		if(!code.equals("same")) {
			code="success";
			service.insertHashtag(htdto);
		}
		map.put("hashtag",htdto);
		map.put("code", code);
		return map;
	}
	
	@RequestMapping(value="/forme/hashtags/{hashtagNo}",method=RequestMethod.DELETE)
	public Map<String,Object> deleteHashtag(@PathVariable String hashtagNo){
		service.deleteHashtag(hashtagNo);
		map.put("code", "success");
		return map;
	}
	
}
