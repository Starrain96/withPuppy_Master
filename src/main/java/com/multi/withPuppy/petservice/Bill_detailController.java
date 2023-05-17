package com.multi.withPuppy.petservice;

import java.util.List;

 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller //스프링에서 제어하는 역활로 등록
@RequestMapping("petservice")
public class Bill_detailController {
	
	@Autowired
	BillDAO dao;
	

	@RequestMapping("mainFee1")
	@ResponseBody
	public void list(Model model) {
		//List<BillVO> list = dao.list();
		//model.addAttribute("list", list);
	}
	
	
	@RequestMapping("insertBill1")
    @ResponseBody
    public int insertBill(BillVO bag) {
        System.out.println("insert bag : " + bag);
        System.out.println(dao);
        int result = dao.insert(bag);
        System.out.println("insertBill Controller : " + result);
        return result;
    }
	 
}
