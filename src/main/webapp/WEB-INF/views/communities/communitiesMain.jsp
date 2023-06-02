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
body {
	font-family: 'Noto Sans KR', sans-serif;
}

.container {
	max-width: 1500px;
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

.top {
	background-color: #f1f1f1;
	font-weight: bold;
}

.down {
	border-bottom: 1px solid #ddd;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="card-container">
					<a href="communitiesList?page=1" class="link">전체 게시물</a>
					<hr>
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>글쓴이</th>
							<th>조회수</th>
						</tr>
						<c:forEach items="${list}" var="vo">
							<tr>
								<td>${vo.commu_no}</td>
								<td><a href="one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
								<td>${vo.commu_date}</td>
								<td>${vo.commu_id}</td>
								<td>${vo.commu_view}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card-container">
					<a href="communitiesList?page=1" class="link">수도권</a>
					<hr>
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>글쓴이</th>
							<th>조회수</th>
						</tr>
						<c:forEach items="${Metrolist_category}" var="vo">
							<tr>
								<td>${vo.commu_no}</td>
								<td><a href="one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
								<td>${vo.commu_date}</td>
								<td>${vo.commu_id}</td>
								<td>${vo.commu_view}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="card-container">
					<a href="communitiesList?page=1" class="link">자유게시판</a>
					<hr>
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>글쓴이</th>
							<th>조회수</th>
						</tr>
						<c:forEach items="${Freelist_category}" var="vo">
							<tr>
								<td>${vo.commu_no}</td>
								<td><a href="one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
								<td>${vo.commu_date}</td>
								<td>${vo.commu_id}</td>
								<td>${vo.commu_view}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card-container">
					<a href="communitiesList?page=1" class="link">지방</a>
					<hr>
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>글쓴이</th>
							<th>조회수</th>
						</tr>
						<c:forEach items="${Vincelist_category}" var="vo">
							<tr>
								<td>${vo.commu_no}</td>
								<td><a href="one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
								<td>${vo.commu_date}</td>
								<td>${vo.commu_id}</td>
								<td>${vo.commu_view}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>

