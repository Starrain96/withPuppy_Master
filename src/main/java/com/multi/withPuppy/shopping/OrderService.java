package com.multi.withPuppy.shopping;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Service
public class OrderService {

	OrderDAO dao = new OrderDAO();

	@Transactional
	public void helloTest() {
		System.out.println("test");
	}

}
