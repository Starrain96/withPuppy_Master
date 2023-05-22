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
	
	
	
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
//댓글리스트 첫 호출
$(function start() {
	selectAnswer();
})

// 댓글리스트 호출 함수
function selectAnswer() {
	$('#replyAnswer').empty()
	$.ajax({
		url : "${pageContext.request.contextPath}/cs/selectAnswerOne",
		data : {
			ask_no : ${vo.ask_no}
		},
		success : function(x) {	
			$('#replyAnswer').append(x)
		}
	}) //ajax
}

//댓글 추가 후 리스트 호출 함수
$('#answerIn').click(function() {
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

</script>
</body>
</html>