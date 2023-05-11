package com.multi.withPuppy.cs;

import java.sql.Timestamp;

public class FaqVO {

	private int faq_no;
	private String faq_category;
	private String faq_title;
	private String faq_content;
	private String faq_writer;
	private Timestamp faq_date;
	private String faq_img1;
	private String faq_img2;
	private String faq_img3;
	public int getFaq_no() {
		return faq_no;
	}
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_writer() {
		return faq_writer;
	}
	public void setFaq_writer(String faq_writer) {
		this.faq_writer = faq_writer;
	}
	public Timestamp getFaq_date() {
		return faq_date;
	}
	public void setFaq_date(Timestamp faq_date) {
		this.faq_date = faq_date;
	}
	public String getFaq_img1() {
		return faq_img1;
	}
	public void setFaq_img1(String faq_img1) {
		this.faq_img1 = faq_img1;
	}
	public String getFaq_img2() {
		return faq_img2;
	}
	public void setFaq_img2(String faq_img2) {
		this.faq_img2 = faq_img2;
	}
	public String getFaq_img3() {
		return faq_img3;
	}
	public void setFaq_img3(String faq_img3) {
		this.faq_img3 = faq_img3;
	}
	@Override
	public String toString() {
		return "FaqVO [faq_no=" + faq_no + ", faq_category=" + faq_category + ", faq_title=" + faq_title
				+ ", faq_content=" + faq_content + ", faq_writer=" + faq_writer + ", faq_date=" + faq_date
				+ ", faq_img1=" + faq_img1 + ", faq_img2=" + faq_img2 + ", faq_img3=" + faq_img3 + "]";
	}
	
}
