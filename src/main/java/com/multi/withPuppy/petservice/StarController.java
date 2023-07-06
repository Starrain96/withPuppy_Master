package com.multi.withPuppy.petservice;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller // 스프링에서 제어하는 역활로 등록
@RequestMapping("petservice")
public class StarController {

	@Autowired
	StarDAOInterface dao;
	
	@Autowired
	StarServiceInterface starService;

	@RequestMapping("starpage") // starpage 불러오기. 값 전달.
	public void one(String id, int service_id, Model model) {
		StarVO bag = new StarVO();
		bag.setId(id);
		bag.setService_id(service_id);
		model.addAttribute("bag", bag);
	}

	@RequestMapping("listStar") // ajax 호출 시 후기리스트 불러오기.
	@ResponseBody
	public List<StarVO> one(int service_id) {
		List<StarVO> list = dao.list(service_id);
		return list;
	}

	@RequestMapping("insertStar") // 후기 insert
	public void insert(StarVO starVO, HttpServletRequest request,@RequestParam(name="file1") MultipartFile file,@RequestParam(name="file2") MultipartFile ocr , Model model) throws Exception {
		
		String ocrName = "";
		
		if (!file.isEmpty()) {
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);
			
			// System.out.println("target : "+ target);  <<<< upload 되는 절대경로 찾는 방법!!!
			model.addAttribute("savedName", savedName);
			starVO.setImg1(savedName);
		}
		
		if (!ocr.isEmpty()) {
			String savedName = ocr.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
			File target = new File(uploadPath + "/" + savedName);
			ocr.transferTo(target);
			
			System.out.println("target : "+ target); 
			
			model.addAttribute("savedName", savedName);
			starVO.setOcr(savedName);
			ocrName = savedName;
			
			// System.out.println(ocrName); 이름 잘 들어감 확인 완료
		}
		
		dao.insert(starVO);
		model.addAttribute("bag", starVO);
		// 컨트롤로의 vo변수명을 맨앞글자만 소문자로 바꾸어서 변수를 만들면,
		// 자동으로 모델의 속성으로 등록시켜줌.
		// model.addAttribute("movieVO", movieVO);
	}

	@RequestMapping("uploadForm") // 후기 사진 upload
	public void uploadForm(HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		String savedName = file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
		File target = new File(uploadPath + "/" + savedName);
		file.transferTo(target);
		model.addAttribute("savedName", savedName);
	}

	@RequestMapping("insertBill") // 영수증 사진 OCR 호출
	public void insertBill(String ocr) throws Exception {
		starService.insertBill(ocr);
	}	
}
