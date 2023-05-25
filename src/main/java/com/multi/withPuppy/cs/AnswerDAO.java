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
		return result;
	}
	
	public int update(AnswerVO bag) {
		int result = my.update("Answer.up", bag);
		return result;
	}
	
	public int delete(int Ans_no) {
		int result = my.delete("Answer.del", Ans_no);
		return result;
	}
	
	public List<AnswerVO> one(int Ask_no) {
		List<AnswerVO> list = my.selectList("Answer.one", Ask_no);
		System.out.println(list.size());
		return list;
	}
	
}
