package com.multi.withPuppy.user;

import java.sql.Timestamp;

public class UserVO {
	private String user_id;
	private String user_pw;
	private String user_email;
	private String user_name;
	private String user_tel;
	private String user_addr1;
	private String user_addr2;
	private String user_addr3;
	private String user_addr4;
	private String user_addr5;
	private String user_nickname;
	private String user_img;
	private String user_level;
	private String user_interest;
	private String user_state;
	private Timestamp user_joindate;
	private int user_visit;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_addr1() {
		return user_addr1;
	}
	public void setUser_addr1(String user_addr1) {
		this.user_addr1 = user_addr1;
	}
	public String getUser_addr2() {
		return user_addr2;
	}
	public void setUser_addr2(String user_addr2) {
		this.user_addr2 = user_addr2;
	}
	public String getUser_addr3() {
		return user_addr3;
	}
	public void setUser_addr3(String user_addr3) {
		this.user_addr3 = user_addr3;
	}
	public String getUser_addr4() {
		return user_addr4;
	}
	public void setUser_addr4(String user_addr4) {
		this.user_addr4 = user_addr4;
	}
	public String getUser_addr5() {
		return user_addr5;
	}
	public void setUser_addr5(String user_addr5) {
		this.user_addr5 = user_addr5;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public String getUser_level() {
		return user_level;
	}
	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}
	public String getUser_interest() {
		return user_interest;
	}
	public void setUser_interest(String user_interest) {
		this.user_interest = user_interest;
	}
	public String getUser_state() {
		return user_state;
	}
	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	public Timestamp getUser_joindate() {
		return user_joindate;
	}
	public void setUser_joindate(Timestamp user_joindate) {
		this.user_joindate = user_joindate;
	}
	public int getUser_visit() {
		return user_visit;
	}
	public void setUser_visit(int user_visit) {
		this.user_visit = user_visit;
	}
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_email=" + user_email + ", user_name="
				+ user_name + ", user_tel=" + user_tel + ", user_addr1=" + user_addr1 + ", user_addr2=" + user_addr2
				+ ", user_addr3=" + user_addr3 + ", user_addr4=" + user_addr4 + ", user_addr5=" + user_addr5
				+ ", user_nickname=" + user_nickname + ", user_img=" + user_img + ", user_level=" + user_level
				+ ", user_interest=" + user_interest + ", user_state=" + user_state + ", user_joindate=" + user_joindate
				+ ", user_visit=" + user_visit + "]";
	}
}
