<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function calculateAverage() {
		var customerServiceRating = parseInt(document
				.getElementById("customer-service-rating").value);
		var treatmentExplanationRating = parseInt(document
				.getElementById("treatment-explanation-rating").value);
		var treatmentRating = parseInt(document
				.getElementById("treatment-rating").value);
		var facilityRating = parseInt(document
				.getElementById("facility-rating").value);
		var priceRating = parseInt(document.getElementById("price-rating").value);

		var averageRating = (customerServiceRating + treatmentExplanationRating
				+ treatmentRating + facilityRating + priceRating) / 5;

		document.getElementById("average-rating").innerText = averageRating
				.toFixed(1);
	}
</script>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="resources/css/star.css" />
</head>
<body>
	<!-- 고객응대, 설명, 진료, 시설, 가격 평가를 위한 입력폼 -->
	<form action="insertstar">
		<table class="table table-striped">
			<tr>
				<th colspan="3">리얼 리뷰 평가</th>
			</tr>
			<tr class="table-primary">
				<td><label for="customer-service-rating">친절</label></td>
				<td><label> 고객응대평가</label></td>
				<td><input type="range" id="customer-service-rating" name="treatment-explanation-rating" min="0" max="5" step="1"></td>
			</tr>
			<tr class="table-success">
				<td><label for="treatment-explanation-rating">설명</label></td>
				<td><label>진료 전 치료 및 가격 설명 평가</label></td>
				<td><input type="range" id="treatment-explanation-rating" name="treatment-explanation-rating" min="0" max="5" step="1"></td>
			</tr>
			<tr class="table-info">
				<td><label for="treatment-rating">진료</label></td>
				<td><label> 치료 후 완쾌 수준</label></td>
				<td><input type="range" id="treatment-rating" name="treatment-rating" min="0" max="5" step="1"></td>
			</tr>
			<tr class="table-warning">
				<td><label for="facility-rating">시설</label></td>
				<td><label>시설 및 장비 수준</label></td>
				<td><input type="range" id="facility-rating" name="facility-rating" min="0" max="5" step="1"></td>
			</tr>
			<tr class="table-active">
				<td><label for="price-rating">가격</label></td>
				<td><label> 진료비 수준</label></td>
				<td><input type="range" id="price-rating" name="price-rating" min="0" max="5" step="1"><br></td>
			</tr>
			<tr>
				<td colspan="2">평균 평점:</td>
				<td id="average-rating"></td>
			</tr>
		</table>
	<!-- 리뷰 내용 입력을 위한 입력폼 -->
		<h2>리뷰 내용</h2>
		<textarea id="review-content" name="review-content"></textarea>
	<!-- 리뷰 사진 등록을 위한 버튼 -->
	<button id="add-review-photo-button">리뷰 사진 추가</button>

	<!-- 영수증 사진 등록을 위한 버튼 -->
	<button id="add-receipt-photo-button">영수증 사진 추가</button>
	<button type="submit">서버로 전송</button>
</form>
</body>
</html>