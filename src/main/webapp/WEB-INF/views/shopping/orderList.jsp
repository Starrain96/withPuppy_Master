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

.cart .content img {
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
	display : flex;
	justify-content: right;
	align-items:center;
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
	margin-left : 50px;
}

.buyBtn:hover {
	background: #FF8E00
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
					`<li class="cart">
					<div class="content">
						<img src= ` + data[i].product_img +
						` alt="image" />
						<div class="author">
							<div class="cartName">` + data[i].product_name+`
							</div>
							<div class="rating">수량 :
							`+data[i].product_cnt+`
							</div>
							<div class="rating">상품 가격 :`
							+data[i].product_price+
							`원</div>
						</div>
					</div>
				</li>`;
				$('#cart_list').append(sen);
			}
        	
			$('#cartTotal').append("상품금액 : " + total + "원");
			var btnSen = `<button class="buyBtn" onClick="location.href='PAGENAME.html'">결제하기</button>`;
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