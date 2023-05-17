package com.multi.withPuppy.petservice;

import java.util.List;

 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller //스프링에서 제어하는 역활로 등록
@RequestMapping("petservice")
public class StarController {
	
	@Autowired
	StarDAO dao;
	
	@RequestMapping("insertStar")
    @ResponseBody
    public int insertUser(StarVO bag) {
        System.out.println("insert bag : " + bag);
        System.out.println(dao);
        int result = dao.insert(bag);
        System.out.println("컨트롤ㄹㄹㄹㄹ러 : " + result);
        return result;
    }
	
	@RequestMapping("update")
	public void update(StarVO bag) {
		dao.update(bag);
	}
	
	@RequestMapping("delete")
	public void delte(String id) {
		dao.delete(id);
	}
	
	@RequestMapping("starpage")
	public void one(String id, int service_id, Model model) {
		StarVO bag = new StarVO();
		bag.setId(id);
		bag.setService_id(service_id);
		model.addAttribute("bag", bag);
	}
	
	@RequestMapping("listStar")
	@ResponseBody
	public List<StarVO> one(int service_id) {
		List<StarVO> list = dao.list(service_id);
		return list;
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
