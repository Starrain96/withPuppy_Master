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
			<li class="nav-item"><a href="selectAskList" class="nav-link link-secondary">1:1문의</a></li>
		</ul>
	</div>
	<hr color="red">
	<div id="insertFaqView">
		<hr color="red">
		<h4>FAQ 문의 작성</h4>
		<hr>
		FAQ 게시글 작성 완료
		<hr>
		<button type="button" onclick="location='selectFaqList'">FAQ 게시판 돌아가기</button>
	</div>

</body>
</html>