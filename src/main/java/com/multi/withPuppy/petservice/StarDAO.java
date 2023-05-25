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

	public List<StarVO> list(int service_id) {
		List<StarVO> list = my.selectList("star.listStar", service_id);
		return list;
	}
	
	public void insertOCR(String [][] ocrAll) {
		OcrVO bag = new OcrVO();
		OcrVO bag2 = new OcrVO();
		bag.setBill_no(ocrAll[ocrAll.length-1][0]);
		bag.setBill_brn(ocrAll[ocrAll.length-1][1]);
		bag.setBill_name(ocrAll[ocrAll.length-1][2]);
		bag.setBill_addr(ocrAll[ocrAll.length-1][3]);
		bag.setBill_totalfee(ocrAll[ocrAll.length-1][4]);
		// bag.setBill_dx(ocrAll[7][5]);
		// bag.setBill_fee(ocrAll[7][6]);
		
		my.insert("star.insertBill", bag);
		
		for (int i = 0; i < ocrAll.length; i++) {
			System.out.println(i + ocrAll[0][0]);
			System.out.println(i + ocrAll[i][5]);
			System.out.println(i + ocrAll[i][6]);
			
			bag2.setBill_no(ocrAll[0][0]);
			bag2.setBill_dx(ocrAll[i][5]);
			bag2.setBill_fee(ocrAll[i][6]);
			my.insert("star.insertBD", bag2);
		}
	}
}
