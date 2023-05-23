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
	<div id="insertAskView">
		<hr color="red">
		<h4>1:1문의 작성</h4>
		<hr>
		1:1문의 게시글 작성 완료
		<hr>
		<button type="button" onclick="location='selectAskList'">1:1문의 게시판 돌아가기</button>
	</div>

</body>
</html>