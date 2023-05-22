package com.multi.withPuppy.user;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	UserDAO dao;
	
	@RequestMapping("/signupUser")
	public void signupUser() {
	}

	@RequestMapping("/loginPage")
	public void loginPage() {
	}

	@RequestMapping("/myPage")
	public void myPage() {
	}

	@RequestMapping("/editUser")
	public void editUser() {
	}

	@RequestMapping("/myPet")
	public void myPet() {
	}

	@RequestMapping("/userHistory")
	public void userHistory() {
	}

	// 로그인
	@RequestMapping("/loginUser")
	public String loginUser(UserVO bag, Model model, HttpSession session) {

		System.out.println("컨트롤러 bag : " + bag);
		
		UserVO vo = dao.loginUser(bag);
		model.addAttribute("vo", vo);
		System.out.println("컨트롤러 vo : " + vo);
		if (vo != null) {
			session.setAttribute("id", bag.getUser_id());
			session.setAttribute("bag", vo);
			System.out.println("세션에 아이디가 들어 있는지? : " + (String) session.getAttribute("id"));
			System.out.println("login success");
			return "redirect:../main.jsp";
		} else {
			return "redirect:loginPage";
		}
	}

	// 로그아웃
	@RequestMapping("logoutUser")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:../main.jsp";
	}

	// 회원가입 : 아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		int cnt = dao.idCheck(id);
		System.out.println("여기: " + cnt);
		return cnt;

	}

	// 회원가입 : 이메일 인증
	@PostMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(@RequestParam("email") String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return dao.joinEmail(email);
	}

	// 회원가입 : 닉네임 중복체크
	@PostMapping("/nicknameCheck")
	@ResponseBody
	public int nicknameCheck(@RequestParam("nickname") String nickname) {
		int cnt = dao.nicknameCheck(nickname);
		System.out.println("닉네임 개수 : " + cnt);
		return cnt;
	}

	// 회원가입 : 제출 버튼
	@RequestMapping("/goUser")
	@ResponseBody
	public int insertUser(UserVO bag) {
		System.out.println("insert bag : " + bag);
		System.out.println(dao);
		int result = dao.insertUser(bag);
		System.out.println("컨트롤ㄹㄹㄹㄹ러 : " + result);
		return result;
	}

	// 회원탈퇴 : 비밀번호 체크
	@PostMapping("/pwCheck")
	@ResponseBody
	public int pwCheck(@RequestParam("pw") String pw, HttpSession session) {
		String id = (String) session.getAttribute("id");
		String userPW = dao.pwCheck(id);

		if (userPW == null) {
			// 사용자의 비밀번호가 데이터베이스에서 검색되지 않은 경우
			return -1;
		}

		if (userPW.equals(pw)) {
			// 입력한 비밀번호와 데이터베이스에서 검색된 비밀번호가 일치한 경우
			return 1;
		} else {
			// 입력한 비밀번호와 데이터베이스에서 검색된 비밀번호가 일치하지 않은 경우
			return 0;
		}
	}

	// 회원탈퇴
	@RequestMapping("/deleteUser")
	public String deleteUser(HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id"); // 세션에서 아이디 값을 가져온다.
		if (id != null) {
			dao.deleteUser(id); // memberService에서 해당 아이디 값을 가진 회원을 삭제한다.
			session.invalidate(); // 탈퇴 후 자동으로 로그아웃 처리하기 위해 세션을 모두 무효화한다.
		}
		return "main"; // 탈퇴 후 메인 페이지로 이동한다.
	}

	// 회원수정 : 제출 버튼
//	@RequestMapping("/updateUser")
//	@ResponseBody
//	public int editUser(UserVO bag) {
//		System.out.println("edit bag : " + bag);
//		System.out.println(dao);
//		int result = dao.updateUser(bag);
//		System.out.println("컨트롤ㄹㄹㄹㄹ러 : " + result);
//		return result;
//	}

	// 회원수정 : 제출 버튼
	@PostMapping("/updateUser")
	@ResponseBody
	public int updateUser(@RequestParam("user_img") MultipartFile file,
			@RequestParam("user_tel") String tel, @RequestParam("user_nickname") String nickname,
			@RequestParam("user_addr1") String addr1, @RequestParam("user_addr2") String addr2,
			@RequestParam("user_addr3") String addr3, @RequestParam("user_addr4") String addr4,
			@RequestParam("user_addr5") String addr5, UserVO bag, HttpServletRequest request, Model model) throws Exception {
		
		String savedName = file.getOriginalFilename();
		String uploadPath 
			= request.getSession().getServletContext().getRealPath("resources/upload");
		File target = new File(uploadPath + "/" + savedName);
		file.transferTo(target);
		
		model.addAttribute("savedName", savedName);
		System.out.println("img넣기 전>> " + bag);
		bag.setUser_img(savedName);
		System.out.println("img넣은 후>> " + bag);
		
		bag.setUser_nickname(nickname);
		bag.setUser_tel(tel);
		bag.setUser_addr1(addr1);
		bag.setUser_addr2(addr2);
		bag.setUser_addr3(addr3);
		bag.setUser_addr4(addr4);
		bag.setUser_addr5(addr5);

		int result = dao.updateUser(bag);

		return result;
	}

	// 회원수정 : 비밀번호 변경 제출 버튼
	@RequestMapping("/updatePw")
	@ResponseBody
	public int updatePw(@RequestParam("pw") String pw, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		int result = dao.updatePw(id, pw);
		return result;
	}

	@RequestMapping("/test2")
	public void test2() {
	}

	@RequestMapping("/imgUpload")
	public int imgUpload(@RequestParam("file1") MultipartFile file, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		String savedName = file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/img");

		System.out.println("uploadpath : " + uploadPath);
		System.out.println("originFilename : " + savedName);

		if (!file.isEmpty()) {
			File target = new File(uploadPath, savedName);
			file.transferTo(target);

			model.addAttribute("savedName", savedName);
			model.addAttribute("uploadPath", target.getAbsolutePath());

			return 1;
		}

		return 0;
	}

}
