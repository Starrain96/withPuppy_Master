<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강아지와🐶</title>
	<style type="text/css">
		/* 전체 body의 스타일 */
		body {
			background-color: #f5f5f5;
			font-family: Arial, sans-serif;
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
			font-size: 16px;
			margin-right: 5px;
			outline: none;
		}
		select {
			background-color: #fff;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
			background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 9l6 6 6-6"/></svg>');
			background-repeat: no-repeat;
			background-position: calc(100% - 8px) 10px;
			padding-right: 25px;
		}
		input[type="text"] {
			flex-grow: 1;
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
			background-color: #333;
			border: 2px solid #333;
			color: #fff;
			padding: 5px 20px;
			border-radius: 4px;
			font-size: 18px;
			cursor: pointer;
			transition: background-color 0.2s;
		}
		.btn-write:hover {
			background-color: #222;
			border-color: #222;
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
			</div>
	
	<!-- 스크립트 -->
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
</body>
</html>
