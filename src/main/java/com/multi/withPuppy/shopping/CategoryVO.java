package com.multi.withPuppy.shopping;

public class CategoryVO {
	private int start;
	private int end;
	private int start_num;
	private int end_num;
	
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
	public int getStart_num() {
		return start_num;
	}
	public void setStart_num(int start_num) {
		this.start_num = start_num;
	}
	public int getEnd_num() {
		return end_num;
	}
	public void setEnd_num(int end_num) {
		this.end_num = end_num;
	}
	@Override
	public String toString() {
		return "CategoryVO [start=" + start + ", end=" + end + ", start_num=" + start_num + ", end_num=" + end_num
				+ "]";
	}
}
