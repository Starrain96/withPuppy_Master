package com.multi.withPuppy.petservice;

public class Bill_joinVO { 
	private int bill_no;
	private String bill_dx;
	private int bill_fee;
	private String bill_addr;
	
	public int getBill_no() {
		return bill_no;
	}
	public void setBill_no(int bill_no) {
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
	public String getBill_addr() {
		return bill_addr;
	}
	public void setBill_addr(String bill_addr) {
		this.bill_addr = bill_addr;
	}
	
	@Override
	public String toString() {
		return "Bill_joinVO [bill_no=" + bill_no + ", bill_dx=" + bill_dx + ", bill_fee=" + bill_fee + ", bill_addr="
				+ bill_addr + "]";
	}
	
	
	
	
	
}
