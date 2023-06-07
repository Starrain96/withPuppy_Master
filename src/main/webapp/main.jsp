<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="container">
	<div class="row">

		<%
		String user_id = null;
		String user_interest = null;
		if (userVo != null) {
			user_id = userVo.getUser_id();
			user_interest = userVo.getUser_interest();
			if (user_interest != null) { // 유저 선호 페이지를 가입시 선택했으면
				switch (user_interest) { // 유저 선호 페이지에 따른 배너 정렬
				case "shopping" :
				%>
				<div class="col-md-4">
					<a href="shopping/shoppingList?start=1&end=4&start_num=1&end_num=12">
						<p style="position: relative; top: 10px; text-align: center;">쇼핑몰</p>
						<img src="resources/img/shop.jpg" alt="쇼핑몰" width="100%"
						height="70%">
					</a>
				</div>
		
				<div class="col-md-4">
					<a href="petservice/listhospital">
						<p style="position: relative; top: 10px; text-align: center;">동물병원</p>
						<img src="resources/img/hospital.jpg" alt="동물병원" width="100%"
						height="70%">
					</a>
				</div>
		
				<div class="col-md-4">
					<a href="communities/communitiesMain?page=1">
						<p style="position: relative; top: 10px; text-align: center;">커뮤니티</p>
						<img src="resources/img/community.jpg" alt="커뮤니티" width="100%"
						height="70%">
					</a>
				</div>
				<%
				break;
				
				case "pet-service" :
				%>
				<div class="col-md-4">
					<a href="petservice/listhospital">
						<p style="position: relative; top: 10px; text-align: center;">동물병원</p>
						<img src="resources/img/hospital.jpg" alt="동물병원" width="100%"
						height="70%">
					</a>
				</div>
		
				<div class="col-md-4">
					<a href="shopping/shoppingList?start=1&end=4&start_num=1&end_num=12">
						<p style="position: relative; top: 10px; text-align: center;">쇼핑몰</p>
						<img src="resources/img/shop.jpg" alt="쇼핑몰" width="100%"
						height="70%">
					</a>
				</div>
			
			
				<div class="col-md-4">
					<a href="communities/communitiesMain?page=1">
						<p style="position: relative; top: 10px; text-align: center;">커뮤니티</p>
						<img src="resources/img/community.jpg" alt="커뮤니티" width="100%"
						height="70%">
					</a>
				</div>
				<%
				break;
				
				default :
				%>
				<div class="col-md-4">
					<a href="communities/communitiesMain?page=1">
						<p style="position: relative; top: 10px; text-align: center;">커뮤니티</p>
						<img src="resources/img/community.jpg" alt="커뮤니티" width="100%"
						height="70%">
					</a>
				</div>
		
				<div class="col-md-4">
					<a href="shopping/shoppingList?start=1&end=4&start_num=1&end_num=12">
						<p style="position: relative; top: 10px; text-align: center;">쇼핑몰</p>
						<img src="resources/img/shop.jpg" alt="쇼핑몰" width="100%"
						height="70%">
					</a>
				</div>
		
				<div class="col-md-4">
					<a href="petservice/listhospital">
						<p style="position: relative; top: 10px; text-align: center;">동물병원</p>
						<img src="resources/img/hospital.jpg" alt="동물병원" width="100%"
						height="70%">
					</a>
				</div>	
				<%
				}
			}
		} else {
		%>

		<div class="col-md-4">
			<a href="communities/communitiesMain?page=1">
				<p style="position: relative; top: 10px; text-align: center;">커뮤니티</p>
				<img src="resources/img/community.jpg" alt="커뮤니티" width="100%"
				height="70%">
			</a>
		</div>

		<div class="col-md-4">
			<a href="shopping/shoppingList?start=1&end=4&start_num=1&end_num=12">
				<p style="position: relative; top: 10px; text-align: center;">쇼핑몰</p>
				<img src="resources/img/shop.jpg" alt="쇼핑몰" width="100%"
				height="70%">
			</a>
		</div>

		<div class="col-md-4">
			<a href="petservice/listhospital">
				<p style="position: relative; top: 10px; text-align: center;">동물병원</p>
				<img src="resources/img/hospital.jpg" alt="동물병원" width="100%"
				height="70%">
			</a>
		</div>
	</div>


<%
	}
%>
	<hr>
	<div class="row">
		<div id="top5Title" class="col-md-6">
		<a href="${pageContext.request.contextPath}/communities/communitiesMain?page=1" class="btn" style="background-color: #FFE98C !important;">최근 게시물</a>
		<br>
		<br>
		<div id="mainTop5">
		
		</div>
		</div>
		<div id="faqTitle" class="col-md-6" class="border border-4">
		<a href="${pageContext.request.contextPath}/cs/selectFaqList" class="btn" style="background-color: #FFE98C !important;">자주묻는질문</a>
		<br>
		<br>
		<div id="mainFaq">
		
		</div>
		</div>
	</div>
</div>	

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
// 메인 게시판 리스트 첫 호출
$(function start() {
	selectMainTop5();
	selectMainFaq();
})

// 커뮤니티 top5 호출 함수
function selectMainTop5() {
	$('#mainTop5').empty()
	$.ajax({
		url : "${pageContext.request.contextPath}/main/mainTop5",
		success : function(x) {	
			$('#mainTop5').append(x)
		}
	}) //ajax
}

// faq top5 호출 함수
function selectMainFaq() {
	$('#mainFaq').empty()
	$.ajax({
		url : "${pageContext.request.contextPath}/main/mainFaq",
		success : function(x) {	
			$('#mainFaq').append(x)
		}
	}) //ajax
}

</script>

</body>
</html>

