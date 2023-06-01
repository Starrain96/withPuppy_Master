package com.multi.withPuppy.user;

import java.sql.Timestamp;

public class UserCommuVO {
	private int commu_no;
	private String commu_title;
	private String commu_view;
	private Timestamp commu_date;
	private String commu_reply;
	public int getCommu_no() {
		return commu_no;
	}
	public void setCommu_no(int commu_no) {
		this.commu_no = commu_no;
	}
	public String getCommu_title() {
		return commu_title;
	}
	public void setCommu_title(String commu_title) {
		this.commu_title = commu_title;
	}
	public String getCommu_view() {
		return commu_view;
	}
	public void setCommu_view(String commu_view) {
		this.commu_view = commu_view;
	}
	public Timestamp getCommu_date() {
		return commu_date;
	}
	public void setCommu_date(Timestamp commu_date) {
		this.commu_date = commu_date;
	}
	public String getCommu_reply() {
		return commu_reply;
	}
	public void setCommu_reply(String commu_reply) {
		this.commu_reply = commu_reply;
	}
	@Override
	public String toString() {
		return "UserCommuVO [commu_no=" + commu_no + ", commu_title=" + commu_title + ", commu_view=" + commu_view
				+ ", commu_date=" + commu_date + ", commu_reply=" + commu_reply + "]";
	}
}
