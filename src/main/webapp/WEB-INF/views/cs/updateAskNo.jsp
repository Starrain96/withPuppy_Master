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
			<li class="nav-item"><a href="selectAskList"
				class="nav-link active">1:1문의</a></li>
		</ul>
	</div>
	
	<hr color="red">
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
					<td><input name="ask_writer" value="${vo.ask_writer}"></td>
				</tr>
			</table>
			<button type="submit">수정 완료</button>
		</form> 
	</div>

</body>
</html>