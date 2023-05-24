package com.multi.withPuppy.petservice;

public class OcrVO { 
	private String bill_no;
	private String bill_brn;
	private String bill_name;
	private String bill_addr;
	private String bill_totalfee;
	private String bill_dx;
	private String bill_fee;
	public String getBill_no() {
		return bill_no;
	}
	public void setBill_no(String bill_no) {
		this.bill_no = bill_no;
	}
	public String getBill_brn() {
		return bill_brn;
	}
	public void setBill_brn(String bill_brn) {
		this.bill_brn = bill_brn;
	}
	public String getBill_name() {
		return bill_name;
	}
	public void setBill_name(String bill_name) {
		this.bill_name = bill_name;
	}
	public String getBill_addr() {
		return bill_addr;
	}
	public void setBill_addr(String bill_addr) {
		this.bill_addr = bill_addr;
	}
	public String getBill_totalfee() {
		return bill_totalfee;
	}
	public void setBill_totalfee(String bill_totalfee) {
		this.bill_totalfee = bill_totalfee;
	}
	public String getBill_dx() {
		return bill_dx;
	}
	public void setBill_dx(String bill_dx) {
		this.bill_dx = bill_dx;
	}
	public String getBill_fee() {
		return bill_fee;
	}
	public void setBill_fee(String bill_fee) {
		this.bill_fee = bill_fee;
	}
	@Override
	public String toString() {
		return "OcrVO [bill_no=" + bill_no + ", bill_brn=" + bill_brn + ", bill_name=" + bill_name + ", bill_addr="
				+ bill_addr + ", bill_totalfee=" + bill_totalfee + ", bill_dx=" + bill_dx + ", bill_fee=" + bill_fee
				+ "]";
	}
	
	
}
