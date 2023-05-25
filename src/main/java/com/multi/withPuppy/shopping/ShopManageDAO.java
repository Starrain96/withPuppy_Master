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
	
	public List<ProductVO> search(String aa) {
		String name = "%" +aa+ "%";
		List<ProductVO> list = my.selectList("manage.search", name);
		System.out.println(list.size());
		return list;
	}
	
	public int cnt() {
		int n = my.selectOne("manage.allCnt");
		return n;
	}
	
	public int addProduct(ProductVO bag) {
		int n = my.insert("product.insert", bag);
		return n;
	}
	
	public int updateProduct(ProductVO bag) {
		int n = my.update("product.update", bag);
		return n;
	}
	
	public int deleteProduct(int product_id) {
		int n = my.delete("manage.delete", product_id);
		return n;
	}
	
	public ProductVO bringInfo(int p_id) {
		ProductVO result = my.selectOne("product.bringOne", p_id);
		return result;
	}
	
	public List<ProductVO> list2(CategoryVO bag) {
		List<ProductVO> list = my.selectList("manage.allCatePage", bag);
		return list;
	}
	
	public List<StatisticsVO> bringS(){
		List<StatisticsVO> list = my.selectList("manage.cateS");
		return list;
	}
}
