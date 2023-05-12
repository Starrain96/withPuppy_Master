<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.review-form {
	margin-bottom: 20px;
}

.form-group {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.form-group label {
	margin-right: 10px;
	font-weight: bold;
}

.form-group input[type="range"] {
	width: 200px;
	margin-right: 10px;
}

#average-rating {
	display: inline-block;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: gray;
	text-align: center;
	line-height: 40px;
	font-weight: bold;
	font-size: 18px;
	color: white;
	margin-left: 10px;
}

div {
	border: 1px solid black;
	padding: 10px;
	margin-bottom: 10px;
}

textarea {
	width: 100%;
	height: 150px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-bottom: 20px;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	margin-right: 10px;
}

button:hover {
	background-color: #45a049;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	font-size: 1.2em;
}

label {
	display: inline-block;
	width: 150px;
	font-weight: bold;
	margin-right: 10px;
}

#average-rating {
	display: inline-block;
	width: 50px;
	font-weight: bold;
	margin-left: 10px;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #f2f2f2;
	border-radius: 5px;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

button[type="submit"] {
	margin-top: 10px;
	align-self: flex-end;
}


textarea {
  width: 100%;
  height: 150px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-bottom: 20px;
}

</style>
</head>
<body>
	<form action="insertStar" method="post">
	<input id="service_id" name="service_id" value="${bag.service_id}">
	<input id="id" name="id" value="${bag.id}">
		<div class="review-form">
			<h2>리얼 리뷰 평가</h2>
			<div class="form-group">
				<label for="customer-service-rating">친절</label> <label>고객응대평가</label>
				<input type="range"
					name="kind" min="0" max="5" step="1">
			</div>
			<div class="form-group">
				<label for="treatment-explanation-rating">설명</label> <label>진료
					전 치료 및 가격 설명 평가</label> <input type="range"
					name="explain" min="0" max="5" step="1">
			</div>
			<div class="form-group">
				<label for="treatment-rating">진료</label> <label>치료 후 완쾌 수준</label> <input
					type="range" name="treat" min="0"
					max="5" step="1">
			</div>
			<div class="form-group">
				<label for="facility-rating">시설</label> <label>시설 및 장비 수준</label> <input
					type="range"  name="facilities" min="0"
					max="5" step="1">
			</div>
			<div class="form-group">
				<label for="price-rating">가격</label> <label>진료비 수준</label> <input
					type="range"  name="price" min="0" max="5"
					step="1">
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

		<button type="submit">서버로 전송</button>
	</form>
</body>
</html>