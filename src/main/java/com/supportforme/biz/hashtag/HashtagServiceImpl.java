package com.supportforme.biz.hashtag;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.project.ProjectDTO;

@Service
public class HashtagServiceImpl implements HashtagService{
	
	@Autowired HashtagDAO hashtagDAO;

	@Override
	public int insertHashtag(HashtagDTO dto) {
		return hashtagDAO.insertHashtag(dto);
	}
	@Override
	public List<HashtagDTO> getHashtags(String projectNo) {
		return hashtagDAO.getHashtags(projectNo);
	}

	@Override
	public int deleteHashtag(String hashtagNo) {
		return hashtagDAO.deleteHashtag(hashtagNo);
	}

}
