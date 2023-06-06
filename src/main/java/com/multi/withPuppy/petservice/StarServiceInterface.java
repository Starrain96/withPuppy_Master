package com.multi.withPuppy.petservice;

import java.util.List;

import org.springframework.ui.Model;

public interface StarServiceInterface {

	//void one(String id, int service_id, Model model);

	//List<StarVO> one(int service_id);

	void insertBill(String ocr) throws Exception;

}