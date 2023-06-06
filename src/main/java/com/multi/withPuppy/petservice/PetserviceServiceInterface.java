package com.multi.withPuppy.petservice;

import java.util.List;

import org.springframework.ui.Model;

public interface PetserviceServiceInterface {

	List<PetserviceVO> all( String category);

	List<PetserviceVO> searchHp( String service_name);

	PetserviceVO one(PetserviceVO bag1);

}