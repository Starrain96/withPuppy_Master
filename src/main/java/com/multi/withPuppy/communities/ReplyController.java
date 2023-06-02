package com.multi.withPuppy.communities;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping("delete_reply")
	@ResponseBody
	public int delete(int reply_no) {
		System.out.println("delete요청됨.");
		System.out.println(reply_no);
		int n = dao.delete(reply_no);
		return n;
	}
	
	@RequestMapping("one_reply")
	public void one(int commu_id, Model model) {
		System.out.println("one요청됨.");
		System.out.println(commu_id);
	}
	
	@RequestMapping("update_reply")
	@ResponseBody
	public void update(int reply_no , String reply_content) {
		System.out.println("update 요청됨");
		System.out.println("Controller : " + reply_no);
		System.out.println("Controller : " + reply_content);
		dao.update(reply_no , reply_content);
	}
	
	@RequestMapping("Replyread")
	@ResponseBody
	public ReplyVO read(int reply_no) {
		System.out.println("ReplyController : " + reply_no);
		ReplyVO bag = dao.modify(reply_no);
		return bag;
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
	
	@RequestMapping(value = "reply_one", method = RequestMethod.GET)
	public String reply_one(int reply_no, Model model) {
		System.out.println("controller : " + reply_no);
		ReplyVO vo = dao.modify(reply_no);
		model.addAttribute("vo", vo);
		return "reply_one";
	}
	
	
}
