package com.supportforme.biz.creditInfo;

public class CreditInfoDTO {
	private String payNo;
	private String userId;
	private String cardNum;
	private String expirationDate;
	private String cardpassword;
	private String payPassword;
	public String getPayNo() {
		return payNo;
	}
	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getCardpassword() {
		return cardpassword;
	}
	public void setCardpassword(String cardpassword) {
		this.cardpassword = cardpassword;
	}
	public String getPayPassword() {
		return payPassword;
	}
	public void setPayPassword(String payPassword) {
		this.payPassword = payPassword;
	}
	@Override
	public String toString() {
		return "CreditInfoDTO [payNo=" + payNo + ", userId=" + userId + ", cardNum=" + cardNum + ", expirationDate="
				+ expirationDate + ", cardpassword=" + cardpassword + ", payPassword=" + payPassword + "]";
	}
	
	
	
	
}
