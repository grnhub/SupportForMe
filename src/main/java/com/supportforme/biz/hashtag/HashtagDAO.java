package com.supportforme.biz.hashtag;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.project.ProjectDTO;

@Repository
public class HashtagDAO {
		
		@Autowired SqlSessionTemplate mybatis;
		
		public int insertHashtag(HashtagDTO dto) {
			return mybatis.insert("hashtag.insertHashtag", dto);
		}
		
		public List<HashtagDTO> getHashtags(String projectNo){
			return mybatis.selectList("hashtag.getHashtags", projectNo);
		}
		
		public int deleteHashtag(String hashtagNo) {
			return mybatis.delete("hashtag.deleteHashtag",hashtagNo);
		}
}
