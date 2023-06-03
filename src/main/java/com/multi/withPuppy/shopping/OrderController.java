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
	
	//order1테이블에 추가
	@RequestMapping("insertOr")
	@ResponseBody
	public int insert(OrderVO bag) {
		System.out.println("orderVO : " + bag);
		int result = dao.insert(bag);
		return result;
	}

	//orderDetail테이블에 추가
	@RequestMapping("insertDe")
	@ResponseBody
	public int insert(String productTmp) throws Exception{
		int order_id = dao.lastId();
		System.out.println("order_id : " + order_id);
		List<Order_detailVO> list = new ArrayList<Order_detailVO>();
		
		JSONParser jp = new JSONParser(); 
		JSONArray ja = (JSONArray)jp.parse(productTmp);
		for(int i=0; i<ja.size(); i++) {
			JSONObject jo = (JSONObject)ja.get(i);
			
			Order_detailVO bag = new Order_detailVO();
			
			bag.setProduct_id(Integer.parseInt(String.valueOf(jo.get("product_id"))));
			bag.setOrdered_cnt(Integer.parseInt(String.valueOf(jo.get("product_cnt"))));
			bag.setOrder_id(order_id);
			bag.setOrder_status("complete");
			bag.setRefundCheck_YN("Y");
			list.add(bag);
		}
		try {
		orderService.insertOrderDetail(list);
		}catch (Exception e) {
			System.out.println(e);
		}
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

}