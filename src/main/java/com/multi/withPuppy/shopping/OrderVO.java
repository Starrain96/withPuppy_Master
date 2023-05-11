package com.multi.withPuppy.shopping;

import java.sql.Timestamp;

public class OrderVO {
	private int order_id;
	private String user_id;
	private Timestamp order_date;
	private String order_address;
	private int tot_price;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public int getTot_price() {
		return tot_price;
	}
	public void setTot_price(int tot_price) {
		this.tot_price = tot_price;
	}
	@Override
	public String toString() {
		return "OrderVO [order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date
				+ ", order_address=" + order_address + ", tot_price=" + tot_price + "]";
	}
	
	
}
