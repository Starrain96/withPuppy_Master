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
<link rel="stylesheet" href="../resources/css/star.css" />
</head>
<script type="text/javascript">
function insertStar() {
	/* 	$('#submit').click(function() { */
				console.log("clicked");
	            $.ajax({
	            	type: 'POST',
	            	url: "insertStar",
	            	data : {
	            		service_id : ${bag.service_id},
	    				id : '${bag.id}',
	    				kind : $('#kind').val(),
	    				explain : $('#explain').val(),
	    				treat : $('#treat').val(),
	    				facilities : $('#facilities').val(),
	    				price : $('#price').val(),
	    				content : $('#content').val()
	    			},
	                success: function (data) {
	                    alert("후기 작성 완료!");
	                    window.close();
	                },
	                error: function () {
	                	 alert("실패");
	                }//error
		})//ajax
	/* })//fun */
}//fun insertStar
</script>
<body>
	<form id="form" method="post">
		<input id="service_id" name="service_id" value="${bag.service_id}">
		<input id="id" name="id" value="${bag.id}">
		<div class="review-form">
			<h2>리얼 리뷰 평가</h2>
			<div class="form-group">
				<label for="customer-service-rating">친절</label> <label>고객응대평가</label>
				<input type="range" id="kind" name="kind" min="0" max="5" step="1">
			</div>
			<div class="form-group">
				<label for="treatment-explanation-rating">설명</label> <label>진료
					전 치료 및 가격 설명 평가</label> <input type="range" id="explain" name="explain" min="0" max="5"
					step="1">
			</div>
			<div class="form-group">
				<label for="treatment-rating">진료</label> <label>치료 후 완쾌 수준</label> <input
					type="range" id="treat" name="treat" min="0" max="5" step="1">
			</div>
			<div class="form-group">
				<label for="facility-rating">시설</label> <label>시설 및 장비 수준</label> <input
					type="range" id="facilities" name="facilities" min="0" max="5" step="1">
			</div>
			<div class="form-group">
				<label for="price-rating">가격</label> <label>진료비 수준</label> <input
					type="range" id="price" name="price" min="0" max="5" step="1">
			</div>
		</div>

		<div class="review-form">
			<h2>리뷰 내용</h2>
			<textarea id="content" name="content"></textarea>
		</div>

		<div class="review-buttons">
			<button id="img" name="img">리뷰 사진 추가</button>
			<button id="ocr" name="ocr">영수증 사진 추가</button>
		</div>
	</form>
	<button type="submit" id="submit" onclick="insertStar();">서버로 전송</button>
</body>
</html>