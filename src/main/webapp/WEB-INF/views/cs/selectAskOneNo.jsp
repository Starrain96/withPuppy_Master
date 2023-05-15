<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지와</title>

<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	margin-right: 5%;
	margin-left: 5%;
}

.con1 {
	margin-right: 5%;
	float: right;
	width: 300px;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		//리스트 불러오는 함수
		function selectAnswer() {
			$('#replyAnswer').empty()
			$.ajax({
				url : "${pageContext.request.contextPath}/cs/selectAnswerOne",
				data : {
					ask_no : ${vo.ask_no},
				},
				success : function(x) {	
					$('#replyAnswer').append(x)
				}
			}) //ajax
		}
		
		selectAnswer();
		
		$('#answerIn').click(function() {
			
			//기존의 것 삭제됨!
			$.ajax({
				url : "${pageContext.request.contextPath}/cs/insertAnswer",
				data : {
					ask_no : ${vo.ask_no},
					ans_content : $('#ans_content').val(),
					ans_writer : $('#ans_writer').val()
				},
				success : function(x) {
					selectAnswer();
				} //success
			}) // ajax
		}) //answerInsert
		
	}) //$function
</script>

</head>
<body>

	<header
		class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
		<a href="main.jsp"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
			<svg class="bi me-2" width="40" height="32">
					<use xlink:href="#bootstrap"></use>
			</svg> <span class="fs-4" style="color: black; font-weight: bold">강아지와</span>
		</a>

		<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
			<input type="search" class="form-control" placeholder="Search..."
				aria-label="Search">
		</form>


		<ul class="nav nav-pills">
			<!-- <li class="nav-item"><a href="#" class="nav-link active"
                aria-current="page">Home</a></li> -->
			<li class="nav-item"><a href="#" class="nav-link link-secondary">커뮤니티</a></li>
			<li class="nav-item"><a href="shoppingList" class="nav-link link-secondary">쇼핑몰</a></li>
			<li class="nav-item"><a href="listhospital?category=동물병원" class="nav-link link-secondary">반려동물서비스</a></li>
			<li class="nav-item"><a href="selectFaqList" class="nav-link link-secondary">고객센터</a></li>
			<li class="nav-item"><a href="#" class="nav-link link-secondary">유기견
					신고</a></li>


		</ul>
	</header>

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
	<div id="askOneNoView">
		<h4>1:1 문의</h4>
		<hr>
		<table class="table">
			<thead class="table-primary">
				<tr>
					<th colspan="2">${vo.ask_title}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 200px">${vo.ask_writer}</td>
					<td><fmt:formatDate value="${vo.ask_date}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
				<tr>
					<td style="white-space: pre;" colspan="2">${vo.ask_content}</td>
				</tr>
			</tbody>
		</table>

		<button type="button" onclick="location='writeAsk'">글쓰기</button>
		<button type="button"
			onclick="location='updateAskNo?Ask_no=${vo.ask_no}'" method="get">수정</button>
		<button type="button"
			onclick="location='deleteAsk?Ask_no=${vo.ask_no}'" method="get">삭제</button>
	</div>

	<hr>
	<div>
		<h5>댓글</h5>
		<div id="replyAnswer"></div>
		<table class="table">
			<thead class="table-primary">
				<tr>
					<th style="width: 65px;">writer</th>
					<th style="width: 300px;">content</th>
					<th style="width: 200px;"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input id="ans_writer"
						value="admin" style="width: 65px;"></td>
					<td style="width: 300px;"><textarea cols="50" rows="2"
							id="ans_content">답변댓글내용</textarea></td>
					<td style="width: 200px;"><button id="answerIn">댓글달기</button></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>