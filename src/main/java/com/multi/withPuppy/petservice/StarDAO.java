package com.multi.withPuppy.petservice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StarDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(StarVO bag) {
		my.insert("star.insertStar", bag);
	}

	public int update(StarVO bag) {
		int result = my.update("star.up", bag);
		return result;
	}

	public int delete(String id) {
		int result = my.delete("star.del", id);
		return result;
	}
	
	public List<StarVO> list(int service_id) {
		List<StarVO> list = my.selectList("star.listStar", service_id);
		return list;
	}
}
