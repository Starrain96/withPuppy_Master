package com.multi.withPuppy.shopping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	
	//통계페이지로 이동
	@RequestMapping("shopping/shopManageStatis")
	public void statistics() {
	}
	
	
	//관리자 페이지 내에서 페이지네이션 할때 사용
	@RequestMapping("shopping/shopManageMain2")
	@ResponseBody
	public List<ProductVO> listAllCate(CategoryVO bag) {
		List<ProductVO> list = dao.list2(bag);
		return list;
	}
	
	//상품 전체 개수 -> 페이지네이션용
	@RequestMapping("shopping/productCnt")
	@ResponseBody
	public int productCnt() {
		int n = dao.cnt();
		return n;
	}
	
	//관리자 상품 검색
	@RequestMapping("shopping/productSearch")
	@ResponseBody
	public List<ProductVO> productSearch(String name) {
		List<ProductVO> list = dao.search(name);
		return list;
	}
	
	//관리자 상품 추가
	@RequestMapping("shopping/addProduct")
	@ResponseBody
	public int addProduct(ProductVO bag) {
		System.out.println("controller : " + bag);
		int result = dao.addProduct(bag);
		return result;
	}
	
	//관리자 상품 수정
	@RequestMapping("shopping/updateProduct")
	@ResponseBody
	public int updateProduct(ProductVO bag) {
		int result = dao.updateProduct(bag);
		return result;
	}
	
	@RequestMapping("shopping/deleteProduct")
	@ResponseBody
	public int deleteProduct(int product_id) {
		int result = dao.deleteProduct(product_id);
		return result;
	}
	
	//관리자 상품 수정시 정보 불러오기
	@RequestMapping("shopping/bringInfo")
	@ResponseBody
	public ProductVO bringInfo(int product_id) {
		ProductVO result = dao.bringInfo(product_id);
		return result;
	}

}
