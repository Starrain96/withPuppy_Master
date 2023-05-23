package com.multi.withPuppy.petservice;

public class BillVO { 
	private int bill_no;
	private String bill_brn;
	private String bill_name;
	private String bill_addr;
	private int bill_totalfee;
	public int getBill_no() {
		return bill_no;
	}
	public void setBill_no(int bill_no) {
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
	public int getBill_totalfee() {
		return bill_totalfee;
	}
	public void setBill_totalfee(int bill_totalfee) {
		this.bill_totalfee = bill_totalfee;
	}
	@Override
	public String toString() {
		return "BillVO [bill_no=" + bill_no + ", bill_brn=" + bill_brn + ", bill_name=" + bill_name + ", bill_addr="
				+ bill_addr + ", bill_totalfee=" + bill_totalfee + "]";
	}
	
	
}
