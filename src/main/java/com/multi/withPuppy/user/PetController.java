package com.multi.withPuppy.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/user")
public class PetController {
	@Autowired
	UserDAO dao;
	
	/*
	 * @RequestMapping("/petList") public String petList(Model model) { List<PetVO>
	 * petList = dao.list(); return "petList"; }
	 */
}
