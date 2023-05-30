<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../shoppingHeader.jsp"%>
<%
String user_id = null;
if(userVo != null){
	user_id = userVo.getUser_id();
}
%>
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
<link rel="stylesheet" href="../resources/css/productDetail.css">
<script src="../resources/js/productDetail.js"></script> 
<script type="text/javascript">

//장바구니에 추가
function addToCart(product_id, user_id) {
	if(user_id == "null"){
		alert("로그인하세요!");
		location.href="../user/loginPage";
	}else{
	const element = document.getElementById('resultCnt');
	$.ajax({
		url : "addCart",
		data : {
			product_id : product_id,
			product_cnt : element.innerText,
			user_id : user_id
		},
		success : function(data) {
			alert("상품이 장바구니에 담겼습니다");
		},
		error : function(){
			alert("에러");
		}
	})//ajax
	}
}
</script>
</head>
<body>
	<div class="content">

		<!-- 메인 - 제품 사진, 이름, 가격, 구매 등 -->
		<div class="row" style="margin-top: 5%; margin-bottom: 10px">
			<div class="col-sm-4" style="width: 500px;">
				<img alt="" src="${bag.product_img}" style="width: 400px; margin-right: 20px;">
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
							onclick="addToCart(${bag.product_id},'<%=user_id%>')">장바구니 담기</button>
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

</body>
</html>