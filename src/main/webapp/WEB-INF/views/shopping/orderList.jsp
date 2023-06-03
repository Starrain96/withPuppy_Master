<%-- 결제확인 페이지 (checkout.jsp) --%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.multi.withPuppy.shopping.Order_detailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../header.jsp"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 확인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/css/order.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>

<style>
body {
	margin-right: 15%;
	margin-left: 15%;
}
</style>

<script type="text/javascript">
let price_total = 0
let order_count = 0

var productTmp;
// cartlist 호출
$(function bringCartData() {
    $.ajax({
        url : "cartPriceTotal",
        data : {
            user_id : "${bag.user_id}",
        },
        success : function(data) {
        	
        	$('#cart_list').empty();
        	var total = 0;
        	productTmp = data;
        	for (i = 0; i < data.length; i++) {
        		
        		total += data[i].product_cnt * data[i].product_price;
				var sen = 
					`<li class="list-group-item">
				<div class="d-flex  align-items-center">
					<img class="img1" src= ` + data[i].product_img +
						` alt="image" />
					<div class="author ">
					<div class="cartPTitle">` +data[i].product_name+`</div>
							<div class="rating cntRow">상품 가격 :`
							+data[i].product_price+`원
							<div id='resultCnt`+ i +`' class="cntRow">갯수: `+data[i].product_cnt+`개</div>
							</div>
							<div class="rating cntRow">상품 총액 : `
								+data[i].product_price*data[i].product_cnt+
								`원</div>
							</div>
							</div>
							
							</li>`;
							$('#cart_list').append(sen);
						}
        	$('#cartTotal').append("총 결제금액 : " + total + "원");
        	price_total= total;
        	order_count= data.length;
        }
    })
})

 function showAdress(user_addr1){
			$(".addressInfo_input_div").css('display', 'none');
			$(".addressInfo_input_div_" + user_addr1).css('display', 'block');		
		
				$(".address_btn").css('backgroundColor', '#555');
				$(".address_btn_"+ user_addr1).css('backgroundColor', '#3c3838');	
	}
  
	
//주소 검색
  function execution_daum_address(){
		console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기
              var addr = ''; // 주소 변수
              var extraAddr = ''; // 참고항목 변수

              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져옴
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else { // 사용자가 지번 주소를 선택했을 경우
                  addr = data.jibunAddress;
              }

              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
              if(data.userSelectedType === 'R'){
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if(extraAddr !== ''){
                      extraAddr = ' (' + extraAddr + ')';
                  }
               	// 추가해야할 코드
                  // 주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;
              
              } else {
              	addr += ' ';
              }

           	// 제거해야할 코드
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              $(".address1_input").val(data.zonecode);
              $(".address2_input").val(addr);				
              // 커서를 상세주소 필드로 이동한다.
              $(".address3_input").attr("readonly", false);
              $(".address3_input").focus();	 
	            
	            
	        }
	    }).open();  	
}  

//주문 요청 (order, order_detail 테이블에 데이터 입력) 
$(function() {
	  $('#cash').click(function(){
		  var receiver_name =$('#receiver_name').val();
		  var receiver_phone =$('#tel1').val() + $('#tel2').val() + $('#tel3').val();
		  var receiver_id =$('#receiver_id').val();
		  var addr1 =$('#addr1').val();
		  var addr2 =$('#addr2').val();
		  var addr3 =$('#addr3').val();
		  var total_price =$('#total_price').val();
	    $.ajax({
	    	type: 'POST',
	        url:'insertOr',
	        data : {
	        	user_id : "apple",
	        	receiver_name: receiver_name,
	        	receiver_phone: receiver_phone,
	        	receiver_id: receiver_id,
	        	addr1: addr1,
	        	addr2: addr2,
	        	addr3: addr3,
	        	total_price: price_total
	        	
	        },
	    success : function(x) {
	    	console.log(productTmp);
			alert("주문이 입력되었습니다. 결제 창으로 이동합니다.")
			
			$('#result').append(x)
			  
			$.ajax({
			    	type: 'POST',
			        url:'insertDe',
			        traditional: true,
			        data : {productTmp : JSON.stringify(productTmp)},
				    success : function(x) {
				    	
			  		} 	 
			    })
		} //success
	}) //ajax
}) //click
	  
	    
}) //function

$(function() {
	$('#cash').click(function() {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp85518144'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		IMP.request_pay({
			pg : 'kakaopay', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트',
			amount : price_total,
			buyer_email : '이메일',
			buyer_name : '이름',
			buyer_tel : '전화번호',
			buyer_addr : '주소',
			buyer_postcode : '전화번호',
			m_redirect_url : 'www.yourdomain.com/payments/complete'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				alert(msg)
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg)
			}
		});

	})
})


	
</script>
<body>
	<div class="container-fluid">
		<div class="card">
			<div class="card-header">
				<h2>주문 확인 페이지</h2>
			</div>
			<div class="cutting_line">
				<span class="ico_scissors"></span> <span class="shdw_left"></span> <span
					class="shdw_right"></span>
			</div>
			<table class="cart-list" id="cart_list"></table>


			<table class="table">
				<thead>
					<tr>
						<th scope="col">배송지 정보</th>
					</tr>
				</thead>
			</table>

			<div class="content_main">
				<!-- 회원 정보 -->
				<div class="member_info_div">
					<table class="table_text_align_center memberInfo_table">
						<tbody>
							<tr>
								<td style="width: *">주문자 ID : ${bag.user_id}</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- 배송지 정보 -->
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<div class="address_btn address_btn_1"
							style="background-color: #3c3838;">배송지 입력</div>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1"
							style="display: block">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>수령인</th>
										<td><input class="addressee_input" id="receiver_name"
											value="${bag.user_name}"></td>
										<td>※필수 입력란 입니다.</td>
									</tr>
									<tr>
										<th>수령인 연락처</th>
										<td><input type="text" id="tel1"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
											maxlength="3" style="width: 67px; height: 45px;"> <span
											class="hypen">-</span> <input type="text" id="tel2"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
											maxlength="4" style="width: 67px; height: 45px;"> <span
											class="hypen">-</span> <input type="text" id="tel3"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
											maxlength="4" style="width: 67px; height: 45px;"></td>
									</tr>
									<tr>
										<th>배송지명</th>
										<td><input class="addressee_input" id="receiver_id"></td>
									</tr>
									<tr>
										<th>주소</th>
										<td><input class="address1_input" readonly="readonly"
											id="addr1"> <a class="address_search_btn"
											onclick="execution_daum_address()">주소 찾기</a><br> <input
											class="address2_input" readonly="readonly" id="addr2"><br>
											<input class="address3_input" readonly="readonly" id="addr3"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6"></div>
			<div class="cartTotal" id="cartTotal"></div>
			<button type="submit" class="btn-custom" id="cash">결제하기</button>
		</div>
	</div>

	<input name="order_status" value="complete" type="hidden"
		id="order_status">
	<input name="refundCheck_YN" value="Y" type="hidden"
		id="refundCheck_YN">
</body>
</html>