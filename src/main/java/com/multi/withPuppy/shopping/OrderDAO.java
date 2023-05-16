package com.multi.withPuppy.shopping;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component 
public class OrderDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(OrderVO bag) {
		int result = my.insert("report.insertRe", bag);
		System.out.println(result);
		return result;
	}
	public int delete(String title) {
		int result = my.delete("report.delete", title);
		System.out.println(result);
		return result;
	}
	public int update(OrderVO bag) {
		int result = my.update("report.update", bag);
		System.out.println(result);
		return result;
	}
	public OrderVO one(int order_id) {
		OrderVO vo = my.selectOne("report.one", order_id);
		return vo;
	}
	public List<OrderVO> list() {
		List<OrderVO> list = my.selectList("report.all");
		return list;
	}
}
