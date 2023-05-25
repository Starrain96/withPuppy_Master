package com.multi.withPuppy.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/user")
public class PetController {
	@Autowired
	PetDAO dao;

	// 반려동물 등록 버튼
	@RequestMapping("/insertPet")
	@ResponseBody
	public int insertPet(PetVO bag, HttpSession session) {
		String pet_owner = (String) session.getAttribute("id");
		bag.setPet_owner(pet_owner);
		int result = dao.insertPet(bag);
		return result;
	}
	
	@RequestMapping("/updatePetPage")
	public void updatePetPage() {
	}
	
	// 반려동물 삭제
	@RequestMapping("/deletePet")
	public void deletePet(int pet_no) {
		dao.deletePet(pet_no);
	}

	// 반려동물 리스트
	@RequestMapping("/petList")
	@ResponseBody
	public List<PetVO> petList(Model model, HttpSession session) {
		String pet_owner = (String) session.getAttribute("id");
		List<PetVO> petList = dao.petList(pet_owner);
		System.out.println(petList);
		model.addAttribute("petList", petList);
		return petList;
	}
	

}
