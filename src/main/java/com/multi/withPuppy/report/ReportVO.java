package com.multi.withPuppy.report;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReportVO {
	
	private int number;
	private String writer;
	private String title;
	private String picture1;
	private String picture2;
	private String picture3;
	private String animal;
	private Timestamp day;
	private String location1;
	private String location2;
	private String location3;
	private String content;
	
	
	public int getNumber() {
		return number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPicture1() {
		return picture1;
	}
	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}
	public String getPicture2() {
		return picture2;
	}
	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}
	public String getPicture3() {
		return picture3;
	}
	public void setPicture3(String picture3) {
		this.picture3 = picture3;
	}
	public String getAnimal() {
		return animal;
	}
	public void setAnimal(String animal) {
		this.animal = animal;
	}
	public Timestamp getDay() {
		return day;
	}
	public void setDay(Timestamp day) {
		this.day = day;
	}
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	public String getLocation3() {
		return location3;
	}
	public void setLocation3(String location3) {
		this.location3 = location3;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "ReportVO [number=" + number + ", writer=" + writer + ", title=" + title + ", picture1=" + picture1
				+ ", picture2=" + picture2 + ", picture3=" + picture3 + ", animal=" + animal + ", day=" + day
				+ ", location1=" + location1 + ", location2=" + location2 + ", location3=" + location3 + ", content="
				+ content + "]";
	}
	
	
	
	
	
}
