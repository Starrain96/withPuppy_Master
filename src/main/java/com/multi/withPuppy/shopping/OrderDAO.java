package com.multi.withPuppy.shopping;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.multi.withPuppy.user.UserVO;

@Component 
public class OrderDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(OrderVO bag) {
		int result = my.insert("order.insertOr", bag);
		System.out.println(result);
		return result;
	}

	public int insertDetail(Order_detailVO bag) {
		System.out.println(bag);
		int result = my.insert("order_detail.insertDe", bag);
		System.out.println(result);
		return result;
	}
	
	public int lastId() {
		int result = my.selectOne("order_detail.lastId");
		System.out.println(result);
		return result;
	}

	
	public int delete(String title) {
		int result = my.delete("order.delete", title);
		System.out.println(result);
		return result;
	}
	public int update(OrderVO bag) {
		int result = my.update("order.update", bag);
		System.out.println(result);
		return result;
	}
	public OrderVO one(String user_id) {
		System.out.println("dao : " + user_id);
		OrderVO vo =my.selectOne("order.one", user_id);
		System.out.println("daoVo : " + vo);
		return vo;
	}
	
	public UserVO bringUser(String user_id) {
		UserVO vo = my.selectOne("order.bringUserInfo", user_id);
		return vo;
	}
	
	public List<ProductVO> listP(String user_id) {
		List<ProductVO> list = my.selectList("cart.allProduct", user_id);
		return list;
	}
	
	
	public int bringProductCnt(int product_id) {
		int ans = my.selectOne("order_detail.productCnt", product_id);
		return ans;
	}
	
	//결제 완료 후 장바구니 비우기
	public int emptyCart(String user_id) {
		int ans = my.delete("cart.emptyCart", user_id);
		return ans;
	}
}
