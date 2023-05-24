package com.multi.withPuppy.user;

public class PetVO {
	private int pet_no;
	private String pet_owner;
	private String pet_name;
	private String pet_birth;
	private String pet_kind;
	private String pet_weight;
	private String pet_img;
	
	public int getPet_no() {
		return pet_no;
	}

	public void setPet_no(int pet_no) {
		this.pet_no = pet_no;
	}

	public String getPet_owner() {
		return pet_owner;
	}

	public void setPet_owner(String pet_owner) {
		this.pet_owner = pet_owner;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public String getPet_birth() {
		return pet_birth;
	}

	public void setPet_birth(String pet_birth) {
		this.pet_birth = pet_birth;
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

	public String getPet_img() {
		return pet_img;
	}

	public void setPet_img(String pet_img) {
		this.pet_img = pet_img;
	}

	@Override
	public String toString() {
		return "PetVO [pet_no=" + pet_no + ", pet_owner=" + pet_owner + ", pet_name=" + pet_name + ", pet_birth="
				+ pet_birth + ", pet_kind=" + pet_kind + ", pet_weight=" + pet_weight + ", pet_img=" + pet_img + "]";
	}
}
