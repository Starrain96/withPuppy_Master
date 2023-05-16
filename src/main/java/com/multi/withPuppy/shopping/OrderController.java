package com.multi.withPuppy.shopping;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
@RequestMapping("shopping")
public class OrderController {
	
	@Autowired    
	OrderDAO dao;
	
	@RequestMapping("insertOr")
	public String insert(OrderVO bag) {
		System.out.println("OrderVO : "+bag);
		dao.insert(bag);
		return "order";
	}
	
	@RequestMapping("delete")
	public String delete(String title) {
		dao.delete(title);
		return "redirect:order";
	}
	@RequestMapping("update")
	public void update(OrderVO bag) {
		dao.update(bag);
	}
	
	@RequestMapping("orderList")
	public void order() {
	}

	@RequestMapping("insertOr1")
	public void order1() {
	}
	@RequestMapping("deleteOr1")
	public void order2() {
	}
	@RequestMapping("detailOr1")
	public void order3() {
	}
	
	
	
	
	@RequestMapping("one")
	public void one(int order_id, Model model) {
		OrderVO vo = dao.one(order_id);
		model.addAttribute("vo", vo);
	}
	@RequestMapping("list")
	public String list(Model model) {
		List<OrderVO> list = dao.list();
		model.addAttribute("list", list);
		return "order/list";
	}
}