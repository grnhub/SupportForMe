package com.supportforme.biz.web.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.supportforme.biz.comments.CommentsDTO;
import com.supportforme.biz.comments.CommentsService;

@Controller
public class CommentsController {

	@Autowired CommentsService commentsService;
/*	
	@Autowired MemberService memberService;
	
	@RequestMapping("/forme/AddrUserId")
	@ResponseBody
	public MemberDTO addrInput(HttpSession session) {
		
		MemberDTO dto = (MemberDTO) session.getAttribute("LoginInfo");
		return dto;
	}
*/	
	//댓글조회
	@RequestMapping("/support/getCommentsList")
	@ResponseBody
	public List<CommentsDTO> getCommentsList(CommentsDTO dto) {
		List<CommentsDTO> list = commentsService.getCommentsList(dto);
		for(CommentsDTO i : list ) {
			i.setReplyCommentCnt(commentsService.getReplyCommentCnt(i));
		}
		return list;
	}
	@RequestMapping("/support/getReplyCommentCnt")
	@ResponseBody
	public String getReplyCommentCnt(CommentsDTO dto) {
		return commentsService.getReplyCommentCnt(dto);
	}
	
	//답글조회
	@RequestMapping("/support/getReplyCommentsList")
	@ResponseBody
	public List<CommentsDTO> getReplyCommentsList(CommentsDTO dto){
		return commentsService.getReplyCommentsList(dto);
	}
	//댓글 입력
	@RequestMapping("/forme/insertComments")
	@ResponseBody
	public CommentsDTO insertComments(CommentsDTO dto) {
		commentsService.insertComments(dto);
		return commentsService.getComments(dto);
	}
	//답글 입력
	@RequestMapping("/forme/insertReplyComments")
	@ResponseBody
	public CommentsDTO insertReplyComments(CommentsDTO dto) {
		commentsService.insertReplyComments(dto);
		return commentsService.getComments(dto);
	}
	//댓글수정
	@RequestMapping("/forme/updateComments")
	@ResponseBody
	public CommentsDTO updateComments(CommentsDTO dto) {
		commentsService.updateComments(dto);
		return commentsService.getComments(dto);
	}
	//답글수정
	@RequestMapping("/forme/updateReplyComments")
	@ResponseBody
	public CommentsDTO updateReplyComments(CommentsDTO dto) {
		commentsService.updateReplyComments(dto);
		return commentsService.getComments(dto);
	}
	//댓글삭제
	@RequestMapping("/forme/deleteComments")
	@ResponseBody
	public CommentsDTO deleteComments(CommentsDTO dto) {
		System.out.println("ddddddddddd"+dto);
		commentsService.deleteComments(dto);
		dto.setCnt(commentsService.getCommentCnt(dto));
		return dto;
	}
	
}
