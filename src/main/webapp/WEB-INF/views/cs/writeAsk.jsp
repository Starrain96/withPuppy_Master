<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../header.jsp"%>
<%@ include file="askCSMenuHeader.jsp"%>
<%
    String userId = userVo.getUser_id(); //사용할 값 정의하는 부분
%>
<hr>
<div id="askWriteView">
	<h4>1:1문의 작성</h4>
	<form action="insertAsk" method="get">
		<table class="table">
			<tr>
				<td style="width: 100px">title :</td>
				<td><input name="ask_title" value=""></td>
			</tr>
			<tr>
				<td style="width: 100px">content :</td>
				<td><textarea cols="50" rows="10"
						style="width: 200px; height: 100px;" name="ask_content"></textarea></td>
			</tr>
			<tr>
				<td style="width: 100px">writer :</td>
				<td><input name="ask_writer" value="<%=userId%>" readonly></td>
			</tr>
		</table>
		<button type="submit">글쓰기 완료</button>
	</form>
</div>

</body>
</html>