package com.multi.withPuppy.cs;


import java.util.List;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 스프링에서 제어하는 역할로 등록! dependency
@RequestMapping("cs")
public class FaqController {

	@Autowired
	FaqDAO dao; 

	@RequestMapping("selectFaqList")
	public void list(Model model) {
		List<FaqVO> list = dao.list();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("insertFaq")
	public void insert(FaqVO bag) {
		System.out.println("insert요청됨.");
		System.out.println(bag);
		System.out.println(dao);
		dao.insert(bag);
	}

	@RequestMapping("updateFaq")
	public void update(FaqVO bag) {
		System.out.println("update요청됨.");
		System.out.println(bag);
		dao.update(bag);
	}

	@RequestMapping("deleteFaq")
	public void delete(int Faq_no) {
		System.out.println("delete요청됨.");
		System.out.println(Faq_no);
		dao.delete(Faq_no);
	}

	@RequestMapping("selectFaqOne")
	public void one(String faq_title, Model model) {
		System.out.println("제목 검색 요청됨.");
		System.out.println(faq_title);
		List<FaqVO> list = dao.one(faq_title);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("selectFaqOne2")
	public void one2(String faq_category, Model model) {
		System.out.println("카테고리 검색 요청됨.");
		System.out.println(faq_category);
		List<FaqVO> list = dao.one2(faq_category);
		model.addAttribute("list", list);
	}

	@RequestMapping("writeFaq")
	public void write() {
		System.out.println("글쓰기 페이지 전환 요청됨.");
	}

}
