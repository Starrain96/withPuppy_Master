package com.multi.withPuppy.user;

public class UserShoppingProductVO {
	private int order_id;
	private String product_img;
	private String product_name;
	private int ordered_cnt;
	private int product_price;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getOrdered_cnt() {
		return ordered_cnt;
	}
	public void setOrdered_cnt(int ordered_cnt) {
		this.ordered_cnt = ordered_cnt;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	@Override
	public String toString() {
		return "UserShoppingProductVO [order_id=" + order_id + ", product_img=" + product_img + ", product_name="
				+ product_name + ", ordered_cnt=" + ordered_cnt + ", product_price=" + product_price + "]";
	}
}
