package com.multi.withPuppy.communities;

import java.sql.Timestamp;

public class ReplyVO {
	private int reply_no;
	private String reply_id;
	private String reply_content;
	private int commu_no;
	private Timestamp reply_date;
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public int getCommu_no() {
		return commu_no;
	}
	public void setCommu_no(int commu_no) {
		this.commu_no = commu_no;
	}
	public Timestamp getReply_date() {
		return reply_date;
	}
	public void setReply_date(Timestamp reply_date) {
		this.reply_date = reply_date;
	}
	@Override
	public String toString() {
		return "ReplyVO [reply_no=" + reply_no + ", reply_id=" + reply_id + ", reply_content=" + reply_content
				+ ", commu_no=" + commu_no + ", reply_date=" + reply_date + "]";
	}
	
	
}
