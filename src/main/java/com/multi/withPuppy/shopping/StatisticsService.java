package com.multi.withPuppy.shopping;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatisticsService {
	
	@Autowired
	StatisticsDAO dao;
	
	public List<StatisticsVO> MonthlySt(int num) {
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
