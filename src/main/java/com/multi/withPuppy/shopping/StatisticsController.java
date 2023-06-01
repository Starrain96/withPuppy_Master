package com.multi.withPuppy.shopping;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StatisticsController {

	@Autowired
	StatisticsDAO dao;

	// 매출현황 데이터
	@RequestMapping("shopping/bringSalesAll")
	@ResponseBody
	public int[] bringSalesAll() {
		int[] arr = dao.salesAll();
		return arr;
	}

	@RequestMapping("shopping/bringStatistics")
	@ResponseBody
	public List<StatisticsVO> bringStatistics() {
		List<StatisticsVO> result = dao.bringS();
		return result;
	} 

	// 당일 카테고리별 매출
	@RequestMapping("shopping/todayStatistics")
	@ResponseBody
	public List<StatisticsVO> todayStatistics() {
		List<StatisticsVO> result = dao.cateDaily();
		return result;
	}

	// 월별 매출
	@RequestMapping("shopping/MonthlyStatistics")
	@ResponseBody
	public List<StatisticsVO> MonthlyStatistics(int num) {
		List<StatisticsVO> result = new ArrayList<StatisticsVO>();
		if(num == 1) {
			result = dao.saleMonthly1();
		} else if(num == 2) {
			result = dao.saleMonthly2();
		} else {
			result = dao.saleMonthly3();
		}
		return result;
	}

}
