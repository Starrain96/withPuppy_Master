package com.multi.withPuppy.petservice;

public class PetserviceVO {
	// MemberVo 가방에 넣은 데이터는 Member 테이블에 들어갈 예정
	// 각 칼럼과 일치시켜 줌.
	private int service_id;
	private String service_name;       
	private double latitude;
	private double longitude;
	private String zipcode;
	private String road_address;
	private String address;
	private String tel;
	private String homepage;
	private String dayoff;
	private String petsize;
	private String operating;
	private String parking;
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
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoad_address() {
		return road_address;
	}
	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getDayoff() {
		return dayoff;
	}
	public void setDayoff(String dayoff) {
		this.dayoff = dayoff;
	}
	public String getPetsize() {
		return petsize;
	}
	public void setPetsize(String petsize) {
		this.petsize = petsize;
	}
	public String getOperating() {
		return operating;
	}
	public void setOperating(String operating) {
		this.operating = operating;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	@Override
	public String toString() {
		return "PetserviceVO [service_id=" + service_id + ", service_name=" + service_name + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", zipcode=" + zipcode + ", road_address=" + road_address + ", address="
				+ address + ", tel=" + tel + ", homepage=" + homepage + ", dayoff=" + dayoff + ", petsize=" + petsize
				+ ", operating=" + operating + ", parking=" + parking + "]";
	}
	
	
}
