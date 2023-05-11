package com.multi.withPuppy.petservice;

import java.sql.Timestamp;

public class StarVO { 
	private int star_no;
	private int service_id;
	private String id;
	private Timestamp date;
	private String content;
	private int kind;
	private int explain;
	private int treat;
	private int facilities;
	private int price;
	private String img1;
	private String img2;
	private String ocr;
	public int getStar_no() {
		return star_no;
	}
	public void setStar_no(int star_no) {
		this.star_no = star_no;
	}
	public int getService_id() {
		return service_id;
	}
	public void setService_id(int service_id) {
		this.service_id = service_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getExplain() {
		return explain;
	}
	public void setExplain(int explain) {
		this.explain = explain;
	}
	public int getTreat() {
		return treat;
	}
	public void setTreat(int treat) {
		this.treat = treat;
	}
	public int getFacilities() {
		return facilities;
	}
	public void setFacilities(int facilities) {
		this.facilities = facilities;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getOcr() {
		return ocr;
	}
	public void setOcr(String ocr) {
		this.ocr = ocr;
	}
	@Override
	public String toString() {
		return "StarVO [star_no=" + star_no + ", service_id=" + service_id + ", id=" + id + ", date=" + date
				+ ", content=" + content + ", kind=" + kind + ", explain=" + explain + ", treat=" + treat
				+ ", facilities=" + facilities + ", price=" + price + ", img1=" + img1 + ", img2=" + img2 + ", ocr="
				+ ocr + "]";
	}
	
	
}
