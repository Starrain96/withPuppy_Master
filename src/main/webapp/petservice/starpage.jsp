<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="../resources/css/star.css" />
</head>
<script type="text/javascript">
$(function insertStar() {
	$.ajax({
		success: function() {
			
			var tag = `
			<form action="insertStar" method="post">
			<input id="service_id" name="service_id" value="${bag.service_id}">
			<input id="id" name="id" value="${bag.id}">
			<div class="review-form">
				<h2>리얼 리뷰 평가</h2>
				<div class="form-group">
					<label for="customer-service-rating">친절</label> <label>고객응대평가</label>
					<input type="range" name="kind" min="0" max="5" step="1">
				</div>
				<div class="form-group">
					<label for="treatment-explanation-rating">설명</label> <label>진료
						전 치료 및 가격 설명 평가</label> <input type="range" name="explain" min="0" max="5"
						step="1">
				</div>
				<div class="form-group">
					<label for="treatment-rating">진료</label> <label>치료 후 완쾌 수준</label> <input
						type="range" name="treat" min="0" max="5" step="1">
				</div>
				<div class="form-group">
					<label for="facility-rating">시설</label> <label>시설 및 장비 수준</label> <input
						type="range" name="facilities" min="0" max="5" step="1">
				</div>
				<div class="form-group">
					<label for="price-rating">가격</label> <label>진료비 수준</label> <input
						type="range" name="price" min="0" max="5" step="1">
				</div>
			</div>

			<div class="review-form">
				<h2>리뷰 내용</h2>
				<textarea id="content" name="content"></textarea>
			</div>

			<div class="review-buttons">
				<button id="img" name="img">리뷰 사진 추가</button><input type="file" name="file" ><br>
				<button id="ocr" name="ocr">영수증 사진 추가</button>
			</div>

			<button type="submit">서버로 전송</button>
		</form>`
		
				$('#insertStar').append(tag);
		}	
	})//ajax
})//fun insertStar
</script>
<body>
	<div id="insertStar"></div>
</body>
</html>