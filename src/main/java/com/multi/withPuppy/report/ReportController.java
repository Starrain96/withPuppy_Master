package com.multi.withPuppy.report;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
@RequestMapping("report")
public class ReportController {
	
	@Autowired    
	ReportDAO dao;
	
	@RequestMapping("insertRe")
	public String insert(ReportVO bag) {
		System.out.println("ReportVO : "+bag);
		dao.insert(bag);
		return "report/report";
	}
	
	@RequestMapping("delete")
	public String delete(String title) {
		dao.delete(title);
		return "redirect:report.jsp";
	}
	@RequestMapping("update")
	public void update(ReportVO bag) {
		dao.update(bag);
	}
	
	@RequestMapping("report")
	public void report() {
	}

	@RequestMapping("insertRe1")
	public void report1() {
	}
	@RequestMapping("deleteRe1")
	public void report2() {
	}
	
	
	
	@RequestMapping("one")
	public void one(int number, Model model) {
		ReportVO vo = dao.one(number);
		model.addAttribute("vo", vo);
	}
	@RequestMapping("list")
	public String list(Model model) {
		List<ReportVO> list = dao.list();
		model.addAttribute("list", list);
		return "report/list";
	}
}