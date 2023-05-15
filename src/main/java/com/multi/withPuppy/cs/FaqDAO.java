package com.multi.withPuppy.cs;

//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
import java.util.List;
//import java.util.Locale;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FaqDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public List<FaqVO> list() {
		List<FaqVO> list = my.selectList("Faq.all");
		System.out.println(list.size());
		return list;
	}

	public int insert(FaqVO bag) {
		int result = my.insert("Faq.create", bag);
		//						namespace.id
		return result;
	}
	
	public int update(FaqVO bag) {
		int result = my.update("Faq.up", bag);
		//						namespace.id
		return result;
	}
	
	public AskVO updateNo(int Faq_no) {
		AskVO vo = my.selectOne("Faq.updateNo", Faq_no);
		//						namespace.id
		System.out.println(vo);
		return vo;
	}
	
	public int delete(int faq_no) {
		int result = my.delete("Faq.del", faq_no);
		//						namespace.id
		return result;
	}
	
	public List<FaqVO> one(String faq_title) {
		List<FaqVO> list = my.selectList("Faq.one", faq_title);
		//						namespace.id
		System.out.println(list.size());
		return list;
	}

	public List<FaqVO> one2(String faq_category) {
		List<FaqVO> list = my.selectList("Faq.one2", faq_category);
		//						namespace.id
		System.out.println(list.size());
		return list;
	}
	
	
	
//	public FaqVO one(String title) {
//		FaqVO vo = my.selectOne("Faq.one", title);
//		//						namespace.id
//		System.out.println(vo);
//		return vo;
//	}
}
