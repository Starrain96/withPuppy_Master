package com.multi.withPuppy.shopping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopManageController {
	@Autowired
	ShopManageDAO dao;
	
	@RequestMapping("shopping/shopManageMain")
	public void listAll(Model model) {
		List<ProductVO> list = dao.list();
		model.addAttribute("list", list);
	}
	
}
