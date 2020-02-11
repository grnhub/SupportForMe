package com.supportforme.biz.test;



import java.util.Arrays;

public class UserSearchDTO extends UserDTO{
	private String searchKeyword;
	private String searchCondition;
	
	private Integer start;
	private Integer end;
	
	private String[] ids;

	private String sort; //정렬기준
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

	public String[] getIds() {
		return ids;
	}

	public void setIds(String[] ids) {
		this.ids = ids;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "UserSearchDTO [searchKeyword=" + searchKeyword + ", searchCondition=" + searchCondition + ", start="
				+ start + ", end=" + end + ", ids=" + Arrays.toString(ids) + ", sort=" + sort + "]";
	}


	
	
	
}
