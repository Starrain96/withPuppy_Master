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
public class AskDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public List<AskVO> list() {
		List<AskVO> list = my.selectList("Ask.all");
		System.out.println(list.size());
		return list;
	}

	public int insert(AskVO bag) {
		int result = my.insert("Ask.create", bag);
		//						namespace.id
		return result;
	}
	
	public int update(AskVO bag) {
		int result = my.update("Ask.update", bag);
		//						namespace.id
		return result;
	}
	
	public int delete(int Ask_no) {
		int result = my.delete("Ask.del", Ask_no);
		//						namespace.id
		return result;
	}
	
	public List<AskVO> one(String title) {
		List<AskVO> list = my.selectList("Ask.one", title);
		//						namespace.id
		System.out.println(list.size());
		return list;
	}

	
	public AskVO oneNo(int Ask_no) {
		AskVO vo = my.selectOne("Ask.oneNo", Ask_no);
		//						namespace.id
		System.out.println(vo);
		return vo;
	}
	
	public AskVO updateNo(int Ask_no) {
		AskVO vo = my.selectOne("Ask.updateNo", Ask_no);
		//						namespace.id
		System.out.println(vo);
		return vo;
	}
}


