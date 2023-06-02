package com.multi.withPuppy.communities;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;






@Controller
@RequestMapping("reply/")
public class ReplyController {
	
	@Autowired
	ReplyDAO dao;
	
	@RequestMapping("insert_reply")
	public void insert(ReplyVO vo) {
		System.out.println(vo);
		System.out.println(dao);
		dao.insert(vo);
	}
	
	@RequestMapping("update_reply")
	public void update(ReplyVO bag) {
		System.out.println("update요청됨.");
		System.out.println(bag);
		dao.update(bag);
	}
	
	@RequestMapping("delete_reply")
	@ResponseBody
	public int delete(int reply_no) {
		System.out.println("delete요청됨.");
		System.out.println(reply_no);
		int n = dao.delete(reply_no);
		return n;
	}
	
	@RequestMapping("one_reply")
	public void one(int Commu_id, Model model) {
		System.out.println("one요청됨.");
		System.out.println(Commu_id);
 
	}
	
	@RequestMapping("replyMain")
	public void replyMain() {
	}
	
	@RequestMapping("replyWrite")
	public void replyWrite() {
	}
	
	@RequestMapping("replyList")
	public void replyList() {
	}
	
	@RequestMapping("replyFnD")
	public void replyFnd() {
	}
	
	@RequestMapping("list_reply")
	@ResponseBody
	public List<ReplyVO> list2(int commu_no) {
		List<ReplyVO> list = dao.list(commu_no);
		System.out.println("controller : " + list.size());
		return list;
	}
	
	
}