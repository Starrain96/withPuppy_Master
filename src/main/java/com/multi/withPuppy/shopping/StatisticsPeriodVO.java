package com.multi.withPuppy.shopping;

public class StatisticsPeriodVO {
	private String startNum;
	private String endNum;
	
	public StatisticsPeriodVO(String startNum, String endNum) {
		super();
		this.startNum = startNum;
		this.endNum = endNum;
	}
	public String getStartNum() {
		return startNum;
	}
	public void setStartNum(String startNum) {
		this.startNum = startNum;
	}
	public String getEndNum() {
		return endNum;
	}
	public void setEndNum(String endNum) {
		this.endNum = endNum;
	}
	@Override
	public String toString() {
		return "StatisticsPeriodVO [startNum=" + startNum + ", endNum=" + endNum + "]";
	}
	
	
}
