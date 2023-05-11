package com.multi.withPuppy.user;

import java.sql.Date;

public class PetVO {
	private int pet_owner;
	private String pet_name;
	private Date pet_age;
	private String pet_kind;
	private String pet_weight;
	public int getPet_owner() {
		return pet_owner;
	}
	public void setPet_owner(int pet_owner) {
		this.pet_owner = pet_owner;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public Date getPet_age() {
		return pet_age;
	}
	public void setPet_age(Date pet_age) {
		this.pet_age = pet_age;
	}
	public String getPet_kind() {
		return pet_kind;
	}
	public void setPet_kind(String pet_kind) {
		this.pet_kind = pet_kind;
	}
	public String getPet_weight() {
		return pet_weight;
	}
	public void setPet_weight(String pet_weight) {
		this.pet_weight = pet_weight;
	}
	@Override
	public String toString() {
		return "PetVO [pet_owner=" + pet_owner + ", pet_name=" + pet_name + ", pet_age=" + pet_age + ", pet_kind="
				+ pet_kind + ", pet_weight=" + pet_weight + "]";
	}
}
