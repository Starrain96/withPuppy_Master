package com.multi.withPuppy.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/user")
public class UserManagementController {
	@Autowired
	UserManagementDAO dao;
	
	@RequestMapping("userManagement")
	public void userManagement(UserPageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<UserVO> list = dao.userList(vo);
		int count = dao.userCount();
		System.out.println("all count>> " + count);
		int pages = 0; // 전체의 페이지 개수를 구하는 것
		if(count%10 == 0) {
			pages = count / 10;
		}else {
			pages = count / 10 + 1;
		}
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}
	
	@RequestMapping("userList")
	public void userList(UserPageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<UserVO> list = dao.userList(vo);
		model.addAttribute("list", list);
	}
}
