package com.multi.withPuppy.petservice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.multi.withPuppy.cs.AskVO;
import com.multi.withPuppy.cs.FaqVO;

@Component
public class Bill_detailDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int count() {
		int result = my.selectOne("Bill_detail.count");
		return result;
	}
	
	public Bill_detailVO one(String bill_dx) {
		Bill_detailVO vo = my.selectOne("Bill_detail.one", bill_dx);
		System.out.println(vo);
		return vo;
	}
	
	public int minTotal(String bill_dx) {
		int result = my.selectOne("Bill_detail.minTotal", bill_dx);
		return result;
	}
	
	public int maxTotal(String bill_dx) {
		int result = my.selectOne("Bill_detail.maxTotal", bill_dx);
		return result;
	}
	
	public int avgTotal(String bill_dx) {
		int result = my.selectOne("Bill_detail.avgTotal", bill_dx);
		return result;
	}
	
}
