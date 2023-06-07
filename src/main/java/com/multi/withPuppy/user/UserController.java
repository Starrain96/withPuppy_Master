package com.multi.withPuppy.user;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@RequestMapping("/userCommu")
	public void userCommu() {
	}
	
	@RequestMapping("/userShopping")
	public void userShopping() {
	}
	
	@RequestMapping("/userReview")
	public void userReview() {
	}
	
	// 마이페이지 : 네이버 아이디 연동
	@RequestMapping("/naverSocial")
	@ResponseBody
	public int naverSocial(@RequestParam("nid") String nid, HttpSession session) throws IOException {
		String id = (String) session.getAttribute("id");
		int result = 0;
		result = dao.nidUser(id, nid);
		return result;
	}
	
	// 네이버 로그인
	@RequestMapping("/naverLogin")
	@ResponseBody
	public int naverLogin(@RequestParam("nid") String nid, Model model, HttpSession session) throws IOException {
		int result = 0;
		result = dao.naverLogin(nid);
		if (result == 1) {
			UserVO vo = dao.naverUser(nid);
			model.addAttribute("vo", vo);
			//System.out.println("컨트롤러 vo : " + vo);
			if (vo != null) {
				session.setAttribute("id", vo.getUser_id());
				session.setAttribute("bag", vo);
				System.out.println("login success");
				return 1;
			} else {
				return 0;
			}
		}
		return 0;
	}
	
	// 마이페이지 : 카카오 아이디 연동
	@RequestMapping("/kakaoSocial")
	@ResponseBody
	public int kakaoSocial(@RequestParam("kid") String kid, HttpSession session) throws IOException {
		String id = (String) session.getAttribute("id");
		int result = 0;
		result = dao.kidUser(id, kid);
		return result;
	}
	
	// 카카오 로그인
	@RequestMapping("/kakaoLogin")
	@ResponseBody
	public int kakaoLogin(@RequestParam("kid") String kid, Model model, HttpSession session) throws IOException {
		int result = 0;
		result = dao.kakaoLogin(kid);
		if (result == 1) {
			UserVO vo = dao.kakaoUser(kid);
			model.addAttribute("vo", vo);
			//System.out.println("컨트롤러 vo : " + vo);
			if (vo != null) {
				session.setAttribute("id", vo.getUser_id());
				session.setAttribute("bag", vo);
				System.out.println("login success");
				return 1;
			} else {
				return 0;
			}
		}
		return 0;
	}
		
	// 로그인
	@RequestMapping("/loginUser")
	@ResponseBody
	public int loginUser(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model, HttpSession session) throws IOException {
		
		UserVO vo = dao.loginUser(id, pw);
		System.out.println("컨트롤러 vo : " + vo);
		model.addAttribute("vo", vo);
		//System.out.println("컨트롤러 vo : " + vo);
		if (vo != null) {
			session.setAttribute("id", vo.getUser_id());
			session.setAttribute("bag", vo);
			System.out.println("login success");
			return 1;
		} else {
			return 0;
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
	@RequestMapping("/insertUser")
	@ResponseBody
	public int insertUser(UserVO bag) {
		System.out.println("insert bag : " + bag);
		System.out.println(dao);
		int result = dao.insertUser(bag);
		System.out.println("컨트롤ㄹㄹㄹㄹ러 : " + result);
		return result;
	}

	// 회원탈퇴 : 비밀번호 체크
	@RequestMapping("/pwCheck")
	@ResponseBody
	public int pwCheck(@RequestParam("pw") String pw, HttpSession session) {
		String id = (String) session.getAttribute("id");
		String userPW = dao.pwCheck(id);

		System.out.println("화면에서 받아온에서 받아온 pw : " + pw);
		System.out.println("dao에서 받아온 pw : " + userPW);
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
	public void deleteUser(HttpSession session,  Model model) throws Exception {
		String id = (String) session.getAttribute("id"); // 세션에서 아이디 값을 가져온다.
		int result = 0;
		if (id != null) {
			result = dao.deleteUser(id); // memberService에서 해당 아이디 값을 가진 회원을 삭제한다.
			session.invalidate(); // 탈퇴 후 자동으로 로그아웃 처리하기 위해 세션을 모두 무효화한다.
		}
		model.addAttribute("result", result);
	}
	
	// 회원수정 : 제출 버튼
	@RequestMapping("/updateUser")
	public void updateUser(UserVO userVO, HttpSession session, HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		System.out.print("업데이트 유저 : " + userVO);
		if (!file.isEmpty()) {
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);
			
			model.addAttribute("savedName", savedName);
			userVO.setUser_img(savedName);
		} else if (file.isEmpty()) {
			userVO.setUser_img("profile.png");
		}
		String id = (String) session.getAttribute("id");
		userVO.setUser_id(id);
		dao.updateUser(userVO);
		UserVO userVo = (UserVO) session.getAttribute("bag");
		userVo.setUser_tel(userVO.getUser_tel());
		userVo.setUser_nickname(userVO.getUser_nickname());
		userVo.setUser_addr1(userVO.getUser_addr1());
		userVo.setUser_addr2(userVO.getUser_addr2());
		userVo.setUser_addr3(userVO.getUser_addr3());
		userVo.setUser_addr4(userVO.getUser_addr4());
		userVo.setUser_addr5(userVO.getUser_addr5());
		userVo.setUser_img(userVO.getUser_img());
		System.out.print("업데이트 유저222 : " + userVo);
		model.addAttribute("bag", userVo);
	}

	// 회원수정 : 비밀번호 변경 제출 버튼
	@RequestMapping("/updatePw")
	@ResponseBody
	public int updatePw(@RequestParam("pw") String pw, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		int result = dao.updatePw(id, pw);
		return result;
	}

	// 내 활동 기록 : 커뮤니티
	@RequestMapping("/userCommuList")
	@ResponseBody
	public List<UserCommuVO> userCommuList(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		
		List<UserCommuVO> commuList = dao.userCommuList(id);
		model.addAttribute("commuList", commuList);
		return commuList;
	}
	
	// 내 활동 기록 : 쇼핑
	@RequestMapping("/userShoppingList")
	@ResponseBody
	public List<UserShoppingVO> userShoppingList(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		
		List<UserShoppingVO> shoppingList = dao.userShoppingList(id);
		model.addAttribute("shoppingList", shoppingList);
		return shoppingList;
	}
	
	// 내 활동 기록 : 리뷰
	@RequestMapping("/userReviewList")
	@ResponseBody
	public List<UserReviewVO> userReviewList(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		
		List<UserReviewVO> reviewList = dao.userReviewList(id);
		model.addAttribute("reviewList", reviewList);
		return reviewList;
	}
}
