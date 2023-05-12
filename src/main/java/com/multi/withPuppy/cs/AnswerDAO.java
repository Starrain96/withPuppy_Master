package com.multi.withPuppy.cs;

//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
import java.util.List;
//import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AnswerDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public List<AnswerVO> list() {
		List<AnswerVO> list = my.selectList("Answer.all");
		System.out.println(list.size());
		return list;
	}

	public int insert(AnswerVO bag) {
		int result = my.insert("Answer.create", bag);
		//						namespace.id
		return result;
	}
	
	public int update(AnswerVO bag) {
		int result = my.update("Answer.up", bag);
		//						namespace.id
		return result;
	}
	
	public int delete(int Ans_no) {
		int result = my.delete("Answer.del", Ans_no);
		//						namespace.id
		return result;
	}
	
	public List<AnswerVO> one(int Ask_no) {
		List<AnswerVO> list = my.selectList("Answer.one", Ask_no);
		//						namespace.id
		System.out.println(list.size());
		return list;
	}
	
//	public AnswerVO one(String title) {
//		AnswerVO vo = my.selectOne("Answer.one", title);
//		//						namespace.id
//		System.out.println(vo);
//		return vo;
//	}
}
