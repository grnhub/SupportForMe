package com.supportforme.biz.invest;

public class InvestDTO {
	
	private String investNo;
	private String investmentAmount;
	private String totalInvestAmount; /*필요해서 추가했습니다^^*/
	private String headcount; /*필요해서 추가했습니다^^ -김효정*/
	private String payType;
	private String presentNo;
	private String userId;
	private String projectNo;
	private String paymentState;
	private String postcode;
	private String address;
	private String addrDetail;
	private String phoneNum;
	private String email;
	private String name;
	private String request;
	private String uuid;
	private String[] subject;			/* 필요해서 추가했습니다 ^^ - 김혜연 */
	
	public String getTotalInvestAmount() {
		return totalInvestAmount;
	}
	public void setTotalInvestAmount(String totalInvestAmount) {
		this.totalInvestAmount = totalInvestAmount;
	}
	public String getHeadcount() {
		return headcount;
	}
	public void setHeadcount(String headcount) {
		this.headcount = headcount;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInvestNo() {
		return investNo;
	}
	public void setInvestNo(String investNo) {
		this.investNo = investNo;
	}
	public String getInvestmentAmount() {
		return investmentAmount;
	}
	public void setInvestmentAmount(String investmentAmount) {
		this.investmentAmount = investmentAmount;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getPresentNo() {
		return presentNo;
	}
	public void setPresentNo(String presentNo) {
		this.presentNo = presentNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	public String getPaymentState() {
		return paymentState;
	}
	public void setPaymentState(String paymentState) {
		this.paymentState = paymentState;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String[] getSubject() {
		return subject;
	}
	public void setSubject(String[] subject) {
		this.subject = subject;
	}
	
	
	
	
}
