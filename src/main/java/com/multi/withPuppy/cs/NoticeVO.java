package com.multi.withPuppy.cs;

import java.sql.Timestamp;

public class NoticeVO {

	private int noti_no;
	private String noti_title;
	private String noti_content;
	private String noti_writer;
	private Timestamp noti_date;
	private String noti_img1;
	private String noti_img2;
	private String noti_img3;
	
	public int getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public String getNoti_writer() {
		return noti_writer;
	}
	public void setNoti_writer(String noti_writer) {
		this.noti_writer = noti_writer;
	}
	public Timestamp getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Timestamp noti_date) {
		this.noti_date = noti_date;
	}
	public String getNoti_img1() {
		return noti_img1;
	}
	public void setNoti_img1(String noti_img1) {
		this.noti_img1 = noti_img1;
	}
	public String getNoti_img2() {
		return noti_img2;
	}
	public void setNoti_img2(String noti_img2) {
		this.noti_img2 = noti_img2;
	}
	public String getNoti_img3() {
		return noti_img3;
	}
	public void setNoti_img3(String noti_img3) {
		this.noti_img3 = noti_img3;
	}
	@Override
	public String toString() {
		return "NoticeVO [noti_no=" + noti_no + ", noti_title=" + noti_title + ", noti_content=" + noti_content
				+ ", noti_writer=" + noti_writer + ", noti_date=" + noti_date + ", noti_img1=" + noti_img1
				+ ", noti_img2=" + noti_img2 + ", noti_img3=" + noti_img3 + "]";
	}
	
	
}
