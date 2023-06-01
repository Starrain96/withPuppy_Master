package com.multi.withPuppy.user;

public class UserPageVO {
	private int start;
	private int end;
	private int page;
	private String user_level;
	private String user_condition;
	private String searchWord;

	public void setStartEnd(int page) {
		//page별로 start, end값만 구해주면 됨.
		start = 1 + (page - 1) * 10; 
		//무조건 1부터 시작
		//1page: 1 + 0 * 10 => start 1
		//2page: 1 + 1 * 10 => start 11  
		end = page * 10;
		//1page: 1 * 10 => end 10
		//2page: 2 * 10 => end 20
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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
	public String getUser_level() {
		return user_level;
	}

	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}

	public String getUser_condition() {
		return user_condition;
	}

	public void setUser_condition(String user_condition) {
		this.user_condition = user_condition;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

}