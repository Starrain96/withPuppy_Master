package com.multi.withPuppy.shopping;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

//싱글톤 만들기
@Repository
public class ProductDAO {
	
	@Autowired
	public SqlSessionTemplate my;
	
	
	public int allCnt(CategoryVO bag) {
		int result = my.selectOne("product.allCnt", bag);
		return result;
	}
	
	public void insert(ProductVO bag) {
		
		System.out.println(bag.getProduct_img());
		System.out.println(bag.getProduct_id());
		System.out.println(bag.getProduct_price());
		System.out.println(bag.getProduct_name());
		my.insert("product.create", bag);
		
	}
	public void delete(String id) {
		System.out.println(id);
		int result = my.delete("product.delete", id);
		System.out.println(result);
	}
	public void update(ProductVO bag) {
		int result = my.update("product.update", bag);
		System.out.println(result);
	}
	
	public int minusProductCnt(ProductVO bag) {
		int result = my.update("product.updateCnt", bag);
		return result;
	}
	
	public ProductVO one(int id) {
		ProductVO vo = my.selectOne("product.one", id);
		return vo;
	}
	
	public List<ProductVO> list1(CategoryVO bag) {
		List<ProductVO> list = my.selectList("product.dogcate1", bag);
		return list;
	}
	
	public List<ProductVO> list2(CategoryVO bag) {
		List<ProductVO> list = my.selectList("product.dogcate2", bag);
		return list;
	}
	
	public List<ProductVO> list3(CategoryVO bag) {
		List<ProductVO> list = my.selectList("product.dogcate3", bag);
		return list;
	}

	public List<ProductVO> list11(CategoryVO bag) {
		List<ProductVO> list = my.selectList("product.dogcate11", bag);
		return list;
	}
	
	public List<ProductVO> list22(CategoryVO bag) {
		List<ProductVO> list = my.selectList("product.dogcate22", bag);
		return list;
	}
	
	public List<ProductVO> list33(CategoryVO bag) {
		List<ProductVO> list = my.selectList("product.dogcate33", bag);
		return list;
	}
}
