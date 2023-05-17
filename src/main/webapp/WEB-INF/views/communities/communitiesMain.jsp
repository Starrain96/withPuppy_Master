<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>강아지와🐶</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
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
	</style>
</head>
<body>
<!-- 오른쪽 메뉴 리스트 -->
<div class="position-fixed top-50 end-0 translate-middle-y">
  <ul class="list-group">
    <li id = "b1" class="list-group-item list-group-item-action">수도권</li>
    <li  id = "b2" class="list-group-item list-group-item-action">지방</li>
    <li  id = "b3" class="list-group-item list-group-item-action">자유게시판</li>
  </ul>
</div>
	<div class="container">
		<a href="communitiesList" class="link">전체 게시물</a>
		<hr>
		<div id="result">
			<!-- 여기에 게시물 목록이 동적으로 추가됩니다. -->
		</div>
	</div>
	<!-- 스크립트 -->
	<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
	<script type="text/javascript">
		$(function() {
			$.ajax({
				url: "list2",
				success: function(x) {
					$("#result").append(x)
				}
			})
			$("#b1").click(function() {
				
			})
		})
	</script>
</body>
</html>
