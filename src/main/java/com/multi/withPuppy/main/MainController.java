package com.multi.withPuppy.main;

import java.util.List;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.withPuppy.cs.AnswerVO;

@Controller // 스프링에서 제어하는 역할로 등록! dependency
@RequestMapping("main")
public class MainController {

	@Autowired
	MainDAO dao; 

	@RequestMapping("mainTop5")
	public void listTop5(Model model) {
		System.out.println("mainTop5 요청됨");
		List<MainVO> list = dao.listTop5();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("mainFaq")
	public void listFaq( Model model) {
		System.out.println("mainFaq 요청됨");
		List<MainVO> list = dao.listFaq();
		model.addAttribute("list", list);
	}

}
