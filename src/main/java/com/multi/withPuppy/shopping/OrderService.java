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
	public void insertOrderDetail(List<Order_detailVO> list) throws Exception {
		//try {
		for (int i = 0; i < list.size(); i++) {

			// 수량이 마이너스 되지 않는지 확인
			int p_cnt = dao.bringProductCnt(list.get(i).getProduct_id());
			int p_end_cnt = p_cnt - list.get(i).getOrdered_cnt();
			if (p_end_cnt < 0) {
				// 수량 마이너스 시 exception 발생
				throw new Exception();
			} else if (p_end_cnt == 0) {
				// 상품 품절로 상태 변경
			}
			
			Order_detailVO bag = new Order_detailVO();
			bag.setOrder_id(list.get(i).getOrder_id());
			bag.setProduct_id(list.get(i).getProduct_id());
			bag.setOrdered_cnt(list.get(i).getOrdered_cnt());
			bag.setOrder_status("complete");
			bag.setRefundCheck_YN("Y");
			
			//orderDetail에 상품 추가
			int result = dao.insertDetail(bag);
			
			// 상품 재고 마이너스
			ProductVO bag2 = new ProductVO();
			bag2.setProduct_id(bag.getProduct_id());
			bag2.setProduct_cnt(p_end_cnt);
			int cntResult = dao1.minusProductCnt(bag2);
			
			//detail에 안들어 갔거나, 재고 마이너스가 되지 않았을 경우 exception
			if(result == 0 || cntResult == 0) {
				throw new Exception();
				//exception 처리를 어케하지..훔
			}
			
		}
		
//		}catch (Exception e) {	//이거 되나
//			//결제 중 에러났을 경우 처리
//			throw new Exception();
//		}
	}

}
