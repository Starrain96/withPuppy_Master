package com.multi.withPuppy.petservice;

public class Bill_detailVO { 
	private String bill_no;
	private String bill_dx;
	private int bill_fee;
	public String getBill_no() {
		return bill_no;
	}
	public void setBill_no(String bill_no) {
		this.bill_no = bill_no;
	}
	public String getBill_dx() {
		return bill_dx;
	}
	public void setBill_dx(String bill_dx) {
		this.bill_dx = bill_dx;
	}
	public int getBill_fee() {
		return bill_fee;
	}
	public void setBill_fee(int bill_fee) {
		this.bill_fee = bill_fee;
	}
	@Override
	public String toString() {
		return "Bill_detailVO [bill_no=" + bill_no + ", bill_dx=" + bill_dx + ", bill_fee=" + bill_fee + "]";
	}
	
}
