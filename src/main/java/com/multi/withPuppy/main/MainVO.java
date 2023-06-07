package com.multi.withPuppy.main;

public class MainVO {

	//풀 리퀘스트 테스트~
	private int commu_no;
	private int faq_no;
	private String commu_title;
	private String faq_title;
	public int getCommu_no() {
		return commu_no;
	}
	public void setCommu_no(int commu_no) {
		this.commu_no = commu_no;
	}
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public String getCommu_title() {
		return commu_title;
	}
	public void setCommu_title(String commu_title) {
		this.commu_title = commu_title;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	@Override
	public String toString() {
		return "MainVO [commu_no=" + commu_no + ", faq_no=" + faq_no + ", commu_title=" + commu_title + ", faq_title="
				+ faq_title + "]";
	}
	

}
