package com.multi.withPuppy.shopping;

public class ProductVO {
	
	private int product_id;
	private int cart_id;
	private String product_name;
	private int product_price;
	private int category1;
	private int category2;
	private int detail;
	private String product_img;
	private int product_cnt;
	private String soldout_YN;
	private String status;
	private String categoryDetail;
	
	public String getSoldout_YN() {
		return soldout_YN;
	}
	public void setSoldout_YN(String soldout_YN) {
		this.soldout_YN = soldout_YN;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getCategory1() {
		return category1;
	}
	public void setCategory1(int category1) {
		this.category1 = category1;
	}
	public int getCategory2() {
		return category2;
	}
	public void setCategory2(int category2) {
		this.category2 = category2;
	}
	public int getDetail() {
		return detail;
	}
	public void setDetail(int detail) {
		this.detail = detail;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public int getProduct_cnt() {
		return product_cnt;
	}
	public void setProduct_cnt(int product_cnt) {
		this.product_cnt = product_cnt;
	}
	public String getCategoryDetail() {
		return categoryDetail;
	}
	public void setCategoryDetail(String categoryDetail) {
		this.categoryDetail = categoryDetail;
	}
	@Override
	public String toString() {
		return "ProductVO [product_id=" + product_id + ", cart_id=" + cart_id + ", product_name=" + product_name
				+ ", product_price=" + product_price + ", category1=" + category1 + ", category2=" + category2
				+ ", detail=" + detail + ", product_img=" + product_img + ", product_cnt=" + product_cnt
				+ ", soldout_YN=" + soldout_YN + ", status=" + status + ", categoryDetail=" + categoryDetail + "]";
	}
	
	
	

	
}
