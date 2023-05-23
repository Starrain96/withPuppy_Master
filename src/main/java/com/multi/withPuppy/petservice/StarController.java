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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller // 스프링에서 제어하는 역활로 등록
@RequestMapping("petservice")
public class StarController {

	@Autowired
	StarDAO dao;

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
	public void insert(StarVO starVO, HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		if (!file.isEmpty()) {
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target);
			
			// System.out.println("target : "+ target);  <<<< upload 되는 절대경로 찾는 방법!!!
			model.addAttribute("savedName", savedName);
			starVO.setImg1(savedName);
		}
		dao.insert(starVO);
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

	
	@RequestMapping("insertBill") // 후기 사진 upload
	public void insertBill() throws Exception {
		
		System.out.println("영수증 OCR 실행");
		
		String apiURL = NaverVISIONAPI.OCR_URL;
		String secretKey = NaverVISIONAPI.SECRECT_KEY;
		// String imageFile = "alone1.jpeg";
		// String imageFile = "doc1.jpeg";
		String imageFile ="C:\\Users\\user\\Documents\\workspace-sts-3.9.14.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\withPuppy_Master\\resources\\upload\\hp_fee01.jpg";
		// String imageFile = HttpServletRequest.getServletContext().getRealPath("/resources/upload/hp_fee01.jpg")
		
		try {
			URL url = new URL(apiURL);
			// 연결설정
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);
			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();
			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			// long start = System.currentTimeMillis();
			File file = new File(imageFile);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
////////////////////////////////////////////////////////////////////////////////////////////////////
			System.out.println("json 확인 " + response);
			JSONParser parser = new JSONParser();
			org.json.simple.JSONObject jsonResult2 = (org.json.simple.JSONObject) parser.parse(response.toString());
			// System.out.println("1. " +jsonResult2);
			org.json.simple.JSONArray images2 = (org.json.simple.JSONArray) jsonResult2.get("images");
			// System.out.println("2. " +images2);
			org.json.simple.JSONObject images2One = (org.json.simple.JSONObject) images2.get(0);
			// System.out.println("3. " +images2One);
			org.json.simple.JSONObject receipt2 = (org.json.simple.JSONObject) images2One.get("receipt");
			// System.out.println("4. " +receipt2);
			org.json.simple.JSONObject result2 = (org.json.simple.JSONObject) receipt2.get("result");
			// System.out.println("5. " +result2);
			// 여기까진 공통 json 경로
			org.json.simple.JSONObject storeInfo2 = (org.json.simple.JSONObject) result2.get("storeInfo");
			// System.out.println("6-0. " +storeInfo2);
			// 영수증 UID
			String uid = (String) images2One.get("uid");

			// 사업자등록번호
			org.json.simple.JSONObject bizNum2 = (org.json.simple.JSONObject) storeInfo2.get("bizNum");
			String brn = (String) bizNum2.get("text");
			// System.out.println("6-1. " +bizNum2);
			// 병원명
			org.json.simple.JSONObject name2 = (org.json.simple.JSONObject) storeInfo2.get("name");
			String name = (String) name2.get("text");
			// System.out.println("6-2. " +name2);
			// 주소
			org.json.simple.JSONArray addresses2 = (org.json.simple.JSONArray) storeInfo2.get("addresses");
			org.json.simple.JSONObject addresses2One = (org.json.simple.JSONObject) addresses2.get(0);
			String addr = (String) addresses2One.get("text");
			// System.out.println("6-3. " +addresses2One);
			// 개별진료항목명 및 진료비 찾기 1
			org.json.simple.JSONArray subResults2 = (org.json.simple.JSONArray) result2.get("subResults");
			// System.out.println("7-0. " +subResults2);
			org.json.simple.JSONObject subResults2One = (org.json.simple.JSONObject) subResults2.get(0);
			// System.out.println("7-1. " +subResults2One);
			org.json.simple.JSONArray items2 = (org.json.simple.JSONArray) subResults2One.get("items");
			 ArrayList<String> dxList = new ArrayList<>();
	            ArrayList<Integer> feeList = new ArrayList<>();
	            String [][] ocrAll = new String[items2.size()][7]; //ocr data 이중 배열로 선언하는 부분
	            int totalFee = 0;
	            for (int i = 0; i < items2.size(); i++) {
	                org.json.simple.JSONObject items2One = (org.json.simple.JSONObject) items2.get(i);
	                org.json.simple.JSONObject name3 = (org.json.simple.JSONObject) items2One.get("name");
	                // System.out.println("8-1. " +name3);
	                org.json.simple.JSONObject price2 = (org.json.simple.JSONObject) items2One.get("price");
	                // System.out.println("8-2. " +price2);
	                org.json.simple.JSONObject price3 = (org.json.simple.JSONObject) price2.get("price");
	                // System.out.println("8-3. " +price3);
	                // 진료비 숫자 0-9을 제외한 문자는 공백으로 대체
	                String priceText1 = (String) price3.get("text");
	                String priceText2 = priceText1.replaceAll("[^0-9]", "");
	                String dxName = (String) name3.get("text");
	                int billFee = Integer.parseInt(priceText2);
	                totalFee += billFee;
	                String toFee = String.valueOf(totalFee);
	                dxList.add(dxName);
	                feeList.add(billFee);
	                
						ocrAll[i][0] = uid;
						ocrAll[i][1] = brn;
						ocrAll[i][2] = name;
						ocrAll[i][3] = addr;
						ocrAll[i][4] = toFee;
						ocrAll[i][5] = dxName;
						ocrAll[i][6] = priceText2;
	                
					// System.out.println(i+". 진료명 : " + dx_name + ", 개별진료비 : " + bill_fee);
				}
				System.out.println();
				System.out.println("UID : " + uid);
				System.out.println("사업자등록번호 : " + brn);
				System.out.println("병원명 : " + name);
				System.out.println("주소 : " + addr);
				System.out.println("총진료비 : " + totalFee);
				System.out.println("진료명 리스트>> " + dxList);
				System.out.println("진료비 리스트>> " + feeList);
				
				for (int i = 0; i < ocrAll.length-1; i++) {
					System.out.println(ocrAll[7][i]);
				}
				
				dao.insertOCR(ocrAll);
				
			} catch (Exception e) {
				System.out.println(e);
			}
	}

	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary)
			throws IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");
		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();
		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();
			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}
			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}
}
