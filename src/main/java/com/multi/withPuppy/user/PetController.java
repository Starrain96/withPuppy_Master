package com.multi.withPuppy.user;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping(value = "/user")
public class PetController {
	@Autowired
	PetDAO dao;
	
	@RequestMapping("/addPet")
	public void addPet() {
	}

	@RequestMapping("/updatePetPage")
	public void updatePetPage() {
	}
	
	// 반려동물 등록 버튼
	@RequestMapping("/insertPet")
	@ResponseBody
	public String insertPet(PetVO petVO, HttpSession session, HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		if (!file.isEmpty()) {
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);
			
			model.addAttribute("savedName", savedName);
			petVO.setPet_img(savedName);
		}
		model.addAttribute("bag", petVO);
		String pet_owner = (String) session.getAttribute("id");
		petVO.setPet_owner(pet_owner);
		dao.insertPet(petVO);
		return "redirect:myPet";
	}
	
	// 반려동물 업데이트
	@RequestMapping("updatePet")
	public void updatePet(PetVO petVO, HttpSession session, HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		System.out.print("업데이트 펫 : " + petVO);
		if (!file.isEmpty()) {
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);
			
			System.out.println("target : "+ target);  ///<<<< upload 되는 절대경로 찾는 방법!!!
			model.addAttribute("savedName", savedName);
			petVO.setPet_img(savedName);
		} else if (file.isEmpty()) {
			petVO.setPet_img("profile.png");
		}
		dao.updatePet(petVO);
		model.addAttribute("bag", petVO);
		// 컨트롤로의 vo변수명을 맨앞글자만 소문자로 바꾸어서 변수를 만들면,
		// 자동으로 모델의 속성으로 등록시켜줌.
		// model.addAttribute("movieVO", movieVO);
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
		System.out.println("pet?_owner : " + pet_owner);
		
		List<PetVO> petList = dao.petList(pet_owner);
		System.out.println(petList);
		model.addAttribute("petList", petList);
		return petList;
	}
	

}
