<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-4">
			<a href="communities/communitiesMain">
				<p style="position: relative; top: 10px; text-align: center;">커뮤니티</p>
				<img src="resources/img/community.jpg" alt="커뮤니티" width="100%"
				height="70%">
			</a>
		</div>

		<div class="col-md-4">
			<a href="petservice/listhospital?category=동물병원">
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
	</div>
</div>

<div style="text-align: center;">
  <img src="resources/img/sample.png">
</div>


</body>
</html>