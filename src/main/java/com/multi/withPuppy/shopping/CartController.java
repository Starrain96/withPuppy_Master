package com.multi.withPuppy.shopping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CartController {
	@Autowired
	CartDAO dao;

	// 미완
	@RequestMapping("shopping/cartList")
	public void cartList(String user_id, Model model) {
		model.addAttribute("user_id", user_id);
	}
	
	@RequestMapping("shopping/cartPriceTotal")
	@ResponseBody
	public List<ProductVO> cartPriceTotal(String user_id, Model model) {
		System.out.println("controller 왔니");
		List<ProductVO> list = dao.listP(user_id);
		model.addAttribute("user_id", user_id);
		return list;
	}
	
	@RequestMapping("shopping/addCart")
	public void addCart(int product_id, int product_cnt, String user_id, Model model) {
		CartVO bag = new CartVO();
		bag.setProduct_id(product_id);
		bag.setProduct_cnt(product_cnt);
		bag.setUser_id(user_id);
		dao.add(bag);
	}
	
	@RequestMapping("shopping/updateCart")
	public void updateCart(int product_id, int product_cnt, String user_id) {
		System.out.println("updateController");
		CartVO bag = new CartVO();
		bag.setProduct_id(product_id);
		bag.setProduct_cnt(product_cnt);
		bag.setUser_id(user_id);
		System.out.println(bag);
		dao.update(bag);
	}
	
}

