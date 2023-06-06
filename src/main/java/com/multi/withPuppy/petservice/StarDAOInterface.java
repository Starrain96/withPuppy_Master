package com.multi.withPuppy.petservice;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

public interface StarDAOInterface {

	void insert(StarVO bag);

	List<StarVO> list(int service_id);

	void insertOCR(String[][] ocrAll) throws Exception;

}