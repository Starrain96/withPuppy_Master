package com.multi.withPuppy.shopping;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Service
public class OrderService {

	@Autowired
	OrderDAO dao;
	
	@Autowired
	ProductDAO dao1;

	@Transactional
	public void insertOrderDetail (List<Order_detailVO> list) throws Exception{
		
		for(int i=0; i<list.size(); i++) {
			
			Order_detailVO bag = new Order_detailVO();
			bag.setOrder_id(list.get(i).getOrder_id());
			bag.setProduct_id(list.get(i).getProduct_id());
			bag.setOrdered_cnt(list.get(i).getOrdered_cnt());
			bag.setOrder_status("complete");
			bag.setRefundCheck_YN("Y");
			
			int result = dao.insertDetail(bag);		
			
			int p_cnt = dao.bringProductCnt(bag.getProduct_id());
			
			//상품 재고 마이너스
			ProductVO bag2 = new ProductVO();
			bag2.setProduct_id(bag.getProduct_id());
			bag2.setProduct_cnt(p_cnt - bag.getOrdered_cnt());
			int cntResult = dao1.minusProductCnt(bag2);
		}
		
	}

}
