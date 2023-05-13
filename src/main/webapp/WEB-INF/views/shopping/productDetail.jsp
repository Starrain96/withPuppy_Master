<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file = "../../../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bag.product_name}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>

body{
	margin-left : 15%;
	margin-right : 15%;
}

.productName{
	font-weight : bold;
	margin-top : 20px;
}
</style>

</head>
<body>

	<div class = "content">
	
		<!-- 메인 - 제품 사진, 이름, 가격, 구매 등 -->
		<div class="row" style = "margin-top : 5%; margin-bottom : 10px">
			<div class="col-sm-4" style = "width : 500px;">
				<img alt="" src="${bag.product_img}"
					style="width: 400px; margin-right: 20px;">
			</div>
			<div class = "col-sm-8" style = "width : 600px">
				<h4 class = "productName">${bag.product_name} </h4><br>
				<h5>가격 : ${bag.product_price}원 </h5><br><br>
				
				
				
				<!-- 구매관련 버튼 -->
				<div class = "row" style="float:right" >
					<div class = "col-6 instance_Class" style = "left-margin : 50%">
						<button type="button" class="button_colored" style = "width : 150px; margin-right : 10px">장바구니 담기</button>
					</div>
					<div class = "col-6">
						<button type="button" class="button_colored">구매하기</button>
					</div>
				</div>
			</div>
		</div>
		
		<hr style = "margin : 40px auto">
		<h5 style = "font-weight : bold">설명</h5>
		<div style = "margin : 10px">${detail}</div>
		
	</div>
</body>
</html>