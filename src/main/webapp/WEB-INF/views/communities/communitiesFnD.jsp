<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지와🐶</title>
<style type="text/css">
.body{
	background-color: #FFE98C
}
</style>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$('#b1').click(function() {
			$('#result').empty()
			$.ajax({
				url : "update",
				data : {
					commu_no : $("#no").val(),
					content : $("#content").val()
				},
				success : function(x) {
					alert("수정이 정상적으로 처리됐습니다!")
					document.location.reload() 
					$('#result').append(x)
				} //success
			}) //ajax
		})//b1
		$('#b2').click(function() {
			$('#result').empty()
			$.ajax({
				url : "delete",
				data : {
					commu_no : $("#delete").val()
				},
				success : function(x) {
					alert("삭제처리가 완료 됐습니다!")
					document.location.reload()
					$('#result').append(x)
				} //success
			}) //ajax
		})//b2
	})


</script>
</head>
<body>
<form>
수정할 번호 :<input id="no"><br>
수정할 내용 :<input id="content"><br>
</form>
<button id="b1" type="button" class="btn btn-secondary">수정하기📝</button>
<a href="communities/communitiesList">
<button type="button" class="btn btn-secondary">게시판목록📝</button>
</a>
<br>
<hr>
<h3>삭제할 게시물 번호를 입력해주세요</h3>
<input id="delete">
<button id="b2" type="button" class="btn btn-secondary">삭제하기📝</button>
<div id="result"></div>
</body>
</html>