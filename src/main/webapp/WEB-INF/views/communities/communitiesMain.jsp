<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>강아지와🐶</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

th {
	background-color: #3aa4c1;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

a:link, a:visited {
	color: #3aa4c1;
	text-decoration: none;
}

a:hover, a:active {
	color: #1e80a3;
	text-decoration: underline;
}

.top {
	background-color: #f1f1f1;
	font-weight: bold;
}

.down {
	border-bottom: 1px solid #ddd;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding-top: 50px;
	padding-bottom: 50px;
}

.card-container {
	margin-bottom: 25px;
	padding: 20px;
	background-color: #fff;
	border-radius: 4px;
	box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.2);
	transition: box-shadow 200ms linear;
}

.card-container:hover {
	box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.3);
}

.card-title {
	font-size: 24px;
	font-weight: bold;
	margin-top: 0;
	margin-bottom: 15px;
}

.card-text {
	margin-bottom: 15px;
	font-size: 16px;
	line-height: 1.5;
}

.btn {
	background-color: #000;
	color: #fff;
	padding: 6px 16px;
	font-size: 16px;
	border: none;
	border-radius: 4px;
	transition: background-color 200ms linear;
}

.btn:hover {
	background-color: #222;
}

.link {
	color: #000;
	text-decoration: none;
	transition: color 200ms linear, text-decoration 200ms linear;
}

.link:hover {
	color: #000;
	text-decoration: underline;
}

.pages {
	display: inline-block;
	margin: 5px;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	text-align: center;
	cursor: pointer;
	background-color: white;
	color: #3aa4c1;
	font-size: 16px;
	font-weight: bold;
	transition: background-color 200ms linear, color 200ms linear;
}

.pages:hover {
	background-color: #3aa4c1;
	color: white;
}
</style>
</head>
<body>
	<div class="container">
		<a href="communitiesList?page=1" class="link">전체 게시물</a>
		<hr>
		<div id="result">
			<!-- 여기에 게시물 목록이 동적으로 추가됩니다. -->
			<table>
				<tr>
					<td class="top">번호</td>
		 			<td class="top">제목</td>
					<td class="top">작성일</td>
					<td class="top">글쓴이</td>
					<td class="top">조회수</td>
				</tr>

				<c:forEach items="${list}" var="vo">

					<tr>
						<td class="down">${vo.commu_no}</td>
						<td class="down"><a href="one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
						<td class="down">${vo.commu_date}</td>
						<td class="down">${vo.commu_id}</td>
						<td class="down">${vo.commu_view}</td>
					</tr>

				</c:forEach>
			</table>
		</div>
	</div>
	<div class="container">
		<a href="communitiesList?page=1" class="link">수도권</a>
		<hr>
		<div id="result">
			<!-- 여기에 게시물 목록이 동적으로 추가됩니다. -->
			<table>
				<tr>
					<td class="top">번호</td>
		 			<td class="top">제목</td>
					<td class="top">작성일</td>
					<td class="top">글쓴이</td>
					<td class="top">조회수</td>
				</tr>

				<c:forEach items="${list}" var="vo">

					<tr>
						<td class="down">${vo.commu_no}</td>
						<td class="down"><a href="one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
						<td class="down">${vo.commu_date}</td>
						<td class="down">${vo.commu_id}</td>
						<td class="down">${vo.commu_view}</td>
					</tr>

				</c:forEach>
			</table>
		</div>
	</div>
	<div class="container">
		<a href="communitiesList?page=1" class="link">지방</a>
		<hr>
		<div id="result">
			<!-- 여기에 게시물 목록이 동적으로 추가됩니다. -->
			<table>
				<tr>
					<td class="top">번호</td>
		 			<td class="top">제목</td>
					<td class="top">작성일</td>
					<td class="top">글쓴이</td>
					<td class="top">조회수</td>
				</tr>

				<c:forEach items="${list}" var="vo">

					<tr>
						<td class="down">${vo.commu_no}</td>
						<td class="down"><a href="one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
						<td class="down">${vo.commu_date}</td>
						<td class="down">${vo.commu_id}</td>
						<td class="down">${vo.commu_view}</td>
					</tr>

				</c:forEach>
			</table>
		</div>
	</div>
	<div class="container">
		<a href="communitiesList?page=1" class="link">자유게시판</a>
		<hr>
		<div id="result">
			<!-- 여기에 게시물 목록이 동적으로 추가됩니다. -->
			<table>
				<tr>
					<td class="top">번호</td>
		 			<td class="top">제목</td>
					<td class="top">작성일</td>
					<td class="top">글쓴이</td>
					<td class="top">조회수</td>
				</tr>

				<c:forEach items="${list}" var="vo">

					<tr>
						<td class="down">${vo.commu_no}</td>
						<td class="down"><a href="one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
						<td class="down">${vo.commu_date}</td>
						<td class="down">${vo.commu_id}</td>
						<td class="down">${vo.commu_view}</td>
					</tr>

				</c:forEach>
			</table>
		</div>
	</div>
	<!-- 스크립트 -->
	<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.pages').click(function() {
				$.ajax({
					url : "list",
					data : {
						page : $(this).text()
					},
					success : function(x) {
						$("#result").html(x)
					},
					error : function() {
						alert("nope")
					}
				})
			})
		})
	</script>
</body>
</html>
