package com.multi.withPuppy.shopping;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller 	//스프링에서 제어하는 역할로 등록
public class ProductController {
	@Autowired    
	ProductDAO dao;
	
	@RequestMapping("shopping/shoppingList")
	public void shoppingList(int start, int end, int start_num, int end_num, Model model) {
		CategoryVO bag = new CategoryVO();
		bag.setEnd(end);
		bag.setStart(start);
		bag.setStart_num(start_num);
		bag.setEnd_num(end_num);
		List<ProductVO> list = dao.list1(bag);
		model.addAttribute("list", list);	
	}
	
	@RequestMapping("shopping/allCnt")
	@ResponseBody
	public int allCnt(CategoryVO bag) {
		int result = dao.allCnt(bag);
		return result;
	}
	
	
	@RequestMapping("shopping/productDetail")
	public void productDetail(int product_id, Model model) {
		System.out.println(product_id);
		ProductVO vo = dao.one(product_id);
		int id = vo.getDetail();
		String description = bringDetail(id);
		
		model.addAttribute("bag", vo);
		model.addAttribute("detail", description);		 
	}
	
	public String bringDetail(int id) {
		String url = "https://dogpre.com/product/" + Integer.toString(id);
		Document doc;
		String details = "";
		try {
			doc = Jsoup.connect(url).get();
			Elements detailData = doc.select("#__next > div:nth-child(2) > div > div.MuiContainer-root.jss11.MuiContainer-disableGutters > div.jss18 > div:nth-child(3) > div > div.jss166 > div.jss167 > div:nth-child(1) > button > div > div.jss184");
			details = detailData.text();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return details;
	}
	
	@RequestMapping("shopping/shoppingList1")
    @ResponseBody
    public List<ProductVO> shopping1(Model model, CategoryVO bag) {
        List<ProductVO> list = dao.list1(bag);
        return list;
    }
	
	@RequestMapping("shopping/shoppingList2")
    @ResponseBody
    public List<ProductVO> shopping2(Model model, CategoryVO bag) {
        List<ProductVO> list = dao.list2(bag);
        return list;
    }
	
	@RequestMapping("shopping/shoppingList3")
    @ResponseBody
    public List<ProductVO> shopping3(Model model, CategoryVO bag) {
        List<ProductVO> list = dao.list3(bag);
        return list;
    }

	
	@RequestMapping("shopping/shoppingList11")
	@ResponseBody
	public List<ProductVO> shopping11(Model model, CategoryVO bag) {
		List<ProductVO> list = dao.list11(bag);
		return list;
	}
	
	@RequestMapping("shopping/shoppingList22")
	@ResponseBody
	public List<ProductVO> shopping22(Model model, CategoryVO bag) {
		List<ProductVO> list = dao.list22(bag);
		return list;
	}
	
	@RequestMapping("shopping/shoppingList33")
	@ResponseBody
	public List<ProductVO> shopping33(Model model, CategoryVO bag) {
		List<ProductVO> list = dao.list33(bag);
		return list;
	}
	

}
