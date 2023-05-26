package com.multi.withPuppy.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class PetDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	// 반려동물 등록
	public int insertPet(PetVO bag) {
		int result = my.insert("pet.insertPet", bag);
		return result;
	}
	
	// 반려동물 삭제
	public int deletePet(int pet_no) {
		int result = my.delete("pet.deletePet", pet_no);
		System.out.println("다오 deletePet : " + result);
		return result;
	}
	
	// 반려동물 수정
	public int updatePet(PetVO bag) {
		int result = my.update("pet.updatePet", bag);
		System.out.println("다오 updatePet : " + result);
		return result;
	}
	
	// 펫 리스트
	public List<PetVO> petList(String pet_owner) {
		List<PetVO> petList = my.selectList("pet.petList", pet_owner);
		return petList;
	}
}
