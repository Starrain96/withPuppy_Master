package com.multi.withPuppy.shopping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ShopManageController {
	@Autowired
	ShopManageDAO dao;
	
	//처음 페이지 이동하면서 호출 시에 사용
	@RequestMapping("shopping/shopManageMain")
	public void listAll(int start_num, int end_num, Model model) {
		CategoryVO bag = new CategoryVO();
		bag.setStart_num(start_num);
		bag.setEnd_num(end_num);		
		List<ProductVO> list = dao.list2(bag);
		model.addAttribute("list", list);
	}
	
	//관리자 페이지 내에서 페이지네이션 할때 사용
	@RequestMapping("shopping/shopManageMain2")
	@ResponseBody
	public List<ProductVO> listAllCate(CategoryVO bag) {
		List<ProductVO> list = dao.list2(bag);
		return list;
	}
	
	@RequestMapping("shopping/productCnt")
	@ResponseBody
	public int productCnt() {
		int n = dao.cnt();
		return n;
	}
	
	@RequestMapping("shopping/productSearch")
	@ResponseBody
	public List<ProductVO> productSearch(String name) {
		List<ProductVO> list = dao.search(name);
		System.out.println(list.size());
		return list;
	}
}
