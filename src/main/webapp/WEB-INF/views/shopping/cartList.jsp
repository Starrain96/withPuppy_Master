<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../shoppingHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style type="text/css">
body {
	margin-left: 15%;
	margin-right: 15%;
}

.cart-wrapper {
	width: 80%;
	margin: 20px auto;
	padding: 20px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	border-radius: 10px;
}

.cart-list {
	list-style: none;
	margin: 0;
	padding: 0;
}

.cart {
	margin-top: 10px;
	margin-bottom: 20px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.cart .author {
	margin-bottom: 10px;
}

.cart .cartName {
	font-weight: bold;
}

.cart .content {
	display: flex;
	align-items: center;
}

img {
	margin: 10px;
	max-width: 100px;
	max-height: 100px;
	object-fit: cover;
	border-radius: 5px;
}

.rating {
	font-size: 13px;
}

.cartTotal {
	display: flex;
	justify-content: right;
	align-items: center;
}

.author {
	margin-left : 20px;
}

.cartPTitle {
	font-size : 20px;
	font-weight : 600;
}

.buyBtn {
	display: block;
	position: relative;
	float: left;
	width: 120px;
	padding: 0;
	margin: 10px 20px 10px 0;
	font-weight: 600;
	text-align: center;
	line-height: 50px;
	color: #FFF;
	border: none;
	border-radius: 5px;
	transition: all 0.2s;
	background: #FFAA40;
	margin-left: 50px;
}

.buyBtn:hover {
	background: #FF8E00
}

/* new design */
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.container-fluid {
	padding: 50px 10%;
}

.card-header {
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	background-color: #ffe98c;
	color: #000;
	height: 70px;
}

.card-footer {
	background-color: #F5F5F5;
}

.list-group-item {
	margin-bottom: 0.75rem !important;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
	font-size: 1.2em;
	padding-top: 1.2rem !important;
	padding-bottom: 1.2rem !important;
}

.list-group-item2 {
	margin-bottom: 0.75rem !important;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
	font-size: 0.95em;
}

.list-group-item .list-group-item2 .info-label {
	display: inline-block;
	width: 100px;
	font-weight: bold;
	margin-right: 1rem;
}

.list-group-item .list-group-item2 .info-value {
	display: inline-block;
	margin-right: 2rem;
}

.list-group-item:hover, .list-group-item2:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
}

.list-group-item a, .list-group-item2 a {
	color: #333;
	text-decoration: none;
	display: block;
	padding: 0.5rem;
}

.list-group-item a:hover, .list-group-item2 a:hover {
	color: #555;
}

.list-group-item:before, .list-group-item:after, .list-group-item2:before,
	.list-group-item2:after {
	content: "";
	position: absolute;
	width: 5px;
	height: 100%;
	left: 0;
	background-color: #ffe98c;
	transform: translateY(-100%);
	transition: transform 0.3s ease;
}

.list-group-item:before, .list-group-item2:before {
	top: 0;
}

.list-group-item:after, .list-group-item2:after {
	bottom: 0;
	transform: translateY(100%);
}

.list-group-item:hover:before, .list-group-item:hover:after,
	.list-group-item2:hover:before, .list-group-item2:hover:after {
	transform: translateY(0);
}

.info-label {
	display: inline-block;
	width: 100px;
	font-weight: bold;
}

.info-value {
	display: inline-block;
}

.btn-custom {
	margin-left: 20px;
	color: white;
	background-color: #60626C;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	border: none;
	padding: 0.5rem;
	padding-left: 1.0rem;
	padding-right: 1.0rem;
}

.btn-custom:hover {
	background-color: #ffe98c;
	color: black;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<script type="text/javascript">
$(function starListLoader() {
    $.ajax({
        url : "cartPriceTotal",
        data : {
            user_id : "${user_id}"
        },
        success : function(data) {
        	$('#cart_list').empty();
        	var total = 0;
        	for (i = 0; i < data.length; i++) {
        		total += data[i].product_cnt * data[i].product_price;
				var sen = 
					`<li class="list-group-item">
				<div class="d-flex align-items-center">
				<img src= ` + data[i].product_img +
					` alt="image" />
				<div class="author">
				<div class = "cartPTitle">` +data[i].product_name+`</div>
					<div class="rating">수량 :
					`+data[i].product_cnt+`
					</div>
					<div class="rating">상품 가격 :`
					+data[i].product_price+
					`원</div>
				</div>
				</div>
			</li>
				
				`;
				$('#cart_list').append(sen);
			}
        	
			$('#cartTotal').append("상품금액 : " + total + "원");
			var btnSen = `<button class="btn-custom">결제하기</button>`;
        	$('#cartTotal').append(btnSen);
        	
        }
    })
})
</script>
<body>

	<div class="cart-wrapper">
		<ul class="cart-list" id="cart_list">

		</ul>
		<div class="cartTotal" id="cartTotal"></div>
	</div>

</body>
</html>