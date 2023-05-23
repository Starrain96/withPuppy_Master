<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- header --%>
    <%@ include file="/header.jsp"%>
    <%-- header END --%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>회원가입 메인</title>
	  <style>
		/* 선택 박스 스타일 */
		.form-group {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  height: 85vh;
		}
		
		.box {
		  display: flex;
		  flex-direction: column;
		  justify-content: center;
		  align-items: center;
		  text-align: center;
		  width: 500px;
		  height: 500px;
		  font-size: 1.7rem;
		  font-weight: bold;
		  border-radius: 20px;
		  margin: 20px;
		  padding: 20px;
		  background-color: #ffffff;
		  border: 6px solid #dddddd;
		}
		
		.box:hover {
			border-color: #ffe98c;
			outline: none;
		}
		
		/* 가입 버튼 스타일 */
		button[type="submit"] {
			margin-top: 15px;
			padding: 10px 40px;
			border-radius: 30px;
			background-color: #ffe98c;
			color: #000000;
			font-size: 1.2rem;
			font-weight: bold;
			border: none;
			cursor: pointer;
		}
		
		p {
			font-size: 1.2rem;
			font-weight: normal;
		}
	  </style>
</head>
<!-- 펫오너, 펫병원/약국 선택 폼 -->
<form>
	<div class="form-group d-flex justify-content-center align-items-center">
		<div class="box pet-owner">
			<h2>🐶펫오너🐶</h2>
			<p style="margin-top: 20px;">펫서비스와 쇼핑몰, 커뮤니티를 즐겨보세요!</p>
			<form action="pet_owner_signup.jsp" method="post">
				<button type="submit">가입하기</button>
			</form>
		</div>
		<div class="box pet-pharmacy">
			<h2>🏥펫병원·약국🏥</h2>
			<p style="margin-top: 20px;">반려동물 건강을 도와주는 병원 또는 약국입니다!</p>
			<form action="pet_hospital_signup.jsp" method="post">
				<button type="submit">가입하기</button>
			</form>
		</div>
	</div>
</form>
</body>

</html>