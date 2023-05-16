package com.multi.withPuppy.petservice;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller //스프링에서 제어하는 역활로 등록
@RequestMapping("petservice")
public class StarController {
	
	@Autowired
	StarDAO dao;
	
	//@RequestMapping("insertStar")
    //@ResponseBody
    //public int insertUser(StarVO bag) {
    //    System.out.println("insert bag : " + bag);
    //    System.out.println(dao);
    //    int result = dao.insert(bag);
    //    System.out.println("컨트롤ㄹㄹㄹㄹ러 : " + result);
    //    return result;
    //}
	
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
	
	@RequestMapping("insertStar")
	public void insert(
					StarVO starVO,
					HttpServletRequest request, 
					MultipartFile file, 
					Model model) throws Exception {
		String savedName = file.getOriginalFilename();
		String uploadPath 
			= request.getSession().getServletContext().getRealPath("resources/upload");
		File target = new File(uploadPath + "/" + savedName);
		file.transferTo(target);
		
		model.addAttribute("savedName", savedName);
		System.out.println("img넣기 전>> " + starVO);
		starVO.setImg1(savedName);
		System.out.println("img넣은 후>> " + starVO);
		
		dao.insert(starVO);
		//컨트롤로의 vo변수명을 맨앞글자만 소문자로 바꾸어서 변수를 만들면,
		//자동으로 모델의 속성으로 등록시켜줌.
		//model.addAttribute("movieVO", movieVO);
	}
	
	@RequestMapping("uploadForm")
	public void uploadForm(
					HttpServletRequest request, 
					MultipartFile file, 
					Model model) throws Exception {
		String savedName = file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
		File target = new File(uploadPath + "/" + savedName);
		file.transferTo(target);
		model.addAttribute("savedName", savedName);
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
