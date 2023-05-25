package com.multi.withPuppy.petservice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PetserviceDAO {

	@Autowired
	SqlSessionTemplate my;
	
	
	public List<PetserviceVO> list(String category) {
		List<PetserviceVO> list = my.selectList("petservice.listhospital", category);
		return list;
	}
	
	public List<PetserviceVO> listhp(String service_name) {
		System.out.println(service_name);
		List<PetserviceVO> list = my.selectList("petservice.searchHospital", service_name);
		return list;
	}
	
	public PetserviceVO hospital(PetserviceVO bag1) {
		PetserviceVO bag = my.selectOne("petservice.hospital", bag1);
		return bag;
	}
}
