//user_id 기반 장바구니 데이터 가져오기
$(function bringCartData() {
    $.ajax({
        url : "cartPriceTotal",
        data : {
            user_id : user_id1
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
			var btnSen = `<button class="btn-custom" onClick="location.href='orderList?user_id=`+user_id1+`'">결제하기</button>`;
        	$('#cartTotal').append(btnSen);
        }
    })
})

//상품수량변경
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

//상품 삭제
function deleteBtn(id) {
	$.ajax({
        url : "deleteCart",
        data : {
            cart_id : id,
            user_id : user_id1
        },
        success : function(data) {
        	alert("삭제되었습니다.");
        	document.location.reload();
        }
	})
}

//상품 수량변경 db에 적용
function updateCnt(id, n){
	const resultElement = document.getElementById('resultCnt' + n);
	let number = resultElement.innerText;
	console.log("number : " + number);
	$.ajax({
        url : "updateCart",
        data : {
            product_id : id,
            product_cnt : number,
            user_id : user_id1
        },
        success : function(data) {
        	alert("수정되었습니다.");
        }
	})
}
