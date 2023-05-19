<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../../header.jsp"%>
	
	<div>
		<h3>고객센터</h3>
		<hr color="red">
		<ul class="nav nav-pills">
			<li class="nav-item"><a href="selectFaqList"
				class="nav-link link-secondary">FAQ</a></li>
			<li class="nav-item"><a href="selectAskList" class="nav-link active">1:1문의</a></li>
		</ul>
	</div>
	<hr color="red">
	<div id="askWriteView">
		<h4>1:1문의 작성</h4>
		<form action="insertAsk" method="get">
			<table class="table">
				<tr>
					<td style="width: 100px">title :</td>
					<td><input name="ask_title" value="문의 제목 추가 테스트1"></td>
				</tr>
				<tr>
					<td style="width: 100px">content :</td>
					<td><textarea cols="50" rows="10"
							style="width: 200px; height: 100px;" name="ask_content">문의 내용 추가 테스트1</textarea></td>
				</tr>
				<tr>
					<td style="width: 100px">writer :</td>
					<td><input name="ask_writer" value="apple"></td>
				</tr>
			</table>
			<button type="submit">글쓰기 완료</button>
		</form>
	</div>

</body>
</html>