package com.multi.withPuppy.shopping;

public class StatisticsVO {
	private String s_name;
	private double s_num;
	
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public double getS_num() {
		return s_num;
	}
	public void setS_num(double s_num) {
		this.s_num = s_num;
	}
	
	@Override
	public String toString() {
		return "StatisticsVO [s_name=" + s_name + ", s_num=" + s_num + "]";
	}
	
}
