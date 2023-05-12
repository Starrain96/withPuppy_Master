<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지와🐶</title>
<style type="text/css">
#result {
	flex-direction: column;
	align-items: center;
	background : #ffe98c;
}
.body{
	margin-left: 15%;
	margin-right: 15%;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "list2",
			success: function(x) {
				$('#result').append(x)
			}
		})
	})

</script>
</head>
<body>
<form action="freeList" method="post">
<div class="search">
<select>
	<option>제목</option>
	<option>내용</option>
	<option>작성자</option>
	<option>제목+내용</option>
</select>
<input type="text">
<button type="button" class="btn btn-outline-secondary">검색</button>
</div>
</form>
<form action="one2.multi" method="get">
no : <input name="no" value="30"><br>
	<button type="submit">서버로 전송</button>
</form>
<a href = "../communities/communitiesWrite">
<button type="button" class="btn btn-outline-secondary">글쓰기📝</button></a>
<a href = "../communities/communitiesFnD">
<button type="submit" class="btn btn-outline-secondary">수정/삭제 페이지📝</button></a>
<div id="result" style="background: white">
</div>
</body>
</html>