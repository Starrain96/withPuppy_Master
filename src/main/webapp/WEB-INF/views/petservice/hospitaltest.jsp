<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>사이트 이름</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9abec93832f88f2e23bb7d16acd54c05"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			success : function() {
				la = ${bag.latitude}
				lo = ${bag.longitude}

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(la, lo), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 마커가 표시될 위치입니다 
				var markerPosition = new kakao.maps.LatLng(la, lo);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					position : markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null);    
			} //success
		}) //ajax		
	})//$fun
</script>

<link rel="stylesheet" href="resources/css/index.css" />
</head>
<body>
	<header>
		<nav class="nav">
			<div class="site-name">강아지와</div>
			<div class="nav-buttons">
				<a href="#" class="button">병원</a> <a href="#" class="button">약국</a>
				<a href="#" class="button">산책가자</a> <a href="#" class="button">마이프로필</a>
			</div>
		</nav>
	</header>

	<section class="hospital-name" >🚑 ${bag.service_name}</section>

	<section class="map">
		<div id="map" style="width: 600px; height: 300px; margin: 0 auto;"></div>
	</section>
	<table style="margin: 0 auto;">
		<tr>
			<td>(${bag.zipcode}) ${bag.roadaddress}</td>
		</tr>
		<tr>
			<td>TEL ${bag.tel}</td>
		</tr>
	</table>
	<table style="margin: 0 auto;">
		<tr>
			<td>홈페이지</td>
			<td><a href="${bag.homepage}">${bag.homepage}</a></td>
			<td style="border-left: 1px solid black;">주차장</td>
			<td>${bag.parking}</td>
		</tr>
		<tr>
			<td>전문분야</td>
			<td>${bag.normalcategory}</td>
			<td style="border-left: 1px solid black;">휴무일</td>
			<td>${bag.dayoff}</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td style="border-left: 1px solid black;">운영시간</td>
			<td>${bag.operating}</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td style="border-left: 1px solid black;"></td>
			<td></td>
		</tr>
	</table>
	
		
	<button>후기작성하기</button>
</body>
</html>
