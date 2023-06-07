package com.multi.withPuppy.shopping;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderService {

	@Autowired
	OrderDAO dao;

	@Autowired
	ProductDAO dao1;

	@Transactional
	public void insertOrderDetail(OrderSumVO bag) throws Exception {
		//ordersumvo의 order 데이터 빼서 vo1에 넣기
		OrderVO vo1 = new OrderVO();
		vo1.setUser_id(bag.getUser_id());
		vo1.setReceiver_name(bag.getReceiver_name());
		vo1.setReceiver_id(bag.getReceiver_id());
		vo1.setReceiver_phone(bag.getReceiver_phone());
		vo1.setAddr1(bag.getAddr1());
		vo1.setAddr2(bag.getAddr2());
		vo1.setAddr3(bag.getAddr3());
		vo1.setTotal_price(bag.getTotal_price());

		//order 테이블에 값 추가
		int result = dao.insert(vo1);
		
		//방금 넣은 order_id 가져오기
		int order_id = dao.lastId();
		
		//ordersumvo의 orderDetail 데이터 빼서 list에 넣기
		List<Order_detailVO> list = new ArrayList<Order_detailVO>();
		JSONParser jp = new JSONParser();
		JSONArray ja = (JSONArray) jp.parse(bag.getProductTmp());
		for (int i = 0; i < ja.size(); i++) {
			JSONObject jo = (JSONObject) ja.get(i);

			Order_detailVO vo2 = new Order_detailVO();

			vo2.setProduct_id(Integer.parseInt(String.valueOf(jo.get("product_id"))));
			vo2.setOrdered_cnt(Integer.parseInt(String.valueOf(jo.get("product_cnt"))));
			vo2.setOrder_id(order_id);
			vo2.setOrder_status("complete");
			vo2.setRefundCheck_YN("Y");
			list.add(vo2);
		}
		
		//orderDetail 테이블에 list 값 추가
		insertDetail(list);
		
	}
	
	//orderDetail 테이블에 list 값 추가
	public void insertDetail(List<Order_detailVO> list) throws Exception {
		for (int i = 0; i < list.size(); i++) {

			// 수량이 마이너스 되지 않는지 확인
			int p_cnt = dao.bringProductCnt(list.get(i).getProduct_id());
			int p_end_cnt = p_cnt - list.get(i).getOrdered_cnt();
			int result2 = 1;
			if (p_end_cnt < 0) {
				// 수량 마이너스 시 exception 발생
				throw new Exception();
			} else if (p_end_cnt == 0) {
				// 상품 품절로 상태 변경
				int p_id = list.get(i).getProduct_id();
				result2 = dao1.productSoldout(p_id);
			}
			
			Order_detailVO bag = new Order_detailVO();
			bag.setOrder_id(list.get(i).getOrder_id());
			bag.setProduct_id(list.get(i).getProduct_id());
			bag.setOrdered_cnt(list.get(i).getOrdered_cnt());
			bag.setOrder_status("complete");
			bag.setRefundCheck_YN("Y");
			
			//orderDetail에 상품 추가
			int result = dao.insertDetail(bag);
			
			// 상품 재고 감소시키기
			ProductVO bag2 = new ProductVO();
			bag2.setProduct_id(bag.getProduct_id());
			bag2.setProduct_cnt(p_end_cnt);
			int cntResult = dao1.minusProductCnt(bag2);
			
			//detail에 안들어 갔거나, 재고 마이너스가 되지 않았을 경우 exception
			if(result == 0 || cntResult == 0) {
				throw new Exception();
			}
		}
	}
	
}
