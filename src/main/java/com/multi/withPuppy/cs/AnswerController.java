package com.multi.withPuppy.cs;


import java.util.List;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 스프링에서 제어하는 역할로 등록! dependency
@RequestMapping("cs")
public class AnswerController {

	@Autowired
	AnswerDAO dao; 

	@RequestMapping("selectAnswerList")
	public void list(Model model) {
		System.out.println("selectAnswerList요청됨.");
		List<AnswerVO> list = dao.list();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("insertAnswer")
	public void insert(AnswerVO bag) {
		System.out.println("insertAnswer요청됨.");
		dao.insert(bag);
	}

	@RequestMapping("updateAnswer")
	public void update(AnswerVO bag) {
		System.out.println("updateAnswer요청됨.");
		dao.update(bag);
	}

	@RequestMapping("deleteAnswer")
	public void delete(int Ans_no) {
		System.out.println("deleteAnswer요청됨.");
		dao.delete(Ans_no);
	}

	@RequestMapping("selectAnswerOne")
	public void one(int ask_no, Model model) {
		System.out.println("selectAnswerOne요청됨.");
		List<AnswerVO> list = dao.one(ask_no);
		model.addAttribute("list", list);
	}

}
