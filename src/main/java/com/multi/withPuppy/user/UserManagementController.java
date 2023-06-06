package com.multi.withPuppy.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println("contorller list UserPageVO : " + list);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("searchUser")
	public void searchUser(UserPageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		System.out.println("contorller getPage : " + vo.getPage());
		
		System.out.println("!!!!!!!: "+vo.getUser_level() + ", " + vo.getUser_condition() + ", " + vo.getSearchWord());
		
		List<UserVO> list = dao.searchUser(vo);
		System.out.println("contorller list : " + list);
		int count = dao.userSearchCount(vo);
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
	
	@RequestMapping("searchUserList")
	public void searchUserList(UserPageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		System.out.println("브이오점겟페이지 : " + vo.getPage());
		List<UserVO> list = dao.searchUser(vo);
		System.out.println("contorller list UserPageVO : " + list);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("deleteUsers")
	@ResponseBody
	public String deleteUsers(@RequestParam("userIds[]") String[] userIds) {
		for (int i = 0; i < userIds.length; i++) {
			dao.deleteUsers(userIds[i]);
			System.out.println(userIds[i]);
		}
	    return "success";
	}
}
