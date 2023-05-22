package com.multi.withPuppy.shopping;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

//싱글톤 만들기
@Repository
public class ShopManageDAO {
	
	@Autowired
	public SqlSessionTemplate my;
	
//	public void insert(ProductVO bag) {
//		
//		System.out.println(bag.getProduct_img());
//		System.out.println(bag.getProduct_id());
//		System.out.println(bag.getProduct_price());
//		System.out.println(bag.getProduct_name());
//		my.insert("product.create", bag);
//		
//	}
//	public void delete(String id) {
//		System.out.println(id);
//		int result = my.delete("product.delete", id);
//		System.out.println(result);
//	}
//	public void update(ProductVO bag) {
//		int result = my.update("product.update", bag);
//		System.out.println(result);
//	}
//	
	public List<ProductVO> search(String aa) {
		String name = "%" +aa+ "%";
		List<ProductVO> list = my.selectList("manage.search", name);
		System.out.println(list.size());
		return list;
	}
//	
//	public List<ProductVO> list() {
//		System.out.println("list 왔음");
//		List<ProductVO> list = my.selectList("manage.all");
//		return list;
//	}
	
	public int cnt() {
		int n = my.selectOne("manage.allCnt");
		return n;
	}
	
	public List<ProductVO> list2(CategoryVO bag) {
		List<ProductVO> list = my.selectList("manage.allCatePage", bag);
		return list;
	}
}
