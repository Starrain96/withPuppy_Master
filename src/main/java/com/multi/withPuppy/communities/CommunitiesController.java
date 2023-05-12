package com.multi.withPuppy.communities;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;






@Controller
public class CommunitiesController {
	
	@Autowired
	CommunitiesDAO dao;
	
	@RequestMapping("communities/insert")
	public void insert(CommunitiesVO vo) {
		System.out.println(vo);
		System.out.println(dao);
		dao.insert(vo);
	}
	
	@RequestMapping("communities/update")
	public void update(CommunitiesVO bag) {
		System.out.println("update요청됨.");
		System.out.println(bag);
		dao.update(bag);
	}
	
	@RequestMapping("communities/delete")
	public void delete(int commu_no) {
		System.out.println("delete요청됨.");
		System.out.println(commu_no);
		dao.delete(commu_no);
	}
	
	@RequestMapping("communities/one")
	public void one(int Commu_id, Model model) {
		System.out.println("one요청됨.");
		System.out.println(Commu_id);
		CommunitiesVO bag = dao.one(Commu_id);
		model.addAttribute("bag", bag);
		//bag에 검색결과 다 들어있음.
		//views아래 one.jsp로 쓸 수 있도록 설정해주어야 함.
		//views까지 전달할 속성으로 추가해주세요. 
	}
	
	@RequestMapping("communities/one2")
	public void one2(int Commu_no, Model model) {
		System.out.println("one요청됨.");
		System.out.println(Commu_no);
		CommunitiesVO bag = dao.one(Commu_no);
		//검색결과가 있는지 프린트!
		System.out.println(bag);
		model.addAttribute("bag", bag);
	}
	
	@RequestMapping("communities/list")
	public void list(Model model) {
	}
	
	@RequestMapping("communities/communitiesMain")
	public void communitiesMain() {
	}
	
	@RequestMapping("communities/communitiesWrite")
	public void communitiesWrite() {
	}
	
	@RequestMapping("communities/communitiesList")
	public void communitiesList() {
	}
	
	@RequestMapping("communities/communitiesFnD")
	public void communitiesFnd() {
	}
	
	@RequestMapping("list2")
	public void list2(Model model) {
		ArrayList<CommunitiesVO> list = dao.list();
		System.out.println(list); //사이즈를 찍어보세요.
		model.addAttribute("list", list);
	}
	
}
