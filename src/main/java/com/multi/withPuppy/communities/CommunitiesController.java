package com.multi.withPuppy.communities;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("communities/")
public class CommunitiesController {

	@Autowired
	CommunitiesDAO dao;

	@RequestMapping("insert")
	public String insertCommunity(CommunitiesVO vo,
								  HttpServletRequest request,
								  MultipartFile file,
								  Model model) throws Exception {
	    if (!file.isEmpty()) {
	        String savedName = file.getOriginalFilename();
	        String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
	        File target = new File(uploadPath + "/" + savedName);
	        file.transferTo(target);
	        model.addAttribute("savedName", savedName);
	        System.out.println("img 넣기전 >> " + savedName);
	        vo.setCommu_img(savedName);
	    }
	    System.out.println("img 넣은 후 >> " + vo);
	    dao.insert(vo);
	    model.addAttribute("vo", vo);
	    return "redirect:/communities/communitiesList?page=1";
	}


	@RequestMapping("update")
	public String update(CommunitiesVO vo) {
		dao.update(vo);
		return "redirect:/communities/communitiesList";
	}

	@RequestMapping("delete")
	public String delete(int commu_no) {
		dao.delete(commu_no);
		return "redirect:/communities/communitiesList";
	}

	@RequestMapping("one")
	public void one(int commu_no, Model model) {
		System.out.println("controller : " + commu_no);
		CommunitiesVO vo = dao.one(commu_no);
		model.addAttribute("vo", vo);
		// vo에 검색결과 다 들어있음.
		// views아래 one.jsp로 쓸 수 있도록 설정해주어야 함.
		// views까지 전달할 속성으로 추가해주세요.
	}

	@RequestMapping("communitiesMain")
	public void communitiesMain(PageVO vo2,Model model) {
		vo2.setStartEnd(vo2.getPage());
		List<CommunitiesVO> list = dao.list(vo2);
		int count = dao.count();
		int pages = 0; // 전체의 페이지 개수를 구하는 것
		if(count%10 == 0) {
			pages = count / 10;
		}else {
			pages = count / 10 + 1;
		}
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}
	
	@RequestMapping("read")
	@ResponseBody
	public CommunitiesVO read(int commu_no) {
		CommunitiesVO bag = dao.modify(commu_no);
		return bag;
	}

	@RequestMapping("communitiesWrite")
	public void communitiesWrite() {
	}

	@RequestMapping("communitiesList")
	public void communitiesList(PageVO vo2,Model model) {
		vo2.setStartEnd(vo2.getPage());
		List<CommunitiesVO> list = dao.list(vo2);
		int count = dao.count();
		int pages = 0; // 전체의 페이지 개수를 구하는 것
		if(count%10 == 0) {
			pages = count / 10;
		}else {
			pages = count / 10 + 1;
		}
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}

	@RequestMapping("communitiesFnD")
	public void communitiesFnd(int commu_no, Model model , PageVO vo2) {
		vo2.setStartEnd(vo2.getPage());
		List<CommunitiesVO> list = dao.list(vo2);
		int count = dao.count();
		int pages = 0; // 전체의 페이지 개수를 구하는 것
		if(count%10 == 0) {
			pages = count / 10;
		}else {
			pages = count / 10 + 1;
		}
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		model.addAttribute("commu_no", commu_no);
	}

	@RequestMapping("list")
	public void list(PageVO vo,Model model) {
		vo.setStartEnd(vo.getPage());
		List<CommunitiesVO> list = dao.list(vo);	
		model.addAttribute("list", list);
	
	}
	
	@RequestMapping("list_category")
	public void list_category(PageVO vo,Model model) {
		vo.setStartEnd(vo.getPage());
		List<CommunitiesVO> list = dao.list(vo);	
		model.addAttribute("list", list);
		
	}

}
