<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../shoppingHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bag.product_name}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<style>
body {
	margin-left: 15%;
	margin-right: 15%;
}

.productName {
	font-weight: bold;
	margin-top: 20px;
}

.cntRow {
	display: inline-block;
	margin: 2px;
}

.button_colored {
	background-color: #ffe98c;
	border: none;
	border-radius: 10px;
	margin-right: 50px;
	padding: 10px;
	font-size: 15px;
}

.button_colored:hover {
	background-color: #fad94d;
}
</style>


<script type="text/javascript">
	function count(type) {
		// 결과를 표시할 element
		const resultElement = document.getElementById('resultCnt');

		// 현재 화면에 표시된 값
		let number = resultElement.innerText;

		// 더하기/빼기
		if (type === 'plus') {
			number = parseInt(number) + 1;
		} else if (type === 'minus') {
			if (number > 1) {
				number = parseInt(number) - 1;
			}
		}

		// 결과 출력
		resultElement.innerText = number;
	}
	
	function addToCart(product_id, user_id) {
		const element = document.getElementById('resultCnt');
		$.ajax({
			url : "addCart",
			data : {
				product_id : product_id,
				product_cnt : element.innerText,
				user_id : user_id
			},
			success : function(data) {
				alert("성공!");
			},
			error : function(){
				alert("에러");
			}
		})//ajax
	}
</script>

</head>
<body>

	<div class="content">

		<!-- 메인 - 제품 사진, 이름, 가격, 구매 등 -->
		<div class="row" style="margin-top: 5%; margin-bottom: 10px">
			<div class="col-sm-4" style="width: 500px;">
				<img alt="" src="${bag.product_img}"
					style="width: 400px; margin-right: 20px;">
			</div>
			<div class="col-sm-8" style="width: 600px">
				<h4 class="productName">${bag.product_name}</h4>
				<br>
				<h5>가격 : ${bag.product_price}원</h5>
				<br> <br> 
				<input type='button' onclick='count("minus")' value=' - '
					class="cntRow b1" />
				<div id='resultCnt' class="cntRow">1</div>
				<input type='button' onclick='count("plus")'
					value=' + ' class="cntRow b1" />
				

				<!-- 구매관련 버튼 -->
				<div class="row" style="float: right">
					<div class="col-6 instance_Class" style="left-margin: 50%">
						<button type="button" class="button_colored"
							style="width: 150px; margin-right: 10px"
							onclick="addToCart(${bag.product_id},'apple')">장바구니 담기</button>
					</div>
					<div class="col-6">
						<button type="button" class="button_colored" id="modal_btn">구매하기</button>
					</div>
				</div>

			</div>
		</div>

		<hr style="margin: 40px auto">
		<h5 style="font-weight: bold">설명</h5>
		<div style="margin: 10px">${detail}</div>
	</div>

<!-- 	<div module="Product_BasketAdd">
		@css(/css/module/product/basketAdd.css)
		<h1>장바구니 담기</h1>
		<div class="content">
			<p>장바구니에 상품이 정상적으로 담겼습니다.</p>
		</div>
		<div class="btnArea center">
			<a href="/order/basket.html?delvtype={$delvtype}"><img
				src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_go_basket.gif"
				alt="장바구니 이동" /></a> <a href="#none"
				onclick="$('#confirmLayer').hide();"><img
				src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_continue_shopping.gif"
				alt="쇼핑계속하기" complete="complete" /></a>
		</div>
		<div class="close">
			<a onclick="$('#confirmLayer').hide();"><img
				src="http://img.echosting.cafe24.com/skin/base_ko_KR/common/btn_close.png"
				alt="닫기" /></a>
		</div>
	</div> -->

</body>
</html>