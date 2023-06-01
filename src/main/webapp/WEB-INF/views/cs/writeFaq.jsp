<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../header.jsp"%>
<%@ include file="faqCSMenuHeader.jsp"%>
<%
    String userId = userVo.getUser_id(); //사용할 값 정의하는 부분
%>

<hr>
<div id="faqWriteView">
	<h4>FAQ 작성</h4>
	<form action="insertFaq" method="get">
		<table class="table">
			<tr>
				<td style="width: 100px">category :</td>
				<td><select name="faq_category">
						<option value="회원정보">회원정보</option>
						<option value="커뮤니티">커뮤니티</option>
						<option value="쇼핑몰">쇼핑몰</option>
						<option value="동물병원">동물병원</option>
				</select></td>
			</tr>
			<tr>
				<td style="width: 100px">title :</td>
				<td><input name="faq_title" value=""></td>
			</tr>
			<tr>
				<td style="width: 100px">content :</td>
				<td><textarea cols="50" rows="10"
						style="width: 200px; height: 100px;" name="faq_content"></textarea></td>
			</tr>
			<tr>
				<td style="width: 100px">writer :</td>
				<td><input name="faq_writer" value="<%=userId%>" readonly></td>
			</tr>
		</table>
		<button type="submit">글쓰기 완료</button>
	</form>
</div>

</body>
</html>