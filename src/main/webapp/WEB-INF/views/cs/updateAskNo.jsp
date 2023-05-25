<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../header.jsp"%>
<%@ include file="askCSMenuHeader.jsp"%>
<%
    String userId = userVo.getUser_id(); //사용할 값 정의하는 부분
%>
<hr>
<div id="updateAskView">
	<h4>1:1문의 수정</h4>
	<form action="updateAsk" method="get">
		<input type="hidden" name="ask_no" value="${vo.ask_no}">
		<table class="table">
			<tr>
				<td style="width: 100px">title :</td>
				<td><input name="ask_title" value="${vo.ask_title}"></td>
			</tr>
			<tr>
				<td style="width: 100px">content :</td>
				<td><textarea cols="50" rows="10"
						style="width: 200px; height: 100px;" name="ask_content">${vo.ask_content}</textarea></td>
			</tr>
			<tr>
				<td style="width: 100px">writer :</td>
				<td><input name="ask_writer" value="<%= userId %>" readonly></td>
			</tr>
		</table>
		<button type="submit">수정 완료</button>
	</form>
</div>

</body>
</html>