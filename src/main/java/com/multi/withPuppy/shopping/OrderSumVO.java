package com.multi.withPuppy.shopping;

public class OrderSumVO {
	/* 주문 번호 */
	private int order_id;
	/* 주문자 */
	private String user_id;
	/* 주문자 전화번호 */
	private String order_date;
	/* 주문자 주소 */
	private String receiver_name;
	/* 수령  배송지명 */
	private String receiver_phone;
	/* 수령인 연락처 */
	private String receiver_id;
	/* 수령인 주소 */
	private String addr1;
	
	private String addr2;
	
	private String addr3;

	private int total_price;
	
	//orderDetail에 들어갈 값
	private String productTmp;

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

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public String getReceiver_phone() {
		return receiver_phone;
	}

	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}

	public String getReceiver_id() {
		return receiver_id;
	}

	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getProductTmp() {
		return productTmp;
	}

	public void setProductTmp(String productTmp) {
		this.productTmp = productTmp;
	}

	@Override
	public String toString() {
		return "OrderSumVO [order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date
				+ ", receiver_name=" + receiver_name + ", receiver_phone=" + receiver_phone + ", receiver_id="
				+ receiver_id + ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + ", total_price="
				+ total_price + ", productTmp=" + productTmp + "]";
	}
	

}
