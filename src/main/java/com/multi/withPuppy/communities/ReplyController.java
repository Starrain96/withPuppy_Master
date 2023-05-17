package com.multi.withPuppy.communities;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;






@Controller
@RequestMapping("reply")
public class ReplyController {
	
	@Autowired
	ReplyDAO dao;
	
	@RequestMapping("insert2")
	public void insert(ReplyVO vo) {
		System.out.println(vo);
		System.out.println(dao);
		dao.insert(vo);
	}
	
	@RequestMapping("update2")
	public void update(ReplyVO bag) {
		System.out.println("update요청됨.");
		System.out.println(bag);
		dao.update(bag);
	}
	
	@RequestMapping("delete2")
	public void delete(int commu_no) {
		System.out.println("delete요청됨.");
		System.out.println(commu_no);
		dao.delete(commu_no);
	}
	
	@RequestMapping("one2")
	public void one(int Commu_id, Model model) {
		System.out.println("one요청됨.");
		System.out.println(Commu_id);
		//ReplyVO bag = dao.one(Commu_id);
		//model.addAttribute("bag", bag);
		//bag에 검색결과 다 들어있음.
		//views아래 one.jsp로 쓸 수 있도록 설정해주어야 함.
		//views까지 전달할 속성으로 추가해주세요. 
	}
	
//	@RequestMapping("one2.multi")
//	public void one2(int Commu_no, Model model) {
//		System.out.println("one요청됨.");
//		System.out.println(Commu_no);
//		//ReplyVO bag = dao.one(Commu_no);
//		//검색결과가 있는지 프린트!
//	//	System.out.println(bag);
//		//model.addAttribute("bag", bag);
//	}
	
	@RequestMapping("list2")
	public void list(Model model) {
	}
	
	@RequestMapping("replyMain")
	public void replyMain() {
	}
	
	@RequestMapping("replyWrite")
	public void replyWrite() {
	}
	
	@RequestMapping("replyList")
	public void replyList() {
	}
	
	@RequestMapping("replyFnD")
	public void replyFnd() {
	}
	
	@RequestMapping("list22")
	public void list2(Model model) {
		ArrayList<ReplyVO> list = dao.list();
		System.out.println(list.size()); //사이즈를 찍어보세요.
		model.addAttribute("list", list);
	}
	
}
