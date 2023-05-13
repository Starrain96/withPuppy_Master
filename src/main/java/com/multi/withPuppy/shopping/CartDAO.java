package com.multi.withPuppy.shopping;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {
	@Autowired
	public SqlSessionTemplate my;
	
	public List<CartVO> list(String user_id) {
		List<CartVO> list = my.selectList("cart.all", user_id);
		return list;
	}
	
	public List<ProductVO> listP(String user_id) {
		List<ProductVO> list = my.selectList("cart.allProduct", user_id);
		return list;
	}
	
	public void delete(CartVO bag)	{
		my.delete("cart.delete", bag);
	}
	
	public void add(CartVO bag)	{
		my.insert("cart.add", bag);
	}
	
	public void update(CartVO bag)	{
		my.update("cart.update", bag);
	}
	
	//모르겠는건 count를 가져올때도 selectOne을 쓰나?
	public int check(CartVO bag) {
		int a = my.selectOne("cart.emptyCheck", bag);
		return a;
	}
	
}
