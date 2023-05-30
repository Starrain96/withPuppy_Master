package com.multi.withPuppy.user;

import java.sql.Timestamp;

public class UserReviewVO {
	private int service_id;
	private String service_name;
	private Timestamp date;
	private String content;
	private int kind;
	private int explain;
	private int treat;
	private int facilities;
	private int price;
	public int getService_id() {
		return service_id;
	}
	public void setService_id(int service_id) {
		this.service_id = service_id;
	}
	public String getService_name() {
		return service_name;
	}
	public void setService_name(String service_name) {
		this.service_name = service_name;
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
	@Override
	public String toString() {
		return "UserReviewVO [service_id=" + service_id + ", service_name=" + service_name + ", date=" + date
				+ ", content=" + content + ", kind=" + kind + ", explain=" + explain + ", treat=" + treat
				+ ", facilities=" + facilities + ", price=" + price + "]";
	}
}
