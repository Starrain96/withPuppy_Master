<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../header.jsp"%>

	<div>
		<h3>고객센터</h3>
		<hr color="red">
		<ul class="nav nav-pills">
			<li class="nav-item"><a href="selectFaqList"
				class="nav-link active">FAQ</a></li>
			<li class="nav-item"><a href="selectAskList"
				class="nav-link link-secondary">1:1문의</a></li>
		</ul>
	</div>
	<hr color="red">
	<div id="faqWriteView">
		<h4>FAQ 문의 작성</h4>
		<form action="insertFaq" method="get">
			<table class="table">
				<tr>
					<td style="width: 100px">category :</td>
					<td><select name="faq_category">
							<option value="회원">회원</option>
							<option value="커뮤니티">커뮤니티</option>
							<option value="쇼핑몰">쇼핑몰</option>
							<option value="반려동물서비스">반려동물서비스</option>
							<option value="유기동물신고">유기동물신고</option>
					</select></td>
				</tr>
				<tr>
					<td style="width: 100px">title :</td>
					<td><input name="faq_title" value="FAQ 제목 추가 테스트1"></td>
				</tr>
				<tr>
					<td style="width: 100px">content :</td>
					<td><textarea cols="50" rows="10"
							style="width: 200px; height: 100px;" name="faq_content">FAQ 내용 추가 테스트1</textarea></td>
				</tr>
				<tr>
					<td style="width: 100px">writer :</td>
					<td><input name="faq_writer" value="admin"></td>
				</tr>
			</table>
			<button type="submit">글쓰기 완료</button>
		</form>
	</div>

</body>
</html>