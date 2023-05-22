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
	
	//개별 진료비 총 등록 건수 카운트
	public int count() {
		int result = my.selectOne("Bill_detail.count");
		return result;
	}
	
	//검색 또는 선택된 진료명에 따른 진료명 전달할 때 사용.
	public Bill_detailVO one(String bill_dx) {
		Bill_detailVO vo = my.selectOne("Bill_detail.one", bill_dx);
		System.out.println(vo);
		return vo;
	}
	
	// 전국진료비 min
	public int minTotal(String bill_dx) {
		int result = my.selectOne("Bill_detail.minTotal", bill_dx);
		return result;
	}
	
	// 전국진료비 max
	public int maxTotal(String bill_dx) {
		int result = my.selectOne("Bill_detail.maxTotal", bill_dx);
		return result;
	}
	
	// 전국진료비 avg
	public int avgTotal(String bill_dx) {
		int result = my.selectOne("Bill_detail.avgTotal", bill_dx);
		return result;
	}
	
}
