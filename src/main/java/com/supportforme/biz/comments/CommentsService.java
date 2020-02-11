package com.supportforme.biz.comments;

import java.util.List;

public interface CommentsService {
	
	public CommentsDTO getComments(CommentsDTO dto);
	
	//댓글 조회
	public List<CommentsDTO> getCommentsList(CommentsDTO dto);
	public String getReplyCommentCnt(CommentsDTO dto);	
	
	//댓글에 달린 답글 조회
	public List<CommentsDTO> getReplyCommentsList(CommentsDTO dto);
	
	//댓글 입력
	public void insertComments(CommentsDTO dto);
	
	//답글 입력
	public void insertReplyComments(CommentsDTO dto);
	
	//댓글 수정
	public void updateComments(CommentsDTO dto);
	
	//답글 수정
	public void updateReplyComments(CommentsDTO dto);
	
	//댓글 삭제
	public void deleteComments(CommentsDTO dto);
	public String getCommentCnt(CommentsDTO dto);
		
}
