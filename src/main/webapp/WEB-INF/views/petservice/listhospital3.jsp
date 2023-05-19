<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="serviceheader.jsp"%>
</head>
<body>
	<p style="margin-top: -12px">
		<b>본인 위치 기반 주변 동물병원 5개의 리스트를 뽑아오고 모든 동물병원 마커 표시</b>
	</p>
	<div id="map" style="width: 800px; height: 350px;"></div>
	<hr color=grey>
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
		
		const arrDistance = []; // 병원이름, 주소, 주차가능여부, 거리를 포함하는 이중배열 선언하는 곳입니다. 외부에 선언 나중에 if문 밖에서 쓰려구
		
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
				
				
				//거리를 본인위치 기반 거리를 계산하여 이중 배열에 값을 넣는 시작부분입니다.
				<c:forEach var="bag" items="${list}">
				var lat2 = ${bag.latitude},
				lon2 = ${bag.longitude};
				function getDistanceFromLatLonInKm(lat,lon,lat2,lon2) {
    				function deg2rad(deg) {
     				   return deg * (Math.PI/180)
   					 }

   					 var R = 6371; // Radius of the earth in km
   					 var dLat = deg2rad(lat2-lat1);  // deg2rad below
   					 var dLon = deg2rad(lo2-lon1);
   					 var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
    			     var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
   					 var d = R * c; // Distance in km
   					 
   					arrDistance.push([${bag.service_name}, ${bag.road_address}, ${bag.parking}, d]);
					}
				</c:forEach>
				
				
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
	<div class="col-lg-9 col-md-8 col-sm-12">
		<div class="card">
			<h5 class="card-header">병원 목록</h5>
			<div class="card-body">
				<!-- 프로필 정보 출력 -->
				<div class="row">
					<!-- 게시글 목록 -->
					<div class="col-sm-12">
						<ul class="list-group list-group-flush">
							<!-- 반복문으로 게시글 목록 출력 -->
							<c:forEach var="bag" items="${list}">
								<li class="list-group-item">
									<div class="d-flex justify-content-between align-items-center">
										<a href="hospital?service_id=${bag.service_id}">${bag.service_name},
											${bag.service_id}</a>
									</div> <!-- 추가 정보 -->
									<div class="info-box">
										<div class="address">주소: ${bag.road_address}</div>
										<div class="parking">주차 가능 여부: ${bag.parking}</div>
										<div class="distance">거리: 2km</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted text-end">강아지와🐶</div>
		</div>
	</div>
</body>
</html>