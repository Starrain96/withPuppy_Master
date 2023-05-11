package com.multi.withPuppy.cs;

import java.sql.Timestamp;

public class AskVO {

	private int ask_no;
	private String ask_title;
	private String ask_content;
	private String ask_writer;
	private Timestamp ask_date;
	private String ask_img1;
	private String ask_img2;
	private String ask_img3;
	private String ask_mail;
	public int getAsk_no() {
		return ask_no;
	}
	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}
	public String getAsk_title() {
		return ask_title;
	}
	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}
	public String getAsk_content() {
		return ask_content;
	}
	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
	public String getAsk_writer() {
		return ask_writer;
	}
	public void setAsk_writer(String ask_writer) {
		this.ask_writer = ask_writer;
	}
	public Timestamp getAsk_date() {
		return ask_date;
	}
	public void setAsk_date(Timestamp ask_date) {
		this.ask_date = ask_date;
	}
	public String getAsk_img1() {
		return ask_img1;
	}
	public void setAsk_img1(String ask_img1) {
		this.ask_img1 = ask_img1;
	}
	public String getAsk_img2() {
		return ask_img2;
	}
	public void setAsk_img2(String ask_img2) {
		this.ask_img2 = ask_img2;
	}
	public String getAsk_img3() {
		return ask_img3;
	}
	public void setAsk_img3(String ask_img3) {
		this.ask_img3 = ask_img3;
	}
	public String getAsk_mail() {
		return ask_mail;
	}
	public void setAsk_mail(String ask_mail) {
		this.ask_mail = ask_mail;
	}
	@Override
	public String toString() {
		return "askVO [ask_no=" + ask_no + ", ask_title=" + ask_title + ", ask_content=" + ask_content + ", ask_writer="
				+ ask_writer + ", ask_date=" + ask_date + ", ask_img1=" + ask_img1 + ", ask_img2=" + ask_img2
				+ ", ask_img3=" + ask_img3 + ", ask_mail=" + ask_mail + "]";
	}
	
	
}
