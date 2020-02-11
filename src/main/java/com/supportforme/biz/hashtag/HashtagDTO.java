package com.supportforme.biz.hashtag;

public class HashtagDTO {
	private String hashtagNo;
	private String hashtagName;
	private String projectNo;

	public String getHashtagNo() {
		return hashtagNo;
	}
	public void setHashtagNo(String hashtagNo) {
		this.hashtagNo = hashtagNo;
	}
	public String getHashtagName() {
		return hashtagName;
	}
	public void setHashtagName(String hashtagName) {
		this.hashtagName = hashtagName;
	}
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	@Override
	public String toString() {
		return "HashtagDTO [hashtagNo=" + hashtagNo + ", hashtagName=" + hashtagName + ", projectNo=" + projectNo + "]";
	}

	
}
