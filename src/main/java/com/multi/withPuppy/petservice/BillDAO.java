package com.multi.withPuppy.petservice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BillDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(BillVO bag) {
		
		int result = my.insert("bill.insertBill", bag);
		return result;
	}

	public int update(BillVO bag) {
		int result = my.update("star.up", bag);
		return result;
	}
	
	public List<BillVO> list(int service_id) {
		List<BillVO> list = my.selectList("bill.listBill", service_id);
		return list;
	}
}
