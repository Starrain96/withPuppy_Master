package com.multi.withPuppy.petservice;

import java.util.List;

 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller //스프링에서 제어하는 역활로 등록
@RequestMapping("petservice")
public class BillController {
	
	@Autowired
	BillDAO dao;
	
	//테스트용 코드로 추후 삭제 예
	@RequestMapping("mainFeeTest")
	//@ResponseBody
	public void list() {
	}
}
