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
public class Bill_detailController {
	
	@Autowired
	Bill_detailDAO dao;

	//진료비 비교 메인페이지 접근과 동시에 등록된 진료비 데이터 총 개수 카운트.
	@RequestMapping("mainFee")
	public void count(Model model) {
		int billCount = dao.count();
		model.addAttribute("billCount", billCount);
	}
	
	//진료비 항목 선택 및 검색을 통한 진료비 비교 페이지 출력 시 사용.
	@RequestMapping("selectDx")
	public void one(String bill_dx, Model model) {
		System.out.println(bill_dx + " : 진료비 검색 요청됨.");
		System.out.println(bill_dx);
		Bill_detailVO vo = dao.one(bill_dx);
		model.addAttribute("vo", vo);
	}
	
	//전국 진료비 비교 시 사용.
	@RequestMapping("compareTotal")
	@ResponseBody
	public List<Integer> compareTotal(String bill_dx) {
		System.out.println(bill_dx + " : 전국 진료비 비교 요청됨");
		int min = dao.minTotal(bill_dx);
		int avg = dao.avgTotal(bill_dx);
		int max = dao.maxTotal(bill_dx);

		List<Integer> result = new ArrayList<>();
	    result.add(min);
	    result.add(avg);
	    result.add(max);
	    
	    return result;
	}
}