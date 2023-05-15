package com.multi.withPuppy.communities;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/communities")
public class CommunitiesController {

	@Autowired
	CommunitiesDAO dao;

	@RequestMapping("insert")
	public String insertCommunity(CommunitiesVO vo){
		dao.insert(vo);
		return "redirect:/communitiesList";
	}

	@RequestMapping("update")
	public String update(CommunitiesVO vo) {
//		System.out.println("update요청됨.");
//		System.out.println(vo);
		dao.update(vo);
		return "redirect:/communitiesList";
	}

	@RequestMapping("delete")
	public String delete(int commu_no) {
//		System.out.println("delete요청됨.");
//		System.out.println(commu_no);
		dao.delete(commu_no);
		return "redirect:/communitiesList";
	}

	@RequestMapping("one")
	public void one(int commu_no, Model model) {
//		System.out.println("one요청됨.");
//		System.out.println(commu_no);
		CommunitiesVO vo = dao.one(commu_no);
		model.addAttribute("vo", vo);
		// vo에 검색결과 다 들어있음.
		// views아래 one.jsp로 쓸 수 있도록 설정해주어야 함.
		// views까지 전달할 속성으로 추가해주세요.
	}

//	@RequestMapping("communities/one2")
//	public void one2(int Commu_no, Model model) {
//		System.out.println("one요청됨.");
//		System.out.println(Commu_no);
//		CommunitiesVO vo = dao.one(Commu_no);
//		//검색결과가 있는지 프린트!
//		System.out.println(vo);
//		model.addAttribute("vo", vo);
//	}

	@RequestMapping("list")
	public void list(Model model) {
	}

	@RequestMapping("communitiesMain")
	public void communitiesMain() {
	}

	@RequestMapping("communitiesWrite")
	public void communitiesWrite() {
	}

	@RequestMapping("communitiesList")
	public void communitiesList() {
	}

	@RequestMapping("communitiesFnD")
	public void communitiesFnd() {
	}

	@RequestMapping("list2")
	public void list2(Model model) {
		ArrayList<CommunitiesVO> list = dao.list();
		System.out.println(list); // 사이즈를 찍어보세요.
		model.addAttribute("list", list);
	}

}
