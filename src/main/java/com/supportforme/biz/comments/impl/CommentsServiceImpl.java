package com.supportforme.biz.comments.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.supportforme.biz.comments.CommentsDTO;
import com.supportforme.biz.comments.CommentsService;

@Service
public class CommentsServiceImpl implements CommentsService{

	@Autowired
	CommentsDAO dao;
	
	//단건
	public CommentsDTO getComments(CommentsDTO dto) {
		return dao.getComments(dto);
	}
	//댓글 조회
	public List<CommentsDTO> getCommentsList(CommentsDTO dto){
		return dao.getCommentsList(dto);
	}
	public String getReplyCommentCnt(CommentsDTO dto) {
		return dao.getReplyCommentCnt(dto);
	}
	//댓글에 달린 답글 조회
	public List<CommentsDTO> getReplyCommentsList(CommentsDTO dto){
		return dao.getReplyCommentsList(dto);
	}
	//댓글 입력
	public void insertComments(CommentsDTO dto) {
		dao.insertComments(dto);
	}
	//답글 입력
	public void insertReplyComments(CommentsDTO dto) {
		dao.insertReplyComments(dto);
	}
	//댓글 수정
	public void updateComments(CommentsDTO dto) {
		dao.updateComments(dto);
	}
	//답글 수정
	public void updateReplyComments(CommentsDTO dto) {
		dao.updateReplyComments(dto);
	}
	//댓글 삭제
	public void deleteComments(CommentsDTO dto) {
		dao.deleteComments(dto);
	}
	public String getCommentCnt(CommentsDTO dto) {
		return dao.getCommentCnt(dto);
	}
	
}
