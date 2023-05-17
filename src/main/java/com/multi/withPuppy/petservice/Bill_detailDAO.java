package com.multi.withPuppy.petservice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Bill_detailDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(Bill_detailVO bag) {
		
		int result = my.insert("bill.insertBill", bag);
		return result;
	}

	public int update(Bill_detailVO bag) {
		int result = my.update("star.up", bag);
		return result;
	}

	public int delete(String id) {
		int result = my.delete("star.del", id);
		return result;
	}
	
	public List<Bill_detailVO> list(int service_id) {
		List<Bill_detailVO> list = my.selectList("bill.listBill", service_id);
		return list;
	}
}
