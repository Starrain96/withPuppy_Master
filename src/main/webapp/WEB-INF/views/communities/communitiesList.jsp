<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강아지와🐶</title>
<style type="text/css">

	table{
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

	tr:nth-child(even){
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

	.top{
		background-color: #f1f1f1;
		font-weight: bold;
	}

	.down{
		border-bottom: 1px solid #ddd;
	}

	/* 전체 body의 스타일 */
	body {
		font-family: 'Noto Sans KR', sans-serif;
	}
	/* 검색 폼의 스타일 */
	.search {
		display: flex;
		flex-direction: row;
		padding: 25px;
		align-items: center;
		justify-content: center;
		border-top: 1px solid #ccc;
		background-color: #fff;
	}
	/* 검색 폼 내부 요소의 스타일 */
	select,
	input[type="text"] {
		height: 40px;
		border: 2px solid #ccc;
		border-radius: 4px;
		padding: 5px;
		margin-right: 5px;
		font-size: 16px;
		background-color: #fdf5e6;
		outline: none;
	}

	select {
		background-color: #fdf5e6;
		background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9l6 6 6-6"/></svg>');
		background-repeat: no-repeat;
		background-position: calc(100% - 8px) 10px;
		padding-right: 25px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}

	select:focus {
		border-color: #fba60b;
	}

	input[type="text"] {
		flex-grow: 1;
		background-color: #fdf5e6;
		outline: none;
	}

	input[type="text"]:focus {
		border-color: #fba60b;
	}

	/* 검색 버튼의 스타일 */
	.btn-search {
		background-color: #fba60b;
		border: 2px solid #fba60b;
		color: #fff;
		padding: 5px 20px;
		border-radius: 4px;
		font-size: 18px;
		cursor: pointer;
		transition: background-color 0.2s;
		margin-right: 5px;
	}

	.btn-search:hover {
		background-color: #e7a00d;
		border-color: #e7a00d;
	}

	/* 글쓰기 버튼의 스타일 */
	.btn-write {
		background-color: #fba60b;
		border: 2px solid #fba60b;
		color: #fff;
		padding: 5px 20px;
		border-radius: 4px;
		font-size: 18px;
		cursor: pointer;
		transition: background-color 0.2s;
		margin-right: 5px;
	}

	.btn-write:hover {
		background-color: #e7a00d;
		border-color: #e7a00d;
	}

	/* 컨테이너의 스타일 */
	.container {
		max-width: 800px;
		margin: 0 auto;
		padding-top: 50px;
		padding-bottom: 50px;
		background-color: #fff;
		border: 2px solid #ccc;
		box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.2);
		text-align: center;
	}

	/* 타이틀의 스타일 */
	h1 {
		font-size: 36px;
		font-weight: bold;
		margin-top: 0;
		margin-bottom: 25px;
		color: #fba60b;
	}

	/* 서브 타이틀의 스타일 */
	h2 {
		font-size: 24px;
		font-weight: bold;
		margin-top: 0;
		margin-bottom: 25px;
		color: #333;
	}

	/* 게시물 제목의 스타일 */
	.post-title {
		font-size: 24px;
		font-weight: bold;
		margin-top: 0;
		margin-bottom: 10px;
		color: #333;
	}

	/* 게시물 내용의 스타일 */
	.post-content {
		font-size: 16px;
		line-height: 1.5;
		margin-bottom: 15px;
	}

	/* 게시물 작성자의 스타일 */
	.post-writer {
		color: #333;
		position: absolute;
		top: 10px;
		right: 10px;
		font-size: 16px;
		font-weight: bold;
	}

	/* 게시물 날짜의 스타일 */
	.post-date {
		color: #333;
		position: absolute;
		bottom: 10px;
		left: 10px;
		font-size: 16px;
	}
</style>

</head>
<body>
<!-- 검색 폼 -->
	<div class="search">
		<select>
			<option>제목</option>
			<option>내용</option>
			<option>작성자</option>
			<option>제목+내용</option>
		</select>
		<input type="text">
		<button type="button" class="btn-search">검색</button>
		<a href="../communities/communitiesWrite"><button type="button" class="btn-write">글쓰기📝</button></a>
	</div>
		
<!-- 여기에 게시물 목록이 동적으로 추가됩니다. -->
	<div id="result">
		<table>
		<tr>
			<td class="top">번호</td>
			<td class="top">제목</td>
			<td class="top">글쓴이</td>
			<td class="top">작성일</td>
			<td class="top">조회수</td>
		</tr>

		<c:forEach items="${list}" var="vo">

			<tr>
				<td class="down">${vo.commu_no}</td>
				<td class="down"><a href = "one?commu_no=${vo.commu_no}">${vo.commu_title}</a></td>
				<td class="down">${vo.commu_date}</td>
				<td class="down">${vo.commu_id}</td>
				<td class="down">${vo.commu_view}</td>
			</tr>

		</c:forEach>
		</table>
	</div>
	<%
	int pages = (int)request.getAttribute("pages");
    for (int p = 1; p <= pages; p++) {
%>	
	
		<button class ="pages"><%= p %></button>
	
<%
	}
%>
	<!-- 스크립트 -->
	<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
	<script type="text/javascript">
	$(function() {
		$('.pages').click(function() {
			$.ajax({
				url: "list",
				data : {
					page : $(this).text()
				},
				success: function(x) {
					$("#result").html(x)
				},
				error: function() {
					alert("nope")
				}
		})		
	})
})
	</script>
</body>
</html>
