package com.supportforme.biz.hashtag;

import java.util.List;

import com.supportforme.biz.project.ProjectDTO;

public interface HashtagService {
		
	public int insertHashtag(HashtagDTO dto);
	
	public List<HashtagDTO> getHashtags(String projectNo);
	
	public int deleteHashtag(String hashtagNo);
}
