package com.supportforme.biz.invest;

public class InvestSearchDTO  extends InvestDTO{
	
	private String searchKeyword;
	private String searchCondition;
	
	private Integer start;
	private Integer end;
	
	private String startdate;
	private String enddate;
	
	
	
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
