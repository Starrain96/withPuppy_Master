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
	<hr color = grey>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9abec93832f88f2e23bb7d16acd54c05&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9abec93832f88f2e23bb7d16acd54c05"></script>
	<script>
	var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
	MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
	OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
	OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
	OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
	OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
	OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
	OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
	SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
	SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
	SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
	SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

	var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
	markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
	overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH,
			OVER_MARKER_HEIGHT), // 오버 마커의 크기
	overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
	spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

	var positions = [];
	var selectedMarker = null; // 클릭한 마커를 담을 변수
	
	
	//[ new kakao.maps.LatLng(33.44975, 126.56967),
	//new kakao.maps.LatLng(33.450579, 126.56956),
	//new kakao.maps.LatLng(33.4506468, 126.5707) ]

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도 위에 마커를 표시합니다
	for (var i = 0, len = positions.length; i < len; i++) {
		var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
		originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
		overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
		normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
		clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
		overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표

		// 마커를 생성하고 지도위에 표시합니다
		addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
	}

	// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
	function addMarker(position, normalOrigin, overOrigin, clickOrigin) {

		// 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
		var normalImage = createMarkerImage(markerSize, markerOffset,
				normalOrigin), overImage = createMarkerImage(
				overMarkerSize, overMarkerOffset, overOrigin), clickImage = createMarkerImage(
				markerSize, markerOffset, clickOrigin);

		// 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : position,
			image : normalImage
		});

		// 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
		marker.normalImage = normalImage;

		// 마커에 mouseover 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseover', function() {

			// 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
			// 마커의 이미지를 오버 이미지로 변경합니다
			if (!selectedMarker || selectedMarker !== marker) {
				marker.setImage(overImage);
			}
		});

		// 마커에 mouseout 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseout', function() {

			// 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
			// 마커의 이미지를 기본 이미지로 변경합니다
			if (!selectedMarker || selectedMarker !== marker) {
				marker.setImage(normalImage);
			}
		});

		// 마커에 click 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {

			// 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
			// 마커의 이미지를 클릭 이미지로 변경합니다
			if (!selectedMarker || selectedMarker !== marker) {

				// 클릭된 마커 객체가 null이 아니면
				// 클릭된 마커의 이미지를 기본 이미지로 변경하고
				!!selectedMarker
						&& selectedMarker
								.setImage(selectedMarker.normalImage);

				// 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
				marker.setImage(clickImage);
			}

			// 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
			selectedMarker = marker;
		});
	}

	// MakrerImage 객체를 생성하여 반환하는 함수입니다
	function createMarkerImage(markerSize, offset, spriteOrigin) {
		var markerImage = new kakao.maps.MarkerImage(SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
		markerSize, // 마커의 크기
		{
			offset : offset, // 마커 이미지에서의 기준 좌표
			spriteOrigin : spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
			spriteSize : spriteImageSize
		// 스프라이트 이미지의 크기
		});

		return markerImage;
	}

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
                                    <a href="hospital?service_id=${bag.service_id}">${bag.service_name}, ${bag.service_id}</a>
                                </div>
                                <!-- 추가 정보 -->
                                <div class="info-box">
                                    <div class="address">주소: 서울시 강남구 도산대로 45길 24</div>
                                    <div class="parking">주차 가능 여부: 가능</div>
                                    <div class="distance">거리: 2km</div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="card-footer text-muted text-end">
            강아지와🐶
        </div>
    </div>
</div>
</body>
</html>