package com.multi.withPuppy.cs;

import java.sql.Timestamp;

public class AnswerVO {

	//풀 리퀘스트 테스트~
	private int ans_no;
	private int ask_no;
	private String ans_content;
	private String ans_writer;
	private Timestamp ans_date;
	private String ans_img1;
	private String ans_img2;
	private String ans_img3;
	private int ask_like;
	public int getAns_no() {
		return ans_no;
	}
	public void setAns_no(int ans_no) {
		this.ans_no = ans_no;
	}
	public int getAsk_no() {
		return ask_no;
	}
	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}
	public String getAns_content() {
		return ans_content;
	}
	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}
	public String getAns_writer() {
		return ans_writer;
	}
	public void setAns_writer(String ans_writer) {
		this.ans_writer = ans_writer;
	}
	public Timestamp getAns_date() {
		return ans_date;
	}
	public void setAns_date(Timestamp ans_date) {
		this.ans_date = ans_date;
	}
	public String getAns_img1() {
		return ans_img1;
	}
	public void setAns_img1(String ans_img1) {
		this.ans_img1 = ans_img1;
	}
	public String getAns_img2() {
		return ans_img2;
	}
	public void setAns_img2(String ans_img2) {
		this.ans_img2 = ans_img2;
	}
	public String getAns_img3() {
		return ans_img3;
	}
	public void setAns_img3(String ans_img3) {
		this.ans_img3 = ans_img3;
	}
	public int getAsk_like() {
		return ask_like;
	}
	public void setAsk_like(int ask_like) {
		this.ask_like = ask_like;
	}
	@Override
	public String toString() {
		return "answerVO [ans_no=" + ans_no + ", ask_no=" + ask_no + ", ans_content=" + ans_content + ", ans_writer="
				+ ans_writer + ", ans_date=" + ans_date + ", ans_img1=" + ans_img1 + ", ans_img2=" + ans_img2
				+ ", ans_img3=" + ans_img3 + ", ask_like=" + ask_like + "]";
	}
	

}
