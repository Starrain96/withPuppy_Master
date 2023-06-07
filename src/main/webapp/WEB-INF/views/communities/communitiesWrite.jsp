<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 게시판</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
}

.container {
	padding: 50px 10%;
}

.card-header {
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	background-color: #ffe98c;
	color: #000;
	height: 70px;
}

.card-footer {
	background-color: #F5F5F5;
}

.title {
	text-align: center;
	font-size: 28px;
	margin: 30px 0;
}

.form-group {
	display: flex;
	flex-direction: column;
	margin-bottom: 1rem;
	margin-bottom: 20px;
}

.form-group label {
	font-weight: bold;
	margin-bottom: 0.5rem;
}

.form-group input[type="file"] {
	margin-top: 0.5rem;
	padding: 0.5rem;
	border: 1px solid #ccc;
	border-radius: 0.25rem;
}

.form-group input[type="file"]:hover, .form-group input[type="file"]:focus
	{
	border-color: #aaa;
	outline: none;
}

label {
	display: block;
	margin-bottom: 5px;
	font-size: 18px;
	font-weight: 600;
	color: #333;
	transition: color 0.3s;
}

input[type="text"], select, textarea {
	width: 100%;
	padding: 10px;
	border: 2px solid #ddd;
	border-radius: 8px;
	transition: border-color 0.3s;
	font-size: 18px;
	color: #333;
	box-sizing: border-box;
}

input[type="text"]:focus, select:focus, textarea:focus {
	border-color: #ffe98c;
}

textarea {
	height: 200px;
}

button[type="submit"] {
	padding: 12px 30px;
	border: none;
	border-radius: 8px;
	background-color: #60626C;
	color: #fff;
	font-size: 18px;
	font-weight: 600;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-top: 10px;
}

button[type="submit"]:hover {
	background-color: #ffe98c;
	color: #000;
}
</style>
</head>
<body>
	<div class="container">
		<div class="card">
			<h5 class="card-header">강아지 게시판 글쓰기</h5>
			<div class="card-body" style="display: flex; flex-direction: column;">
				<form action="../communities/insert" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="category">카테고리</label> <select id="category"
							name="category1">
							<option value="">선택하세요</option>
							<option value="1">자유게시판</option>
							<option value="2">수도권</option>
							<option value="3">지방</option>
						</select>
					</div>
					<div class="form-group">
						<label for="title">제목</label> <input type="text" id="title"
							name="commu_title" required>
					</div>
					<div class="form-group">
						<label for="writer">작성자</label> <input type="text" id="writer"
							name="commu_id" required>
					</div>
					<div class="form-group">
						<label for="image">이미지</label> <input type="file" id="image"
							name="file">
					</div>
					<div class="form-group">
						<label for="content">내용</label>
						<textarea id="content" name="commu_content" required></textarea>
					</div>
					<div class="form-group">
						<label for="view">조회수(미구현)</label>
						<textarea id="view" name="commu_view" required >1</textarea>
					</div>
					<div style="display: flex; justify-content: flex-end;">
						<button id = "b10" type="submit">작성</button>
					</div>
				</form>
			</div>
			<div class="card-footer text-muted text-end">강아지와🐶</div>
		</div>
	</div>
<!-- 스크립트 -->
	<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
	<script type="text/javascript">
	</script>
</body>
</html>