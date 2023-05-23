package com.multi.withPuppy.communities;

public class PageVO {
	
	private int start;
	private int end;
	private int page;
	
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
	
	

}
