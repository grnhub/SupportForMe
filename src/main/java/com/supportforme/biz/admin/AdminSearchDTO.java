package com.supportforme.biz.admin;

public class AdminSearchDTO  extends AdminDTO{
	
	private String searchKeyword;
	private String searchCondition;
	private String supportForMePickUp;
	private Integer start;
	private Integer end;
	private String startdate;
	private String enddate;
	private String[] ids;
	private String flag;
	private String progress;
	
	
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getSupportForMePickUp() {
		return supportForMePickUp;
	}
	public void setSupportForMePickUp(String supportForMePickUp) {
		this.supportForMePickUp = supportForMePickUp;
	}
	public String[] getIds() {
		return ids;
	}
	public void setIds(String[] ids) {
		this.ids = ids;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getEnd() {
		return end;
	}
	public void setEnd(Integer end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "InvestSearchDTO [searchKeyword=" + searchKeyword + ", searchCondition=" + searchCondition + ", start="
				+ start + ", end=" + end + "]";
	}

}
