package com.supportforme.biz.comments.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.supportforme.biz.comments.CommentsDTO;

@Repository
public class CommentsDAO {
	
	@Autowired SqlSessionTemplate mybatis;
	
	//단건
	public CommentsDTO getComments(CommentsDTO dto) {
		return mybatis.selectOne("comments.getComments", dto);
	}
	 
	//댓글 조회
	public List<CommentsDTO> getCommentsList(CommentsDTO dto) {
		return mybatis.selectList("comments.getCommentsList", dto);
	}
	public String getReplyCommentCnt(CommentsDTO dto) {
		return mybatis.selectOne("comments.getReplyCommentCnt", dto);
	}
	
	//댓글에 달린 답글 조회
	public List<CommentsDTO> getReplyCommentsList(CommentsDTO dto) {
		return mybatis.selectList("comments.getReplyCommentsList", dto);
	}
	
	//댓글 입력
	public void insertComments(CommentsDTO dto) {
		mybatis.insert("comments.insertComments", dto);
	}
	
	//답글 입력
	public void insertReplyComments(CommentsDTO dto) {
		mybatis.insert("comments.insertReplyComments", dto);
	}
	
	//댓글 수정
	public void updateComments(CommentsDTO dto) {
		mybatis.update("comments.updateComments", dto);
	}
	
	//답글 수정
	public void updateReplyComments(CommentsDTO dto) {
		mybatis.update("comments.updateReplyComments", dto);
	}
	
	//댓글 삭제
	public void deleteComments(CommentsDTO dto) {
		mybatis.delete("comments.deleteComments", dto);
	}
	public String getCommentCnt(CommentsDTO dto) {
		return mybatis.selectOne("comments.getCommentCnt", dto);
	}

}
