package com.multi.withPuppy.petservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller //스프링에서 제어하는 역활로 등록
@RequestMapping("petservice")
public class PetserviceController {
	
	@Autowired
	PetserviceDAO dao;
	//컨트롤 하는 기능 (CRUD)
	//회원가입, 수정, 탈퇴, 정보검색
	
	//클래스 내에서 기능처리 담당
	//멤버변수 + 멤버메서드(기능처리 담당)
	//하나의 요청당 하나의 메서드
	//하나의 버튼호출당 하나의 함수 연결!
	// 요청된 주소가 어떻게 될 때
	// 바로 아래에 있는 메서드가 호출이 될지를
	// 써주어야 한다.
	/*
	 * @RequestMapping("login") public String login(MemberVO bag, HttpSession
	 * session) { System.out.println(bag); System.out.println(dao);
	 * 
	 * int result = dao.login(bag); if(result==1) { //로그인에 성공을 하면 세션을 설정하자!
	 * session.setAttribute("id", bag.getId()); return "ok"; } else { //views 아래가
	 * 아니고, webapp 아래 member.jsp로 가고 싶은 경우! return "redirect:member.jsp"; } }
	 */
	
	
	//@RequestMapping("one")
	//public void one(String id, Model model) {
	//	System.out.println("insert 요청됨.");
	//	PetserviceVO bag = dao.one(id);
	//	model.addAttribute("bag", bag);
	//}
	
	@RequestMapping("listhospital")
	public void all(Model model,String category) {
		List<PetserviceVO> list = dao.list(category);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("hospital")
	public void one(PetserviceVO bag1, Model model) {
		PetserviceVO bag = dao.hospital(bag1);
		model.addAttribute("bag", bag);
	}
	

	  
	/*
	 * @RequestMapping("delete") public void delete(String id) {
	 * System.out.println("delete 요청됨."); dao.delete(id); }
	 */
	 
	    /*
		 * @RequestMapping("one5") public void one(String id, Model model) { MemberVO
		 * bag = dao.one(id); model.addAttribute("bag", bag); }
		 * 
		 * @RequestMapping("jsonResponse3")
		 * 
		 * @ResponseBody public MemberVO one(String id) { MemberVO bag = dao.one(id);
		 * return bag; }
		 * 
		 * @RequestMapping("list") public void list(Model model) { ArrayList<MemberVO>
		 * list = dao.list(); model.addAttribute("list", list); }
		 * 
		 * @RequestMapping("jsonResponse4")
		 * 
		 * @ResponseBody public ArrayList<MemberVO> list() { ArrayList<MemberVO> list =
		 * dao.list(); return list; }
		 * 
		 * @RequestMapping("list7") public void list7(Model model) { ArrayList<MemberVO>
		 * list = dao.list(); model.addAttribute("list", list); }
		 */
	 
}
