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
				case "community" :
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
					break;
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
				case "hospital" :
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
</div>

<%
	}
%>

<div style="text-align: center;">
	<img src="resources/img/sample.png">
</div>

</body>
</html>

