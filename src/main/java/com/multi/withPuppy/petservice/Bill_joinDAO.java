package com.multi.withPuppy.petservice;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Bill_joinDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int minSido(String bill_dx, String bill_addr) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("bill_dx", bill_dx);
		parameters.put("bill_addr", bill_addr);
		
		int result = my.selectOne("Bill_detail.minSido", parameters);
		return result;
    }
	
	public int avgSido(String bill_dx, String bill_addr) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("bill_dx", bill_dx);
		parameters.put("bill_addr", bill_addr);
		
		int result = my.selectOne("Bill_detail.avgSido", parameters);
		return result;
    }
	
	public int maxSido(String bill_dx, String bill_addr) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("bill_dx", bill_dx);
		parameters.put("bill_addr", bill_addr);
		
		int result = my.selectOne("Bill_detail.maxSido", parameters);
		return result;
    }
	
	public int minGugun(String bill_dx, String bill_addr) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("bill_dx", bill_dx);
		parameters.put("bill_addr", bill_addr);
		
		int result = my.selectOne("Bill_detail.minGugun", parameters);
		return result;
    }
	
	public int avgGugun(String bill_dx, String bill_addr) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("bill_dx", bill_dx);
		parameters.put("bill_addr", bill_addr);
		
		int result = my.selectOne("Bill_detail.avgGugun", parameters);
		return result;
    }
	
	public int maxGugun(String bill_dx, String bill_addr) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("bill_dx", bill_dx);
		parameters.put("bill_addr", bill_addr);
		
		int result = my.selectOne("Bill_detail.maxGugun", parameters);
		return result;
    }
	
}
