package com.multi.withPuppy.petservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
public class PetserviceService implements PetserviceServiceInterface {
	
	@Autowired
	PetserviceDAO dao;
	
	
	@Override
	public List<PetserviceVO> all(String category) {
		List<PetserviceVO> list = dao.list(category);
		return list;
	}
	
	
	@Override
	public List<PetserviceVO> searchHp(String service_name) {
		System.out.println(service_name);
		return dao.listhp(service_name);
		
	}
	
	
	@Override
	public PetserviceVO one(PetserviceVO bag1) {
		 return dao.hospital(bag1);
	
	}
}
