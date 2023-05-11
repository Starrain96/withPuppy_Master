package com.multi.withPuppy.communities;

import java.sql.Timestamp;

public class CommunitiesVO {
	private int commu_no;
	private String commu_id;
	private String commu_title;
	private String commu_content;
	private String commu_img;
	private String commu_img2;
	private String commu_img3;
	private String category1;
	private String category2;
	private String category3;
	private int commu_view;
	private Timestamp commu_date;
	private int commu_like;
	
	public int getCommu_no() {
		return commu_no;
	}
	public void setCommu_no(int commu_no) {
		this.commu_no = commu_no;
	}
	public String getCommu_id() {
		return commu_id;
	}
	public void setCommu_id(String commu_id) {
		this.commu_id = commu_id;
	}
	public String getCommu_title() {
		return commu_title;
	}
	public void setCommu_title(String commu_title) {
		this.commu_title = commu_title;
	}
	public String getCommu_content() {
		return commu_content;
	}
	public void setCommu_content(String commu_content) {
		this.commu_content = commu_content;
	}
	public String getCommu_img() {
		return commu_img;
	}
	public void setCommu_img(String commu_img) {
		this.commu_img = commu_img;
	}
	public String getCommu_img2() {
		return commu_img2;
	}
	public void setCommu_img2(String commu_img2) {
		this.commu_img2 = commu_img2;
	}
	public String getCommu_img3() {
		return commu_img3;
	}
	public void setCommu_img3(String commu_img3) {
		this.commu_img3 = commu_img3;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getCategory3() {
		return category3;
	}
	public void setCategory3(String category3) {
		this.category3 = category3;
	}
	public int getCommu_view() {
		return commu_view;
	}
	public void setCommu_view(int commu_view) {
		this.commu_view = commu_view;
	}
	public Timestamp getCommu_date() {
		return commu_date;
	}
	public void setCommu_date(Timestamp commu_date) {
		this.commu_date = commu_date;
	}
	public int getCommu_like() {
		return commu_like;
	}
	public void setCommu_like(int commu_like) {
		this.commu_like = commu_like;
	}
	@Override
	public String toString() {
		return "CommunitiesVO [commu_no=" + commu_no + ", commu_id=" + commu_id + ", commu_title=" + commu_title
				+ ", commu_content=" + commu_content + ", commu_img=" + commu_img + ", commu_img2=" + commu_img2
				+ ", commu_img3=" + commu_img3 + ", category1=" + category1 + ", category2=" + category2
				+ ", category3=" + category3 + ", commu_view=" + commu_view + ", commu_date=" + commu_date
				+ ", commu_like=" + commu_like + "]";
	}
	
	
	
}
