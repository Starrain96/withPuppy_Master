package com.multi.withPuppy.communities;

public class PageVO {
	
	private int start;
	private int end;
	private int page;
	private String category1;
	
	private String type;
	private String keyword;

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	
	public String getCategory1() {
		return category1;
	}
	
	public void setStartEnd(int page) {
		start = 1 + (page - 1) * 10;
		end = page * 10;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "PageVO [start=" + start + ", end=" + end + ", page=" + page + ", category1=" + category1 + "]";
	}
	
	

}
