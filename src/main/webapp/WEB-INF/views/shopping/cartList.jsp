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
<link rel="stylesheet" href="../resources/css/cart.css">
</head>
<script type="text/javascript">


$(function bringCartData() {
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
					<div>
					<input type='button' onclick='deleteBtn(`+data[i].cart_id+`)' value=' X '
						class="delBtn" />
					</div>
				<div class="d-flex">
					<img src= ` + data[i].product_img +
						` alt="image" />
					<div class="author ">
						<div class = "cartPTitle" onclick="location.href='productDetail?product_id=`+
							data[i].detail+`'">` +data[i].product_name+`
						</div>
						<div>
							<input type='button' onclick='count("minus", `+ i +`)' value=' - '
								class="cntRow cntBtn" />
							<div id='resultCnt`+ i +`' class="cntRow">`+data[i].product_cnt+`</div>
							<input type='button' onclick='count("plus", `+ i +`)' value=' + '
								class="cntRow cntBtn" />
							<button class = "upBtn" onclick="updateCnt(`+data[i].product_id+`,`+ i +`)">수정</button>
						</div>
						<div class="rating cntRow">상품 가격 :`
						+data[i].product_price+`원
						</div>
						<div class="rating cntRow">상품 총액 : `
							+data[i].product_price*data[i].product_cnt+
							`원</div>
					</div>
				</div>
				
			</li>`;
				$('#cart_list').append(sen);
			}
        	
			$('#cartTotal').append("상품금액 : " + total + "원");
			var btnSen = `<button class="btn-custom" onClick="location.href='orderList?user_id=${user_id}'">결제하기</button>`;
        	$('#cartTotal').append(btnSen);
        	
        }
    })
})

function count(type, nn) {
		const resultElement = document.getElementById('resultCnt' + nn);
		let number = resultElement.innerText;
		// 더하기/빼기
		if (type === 'plus') {
			number = parseInt(number) + 1;
		} else if (type === 'minus') {
			if (number > 1) {
				number = parseInt(number) - 1; 
			}
		}
		resultElement.innerText = number;
	}

function deleteBtn(id) {
	$.ajax({
        url : "deleteCart",
        data : {
            cart_id : id,
            user_id : "${user_id}"
        },
        success : function(data) {
        	alert("삭제되었습니다.");
        	document.location.reload();
        }
	})
}
	
function updateCnt(id, n){
	const resultElement = document.getElementById('resultCnt' + n);
	let number = resultElement.innerText;
	console.log("number : " + number);
	$.ajax({
        url : "updateCart",
        data : {
            product_id : id,
            product_cnt : number,
            user_id : "${user_id}"
        },
        success : function(data) {
        	alert("수정되었습니다.");
        }
	})
}
</script>
<body>

	<div class="cart-wrapper">
		<ul class="cart-list" id="cart_list">

		</ul>
		<div class="cartTotal" id="cartTotal"></div>
	</div>

	<!-- 
<div class="rating">수량 :
					`+data[i].product_cnt+`
					</div>

 -->
</body>
</html>