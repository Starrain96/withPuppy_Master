package com.multi.withPuppy.shopping;

public class Order_detailVO {
	private int order_id;
	private int product_id;
	private int ordered_cnt;
	private String order_status;
	private String refundCheck_YN;
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
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getRefundCheck_YN() {
		return refundCheck_YN;
	}
	public void setRefundCheck_YN(String refundCheck_YN) {
		this.refundCheck_YN = refundCheck_YN;
	}
	@Override
	public String toString() {
		return "Order_detailVO [order_id=" + order_id + ", product_id=" + product_id + ", ordered_cnt=" + ordered_cnt
				+ ", order_status=" + order_status + ", refundCheck_YN=" + refundCheck_YN + "]";
	}
	
	
	
	
}
