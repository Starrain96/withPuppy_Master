<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.multi.withPuppy.user.UserVO"%>
<%
    UserVO userVo = (UserVO) session.getAttribute("bag");
    System.out.println("header bag : " + userVo);
%>
<%@ include file="serviceheader.jsp"%>
</head>
<body>
	<div class="search-top-container">
		<h3 class="title">동물병원·약국찾기</h3>
	</div>
	<div class="search-box-container">
		<div class="inner">
			<input type="text" placeholder="동물병원 검색">
		</div>
		<!-- <button type="button" class="search-button">검색</button> -->
	</div>
	<hr color=grey>

	<div id="map" style="width: 800px; height: 350px; margin: 0 auto;"></div>
	<hr color=grey>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9abec93832f88f2e23bb7d16acd54c05&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9abec93832f88f2e23bb7d16acd54c05"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//여기서부터 마커 이벤트 등록하기 위해 추가한 함수

		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
			<c:forEach var="bag" items="${list}">
			{content : '<div> ${bag.service_name} </div>',
			latlng : new kakao.maps.LatLng(${bag.latitude}, ${bag.longitude})},
			</c:forEach>
			{content : '<div>마무리</div>',
			latlng : new kakao.maps.LatLng(0, 0)}
		
		];
		
		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng
			// 마커의 위치
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content
			// 인포윈도우에 표시할 내용
			});

			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}

		//여기까지가 마커이벤트 코드입니다
		
		//클러스터리(군집마커) 코드 시작하는 곳입니다.
		
		//클러스터리(군집마커) 코드 끝나는 곳입니다.
		
		var arrDistance = []; // 병원이름, 주소, 주차가능여부, 거리를 포함하는 이중배열 선언하는 곳입니다. 외부에 선언 나중에 if문 밖에서 쓰려구
		
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도
				
				var locPosition = new kakao.maps.LatLng(lat, lon);// 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				var message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);
				
				//거리계산하는 함수
				
				function distance(lat1, lon1, lat2, lon2) {
  				const R = 6371;    // 지구 반지름 (단위: km)
				const dLat = deg2rad(lat2 - lat1);
 				const dLon = deg2rad(lon2 - lon1);
 				const a = Math.sin(dLat/2) * Math.sin(dLat/2) +
       				     Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
       				     Math.sin(dLon/2) * Math.sin(dLon/2);
  				const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  				const distance = R * c; // 두 지점 간의 거리 (단위: km)
 				 return distance;
				}
				
				function deg2rad(deg) {
					  return deg * (Math.PI/180);
					}
				
				var hpLat =0.0;
				var hpLon =0.0;
				var dist = 0.0;
				let name = "";
				let address = "";
				let park = "";
				
				//거리를 본인위치 기반 거리를 계산하여 이중 배열에 값을 넣는 시작부분입니다.
				
				let distString = "";
				let test =1.1;
				
				<c:forEach var="bag" items="${list}">
				hpLat = ${bag.latitude};
				hpLon = ${bag.longitude};
				name = '${bag.service_name}';
				address = '${bag.road_address}';
				park = '${bag.parking}';
				id = '${bag.service_id}'
				
				dist = distance(lat, lon, hpLat, hpLon);
				distString = dist.toFixed(1);
				
				arrDistance.push({id: id, name: name, address: address ,park: park, dist: distString})
				</c:forEach>
				
				var sortingField = "dist";
				
				arrDistance.sort(function(a, b) { 
					  return a[sortingField] - b[sortingField];  // 13, 21, 25, 44 
					});
				
				for(i=0; i<5; i++) {
					var id = arrDistance[i].id
					var tag =
						`<li class="list-group-item">
					<div class="d-flex justify-content-between align-items-center">
						<a href="hospital?service_id=`+ id +`">`+ arrDistance[i].name + ` </a>
					</div> <!-- 추가 정보 -->
					<div class="info-box">
						<div class="address">주소: `+ arrDistance[i].address + `</div>
						<div class="parking">주차 가능 여부: `+  arrDistance[i].park + `</div>
						<div class="distance">거리: `+ arrDistance[i].dist + `km</div>
					</div>
				</li>`
				
				$("#hpList").append(tag);
				}
				
				
			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {
			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
	</script>

	<!-- 메인 컨텐츠 -->
		<div class="card-center">
			<div class="card">
				<h5 class="card-header">근처 병원 5개 목록</h5>
				<div class="card-body">
					<!-- 프로필 정보 출력 -->
					<div class="row">
						<!-- 게시글 목록 -->
						<div class="col-sm-12">
							<ul class="list-group list-group-flush" id="hpList">
								<!-- 반복문으로 게시글 목록 출력 -->

							</ul>
						</div>
					</div>
				</div>
				<div class="card-footer text-muted text-end">강아지와🐶</div>
			</div>
			</div>
</body>
</html>