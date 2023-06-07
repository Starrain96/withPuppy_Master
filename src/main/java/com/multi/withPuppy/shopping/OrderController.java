package com.multi.withPuppy.shopping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.multi.withPuppy.user.UserVO;
import com.sun.media.sound.ModelAbstractOscillator;


@Controller
@RequestMapping("shopping")
public class OrderController {

	@Autowired
	OrderDAO dao;
	
	@Autowired
	ProductDAO dao1;
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("insertOrderSum")
	@ResponseBody
	public int insertOrderSum(OrderSumVO bag) throws Exception {
		
		orderService.insertOrderDetail(bag);

		return 1;
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
	
	//결제 성공 시 장바구니 비우기
	@RequestMapping("emptyCart")
	public int emptyCart(String user_id) {
		int ans = dao.emptyCart(user_id);
		return ans;
	}

}