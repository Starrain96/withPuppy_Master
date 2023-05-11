package com.multi.withPuppy.shopping;

public class Order_detailVO {
	private int detail_id;
	private int order_id;
	private int product_id;
	private int ordered_cnt;
	public int getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(int detail_id) {
		this.detail_id = detail_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getOrdered_cnt() {
		return ordered_cnt;
	}
	public void setOrdered_cnt(int ordered_cnt) {
		this.ordered_cnt = ordered_cnt;
	}
	@Override
	public String toString() {
		return "order_detailVO [detail_id=" + detail_id + ", order_id=" + order_id + ", product_id=" + product_id
				+ ", ordered_cnt=" + ordered_cnt + "]";
	}
	
	
}
