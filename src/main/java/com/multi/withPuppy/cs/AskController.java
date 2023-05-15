package com.multi.withPuppy.cs;


import java.util.List;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 스프링에서 제어하는 역할로 등록! dependency
@RequestMapping("cs")
public class AskController {

	@Autowired
	AskDAO dao; 

	@RequestMapping("selectAskList")
	public void list(Model model) {
		List<AskVO> list = dao.list();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("insertAsk")
	public void insert(AskVO bag) {
		System.out.println("insert요청됨.");
		System.out.println(bag);
		System.out.println(dao);
		dao.insert(bag);
	}

	@RequestMapping("updateAsk")
	public void update(AskVO bag) {
		System.out.println("update요청됨.");
		System.out.println(bag);
		dao.update(bag);
	}

	@RequestMapping("updateAskNo")
	public void updateNo(int Ask_no, Model model) {
		System.out.println("updateNo요청됨.");
		System.out.println(Ask_no);
		AskVO vo = dao.updateNo(Ask_no);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("deleteAsk")
	public void delete(int Ask_no) {
		System.out.println("delete요청됨.");
		System.out.println(Ask_no);
		dao.delete(Ask_no);
	}

	@RequestMapping("selectAskOne")
	public void one(String Ask_title, Model model) {
		System.out.println("제목 검색 요청됨.");
		System.out.println(Ask_title);
//		AskVO vo = dao.one(title);
//		model.addAttribute("vo", vo);
		List<AskVO> list = dao.one(Ask_title);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("selectAskOneNo")
	public void oneNo(int Ask_no, Model model) {
		System.out.println("글번호 선택 요청됨.");
		System.out.println(Ask_no);
		AskVO vo = dao.oneNo(Ask_no);
		model.addAttribute("vo", vo);
	}
//	@RequestMapping("AskOne")
//	public void one(String title, Model model) {
//		System.out.println("one요청됨.");
//		System.out.println(title);
//		AskVO vo = dao.one(title);
//		model.addAttribute("vo", vo);
//	}

	@RequestMapping("writeAsk")
	public void write() {
		System.out.println("글쓰기 페이지 전환 요청됨.");
	}
}
