package com.multi.withPuppy.communities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(ReplyVO vo) {
		int result = my.insert("reply.create",vo);
		return result;
	}
	
	public int update(ReplyVO vo) {
		int result = my.update("reply.up",vo);
		return result;
	}
	
	public int delete(int reply_no) {
		int result = my.delete("reply.del", reply_no);
		return result;
	}
	
	public ArrayList<ReplyVO> list() {
		ResultSet rs = null; // 항목명 + 결과 데이터를 담고 있는 테이블

		// 가방들 넣어줄 큰 컨테이너 역할을 부품이 필요!
		// ArrayList<MemberVO> ==> MemberVO만 들어간 arraylist라는 의미
		ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();

		ReplyVO bag = null;
		try {
			// 1.오라클 11g와 연결한 부품 설정
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("1.mySQL과 자바 연결할 부품 설정 성공.");
			Locale.setDefault(Locale.US); // 맥 locale에러나신 분들만!!!

			// 2.오라클 11g에 연결해보자.(java --- oracle)
			// String url = "jdbc:mysql://localhost:3306/multi";
			String url = "jdbc:mysql://localhost:3306/withpuppy?serverTimezone=UTC";
			String user = "root";
			String password = "1234";
			Connection con = DriverManager.getConnection(url, user, password); // Connection
			// String data = JOptionPane.showInputDialog("이름입력"); //String, 임아무개
			System.out.println("2. mySQL 연결 성공.");
			// 컨트롤 + 쉬프트 + f : 코드 자동 정리!

			String sql = "select * from reply";
			
			PreparedStatement ps = con.prepareStatement(sql); // PreparedStatement
			// 삭제!!!! ps.setString(1, id);
			System.out.println("3. SQL문 부품(객체)으로 만들어주기 성공.");

			rs = ps.executeQuery(); // select문 전송시
			System.out.println("4. SQL문 오라클로 보내기 성공.");
			while (rs.next()) { // 검색결과가 있는지 여부는 rs.next()
				// true이면 있다라는 의미, false이면 없다라는 의미
				// 1. 검색결과가 있으면,
				// System.out.println("검색결과 있음. 성공.");
				String id = rs.getString(1); // writer
				int no2 = rs.getInt(2); // no
				String title = rs.getString(3); // title
				String content = rs.getString(4); // content
				System.out.println(no2 + " " + title + " " + content + " " + id);
				// 검색결과를 검색화면 UI부분을 주어야 함.
				bag = new ReplyVO();
				
				// 4. list에 bag을 추가해주자.
				list.add(bag);
			}
			// System.out.println(result);
			ps.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// return id, pw, name, tel은 XXXXX!
		// return 뒤에는 반드시 여러 데이터를 묶어서 리턴해주어야 함.
		// 검색결과가 있을 때는 bag에 데이터가 들어있음.
		// 검색결과가 없을 때는 bag에 무엇이 들어있나? null
		return list;

	}
	
}
