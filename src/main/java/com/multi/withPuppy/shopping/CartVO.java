package com.multi.withPuppy.shopping;

public class CartVO { 
	private int cart_id;
	private int product_id;
	private int product_cnt;
	private int user_id;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getProduct_cnt() {
		return product_cnt;
	}
	public void setProduct_cnt(int product_cnt) {
		this.product_cnt = product_cnt;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "CartVO [cart_id=" + cart_id + ", product_id=" + product_id + ", product_cnt=" + product_cnt
				+ ", user_id=" + user_id + "]";
	}
	
	
}
