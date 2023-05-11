<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="serviceheader.jsp"%>
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

</head>
<script type="text/javascript">
	$(function kakaoMap() {
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

	
	$(function starListLoader() {
		$.ajax({
			url : "listStar",
			data : {
				service_id : ${bag.service_id}
			},
			success : function(star) {
				
				float avgall = 0;
				float avgkind = 0;
				float avgexplain = 0;
				float avgtreat = 0;
				float avgfacilities = 0;
				float avgprice = 0;
				
				for (i=0; i<star.length; i++) {
					date = new Date(star[i].date);
					
					function dateFormat(date) {
				        let month = date.getMonth() + 1;
				        let day = date.getDate();
				        let hour = date.getHours();
				        let minute = date.getMinutes();
				        let second = date.getSeconds();

				        month = month >= 10 ? month : '0' + month;
				        day = day >= 10 ? day : '0' + day;
				        hour = hour >= 10 ? hour : '0' + hour;
				        minute = minute >= 10 ? minute : '0' + minute;
				        second = second >= 10 ? second : '0' + second;

				        return date.getFullYear() + '-' + month + '-' + day;
				}


				var currentDate = new Date(star[i].date);

				// timestamp를 yyyy-MM-dd HH:mm:ss 로 출력
				var currentFormatDate = dateFormat(currentDate);
				console.log(currentFormatDate);
					
				avg = parseFloat(star[i].kind + star[i].explain + star[i].treat + star[i].facilities + star[i].price)/5
				//String num = String.format("%.2f" , avg);
						
					tag = `
					<ul class="comment-list">
					<li class="comment">
						<div class="author">` +
						star[i].id
							+`<div class="rating">` + avg + `</div>
						</div>
						<div class="timestamp">` + currentFormatDate + `</div>
						<div class="content">` +
						star[i].content + `<img
								src="https://via.placeholder.com/150" alt="image" />
						</div>
					</li>
				</ul>`
			
					$('#comment-wrapper').append(tag);
					$('#review-all').append();
				
				}
				
				
			}, //success
			error : function () {
				alert("실패");
			}
		})//ajax
	})
</script>
<section class="hospital-name">🚑 ${bag.service_name}</section>
<hr color=grey>
<section class="map">
	<div id="map" style="width: 80%; height: 500px; margin: 0 auto;"></div>
</section>
<hr color=grey>
<table style="margin: 0 auto;">
	<tr>
		<td>(${bag.zipcode}) ${bag.road_address}</td>
	</tr>
	<tr>
		<td>TEL ${bag.tel}</td>
	</tr>
</table>
<hr color=grey>
<table style="margin: 0 auto;">
	<tr>
		<td>홈페이지</td>
		<td><a href="${bag.homepage}">${bag.homepage}</a></td>
		<td style="border-left: 1px solid black;">주차장</td>
		<td>${bag.parking}</td>
	</tr>
	<tr>
		<td>전문분야</td>
		<td>${bag.normal_category}</td>
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
<hr color=grey>
<div id=review-all style="width: 80%; height: 300px; margin: 0 auto;">
	<div class="review-title">리얼후기</div>
	<h1>
		<button class="review-button">후기 작성하기</button>
	</h1>
	<div class="review-all">총점</div>
	<div id=review-avg style="width: 80%; height: 300px; margin: 0 auto;">
		<div class="review-avg">4.5점</div>
		<div class="review-container">
			<div class="review-item">
				<h2>친절</h2>
				<p>여기에 글을 작성해주세요.</p>
			</div>
			<div class="review-item">
				<h2>설명</h2>
				<p>여기에 글을 작성해주세요.</p>
			</div>
			<div class="review-item">
				<h2>진료</h2>
				<p>여기에 글을 작성해주세요.</p>
			</div>
			<div class="review-item">
				<h2>시설</h2>
				<p>여기에 글을 작성해주세요.</p>
			</div>
			<div class="review-item">
				<h2>가격</h2>
				<p>여기에 글을 작성해주세요.</p>
			</div>

		</div>
	</div>



</div>
<hr color=grey>
<div id="comment-wrapper"
	style="width: 80%; height: 300px; margin: 0 auto;"></div>
</body>
</html>
