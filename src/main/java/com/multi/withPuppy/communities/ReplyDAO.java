package com.multi.withPuppy.communities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(ReplyVO vo) {
		int result = my.insert("reply.create2",vo);
		return result;
	}
	
	public int update(ReplyVO vo) {
		int result = my.update("reply.update2",vo);
		return result;
	}
	
	public int delete(int reply_no) {
		int result = my.delete("reply.delete2", reply_no);
		return result;
	}
	
	public List<ReplyVO> list(ReplyVO vo) {
		System.out.println(vo);
		return my.selectList("reply.list2", vo);	
	}
}
