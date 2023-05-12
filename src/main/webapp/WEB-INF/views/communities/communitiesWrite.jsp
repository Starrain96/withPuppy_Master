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
	background-color: #FFE98C;
	margin-left: 15%;
	margin-right: 15%;
}
</style>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<body>
<form action="insert" method="get">
	<select>
	<option>자유게시판</option>
	<option>수도권</option>
	<option>지방</option>
	</select>
	title : <textarea name="title" cols="50px"></textarea>
	writer : <input name="commu_id" ><br>
	content : <br>
	<textarea name="content" rows="10px" cols="100px"></textarea><br>
<a href = "../communities/communitiesList"><button type="submit" class="btn btn-outline-secondary">글쓰기📝</button>
</a></form>
</body>
</html>