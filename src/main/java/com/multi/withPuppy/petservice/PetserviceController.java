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
	PetserviceServiceInterface petserviceService;
	
	@RequestMapping("listhospital")
	public void all(Model model,String category) {
		List<PetserviceVO> list = petserviceService.all(category);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("searchHospital")
	public void searchHp(Model model,String service_name) {
		System.out.println(service_name);
		List<PetserviceVO> list = petserviceService.searchHp(service_name);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("hospital")
	public void one(PetserviceVO bag1, Model model) {
		PetserviceVO bag = petserviceService.one(bag1);
		model.addAttribute("bag", bag);
	}
}
