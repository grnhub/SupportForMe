package com.supportforme.biz.comments;

public class CommentsDTO {
	private String commentNo;
	private String topCommentNo;
	private String commentContent;
	private String commentDate;
	private String projectNo;
	private String userId;
	private String cnt;
	private String replyCommentCnt;
	
	public String getReplyCommentCnt() {
		return replyCommentCnt;
	}
	public void setReplyCommentCnt(String replyCommentCnt) {
		this.replyCommentCnt = replyCommentCnt;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}
	public String getTopCommentNo() {
		return topCommentNo;
	}
	public void setTopCommentNo(String topCommentNo) {
		this.topCommentNo = topCommentNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "CommentsDTO [commentNo=" + commentNo + ", topCommentNo=" + topCommentNo + ", commentContent="
				+ commentContent + ", commentDate=" + commentDate + ", projectNo=" + projectNo + ", userId=" + userId
				+ "]";
	}
	
}
