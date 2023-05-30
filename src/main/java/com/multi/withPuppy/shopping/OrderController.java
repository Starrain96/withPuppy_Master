package com.multi.withPuppy.shopping;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.withPuppy.user.UserVO;
import com.sun.media.sound.ModelAbstractOscillator;

@Controller
@RequestMapping("shopping")
public class OrderController {

	@Autowired
	OrderDAO dao;
	
	@Autowired
	ProductDAO dao1;
	

	@RequestMapping("insertOr")
	@ResponseBody
	public int insert(OrderVO bag) {
		System.out.println("orderVO : " + bag);
		int result = dao.insert(bag);
		return result;
	}

	@RequestMapping("insertDe")
	@ResponseBody
	public int insert(Order_detailVO bag) {
		int order_id = dao.lastId();
		System.out.println("order_detailVO : " + bag);
		bag.setOrder_id(order_id);
		int result = dao.insert(bag);
		
		int p_cnt = dao.bringProductCnt(bag.getProduct_id());
		
		//상품 재고 마이너스
		ProductVO bag2 = new ProductVO();
		bag2.setProduct_id(bag.getProduct_id());
		bag2.setProduct_cnt(p_cnt - bag.getOrdered_cnt());
		int cntResult = dao1.minusProductCnt(bag2);
		return result;
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
	public void order(String user_id, Model model) {
		// order 테이블 데이터 추가
		// order_id를 받아서 orderDetail테이블에 값 추가
		UserVO bag = dao.bringUser(user_id);
		model.addAttribute("bag", bag);
		
	}

}