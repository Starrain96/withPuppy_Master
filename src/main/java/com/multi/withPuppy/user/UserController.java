package com.multi.withPuppy.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	UserDAO dao;

	@RequestMapping("/loginUser")
	public String loginUser(UserVO bag, Model model, HttpSession session) {

		UserVO vo = dao.loginUser(bag);
		model.addAttribute("vo", vo);
		System.out.println("컨트롤러 vo : " + vo);
		if (vo != null) {
			session.setAttribute("id", bag.getUser_id());
			session.setAttribute("bag", vo);
			System.out.println("세션에 아이디가 들어 있는지? : " + (String) session.getAttribute("id"));
			System.out.println("login success");
			return "main";
		} else {
			return "redirect:user/loginPage";
		}
	}

	@RequestMapping("/signupUser")
	public void signupUser() {
	}

	// 아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		int cnt = dao.idCheck(id);
		System.out.println("여기: "+cnt);
		return cnt;

	}
	
	//이메일 인증
	@PostMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(@RequestParam("email") String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return dao.joinEmail(email);
	}
	
	// 닉네임 중복체크
	@PostMapping("/nicknameCheck")
	@ResponseBody
	public int nicknameCheck(@RequestParam("nickname") String nickname) {
		int cnt = dao.nicknameCheck(nickname);
		System.out.println("닉네임 개수 : "+cnt);
		return cnt;
	}
	
	@RequestMapping("goUser")
	@ResponseBody
	public int insertUser(UserVO bag) {
		System.out.println("insert bag : " + bag);
		System.out.println(dao);
		int result = dao.insertUser(bag);
		System.out.println("컨트롤ㄹㄹㄹㄹ러 : " + result);
		return result;
	}

}
