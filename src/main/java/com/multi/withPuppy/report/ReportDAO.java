package com.multi.withPuppy.report;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component 
public class ReportDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(ReportVO bag) {
		int result = my.insert("report.insertRe", bag);
		System.out.println(result);
		return result;
	}
	public int delete(String title) {
		int result = my.delete("report.delete", title);
		System.out.println(result);
		return result;
	}
	public int update(ReportVO bag) {
		int result = my.update("report.update", bag);
		System.out.println(result);
		return result;
	}
	public ReportVO one(int no) {
		ReportVO vo = my.selectOne("report.one", no);
		return vo;
	}
	public List<ReportVO> list() {
		List<ReportVO> list = my.selectList("report.all");
		return list;
	}
}
