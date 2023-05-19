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
	
	<div id="updateFaqCompleteView">
		<h4>FAQ 수정</h4>
		<hr>
		FAQ 게시글 수정 완료
		<hr>
		<button type="button" onclick="location='selectFaqList'">FAQ 게시판 돌아가기</button>
	</div>

</body>
</html>