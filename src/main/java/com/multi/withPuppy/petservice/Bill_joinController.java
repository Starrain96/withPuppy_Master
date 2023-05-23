package com.multi.withPuppy.petservice;

import java.util.ArrayList;
import java.util.List;

 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.HttpHeadersReturnValueHandler;

import com.multi.withPuppy.cs.FaqVO;

@Controller //스프링에서 제어하는 역활로 등록
@RequestMapping("petservice")
public class Bill_joinController {
	
	@Autowired
	Bill_joinDAO dao;
	
	@RequestMapping("compareSido")
	@ResponseBody
	public List<Integer> compareSido(String bill_dx, String bill_addr) {
		System.out.println(bill_addr + ": 시/도 요청됨");
		System.out.println(bill_dx + ": 진료비 비교 요청됨");
	
		
		int min = dao.minSido(bill_dx, bill_addr);
		int avg = dao.avgSido(bill_dx, bill_addr);
		int max = dao.maxSido(bill_dx, bill_addr);

		List<Integer> result = new ArrayList<>();
	    result.add(min);
	    result.add(avg);
	    result.add(max);
	    
	    return result;
	}
	
	@RequestMapping("compareGugun")
	@ResponseBody
	public List<Integer> compareGugun(String bill_dx, String bill_addr) {
		System.out.println(bill_addr + ": 구/군 요청됨");
		System.out.println(bill_dx + ": 진료비 비교 요청됨");
	
		
		int min = dao.minGugun(bill_dx, bill_addr);
		int avg = dao.avgGugun(bill_dx, bill_addr);
		int max = dao.maxGugun(bill_dx, bill_addr);

		List<Integer> result = new ArrayList<>();
	    result.add(min);
	    result.add(avg);
	    result.add(max);
	    
	    return result;
	}
}