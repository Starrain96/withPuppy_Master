package com.multi.withPuppy.main;

public class User_menuVO {

	private String user_id;
	private int cnt_service;
	private int cnt_shop;
	private int cnt_lost;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCnt_service() {
		return cnt_service;
	}
	public void setCnt_service(int cnt_service) {
		this.cnt_service = cnt_service;
	}
	public int getCnt_shop() {
		return cnt_shop;
	}
	public void setCnt_shop(int cnt_shop) {
		this.cnt_shop = cnt_shop;
	}
	public int getCnt_lost() {
		return cnt_lost;
	}
	public void setCnt_lost(int cnt_lost) {
		this.cnt_lost = cnt_lost;
	}
	@Override
	public String toString() {
		return "User_menuVO [user_id=" + user_id + ", cnt_service=" + cnt_service + ", cnt_shop=" + cnt_shop
				+ ", cnt_lost=" + cnt_lost + "]";
	}
	
	
	
}
