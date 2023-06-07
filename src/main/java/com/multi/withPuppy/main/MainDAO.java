package com.multi.withPuppy.main;

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

import com.multi.withPuppy.cs.AnswerVO;

@Component
public class MainDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<MainVO> listTop5() {
		List<MainVO> list = my.selectList("Main.listTop5");
		System.out.println(list.size());
		return list;
	}
	
	public List<MainVO> listFaq() {
		List<MainVO> list = my.selectList("Main.listFaq");
		System.out.println(list.size());
		return list;
	}
	
}