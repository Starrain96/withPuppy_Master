package com.multi.withPuppy.petservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller //스프링에서 제어하는 역활로 등록
@RequestMapping("petservice")
public class PetserviceController {
	
	@Autowired
	PetserviceDAO dao;
	
	@RequestMapping("listhospital")
	public void all(Model model,String category) {
		List<PetserviceVO> list = dao.list(category);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("hospital")
	public void one(PetserviceVO bag1, Model model) {
		PetserviceVO bag = dao.hospital(bag1);
		model.addAttribute("bag", bag);
	}
}
